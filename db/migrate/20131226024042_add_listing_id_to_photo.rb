class AddListingIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :listing_id, :integer
    add_index :photos, :listing_id
  end
end
