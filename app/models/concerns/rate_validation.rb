module RateValidation
  extend ActiveSupport::Concern
  included do
   # validate :delete_rate, :on => :destroy
    before_destroy :delete_rate
  end
  def delete_rate
   raise 'Error al eliminar la tarifa, hay salidas asociadas a está tarifa' if self.exits.present?
  end
end