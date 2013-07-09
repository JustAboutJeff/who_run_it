class AddCommits < ActiveRecord::Migration
  def up
    add_column :notifications, :committed, :integer, default: 0
  end

  def down
    remove_column :notifications, :committed
  end
end
