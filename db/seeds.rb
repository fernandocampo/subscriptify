# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating 3 Users"

User.create(
  email: "darioferreira10@gmail.com",
  password: '123456'
)
User.create(
  email: "fernandocampo@gmail.com",
  password: '123456'
)
User.create(
  email: "antonioedwards@gmail.com",
  password: '123456'
)

puts "Users created succesfully!"

puts "Creating Subscriptions"
Subscription.create(
  company_name: 'Netflix',
  user_id: '1',
  description: 'Familia',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "25/04/2024",
  url: 'www.Netflix.com',
  price: '10',
  currency: "usd",
  category: "streaming"
)

Subscription.create(
  company_name: 'Spotify',
  user_id: '1',
  description: 'Amigos',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "22/08/2024",
  url: 'www.Sporify.com',
  price: '10',
  currency: "usd",
  category: "streaming"
)

Subscription.create(
  company_name: 'YouTube',
  user_id: '1',
  description: 'Amigos',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "03/03/2024",
  url: 'www.Youtube.com',
  price: '5',
  currency: "usd",
  category: "streaming"
)

Subscription.create(
  company_name: 'EducTech',
  user_id: '1',
  description: 'Personal',
  recurrent: "1",
  frequency: 'anually',
  payment_date: "01/04/2024",
  url: 'www.edutech.com',
  price: '200',
  currency: "usd",
  category: "education"
)

Subscription.create(
  company_name: 'DiarioTech',
  user_id: '1',
  description: 'Familiar',
  recurrent: "1",
  frequency: 'weekly',
  payment_date: "12/08/2024",
  url: 'www.diairiotech.com',
  price: '1',
  currency: "usd",
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
  price: '150',
  currency: "usd",
  category: "services"
)

Subscription.create(
  company_name: 'Netflix',
  user_id: '2',
  description: 'Familia',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "25/06/2024",
  url: 'www.Netflix.com',
  price: '10',
  currency: "usd",
  category: "streaming"
)

Subscription.create(
  company_name: 'Spotify',
  user_id: '2',
  description: 'Amigos',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "22/03/2024",
  url: 'www.Sporify.com',
  price: '10',
  currency: "usd",
  category: "streaming"
)


Subscription.create(
  company_name: 'EducTech',
  user_id: '2',
  description: 'Personal',
  recurrent: "1",
  frequency: 'anually',
  payment_date: "01/05/2024",
  url: 'www.edutech.com',
  price: '180',
  currency: "usd",
  category: "education"
)

Subscription.create(
  company_name: 'DiarioTech',
  user_id: '2',
  description: 'Familiar',
  recurrent: "1",
  frequency: 'weekly',
  payment_date: "12/04/2024",
  url: 'www.diairiotech.com',
  price: '2',
  currency: "usd",
  category: "services"
)

Subscription.create(
  company_name: 'GasLooz',
  user_id: '2',
  description: 'Familiar',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "11/07/2024",
  url: 'www.gaslooz.com',
  price: '18',
  currency: "usd",
  category: "services"
)

Subscription.create(
  company_name: 'Teletech',
  user_id: '2',
  description: 'Personal',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "11/08/2024",
  url: 'www.Teletech.com',
  price: '120',
  currency: "usd",
  category: "services"
)

Subscription.create(
  company_name: 'Spotify',
  user_id: '3',
  description: 'Amigos',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "22/03/2024",
  url: 'www.Sporify.com',
  price: '10',
  currency: "usd",
  category: "streaming"
)

Subscription.create(
  company_name: 'YouTube',
  user_id: '3',
  description: 'Amigos',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "03/03/2024",
  url: 'www.Youtube.com',
  price: '10',
  currency: "usd",
  category: "streaming"
)

Subscription.create(
  company_name: 'EducTech',
  user_id: '3',
  description: 'Personal',
  recurrent: "1",
  frequency: 'anually',
  payment_date: "01/06/2024",
  url: 'www.edutech.com',
  price: '180',
  currency: "usd",
  category: "education"
)

Subscription.create(
  company_name: 'DiarioTech',
  user_id: '3',
  description: 'Familiar',
  recurrent: "1",
  frequency: 'weekly',
  payment_date: "12/03/2024",
  url: 'www.diairiotech.com',
  price: '2',
  currency: "usd",
  category: "services"
)

Subscription.create(
  company_name: 'Teletech',
  user_id: '3',
  description: 'Personal',
  recurrent: "1",
  frequency: 'monthly',
  payment_date: "11/04/2024",
  url: 'www.Teletech.com',
  price: '120',
  currency: "usd",
  category: "services"
)

puts "Subscriptions created succesfully!"
