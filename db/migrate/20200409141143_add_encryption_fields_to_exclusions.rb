# frozen_string_literal: true

class AddEncryptionFieldsToExclusions < ActiveRecord::Migration[6.0]
  def change
    add_column :exclusions, :encrypted_email_address, :string
    add_column :exclusions, :encrypted_email_address_iv, :string
    add_index :exclusions, :encrypted_email_address_iv, unique: true
  end
end
