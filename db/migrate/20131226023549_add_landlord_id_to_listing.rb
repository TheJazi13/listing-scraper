class AddLandlordIdToListing < ActiveRecord::Migration
  def change
    add_column :listings, :landlord_id, :integer
    add_index :listings, :landlord_id
  end
end
