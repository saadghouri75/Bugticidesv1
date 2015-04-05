class AddSoldFlagToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :sold_flag, :boolean, :default => false
  end
end
