module Euclid
  class Client
    def initialize(credential)
      @credential = credential
    end
    
    def create_shopper(mac, name=nil)
      name = Digest::SHA2.hexdigest(mac.to_s) if name.nil?
      shopper = Euclid::Shopper.new(@credential, mac, name)
      response = shopper.register()
    end
    
    # proximity = detected || away || close
    def get_shoppers(proximity=nil)
      Euclid::Shopper.get_shoppers(@credential, proximity)
    end
    
    # gets the shopper information by shopper_id
    def get_shopper(id=nil)
      Euclid::Shopper.get_shopper(id)
    end
    
    # gets the alerts associated with this sensor, optional params shopper_id, proximity
    def get_alerts(opts={})
      args = {}
      args[:shopper_id] = opts["shopper_id"] if opts["shopper_id"]
      args[:proximity] = opts["proximity"] if opts["proximity"] && ["close", "detected", "away"].include?(opts["proximity"])
      p opts
      p opts["proximity"]
      Euclid::Alert.get_alerts(@credential, args)
    end
  end
end