class Vehicle < ApplicationRecord
  include VehicleValidation
  has_many :entry, :foreign_key => :plate, :primary_key => :plate

  def name
    plate
  end
end
