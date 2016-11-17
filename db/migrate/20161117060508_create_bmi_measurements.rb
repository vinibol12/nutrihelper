class CreateBmiMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :bmi_measurements do |t|
      t.references :anthropometric_evaluation, index: true, null: false
      t.float :weight
      t.integer :height
      t.float :bmi

      t.timestamps
    end
  end
end
