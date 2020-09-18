.w-100
h2 Recommendations
.w-100.d-flex.flex-wrap
    - data = Finnhub::Utils.recommendations(stock.symbol)
        - [data[0], data[1], data[2]].each do |rec|
        .text-dark.col-sm-12.col-md-6.col-lg-4.d-flex.flex-column.mb-3.card
            div Date: 
                span = rec["period"]
            div Buy: 
                span = Finnhub::Utils.getPercentage(rec, "buy") + "%"
            div Sell: 
                span = Finnhub::Utils.getPercentage(rec, "sell") + "%"
            div Hold: 
                span = Finnhub::Utils.getPercentage(rec, "hold") + "%"
            div Strong Buy: 
                span = Finnhub::Utils.getPercentage(rec, "strongBuy") + "%"
            div Strong Sell: 
                span = Finnhub::Utils.getPercentage(rec, "strongSell") + "%"