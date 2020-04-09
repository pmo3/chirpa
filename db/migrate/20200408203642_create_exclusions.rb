class CreateExclusions < ActiveRecord::Migration[6.0]
  def change
    create_table :exclusions do |t|
      t.string :email_address

      t.timestamps
    end
  end
end
