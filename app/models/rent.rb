class Rent < ActiveRecord::Base
  belongs_to :client
  belongs_to :auto

  validates :client_id, :auto_id, presence: true
end
