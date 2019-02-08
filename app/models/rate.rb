class Rate < ApplicationRecord
  include RateValidation
  has_many :exits
  validates :value, numericality: {message: 'Debe ser numerico'}
  validates :name , :length => { maximum: 200}
  validates :description , :length => { maximum: 400}
  scope :is_valid, lambda{
    where('CURRENT_DATE between date_begin and date_end')
  }



end
