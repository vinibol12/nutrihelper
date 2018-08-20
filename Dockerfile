FROM ruby:2.5

RUN bundle config --global frozen 1

WORKDIR /usr/src/nutrihelper

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" >  /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

ENV INSTALL_PATH /nutrihelper
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

#Copying the Gemfile from the actual repo we can then run bundle install to update our dependencies.
#Another thing it's solving here is that Docker wouldn't know that our dependencies have changed when we add new gems
#to the Gemfile. When docker copies the Gemfile and hashes it, it looks at the checksum of the hash and notices that it
#has changed. Then it runs all commands from then on. For that reason we're adding this part in the end. Just so if our
#Gemfile changed docker will not have to run all the previous commands.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

COPY . .
# Provide dummy data to Rails so it can pre-compile assets.
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
q
#Tarefa.
#Criar um dock compose file que tenha nutrihelper expondo a porta tres mil e o postgres que esteja conectado com o nutrihelper
#O stretch goal é fazer o app conectar ao postgres do docker compose