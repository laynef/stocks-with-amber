require "http"

module Finnhub

    class Utils

        def initialize
        end

        def get(url)
            HTTP::Client.get("http://www.example.com", get_headers)
        end

        def post(url, body)
            HTTP::Client.post("http://www.example.com", get_headers, body)
        end

        def put(url, body)
            HTTP::Client.put("http://www.example.com", get_headers, body)
        end

        def patch(url, body)
            HTTP::Client.patch("http://www.example.com", get_headers, body)
        end

        def delete(url)
            HTTP::Client.delete("http://www.example.com", get_headers)
        end

        private def get_headers
            api_key: String = ENV["FINNHUB_API_KEY"]
            headers = HTTP::Headers.new
            headers.add("X-Finnhub-Token", api_key)
            headers
        end
    end

end