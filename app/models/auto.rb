class Auto < ActiveRecord::Base
  validates :make, :model, :year, :license_plate, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1960 }, length: { is: 4 }
  validates :license_plate, uniqueness: true
  
  has_many :rents
  belongs_to :user

  searchable do
      text  :make
      text  :model
      text  :year
      text  :license_plate 
  end

  def name
    "#{make} #{model} #{license_plate}"
  end
end
