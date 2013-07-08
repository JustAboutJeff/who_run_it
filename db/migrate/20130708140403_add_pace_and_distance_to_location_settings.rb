class AddPaceAndDistanceToLocationSettings < ActiveRecord::Migration
  def change
    add_column :location_settings, :pace_min, :integer
    add_column :location_settings, :pace_max, :integer
    add_column :location_settings, :distance_min, :integer
    add_column :location_settings, :distance_max, :integer
  end
end
