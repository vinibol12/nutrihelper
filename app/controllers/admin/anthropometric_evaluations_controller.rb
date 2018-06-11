class Admin::AnthropometricEvaluationsController < Admin::BaseController

  before_action :load_evaluation, only: [:show, :edit]
  before_action :load_user, only: [:show, :edit]

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @user = @appointment.user
    @evaluation = AnthropometricEvaluation.new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
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

  def evaluation_params
    params[:anthropometric_evaluation].permit(:fat_percentage, :fat_mass, :lean_mass, :abdomen, :waist, :hip, :arm,
                                              :weight, :height, :bmi, :triceps, :subscapular, :thigh, :iliac_crest,
                                              :abdominal, :chest, :axilla, :notes)
  end

  def load_evaluation
    @evaluation = AnthropometricEvaluation.find(params[:id])
  end

  def load_user
    @user = @evaluation.user
  end
end

