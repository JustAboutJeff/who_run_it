class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.integer  :user_id
  		t.string   :title
  		t.string   :description
  		t.integer  :route_id
  		t.datetime :start_time
      t.integer  :pace
      t.string   :url_key

  		t.timestamps
  	end
  end
end
