class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.string :description
      t.string :area
      t.string :postal_code
      t.string :city
      t.string :province
      t.timestamps null: false
    end
  end
end
