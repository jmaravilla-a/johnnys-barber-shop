User.destroy_all
Order.destroy_all
OrderItem.destroy_all
Item.destroy_all

puts "🌱🌱 Seeding 🌱🌱"

puts "Seeding Users 🌱"

javier = User.create(first_name: "Javier", last_name: "Maravilla", email: "javimaravilla@outlook.com", password: "sessions")

puts "Seeding Orders 🌱"

o1 = Order.create(date: Time.now.to_datetime, paid: true, user_id: javier.id)

puts "Seeding Items 🌱"

i1 = Item.create(name: "Standard Haircut", price: 20, price_id: "price_1K6zSsAQukT5m4JJCeaDWQdt", category: "Service")
i2 = Item.create(name: "Standard Beard Trim", price: 15, price_id: "price_1K7XK5AQukT5m4JJrgSwwEDO", category: "Service")
i3 = Item.create(name: "Custom Hair Style", price: 30, price_id: "price_1K7XOKAQukT5m4JJsRAUtUTm", category: "Service")
i4 = Item.create(name: "Custom Beard Style", price: 25, price_id: "price_1K7XTDAQukT5m4JJxkgu4bnU", category: "Service")
i5 = Item.create(name: "Johnny B. Gel", price: 15, price_id: "price_1K6zTSAQukT5m4JJiaGTbgQr", category: "Product")
i6 = Item.create(name: "Cremo Beard Oil", price: 8, price_id: "price_1K7XWUAQukT5m4JJvw9ILyUS", category: "Product")

puts "Seeding Order Items 🌱"

oi1 = OrderItem.create(item_name: i1.name, order_id: o1.id, item_id: i1.id)
oi2 = OrderItem.create(item_name: i2.name, order_id: o1.id, item_id: i2.id)
oi2 = OrderItem.create(item_name: i5.name, order_id: o1.id, item_id: i5.id)
oi2 = OrderItem.create(item_name: i6.name, order_id: o1.id, item_id: i6.id)

puts "🌱🌱 Done Seeding 🌱🌱"