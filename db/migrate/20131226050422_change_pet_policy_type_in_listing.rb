class ChangePetPolicyTypeInListing < ActiveRecord::Migration
  def change
    change_column :listings, :pet_policy, :boolean
  end
end
