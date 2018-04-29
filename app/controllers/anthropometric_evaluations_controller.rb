class AnthropometricEvaluationsController < ApplicationController

  before_action :load_appointment
  before_action :load_client
  before_action :load_evaluation, only: :new

  def create
    # binding.pry
    @evaluation = AnthropometricEvaluation.new(evaluation_params.merge(appointment_id: @appointment.id))
    if @evaluation.save
      flash[:success] = 'Saved Evaluation with success'
      render :show
    else
      flash[:error] = @evaluation.errors.full_messages.join(', ')
      render :new
      # body_density_adult_male = 1,11200000 - ((0,00043499 * @total_sum) + (0,00000055 * (@total_sum ** 2)) - (0,0002882 * @age)
    end
  end

  private

  def load_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def load_client
    @user = @appointment.user
  end

  def load_evaluation
    @evaluation = AnthropometricEvaluation.new
  end

  def evaluation_params
    params[:anthropometric_evaluation].permit(:fat_percentage, :fat_mass, :lean_mass, :abdomen, :waist, :hip, :arm, :weight, :height,
                                              :bmi, :triceps, :subscapular, :thigh, :iliac_crest, :abdominal, :chest, :axilla, :calf,
                                              :biceps)
  end

end
