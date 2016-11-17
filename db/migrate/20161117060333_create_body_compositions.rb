class CreateBodyCompositions < ActiveRecord::Migration[5.0]
  def change
    create_table :body_compositions do |t|
      t.references :atropometric_evaluation, index: true, null: false
      t.decimal :fat_percentage
      t.float :fat_mass
      t.float :lean_mass
      t.timestamps
    end
  end
end
