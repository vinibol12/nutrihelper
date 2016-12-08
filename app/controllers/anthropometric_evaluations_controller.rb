class AnthropometricEvaluationsController < ApplicationController
  def new
    @evaluation = AnthropometricEvaluation.new
    @circumferences = CircumferenceMeasurement.new
    render :new
  end
end
