class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :item_id, :item_name

  has_many :items
end
