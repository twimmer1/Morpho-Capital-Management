class CreateHoldings < ActiveRecord::Migration[5.2]
  def change
    create_table :holdings do |t|
      t.string :address
      t.text :amenities
      t.integer :capacity
      t.text :description
      t.string :size
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :photos

      t.timestamps
    end
  end
end
