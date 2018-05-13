class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /users/sign_up
  def new
    @user = User.new
    render :new
  end

  # POST /resource
  def create
    @user = User.new(permited_params)
    if @user.save
      render :thank_you
    else
      render :new
    end
  end

  private

  def permited_params
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :password, :password_confirmation, :gender, :email)
  end
end
