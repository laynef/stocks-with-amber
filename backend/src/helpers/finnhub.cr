require "http"

module Finnhub

    class Utils

        def initialize
            @host = HTTP::Client.new("https://finnhub.io")
        end

        def get(url)
            @host.get(url, get_headers)
        end

        def post(url, body)
            @host.post(url, get_headers, body)
        end

        def put(url, body)
            @host.put(url, get_headers, body)
        end

        def patch(url, body)
            @host.patch(url, get_headers, body)
        end

        def delete(url)
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