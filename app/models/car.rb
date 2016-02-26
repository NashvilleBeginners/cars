class Car < ActiveRecord::Base
  belongs_to :model
  belongs_to :color

  has_one :make, through: :model

  delegate :name, to: :model, prefix: true
  delegate :name, to: :color, prefix: true
  delegate :name, to: :make, prefix: true

end
