namespace :scrape do
  desc "Scrapes for listings from appfolio"
  task :appfolio => :environment do
    @xml = BigXML::Parser.new("http://rentals.appfolio.com/mits/v40/feed.xml")
    
    @xml.each_node do |node, path|
      if node.name == "Management"
        sub = Nokogiri::XML(node.inner_xml)
        name = sub.xpath("//CompanyName").text
        puts block
      elsif node.name = "Property"
        sub_node = Nokogiri::XML(node.inner_xml)
        name = sub_node.xpath("//MarketingName").text
        address = "#{sub_node.xpath("//Address/AddressLine1").text} #{sub_node.xpath("//Address/AddressLine2").text}, #{sub_node.xpath("//Address/City").text}, #{sub_node.xpath("//Address/PostalCode").text}"
        site = sub_node.xpath("//WebSite").text
        
       puts name
        puts address
      end
    end
  end
end
