class ExitSerializer < ActiveModel::Serializer
  attributes :entry_id, :date_departure, :hour_departure, :rate_id, total_time, :ammount_to_paid, :discount
end
