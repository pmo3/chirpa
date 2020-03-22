# frozen_string_literal: true

class Chirp < ApplicationRecord
  validates :text, presence: true
  has_many :chirp_requests

  def self.search term
    where("text LIKE ? OR attribution LIKE ?", "%#{term}%", "%#{term}%")
  end
end
