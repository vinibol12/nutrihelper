class CreateCircumferenceMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :circumference_measurements do |t|
      t.references :anthropometric_evaluation, index: {name: 'index_circumference_on_anthropometric_evaluation_id'}, null: false
      t.integer :abdomen
      t.integer :waist
      t.integer :hip
      t.integer :arm

      t.timestamps
    end
  end
end
