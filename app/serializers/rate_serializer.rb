class RateSerializer < ActiveModel::Serializer
  attributes :value, :name, :description, :date_begin, :date_end
end
