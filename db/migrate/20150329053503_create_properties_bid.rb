class CreatePropertiesBid < ActiveRecord::Migration
  def change
    create_table :property_bids do |t|
    	t.integer :property_id
    	t.integer :user_id
    	t.integer :bid
    	t.timestamps
    end
  end
end
