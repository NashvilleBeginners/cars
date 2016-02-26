class Color < ActiveRecord::Base
  has_many :cars
  has_many :models, through: :cars
  has_many :makes, through: :models
end
