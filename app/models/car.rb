class Car < ActiveRecord::Base
  ACCEPTABLE_NUMBER_OF_DOORS = [2,3,4].freeze

  belongs_to :model
  belongs_to :color

  has_one :make, through: :model

  #delegate :name, to: :model, prefix: true
  #delegate :name, to: :color, prefix: true
  #delegate :name, to: :make, prefix: true

  validates :year, presence: true, on: :create
  validates :number_of_doors,
    inclusion: ACCEPTABLE_NUMBER_OF_DOORS,
    allow_nil: true

  validate :year_is_not_in_the_future

  after_create :email_the_admins

  private
  def year_is_not_in_the_future
    if car_year_greater_than_current_year?
      errors.add(:year, "can't be greater than the current year")
    end
  end

  def car_year_greater_than_current_year?
    year > DateTime.now.year
  end

  def email_the_admins
    ### ApplicationMailer...
    self.number_of_seats = 3000
    save!
  end
end
