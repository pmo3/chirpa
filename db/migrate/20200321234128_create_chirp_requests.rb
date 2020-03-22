# frozen_string_literal: true

class CreateChirpRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :chirp_requests do |t|
      t.references :chirp, null: false, foreign_key: true
      t.string :sender
      t.string :recipient

      t.timestamps
    end
  end
end
