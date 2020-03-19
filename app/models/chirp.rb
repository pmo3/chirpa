# frozen_string_literal: true

class Chirp < ApplicationRecord
  validates :text, presence: true
end
