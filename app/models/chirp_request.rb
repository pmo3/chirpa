# frozen_string_literal: true

class ChirpRequest < ApplicationRecord
  belongs_to :chirp
  validates :sender, presence: true
  validates :recipient, presence: true

  def send_email?
    # must use the dynamic find_by method here with attr_encrypted
    # breaks if using Exclusion.find_by(email_address: recipient)
    exclusions = Exclusion.find_by_email_address(recipient)
    result = exclusions.blank?
  end
end
