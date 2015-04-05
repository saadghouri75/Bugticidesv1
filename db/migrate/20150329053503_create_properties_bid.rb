class CreatePropertiesBid < ActiveRecord::Migration
  def change
    create_table :property_bids do |t|
    	t.integer :property_id
    	t.integer :user_id
    	t.decimal :bid, :precision => 6, :scale => 2
    	t.timestamps
    end
  end
end
