class CreateItineraryDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :itinerary_destinations do |t|
    	t.integer :destination_id
    	t.integer :itinerary_id
      t.timestamps
    end
  end
end
