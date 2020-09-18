require "../helpers/finnhub"

class FinnhubController < ApplicationController
    include Finnhub

    def price_target
        finnhub = Finnhub::Utils.new
        symbol = params[:symbol]
        @prices = finnhub.get("/api/v1/stock/price-target?stock=#{symbol}&token=#{api_key}")
    end

    private def api_key
        ENV["FINNHUB_API_KEY"]
    end
end
