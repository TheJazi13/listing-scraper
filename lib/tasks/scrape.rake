namespace :scrape do
  desc 'Scrapes for listings from appfolio'
  task :appfolio => :environment do
    # Use BigXML object to allow for more lightweight memory use on large XML file
    @xml = BigXML::Parser.new("#{Rails.root.to_s}/resources/feed.xml")

    # Traverse each top level node of the document
    @xml.each_node do |node, path|
      if node.name == 'Management'
        # Setup the indivdual node as Nokogiri XML object for easier parsing
        sub_node = Nokogiri::XML(node.outer_xml)

        # Parse out the landlord information into temporary variables
        name = sub_node.xpath('//CompanyName').text
        company_id = sub_node.xpath('//Identification').attr('IDValue').text
        address = "#{sub_node.xpath('//Address/AddressLine1').text} #{sub_node.xpath('//Address/AddressLine2').text}, #{sub_node.xpath('//Address/City').text}, #{sub_node.xpath('//Address/PostalCode').text}"
        city = sub_node.xpath('//Address/City').text
        state = sub_node.xpath('//Address/State').text
        postal_code = sub_node.xpath('//Address/PostalCode').text
        country = sub_node.xpath('//Address/Country').text
        website = sub_node.xpath('//WebSite').text

        # Create Landlord entry
        Landlord.create!(name: name,
                         company_id: company_id,
                         address: address,
                         city: city,
                         state: state,
                         postal_code: postal_code,
                         country: country,
                         website: website)

      elsif node.name == 'Property'
        # Setup the indivdual node as Nokogiri XML object for easier parsing
        sub_node = Nokogiri::XML(node.outer_xml)

        # Parse out the property listing into temporary variables
        name = sub_node.xpath('//MarketingName').text
        address = "#{sub_node.xpath('//Address/AddressLine1').text} #{sub_node.xpath('//Address/AddressLine2').text}, #{sub_node.xpath('//Address/City').text}, #{sub_node.xpath('//Address/PostalCode').text}"
        website = sub_node.xpath('//WebSite').text
        photo_urls = sub_node.xpath('//File/Src')
        bedroom_count = sub_node.xpath("//Floorplan/Room[@RoomType='Bedroom']/Count").text.to_i
        bathroom_count = sub_node.xpath("//Floorplan/Room[@RoomType='Bathroom']/Count").text.to_i
        short_description = sub_node.xpath('//ShortDescription').text
        long_description = sub_node.xpath("//LongDescription").text
        pet_policy = sub_node.xpath('//Policy/Pet').attr('Allowed').text
        company_id = sub_node.xpath("//Identification[@IDType='Company']").attr('IDValue').text
        square_feet = sub_node.xpath('//Building/SquareFeet').text.to_i
        year_built = sub_node.xpath('//Information/YearBuilt').text.to_i
        price = sub_node.xpath('//Rents/StandardRent').text.to_f

        unless sub_node.xpath('//Deposit/Amount/ValueRange').empty? 
          deposit = sub_node.xpath('//Deposit/Amount/ValueRange').attr('Exact').text.to_f
        end

        # Find the landlord to associate the property with
        landlord = Landlord.find_by(company_id: company_id)

        # Create the property listing entry
        saved_listing = Listing.create!(name: name,
                                        short_description: short_description,
                                        long_description: long_description,
                                        address: address,
                                        year_built: year_built,
                                        bedroom_count: bedroom_count,
                                        bathroom_count: bathroom_count,
                                        price: price,
                                        website: website,
                                        deposit: deposit,
                                        square_feet: square_feet,
                                        pet_policy: pet_policy)

        # Create the photo entries and associate them with the current property
        photo_urls.each do |photo|
          saved_listing.photos << Photo.create!(url: photo.text)
        end

        # Save the lsiting after adding photos
        saved_listing.save!

        # Associate the listing to the landlord and save it
        landlord.listings << saved_listing if landlord
        landlord.save! if landlord
      end
    end
  end
end
