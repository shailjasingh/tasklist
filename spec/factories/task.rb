# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    description { 'This is a test description' }
    avatar_url { Faker::Internet.url }
    user
  end
end
