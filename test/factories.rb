FactoryGirl.define do
  factory :auto do
	make "Audi"
	model "A6"
	year "2011"
	license_plate "WD W315"
  end

  factory :client do
  name "Luk"
  surname "Bobi"
  phone "123456789"
  birth_date "1989-01-17"
  personal_id "89011712345"
  end

end