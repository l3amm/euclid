Euclid Gem
==========
Ruby wrapper for the [Euclid Hackathon API](http://www.euclidelements.com/hack/api). The Euclid gem provides an easy to user wrapper for Euclid's JSON API. It uses [RestClient](https://github.com/archiloque/rest-client) to simplify communication with Euclid's servers.

Installation
------------
[sudo] gem install euclid

Usage
=====

### Authentication

In order to talk to the appropriate sensor you must provide a credential to the server. To simplify this process I've created a client object to store the credential, all calls are made through the client.

    require 'rubygems'
    require 'euclid'
    
    # credential is the id of the sensor
    client = Euclid::Client.new('credential')
    
### Register Shopper

Using a properly credentialed client you can register a shopper with Euclid. A shopper with a previously registered mac address will return the shopper_id already stored with Euclid.

    # Create a client, optionally include a name identifier for the shopper
    # mac should be the mac address of the user's wireless device without colons. E.g. 00:AA:11:22:33:44 should be 00AA11223344
    # name is an optional parameter
    client.create_shopper("AABBCCFFFFFF", "Jeff Brown")
    # Return Value
    {
    "shopper_id": 183,
    "name": "Jeff Brown",
    "mac": "AABBCCFFFFFF",
    "registered_at": 1338577684
    }
    
### Fetch Shopper

Using a properly credentialed client you can fetch a shopper by shopper_id.

    # Fetch a shopper by shopper_id
    client.get_shopper(183)
    # Return Value
    {
    "shopper_id": 183,
    "name": "Jeff Brown",
    "mac": "AABBCCFFFFFF",
    "registered_at": 1338577684
    }
    
### Fetch Shoppers

Using a properly credentialed client you can fetch shoppers registered with the sensor.
    
    # fetch all shoppers registered with this credential, with an optional proximity parameter
    # get registerd shoppers close to the sensor
    client.get_shoppers('close')
    # get registerd shoppers detected by sensor
    client.get_shoppers('detected')
    # get registerd shoppers not detected by the sensor
    client.get_shoppers('away')
    # get all registered shoppers for this sensor
    client.get_shoppers()
    
    # Return Values
    [
      {
          "detected_at": 1338577743,
          "id": 161,
          "mac": "AABBCCDDEEEE",
          "name": "Macbook Ken",
          "registered_at": 1338491556
      },
        {
        "detected_at": 1338577719,
        "id": 157,
        "mac": "9022E454333F",
        "name": "iPhone 4 Steve",
        "registered_at": 1338491553
      }
     ]
### Fetch Alerts

You can also fetch alerts for a sensor, scoped by proximity and shopper_id (optional).

    # fetch all shoppers registered with this credential, with an optional proximity parameter
    # get recent alerts for all shoppers
    client.get_alerts()
    # get alerts for close shoppers
    client.get_alerts({"proximity" => "close"})
    # get alerts scoped by shopper_id
    client.get_alerts({"proximity" => "close", "shopper_id" => 183})
    client.get_alerts({"shopper_id" => 183})
    
    # Return Values
    [
       {
          "detected_at": 1338578069,
          "id": 13274,
          "proximity": "close",
          "shopper_id": 174,
          "shopper_mac": "00260890500B",
          "shopper_name": "iPhone 3GS Roy"
      },
      {
          "detected_at": 1338578060,
          "id": 13273,
          "proximity": "close",
          "shopper_id": 165,
          "shopper_mac": "CC08E0763CF6",
          "shopper_name": "Jane Doe"
      }
    ]
