class AddColumnsToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :date_time, :datetime
    add_column :appointments, :notes, :string
  end
end
