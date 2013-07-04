class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.integer  :user_id
  		t.string   :title
  		t.string   :description
  		t.integer  :location_id
  		t.integer  :pace       #integer for mile pace?
  		t.datetime :start_time

  		t.timestamps
  	end
  end
end
