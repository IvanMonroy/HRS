module VehicleValidation
  extend ActiveSupport::Concern
  included do
    #validate :delete_rate, :on => :destroy
    before_destroy :delete_vehicle
   # before_create :insert_vehicle
  end
  def delete_vehicle
    raise 'Error al eliminar el vehículo, hay entradas asociadas a este vehículo' if self.entry.exists?
  end
  def insert_vehicle
    raise 'Error al insertar y/o actualizar el vehiculo, la placa ya esta registrada' if self.plate.present?
  end
end