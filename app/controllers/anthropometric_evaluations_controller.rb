class AnthropometricEvaluationsController < ApplicationController
  def new
    @evaluation = AnthropometricEvaluation.new
    @circumferences = CircumferenceMeasurement.new
    @skinfolds = SkinFoldMeasurement.new

    render :new
  end
end
