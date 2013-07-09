class AddSavedRoutes < ActiveRecord::Migration
  def up
    add_column :routes, :saved, :boolean, default: true
  end

  def down
    remove_column :routes, :saved
  end
end
