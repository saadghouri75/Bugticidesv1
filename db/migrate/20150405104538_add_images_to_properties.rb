class AddImagesToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :image2, :string
  	add_column :properties, :image3, :string
  	add_column :properties, :image4, :string
  end
end
