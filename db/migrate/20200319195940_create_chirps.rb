# frozen_string_literal: true

class CreateChirps < ActiveRecord::Migration[6.0]
  def change
    create_table :chirps do |t|
      t.text :text
      t.string :attribution
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
