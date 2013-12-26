class ChangeLongDescriptionTypeInListing < ActiveRecord::Migration
  def change
    change_column :listings, :long_description, :text
  end
end
