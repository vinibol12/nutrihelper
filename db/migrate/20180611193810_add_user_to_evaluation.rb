class AddUserToEvaluation < ActiveRecord::Migration[5.0]
  def change
    # Add user column
    add_reference :anthropometric_evaluations, :user

    # Add user to existing evaluations
    ActiveRecord::Base.transaction do
      AnthropometricEvaluation.all.each do |e|
        e.update!(user: e.appointment.user)
      end
    end
  end
end
