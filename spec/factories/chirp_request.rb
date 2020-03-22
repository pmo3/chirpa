# frozen_string_literal: true

FactoryBot.define do
  factory :chirp_request do
    chirp
    sender { Faker::Internet.email }
    recipient { Faker::Internet.email }
  end
end
