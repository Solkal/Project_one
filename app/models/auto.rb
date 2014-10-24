class Auto < ActiveRecord::Base
	validates :make, :model, :year, :license_plate, presence: true
	validates :year, numericality: { greater_than_or_equal_to: 2010 }, length: { is: 4 }
	validates :license_plate, uniqueness: true, format: { with: /\A([A-Z0-9]){2,5}\s([A-Z0-9]{3,5})\z/,
    message: "license_plate is invalid" }
	has_many :rents
end
