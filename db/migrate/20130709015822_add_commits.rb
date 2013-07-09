class AddCommits < ActiveRecord::Migration
  def up
    add_column :notifications, :committed, :boolean, default: false
  end

  def down
    remove_column :notifications, :committed
  end
end
