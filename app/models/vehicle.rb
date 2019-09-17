class Vehicle < ApplicationRecord
  include VehicleValidation
  has_many :entries, :foreign_key => :plate, :primary_key => :plate

  def name
    plate
  end

  def total_entries
    self.entries.count.to_i
  end
end
