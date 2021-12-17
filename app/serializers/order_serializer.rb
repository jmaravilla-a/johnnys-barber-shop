class OrderSerializer < ActiveModel::Serializer
  attributes :id, :date, :paid, :user_id

  has_many :order_items
  has_many :items
end
