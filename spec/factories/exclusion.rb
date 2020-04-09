# frozen_string_literal: true

FactoryBot.define do
  factory :exclusion do
    email_address { Faker::Internet.email }
  end
end
