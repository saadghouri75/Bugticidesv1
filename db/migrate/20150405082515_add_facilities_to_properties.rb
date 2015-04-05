class AddFacilitiesToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :facilities, :string
  end
end
