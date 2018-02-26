class AnthropometricEvaluationsController < ApplicationController

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @user = @appointment.user
    @anthropometric_evaluation = AnthropometricEvaluation.new
    render :new
  end

  def create
    @anthropometric_evaluation = AnthropometricEvaluation.new(
                            skin_fold_measurement: params[:skinfolds],
                            bmi_measurement: params[:bmi_measurements],
                            circumference_measurement: params[:circumferences],
                            appointment: Appointment.find(params[:appointment_id])
    )
    if @anthropometric_evaluation.save
      flash[:success] = 'Saved Evaluation with success'
      render :show
    else
      flash[:error] = @anthropometric_evaluation.errors.full_messages.join(', ')
      render :new
    end
  end
end
