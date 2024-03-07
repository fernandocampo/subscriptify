class AddFieldsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :phone, :string
    add_column :users, :city, :string
  end
end
