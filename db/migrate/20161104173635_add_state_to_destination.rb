class AddStateToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :state, :string
    remove_column :itineraries, :state
  end
end
