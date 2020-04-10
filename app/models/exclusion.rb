# frozen_string_literal: true

class Exclusion < ApplicationRecord
  validates :email_address, presence: true
  attr_encrypted :email_address, key: Rails.application.credentials.secret_key_base, mode: :single_iv_and_salt, insecure_mode: true
end
