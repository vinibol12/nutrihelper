FROM ruby:2.5

RUN bundle config --global frozen 1

WORKDIR /usr/src/nutrihelper

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" >  /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

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
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://nutrihelper:easypassword@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile
RUN chmod +x docker-entrypoint.sh
# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["/usr/src/nutrihelper/public"]

EXPOSE 3000
ENTRYPOINT ["/usr/src/nutrihelper/docker-entrypoint.sh"]

#Tarefa.
#Criar um dock compose file que tenha nutrihelper expondo a porta tres mil e o postgres que esteja conectado com o nutrihelper
#O stretch goal é fazer o app conectar ao postgres do docker compose

#WORKDIR changes the current working directory. Just like cd in bash script.

#COPY AND ADD have a origin scope outside the docker container on the interface btw the host and the container.
#The destination for those commands, second arg, has the scope of the current WORKDIR.
#Hence COPY Gemfile Gemfile copies the Gemfile in the host and installs with the same name in the current WORKDIR

#Docker uses hashing to find out whether or not something has changed and needs to be rebuilt.
#For RUN it analises the commad in itself and on COPY ADD it analises the files.

#REmove secrets from dockerfile
#How to make an upload to nutrihelper pro dockerhub
#REad on Volumes, commands documentation

# LEvanta um servidor na Amazon, configura com postgres pronto pra rodar o código do nutrihelper só que sem o código do Nutrihelper
# e aí vamos usar o docker image que tá no hub.docker

#Dockerfile é uma forma de definir e criar uma imagem. Definir servidor. REceita do bolo
#Docker compose é que vai usar as imagem e criar o conjunto de serviços necessários pra rodar/servir um aplicativo. É uma forma
#de definir a infraestrutura usando somente containers.

# 1- Config servidor
# 2 - instal docker
## 3 - docker run