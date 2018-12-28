module ExitValidation
  extend ActiveSupport::Concern
  included do
  #  before_create :validate_exit
  end
#  def validate_exit
   # raise 'Error la salida ya fue registrada' if self.entry.plate_has_an_entry?
 # end

end