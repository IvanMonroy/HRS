class VehicleSerializer < ActiveModel::Serializer
  attributes :id ,:plate, :brand, :year
end
