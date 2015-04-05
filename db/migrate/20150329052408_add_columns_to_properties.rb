class AddColumnsToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :status, :string, :default => 'open'
  	add_column :properties, :approved, :boolean, :default => :false
  end
end
