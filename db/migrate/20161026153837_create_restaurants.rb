class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
    	t.integer :price
    	t.string :name
    	t.string :address
    	t.string :state
    	t.string :city
    	t.string :country
    	t.string :location
    	

    	t.integer :destination_id

      	t.timestamps
    end
  end
end
