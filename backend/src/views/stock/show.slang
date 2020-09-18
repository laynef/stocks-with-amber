h1 Show Stock

div id="stocks"

script window.STOCK = { "symbol": "#{@stock.symbol}" }
script src="/dist/main.bundle.js"

- if Amber.settings.auto_reload?
  script src="/js/client_reload.js"