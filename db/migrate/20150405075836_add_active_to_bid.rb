class AddActiveToBid < ActiveRecord::Migration
  def change
  	add_column :property_bids, :active, :boolean, :default => true
  end
end
