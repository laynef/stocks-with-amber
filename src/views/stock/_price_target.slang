.w-100
    h2 Price Target
    .w-100.d-flex.flex-column.card.text-dark
        - data = Finnhub::Utils.price_target(stock.symbol)
        div Date:
            span = data["lastUpdated"]
        div Target High: 
            span = data["targetHigh"]
        div Target Low: 
            span = data["targetLow"]
        div Target Mean: 
            span = data["targetMean"]
        div Target Median: 
            span = data["targetMedian"]