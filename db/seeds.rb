Home.destroy_all
Home.create
Home.create

Task.destroy_all
Task.create name: 'Wash the dishes', points: 1, deadline: Date.today, every: 1, 
            since_done: true, status: 'claimable', room: 'kitchen', action: 'dishes', home_id: 1
Task.create name: 'Wash the dishes', points: 2, deadline: Date.today, every: 1, 
            since_done: true, status: 'claimable', room: 'kitchen', action: 'dishes', home_id: 2
Task.create name: 'Clean the toilet', points: 5, deadline: Date.tomorrow, every: 7, 
            since_done: true, status: 'claimable', room: 'bathroom', action: 'toilet', home_id: 1
Task.create name: 'Clean the toilet', points: 4, deadline: Date.tomorrow, every: 7, 
            since_done: true, status: 'claimable', room: 'bathroom', action: 'toilet', home_id: 2
Task.create name: 'Wipe living room', points: 2, deadline: 3.days.from_now, every: 3, 
            since_done: true, status: 'claimable', room: 'living_room', action: 'wipe', home_id: 1
Task.create name: 'Wipe living room', points: 2, deadline: 4.days.from_now, every: 3, 
            since_done: true, status: 'claimable', room: 'living_room', action: 'wipe', home_id: 2
Task.create name: 'Mop the kitchen', points: 2, deadline: Date.tomorrow, every: 1, 
            since_done: true, status: 'claimable', room: 'kitchen', action: 'mop', home_id: 1
Task.create name: 'Mop the kitchen', points: 2, deadline: Date.today, every: 1, 
            since_done: true, status: 'claimable', room: 'kitchen', action: 'mop', home_id: 2

User.destroy_all
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