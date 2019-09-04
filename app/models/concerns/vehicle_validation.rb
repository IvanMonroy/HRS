module VehicleValidation
  extend ActiveSupport::Concern
  included do
    #validate :delete_rate, :on => :destroy
    before_destroy :delete_vehicle
    before_create :validate_on_create
  end

  def validate_on_create
    insert_vehicle
    lenght_plate
    length_year
    validate_year

  end

  def lenght_plate
    raise 'La placa deberá tener almenos 7 carácteres (Ej. ABC-123).' if self.plate.length < 7
    raise 'Placa demasiado larga, porfavor escribirla en un formato correcto (Ej. ABC-123).' if self.plate.length > 7
  end

  def length_year
    raise 'La placa deberá tener almenos 7 carácteres (Ej. ABC-123).' if self.year.length < 4
  end

  def validate_year
    raise "El año insertado no es valido, inserte un año menor a #{Date.today.year + 1} " if self.year.to_i > (Date.today.year + 1)
  end

  def delete_vehicle
    raise 'Error al eliminar el vehículo, hay entradas asociadas a este vehículo' if self.entry.exists?
  end

  def insert_vehicle
    raise 'Error al insertar y/o actualizar el vehiculo, la placa ya esta registrada' if Vehicle.where("plate = ?", self.plate).present?
  end
end

