class CreateAnthropometricEvaluation < ActiveRecord::Migration[5.0]
  def change
    create_table :anthropometric_evaluations do |t|
      t.references :appointment, index: true, null: false
      t.references :patient, index: true

      t.timestamps
    end
  end
end
