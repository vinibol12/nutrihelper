class CreateAnthropometricEvaluation < ActiveRecord::Migration[5.0]
  def change
    create_table :anthropometric_evaluations do |t|
      t.references :appointment, index: true, null: false

      # body composition
      t.decimal :fat_percentage, precision: 5, scale: 2
      t.decimal :fat_mass, precision: 5, scale: 2
      t.decimal :lean_mass, precision: 5, scale: 2

      # circumference
      t.decimal :abdomen, precision: 5, scale: 2
      t.decimal :waist, precision: 5, scale: 2
      t.decimal :hip, precision: 5, scale: 2
      t.decimal :arm, precision: 5, scale: 2

      # bmi
      t.decimal :weight, precision: 6, scale: 3
      t.decimal :height, precision: 6, scale: 3
      t.decimal :bmi, precision: 6, scale: 3

      # skinfold mms
      t.decimal :triceps, precision: 5, scale: 2
      t.decimal :subscapular, precision: 5, scale: 2
      t.decimal :thigh, precision: 5, scale: 2
      t.decimal :iliac_crest, precision: 5, scale: 2
      t.decimal :abdominal, precision: 5, scale: 2
      t.decimal :chest, precision: 5, scale: 2
      t.decimal :axilla, precision: 5, scale: 2
      t.decimal :calf, precision: 5, scale: 2
      t.decimal :biceps, precision: 5, scale: 2
      t.decimal :lean_mass, precision: 5, scale: 2
      t.decimal :body_fat, precision: 5, scale: 2
      t.decimal :body_fat_percentage, precision: 5, scale: 2

      t.timestamps
    end
  end
end
