# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Home.create
Home.create

Task.create name: 'Lavar los platos', points: 1, deadline: Date.today, every: 1, 
            since_done: true, status: 'claimable', tags: ['wash', 'kitchen'], home_id: 1
Task.create name: 'Lavar platos', points: 2, deadline: Date.today, every: 1, 
            since_done: true, status: 'claimable', tags: ['wash', 'kitchen'], home_id: 2
Task.create name: 'Limpiar el water', points: 5, deadline: Date.tomorrow, every: 7, 
            since_done: true, status: 'claimable', tags: ['wash', 'bathroom'], home_id: 1
Task.create name: 'Limpiar el water', points: 4, deadline: Date.tomorrow, every: 7, 
            since_done: true, status: 'claimable', tags: ['wash', 'bathroom'], home_id: 2
Task.create name: 'Barrer el salón', points: 2, deadline: 3.days.from_now, every: 3, 
            since_done: true, status: 'claimable', tags: ['wash', 'kitchen'], home_id: 1
Task.create name: 'Barrer salón', points: 2, deadline: 4.days.from_now, every: 3, 
            since_done: true, status: 'claimable', tags: ['wash', 'kitchen'], home_id: 2
Task.create name: 'Barrer la cocina', points: 2, deadline: Date.tomorrow, every: 1, 
            since_done: true, status: 'claimable', tags: ['wash', 'kitchen'], home_id: 1
Task.create name: 'Barrer cocina', points: 2, deadline: Date.today, every: 1, 
            since_done: true, status: 'claimable', tags: ['wash', 'kitchen'], home_id: 2

users = [
  {
    email: 'jonsnow@example.com', 
    password: '1234', 
    password_confirmation: '1234',
    name: 'Jon Snow',
    admin: true,
    home_id: 1
  },
  {
    email: 'sansa@example.com', 
    password: '1234', 
    password_confirmation: '1234',
    name: 'Sansa Stark',
    admin: true,
    home_id: 1
  },
  {
    email: 'sirdavos@example.com', 
    password: '1234', 
    password_confirmation: '1234',
    name: 'Sir Davos',
    admin: true,
    home_id: 1
  },
  {
    email: 'tyrion@example.com', 
    password: '1234', 
    password_confirmation: '1234',
    name: 'Tyrion Lannister',
    admin: true,
    home_id: 2
  },
  {
    email: 'khaleesi@example.com', 
    password: '1234', 
    password_confirmation: '1234',
    name: 'Daenerys Targaryen',
    admin: true,
    home_id: 2
  },
  {
    email: 'missandei@example.com', 
    password: '1234', 
    password_confirmation: '1234',
    name: 'Missandei',
    admin: true,
    home_id: 2
  },
]

users.each do |user_params|
  user = User.new user_params
  user.skip_confirmation!
  user.save!
end