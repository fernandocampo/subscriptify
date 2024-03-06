# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Creating Subscriptions"
Subscription.create(
  company_name: 'Netflic',
  user_id: '1',
  description: 'Familia',
  recurrent: "1",
  frequency: 'anually',
  payment_date: "25/10/2024",
  url: 'www.Netflic.com',
  price: '10',
  currency: "usd",
  category: "streaming"
)

Subscription.create(
  company_name: 'Sporify',
  user_id: '1',
  description: 'Amigos',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "25/11/2024",
  url: 'www.Sporify.com',
  price: '2000',
  currency: "ars",
  category: "streaming"
)

Subscription.create(
  company_name: 'YouTuve',
  user_id: '1',
  description: 'Amigos',
  recurrent: "1",
  frequency: 'weekly',
  payment_date: "03/11/2024",
  url: 'www.Youtuve.com',
  price: '1500',
  currency: "clp",
  category: "streaming"
)

Subscription.create(
  company_name: 'EducTech',
  user_id: '1',
  description: 'Personal',
  recurrent: "1",
  frequency: 'anually',
  payment_date: "01/01/2025",
  url: 'www.edutech.com',
  price: '2000',
  currency: "usd",
  category: "education"
)

Subscription.create(
  company_name: 'DiarioTech',
  user_id: '1',
  description: 'Familiar',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "11/06/2024",
  url: 'www.diairiotech.com',
  price: '1',
  currency: "usd",
  category: "services"
)

Subscription.create(
  company_name: 'GasLooz',
  user_id: '1',
  description: 'Familiar',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "11/07/2024",
  url: 'www.gaslooz.com',
  price: '10000',
  currency: "ars",
  category: "services"
)

Subscription.create(
  company_name: 'Teletech',
  user_id: '1',
  description: 'Personal',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "11/07/2024",
  url: 'www.Teletech.com',
  price: '15000',
  currency: "ars",
  category: "services"
)

puts "Subscriptions created succesfully!"
