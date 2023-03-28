puts 'Seeding...'


2.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password123'
  )
end


5.times do
  Item.create!(
    description: Faker::Food.dish,
    price: Faker::Number.decimal(l_digits: 2),
    category: Faker::Food.ethnic_category,
    imgURL: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food'])
  )
end


5.times do
  Order.create!(
    user_id: rand(1..2),
    item_id: rand(1..5)
  )
end


5.times do
  quantity = rand(1..5)
  item = Item.find(rand(1..5))
  subtotal = quantity * item.price

  OrderItem.create!(
    order_id: rand(1..5),
    item_id: item.id,
    quantity: quantity,
    subtotal: subtotal
  )
end


5.times do
  Payment.create!(
    order_id: rand(1..5),
    amount: Faker::Number.decimal(l_digits: 2),
    payment_method: Faker::Business.credit_card_type,
    card_number: Faker::Business.credit_card_number,
    cardholder_name: Faker::Name.name,
    expiration_date: Faker::Business.credit_card_expiry_date,
    cvc: Faker::Number.number(digits: 3)
  )
end

  
  puts 'Done seeding!'
  