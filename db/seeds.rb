# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user = User.create!(
  username: 'Test User',
  email: 'test_user@doublegdp.com'
)

Task.create!(
  description: 'This is a test task description 1',
  avatar_url: '',
  completed_at: Time.zone.now,
  user_id: test_user.id
)

Task.create!(
  description: 'This is a test task description 2',
  avatar_url: '',
  completed_at: Time.zone.now,
  user_id: test_user.id
)

Task.create!(
  description: 'This is a test task description 3',
  avatar_url: '',
  user_id: test_user.id
)
