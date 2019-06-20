class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.integer :empty_slot
      t.float :latitude
      t.float :longitude
      t.boolean :has_bikes
      t.integer :free_bikes
      t.string :name
      t.string :uid
    end
  end
end
