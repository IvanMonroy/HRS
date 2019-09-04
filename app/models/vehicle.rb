class Vehicle < ApplicationRecord
  include VehicleValidation
  has_many :entry, :foreign_key => :plate, :primary_key => :plate

  validates :year, numericality: { greater_than_or_equal_to: 4}
  def name
    plate
  end
end
