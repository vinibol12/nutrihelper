class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @appointment = Appointment.new
    @appointment.user = @user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params.merge(password: generate_password))
    if @user.save
      redirect_to admin_user_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @user.admin
      flash[:notice] = 'This user is an admin. So it cannot be destroyed. Please contact your website developer'
      render :show
    else
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully destroyed.'
    end
  end

  private

    def generate_password
      Devise.friendly_token(50)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :date_of_birth, :gender, :email, :password)
    end
end
