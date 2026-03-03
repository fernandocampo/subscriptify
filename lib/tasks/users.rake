namespace :users do
  desc "Confirm all unconfirmed users (Free Tier Render bypass)"
  task confirm_all: :environment do
    count = User.where(confirmed_at: nil).update_all(confirmed_at: Time.current)
    puts "Confirmed #{count} user(s)."
  end
end
