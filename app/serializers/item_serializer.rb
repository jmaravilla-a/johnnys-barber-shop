class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :price_id, :category
end
