class Vehicle < ApplicationRecord
  include VehicleValidation
  has_many :entry, :foreign_key => :plate, :primary_key => :plate

  validates :plate, :length=> { :is =>7}
  validates :brand, :length => { maximum: 200}
  validates :year, numericality: { greater_than_or_equal_to: 4}
  def name
    plate
  end
end
