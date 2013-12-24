json.array!(@listings) do |listing|
  json.extract! listing, :id, :short_description, :long_description, :bedroom_count, :bathroom_count, :price, :website, :name, :deposit, :square_feet, :year_built, :pet_policy
  json.url listing_url(listing, format: :json)
end
