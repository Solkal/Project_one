class ChangeColumnDateInClients < ActiveRecord::Migration
  def change
  	remove_column :clients, :birth_date, :integer
    add_column :clients, :birth_date, :date
  end
end
