class Client < ActiveRecord::Base
  validates :name, :surname, :phone, :birth_date, :personal_id, presence: true
  # validates :name, :surname, format: { with: /[A-Z]{1}[a-z]{1-10}/}
  validates :phone, format: { with: /[1-9]{1}[0-9]{8}/ }
  has_many :rents
end
