# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.name }
    email { Faker::Internet.email }
  end
end
