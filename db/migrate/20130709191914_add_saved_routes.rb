class AddSavedRoutes < ActiveRecord::Migration
  def up
    add_column :routes, :saved, :integer, default: 1
  end

  def down
    remove_column :routes, :saved
  end
end
