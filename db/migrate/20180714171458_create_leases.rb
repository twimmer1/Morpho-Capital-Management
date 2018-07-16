class CreateLeases < ActiveRecord::Migration[5.2]
  def change
    create_table :leases do |t|
      t.integer :user_id
      t.references :holding, foreign_key: true
      t.integer :rent
      t.string :start_date
      t.string :end_date
      t.integer :security_deposit
      t.text :conditions

      t.timestamps
    end
  end
end
