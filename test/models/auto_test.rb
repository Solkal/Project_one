require 'test_helper'

class AutoTest < ActiveSupport::TestCase
	
	def valid_auto_hash
    	FactoryGirl.attributes_for :auto
  	end
	
	test "auto attributes must not be empty" do
		auto = Auto.new
		assert auto.invalid?
		assert auto.errors[:make].any?
		assert auto.errors[:model].any?
		assert auto.errors[:year].any?
		assert auto.errors[:license_plate].any?
	end

	test "auto license plate must be valid" do
		auto = FactoryGirl.build(:auto, license_plate: "WD76754")
		assert auto.invalid?
		assert auto.errors[:license_plate].include?("license_plate is invalid")

		auto.license_plate = "WD 76754"
		assert auto.valid?
	end

	test "auto year must be valid" do
		auto = FactoryGirl.build(:auto, year: "2012")
		assert auto.valid?
	end

	test "auto year must be 4 chars long" do
		auto = FactoryGirl.build(:auto, year: "20012")
		assert auto.invalid?
		assert auto.errors[:year].include?("is the wrong length (should be 4 characters)")
	end

	test "auto year must be greater than 2010" do
		auto = FactoryGirl.build(:auto, year: "1990")
		assert auto.invalid?
		assert auto.errors[:year].include?("must be greater than or equal to 2010")
	end

	test "auto license plate must be uniq" do
		same_license_plate = "AA 11111"
		auto1 = FactoryGirl.create(:auto, license_plate: same_license_plate)
		auto2 = FactoryGirl.build(:auto, license_plate: same_license_plate) 
		assert auto2.invalid?
		assert auto2.errors[:license_plate].include?("has already been taken")
	end
end
