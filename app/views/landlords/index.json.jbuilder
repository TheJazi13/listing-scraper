json.array!(@landlords) do |landlord|
  json.extract! landlord, :id, :company_id, :website, :name, :address, :city, :state, :postal_code, :country
  json.url landlord_url(landlord, format: :json)
end
