# frozen_string_literal: true

class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.integer :empty_slot
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :free_bikes
      t.string :name
      t.string :uid

      t.timestamps
    end
  end
end
