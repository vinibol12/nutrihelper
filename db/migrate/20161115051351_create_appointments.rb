class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :user, index: true, null: false
      t.timestamps
    end
  end
end
