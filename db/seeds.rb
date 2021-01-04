# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
start_time = Time.now
`say "Im starting now master time now is #{Time.now}"`
# 200.times do
#   user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.email, password: "123456", age:rand(30..60) , occupation: Faker::Job.title)
#   rand(5..8).times do
# puts "creating new users"
#     Bond.create!(user: user,amount: rand(1000..1000000) , interest_rate: rand(10..15), start_date: Faker::Date.between(from: '2020-09-23', to: '2020-09-23'), end_date: Faker::Date.between(from: '2023-09-23', to: '2024-09-25'), terms: %w[ monthly quarterly].sample )
#     puts "creating new users"
#   end
# end
# `say "all your 200 users have been created with 5 to 8 bonds each"`
# counter = 1
# Bond.all.each do |bond|
#   days = (bond.end_date - bond.start_date).to_i
#   bond.update(period: days)
#   counter += 1
#   puts counter
# end

hazim_asset = User.last.asset
10.times do
  Cash.create(asset: hazim_asset, amount: rand(1000.0..10000.0).round(2))
  Property.create(asset: hazim_asset, value: rand(10000..100000), description: Faker::House.room,location:Faker::Address.full_address)
  stock = Stock.create(asset: hazim_asset, symbol: Faker::Finance.ticker, instrument: Faker::Finance.ticker, position: rand(5..10), average_price: rand(10.0..100.0))
  stock.update(cost_basis: stock.position * stock.average_price)
end
cash_sum = Cash.where(asset: hazim_asset).sum(:amount)
properties_sum = Property.where(asset: hazim_asset).sum(:value)
stocks_sum = Stock.where(asset: hazim_asset).sum(:cost_basis)

hazim_asset.update(total_value: hazim_asset.total_value + properties_sum + stocks_sum + cash_sum )

end_time = Time.now

puts "Time taken is #{end_time - start_time}"
`say "all done master Time taken is #{end_time - start_time}"`
