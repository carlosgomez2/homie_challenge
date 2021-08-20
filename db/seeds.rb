require 'faker'

50.times do
  Property.create(
    name: Faker::Address.street_address,
    description: Faker::Lorem.paragraph_by_chars,
    rental_price: Faker::Number.decimal(l_digits: 5, r_digits: 2),
    status: %w[published available deleted].sample,
    tenant_name: Faker::Name.name,
    tenant_email: Faker::Internet.email,
    tenant_phone: Faker::PhoneNumber.cell_phone,
    tenant_availability: %w[unavailable available].sample
  )
end

puts 'Great! 50 properties created.'