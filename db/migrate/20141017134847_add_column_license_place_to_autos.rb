class AddColumnLicensePlaceToAutos < ActiveRecord::Migration
  def change
    add_column :autos, :license_plate, :string
  end
end
