class RemoveFlightsReferenceFromPassenger < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :flight_id, :index
  end
end
