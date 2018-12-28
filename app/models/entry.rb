class Entry < ApplicationRecord
  include EntryValidation
  belongs_to :vehicle, :foreign_key => :plate, :primary_key => :plate
  has_one :exit
  validates :plate , :length => { is: 7}
  validates :place , :length => { maximum: 400}


  scope :is_in_parking, lambda{
    where('is_parking = ?', true)
  }
  def plate_has_an_entry?
    Entry.where('plate = ? and is_parking = ?', plate, true ).exists?
  end
  def name
    plate
  end
  def show_vehicles
    Vehicle.select("plate").all
  end
  def time_entry_format
    format_time_entry.strftime("%Y-%m-%d %H:%M:%S")
  end
  def format_time_entry
    date_a = date_arrival.strftime("%Y-%m-%d")
    hour_a = hour_arrival.strftime("%H:%M:%S")
    ("#{date_a} #{hour_a}").to_time
  end
  def the_plate_is_parking?
    Entry.where('plate = ?', plate).is_in_parking.exists?
  end
end
