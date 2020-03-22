# frozen_string_literal: true

class ChirpRequest < ApplicationRecord
  belongs_to :chirp
  validates :sender, presence: true
  validates :recipient, presence: true
end
