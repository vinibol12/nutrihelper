class AddNotesToEvaluation < ActiveRecord::Migration[5.0]
  def change
    add_column :anthropometric_evaluations, :notes, :string
  end
end
