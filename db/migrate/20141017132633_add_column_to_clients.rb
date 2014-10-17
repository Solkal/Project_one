class AddColumnToClients < ActiveRecord::Migration
  def change
    add_column :clients, :name, :string
    add_column :clients, :surname, :string
    add_column :clients, :phone, :integer
    add_column :clients, :birth_date, :integer
    add_column :clients, :personal_id, :integer
  end
end
