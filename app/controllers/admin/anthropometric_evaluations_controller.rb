class Admin::AnthropometricEvaluationsController < Admin::BaseController

  before_action :load_resources
  before_action :load_evaluation, only: :new

  def create
    @evaluation = AnthropometricEvaluation.new(evaluation_params.merge(appointment_id: @appointment.id))
    @user = @evaluation.user
    if @evaluation.save
      flash[:success] = 'Saved Evaluation with success'
      redirect_to admin_user_appointments_path(@user)
    else
      flash[:error] = @evaluation.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def load_resources
    if params[:appointment_id]
      @appointment = Appointment.find(params[:appointment_id])
      @user = @appointment.user
    else
      @user = User.find  params[:appointment][:user_id]
      @appointment = Appointment.create(user: @user)
    end
  end

  def load_evaluation
    @evaluation = AnthropometricEvaluation.new
  end

  def evaluation_params
    params[:anthropometric_evaluation].permit(:fat_percentage, :fat_mass, :lean_mass, :abdomen, :waist, :hip, :arm, :weight, :height,
                                              :bmi, :triceps, :subscapular, :thigh, :iliac_crest, :abdominal, :chest, :axilla, :notes)
  end
end
