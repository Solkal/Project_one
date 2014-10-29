class User < ActiveRecord::Base
  has_many :rents
  has_many :autos
  has_many :clients
end
