class AnthropometricEvaluationsController < ApplicationController
  def new
    @evaluation = AnthropometricEvaluation.new
    render :new
  end
end
