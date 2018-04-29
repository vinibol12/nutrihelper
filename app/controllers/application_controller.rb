class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  after_action :discard_flash

  def home
    render :home
  end

  private

  def discard_flash
    flash.discard
  end
end
