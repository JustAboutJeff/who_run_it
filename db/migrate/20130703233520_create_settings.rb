class CreateSettings < ActiveRecord::Migration
  def change
  	create_table :settings do |t|
  		t.integer :user_id
  		t.integer :location_id
  		t.string  :notification_method  #combo (none, phone, email, both)
  		#frequency :frequency

  		t.timestamps
  	end
  end
end
