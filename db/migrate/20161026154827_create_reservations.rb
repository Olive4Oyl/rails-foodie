class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
    	t.integer :itinerary_id
    	t.integer :restaurant_id
    	t.datetime :reserved_time
    	
      	t.timestamps
    end
  end
end
