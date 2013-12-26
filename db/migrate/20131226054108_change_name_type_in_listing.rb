class ChangeNameTypeInListing < ActiveRecord::Migration
  def change
    change_column :listings, :name, :text
  end
end
