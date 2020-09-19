.w-100
    - data = Finnhub::Utils.quote(stock.symbol)
    h2 = (stock.company_name || "Company") + ": $" + (data["c"] || "N/A").to_s
.w-100
    h4 Current Returns: 
        span = "$" + ((data["c"].as_f - (stock.price || 0).to_f) * (stock.amount || 0).to_f).to_s