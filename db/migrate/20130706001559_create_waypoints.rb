class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.integer :route_id
      t.integer :position
      t.float   :latitude
      t.float   :longitude
    end
  end
end
