class Admin::AppointmentsController < Admin::BaseController

  def index
    @user = User.find(params[:user_id])
    @appointments = @user.appointments.eager_load(:anthropometric_evaluation)
    render :index
  end

  def new
    @appointment = Appointment.new
    @users = User.all.order('first_name')
    render :new
  end

  def create
    parse_date_time
    @appointment = Appointment.new(user: user, date_time: @date_time, notes: appointment_params[:notes])
    if @appointment.save
      flash[:success] = 'New Appointment created'
      redirect_to admin_appointment_path(@appointment)
    else
      flash[:error] = 'Appointment could not be created'
      redirect_to :back
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @user = @appointment.user
    if @appointment.destroy
      flash[:success] = 'Appointment has been successfully deleted'
    else
      flash[:alert] = 'Could not delete appointment'
    end
    redirect_to admin_user_appointments_path(@user)
  end

  def update
    
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :date, :time, :notes)
  end

  def user
    @user ||= User.find appointment_params[:user_id]
  end

  def parse_date_time
    @date_time = DateTime.parse(appointment_params[:date] + appointment_params[:time])
  end
end
