class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
    	t.string :city
    	t.integer :user_id
    	
      	t.timestamps
    end
  end
end
