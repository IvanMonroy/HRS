module EntryValidation
  extend ActiveSupport::Concern
  included do
    #validate :delete_entry, :on => :destroy
    before_destroy :delete_entry
    before_create :yet_parking?
  end
  def delete_entry
   raise 'Error al eliminar la entrada, hay salidas asociadas a está entrada' if self.exit.present?
  end
  def yet_parking?
    raise 'Error al crear la entrada, el vehiculo se encuentra en el parqueadero' if self.the_plate_is_parking?
  end

end