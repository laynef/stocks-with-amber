require "http"

module Finnhub

    class Utils

        def initialize
            @host = HTTP::Client.new("https://finnhub.io")
        end

        def price_target(symbol)
            get("/api/v1/price_target?token=#{api_key}&symbol=#{symbol}")
        end

        private def get(url)
            @host.get(url, get_headers)
        end

        private def post(url, body)
            @host.post(url, get_headers, body)
        end

        private def put(url, body)
            @host.put(url, get_headers, body)
        end

        private def patch(url, body)
            @host.patch(url, get_headers, body)
        end

        private def delete(url)
            @host.delete(url, get_headers)
        end

        private def get_headers
            api_key: String = ENV["FINNHUB_API_KEY"]
            headers = HTTP::Headers.new
            headers.add("X-Finnhub-Token", api_key)
            headers
        end
    end

end