require "http/client"
require "json"

module Finnhub

    class Utils

        def self.price_target(symbol)
            get_url("https://finnhub.io/api/v1/stock/price-target?symbol=#{symbol}")
        end

        def self.recommendations(symbol)
            url = "https://finnhub.io/api/v1/stock/recommendation?symbol=#{symbol}"
            response = get_url(url)
            response.as_a
        end

        def self.getPercentage(j, type)
            json = j.as_h
            ((json[type].as_i / (json["buy"].as_i + json["sell"].as_i + json["hold"].as_i + json["strongBuy"].as_i + json["strongSell"].as_i)) * 100).to_s
        end

        private def self.get_url(url)
            data = HTTP::Client.get(url + "&token=bthpmc748v6rsb748n50")
            json = JSON::Parser.new(data.body)
            json.parse
        end

    end

end