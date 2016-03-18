require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "validations" do
    it { should validate_presence_of :year }
    it { should validate_inclusion_of(:number_of_doors).in_array([2, 3, 4]) }
  end
end
