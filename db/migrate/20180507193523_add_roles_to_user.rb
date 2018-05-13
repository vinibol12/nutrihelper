class AddRolesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :roles, :text, array: true, default: []
    rename_column :users, :dob, :date_of_birth
  end
end
