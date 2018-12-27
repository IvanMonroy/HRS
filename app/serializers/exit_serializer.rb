class ExitSerializer < ActiveModel::Serializer
  attributes :date_departure, :hour_departure, :rate_id, :ammount_to_paid, :discount
end
