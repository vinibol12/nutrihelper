class CreateSkinFoldMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :skin_fold_measurements do |t|
      t.references :anthropometric_evaluation, index: true, null: false
      t.integer :triceps
      t.integer :subscapular
      t.integer :thigh
      t.integer :iliac_crest
      t.integer :abdominal
      t.integer :chest
      t.integer :axilla
      t.integer :calf
      t.integer :biceps

      t.timestamps
    end
  end
end
