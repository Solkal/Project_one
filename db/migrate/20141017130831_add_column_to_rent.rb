class AddColumnToRent < ActiveRecord::Migration
  def change
    add_column :rents, :client_id, :integer
    add_column :rents, :car_id, :integer
    add_column :rents, :date_start, :date_start
    add_column :rents, :date_end, :date_end
  end
end
