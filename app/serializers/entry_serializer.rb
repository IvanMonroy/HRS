class EntrySerializer < ActiveModel::Serializer
  attributes :plate, :date_arrival, :hour_arrival, :place, :is_parking
end
