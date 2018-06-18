# AuthenticatedBaseController
#
# Base controller class, controllers that are to be authenticated inherit from this.
class AuthenticatedBaseController < ApplicationController
  # before_action :authenticate_user!

  before_action :require_login

  private

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
