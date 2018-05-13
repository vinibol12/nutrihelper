class Admin::AnthropometricEvaluationsController < Admin::BaseController

  before_action :load_resources
  before_action :load_evaluation, only: :new

  def create
    @evaluation = AnthropometricEvaluation.new(evaluation_params.merge(appointment_id: @appointment.id))
    if @evaluation.save

      flash[:success] = 'Saved Evaluation with success'
    else
      flash[:error] = @evaluation.errors.full_messages.join(', ')
      render :new
      # body_density_adult_male = 1,11200000 - ((0,00043499 * @total_sum) + (0,00000055 * (@total_sum ** 2)) - (0,0002882 * @age)
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
                                              :bmi, :triceps, :subscapular, :thigh, :iliac_crest, :abdominal, :chest, :axilla)
  end
end
