class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :company_id
      t.string :website
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country

      t.timestamps
    end
  end
end
