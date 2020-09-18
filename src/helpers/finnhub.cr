require "http/client"
require "json"

module Finnhub

    class Utils

        def self.price_target(symbol)
            get_url("https://finnhub.io/api/v1/stock/price-target?symbol=#{symbol}")
        end

        def self.recommendations(symbol)
            get_url("https://finnhub.io/api/v1/stock/recommendation?symbol=#{symbol}")
        end

        def self.getPercentage(json, type)
            (json[type] / (json.buy + json.sell + json.hold + json.strongBuy + json.strongSell)) * 100.0
        end

        private def self.get_url(url)
            data = HTTP::Client.get(url + "&token=bthpmc748v6rsb748n50")
            json = JSON::Parser.new(data.body)
            json.parse
        end

    end

end