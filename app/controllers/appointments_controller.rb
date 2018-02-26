class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @users = User.all.order('first_name')
    render :new
  end

  def create
    @appointment =  Appointment.new(user_params)
    if @appointment.save
      flash[:success] = 'New Appointment created'
      redirect_to appointment_path(@appointment)
    else
      flash[:error] = 'Appointment could not be created'
      redirect_to :back
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def user_params
    params.require(:appointment).permit(:user_id)
  end

end
