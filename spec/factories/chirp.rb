# frozen_string_literal: true

FactoryBot.define do
  factory :chirp do
    text { Faker::Movies::HarryPotter.quote }
    attribution { Faker::Movies::HarryPotter.character }
    approved { true }
  end
end
