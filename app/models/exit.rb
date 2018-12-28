class Exit < ApplicationRecord
  include ExitValidation
  belongs_to :entry
  belongs_to :rate
  validates :entry_id , uniqueness: { message: 'Yas está registrado'}
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
  def show_dates
    Exit.joins(:entry).where(entries: {entry_id: entry_id  })
    Entry.joins(:exit).where(exits: {id: id })
  end
  def time_exit_format
    format_time_exit.strftime("%Y-%m-%d %H:%M:%S")
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
    (format_time_exit - entry.format_time_entry).abs/60
  end

  def total_amount
    (rate.value * calcule_minutes)
  end

  def verify_discount
    if get_discount > 0
     (total_amount * get_discount)/100
    else
       0
    end
  end

  def ammount_with_discount
    total_amount - verify_discount
  end



end
