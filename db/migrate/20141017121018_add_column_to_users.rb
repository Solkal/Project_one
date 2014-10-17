class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :personal_id, :number
    add_column :users, :login, :string
    add_column :users, :email, :string
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string

    remove_column :users, :name, :string
    remove_column :users, :surname, :string
    remove_column :users, :personal_id, :number
    remove_column :users, :password_hash, :string
    remove_column :users, :password_salt, :string

  end
end
