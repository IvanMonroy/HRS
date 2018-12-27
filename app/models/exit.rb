class Exit < ApplicationRecord
  include ExitValidation
  belongs_to :entry
  belongs_to :rate
  validate :rate_is_valid?
  def exit_parking
    entry.is_parking = false
    entry.save

  end
  def show_entries
    Entry.select("id, plate").is_in_parking
  end
  def show_rates
    Rate.select("id, name").is_valid
  end


  def rate_is_valid?
    Exit.where('date_departure = ?', Time.now.strftime("%Y-%m-%d")).exists?
  end
  def get_plate
    entry.plate
  end
  def count_entries
      Entry.where('plate = ?', get_plate).count
  end

  def get_discount
    if count_entries > 5
      20
    else
      0
    end
  end


  def format_time_exit
    date_a = date_departure.strftime("%Y-%m-%d")
    hour_a = hour_departure.strftime("%H:%M:%S")
    ("#{date_a} #{hour_a}").to_time

  end


  def calcule_minutes
    (Time.now.to_time - entry.format_time).abs
  end

  def total_amount
    tarifa =  Rate.is_valid.first
    (tarifa.value * calcule_minutes)/60
  end
  def verify_discount
    if get_discount > 0
     return (total_amount * get_discount)/100
    else
      return 'NO tiene descuento'
    end
  end

  def ammount_with_discount
    total_amount - verify_discount
  end



end
