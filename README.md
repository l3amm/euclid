Euclid Gem
==========
Ruby wrapper for the [Euclid Hackathon API](http://www.euclidelements.com/hack/api). The Euclid gem provides an easy to user wrapper for Euclid's JSON API. It uses [RestClient](https://github.com/archiloque/rest-client) to simplify communication with Euclid's servers.

Installation
------------
 gem install euclid

Usage
=====

### Authentication

In order to talk to the appropriate sensor you must provide a credential to the server. To simplify this process I've created a client object to store the credential, all calls are made through the client.

    require 'rubygems'
    require 'euclid'
    
    # credential is the id of the sensor
    client = Euclid::Client.new('credential')
    
    # fetch all shoppers registered with this credential, with an optional proximity parameter
    # get registerd shoppers close to the sensor
    client.get_shoppers('close')
    # get registerd shoppers detected by sensor
    client.get_shoppers('detected')
    # get registerd shoppers not detected by the sensor
    client.get_shoppers('away')
    # get all registered shoppers for this sensor
    client.get_shoppers()
    
    # Return Value
    Returns:
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
