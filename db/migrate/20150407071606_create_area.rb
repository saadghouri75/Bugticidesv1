class CreateArea < ActiveRecord::Migration
  def change
    create_table :areas do |t|
    	t.string :name
    	t.string :city
    	t.timestamps
    end
  end
end
