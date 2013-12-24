class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :short_description
      t.string :long_description
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.float :price
      t.string :website
      t.string :name
      t.float :deposit
      t.integer :square_feet
      t.integer :year_built
      t.boolean :pet_policy

      t.timestamps
    end
  end
end
