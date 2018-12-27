class Rate < ApplicationRecord
  include RateValidation
  has_many :exits
  validates :value, numericality: { greater_than_or_equal_to: 5 }
  validates :name , :length => { maximum: 200}
  validates :description , :length => { maximum: 400}
  scope :is_valid, lambda{
    where('CURRENT_DATE between date_begin and date_end')
  }



end
