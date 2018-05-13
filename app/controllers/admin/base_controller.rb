class Admin::BaseController < AuthenticatedBaseController
  before_action :check_admin!

  private

  def check_admin!
    authorize! :manage, :all
  end
end
