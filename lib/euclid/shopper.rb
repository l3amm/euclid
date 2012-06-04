module Euclid
  class Shopper
    
    def self.get_shoppers(credential, proximity=nil)
      url = "https://store.euclidelements.com/shoppers.json?credential=" + credential
      url += "&proximity=#{proximity}" if ["close", "detected", "away"].include? proximity
      JSON.parse(RestClient.get(url))
    end
    
    def self.get_shopper(id=nil)
      raise "Shopper ID required" if id.nil?
      url = "https://store.euclidelements.com/shoppers/#{id}.json?credential=hackathon"
      JSON.parse(RestClient.get(url))
    end
    
    def initialize(credential, mac, name)
      @mac = mac
      @name = name
      @credential = credential
    end
    
    def register
      url = "https://store.euclidelements.com/shoppers.json?credential=" + @credential
      response = RestClient.post(
        url,
        {
          mac: @mac,
          name: @name
        }
      )
      json_response = JSON.parse(response)
      if json_response["shopper_id"]
        @shopper_id = json_response["shopper_id"]
        self
      else
        raise "could not create shopper"
      end
    end
  end
end