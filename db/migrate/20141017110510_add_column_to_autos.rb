class AddColumnToAutos < ActiveRecord::Migration
  def change
    add_column :autos, :make, :string
    add_column :autos, :model, :string
  	add_column :autos, :year, :string
  end
end
