class ChangeReservedTimeDataType < ActiveRecord::Migration[5.0]
  def change
  	change_column :reservations, :reserved_time, :string
  end
end
