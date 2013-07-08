class CreateLocationSettings < ActiveRecord::Migration
  def change
  	create_table :location_settings do |t|
  		t.integer :user_id
  		t.string  :name
      t.string  :notification_frequency
  		t.string  :notification_method  #combo (none, phone, email, both)
      t.float   :latitude
      t.float   :longitude

  		t.timestamps
  	end
  end
end
