module Euclid
  class Alert
    
    def self.get_alerts(credential, args)
      url = "https://store.euclidelements.com/shoppers.json?&credential=" + credential
      if args.length > 0
        args.each do |k,v|
          url += "&#{k}=#{v}"
        end
      end
      p url
      JSON.parse(RestClient.get(url))
    end
  end
end