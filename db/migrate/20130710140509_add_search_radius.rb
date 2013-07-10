class AddSearchRadius < ActiveRecord::Migration
  def up
    add_column :location_settings, :search_radius, :float
  end

  def down
    remove_column :location_settings, :search_radius
  end
end
