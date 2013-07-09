class AddAddressToLocationSettings < ActiveRecord::Migration
  def change
    add_column :location_settings, :address, :string
  end
end
