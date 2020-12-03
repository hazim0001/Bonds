# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
start_time = Time.now
200.times do
  user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.email, password: "123456", age:rand(30..60) , occupation: Faker::Job.title)
  rand(5..8).times do
puts "creating new users"
    Bond.create!(user: user,amount: rand(1000..1000000) , interest_rate: rand(10..15), start_date: Faker::Date.between(from: '2020-09-23', to: '2020-09-23'), end_date: Faker::Date.between(from: '2023-09-23', to: '2024-09-25'), terms: %w[ monthly quarterly].sample )
    puts "creating new users"
  end
end
counter = 1
Bond.all.each do |bond|
  days = (bond.end_date - bond.start_date).to_i
  bond.update(period: days)
  counter += 1
  puts counter
end
end_time = Time.now

puts "Time taken is #{end_time - start_time}"
