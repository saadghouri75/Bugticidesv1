class AddPropertyTypeToProperty < ActiveRecord::Migration
  def change
  	add_column :properties, :property_type, :string
  	add_column :properties, :size, :string
  	add_column :properties, :price_min, :decimal, :precision => 6, :scale => 2
  	add_column :properties, :price_max, :decimal, :precision => 6, :scale => 2
  	add_column :properties, :age, :integer
  	add_column :properties, :sold_at, :timestamp
  end
end
