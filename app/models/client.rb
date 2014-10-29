class Client < ActiveRecord::Base
  validates :name, :surname, :phone, :birth_date, :personal_id, presence: true
  validates :name, :surname, format: { with: /[A-Z]{1}[a-z]{1,10}/ }
  #simple validate for birth date
  validates :birth_date, format: { with: /[1-2][0,9][0-9]{2}-[0-1][0-9]-[0-3][0-9]/ }
  validates :phone, uniqueness: true, format: { with: /[1-9]{1}[0-9]{8}/ }
  #simple validate for personal_id
  validates :personal_id, uniqueness: true, format: { with: /[1-9]{1}[1-9]{10}/ }
  has_many :rents
  belongs_to :user
end
