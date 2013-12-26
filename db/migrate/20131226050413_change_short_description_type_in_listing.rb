class ChangeShortDescriptionTypeInListing < ActiveRecord::Migration
  def change
    change_column :listings, :short_description, :text
  end
end
