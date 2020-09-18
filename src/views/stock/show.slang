h1 Show Stock

div id="stocks"

== render(partial: "_price_target.slang")

div.w-100
  == link_to("Edit", "/stocks/#{stock.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/stocks/#{stock.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

script window.STOCK = { "symbol": "#{@stock.symbol}" }
script src="/dist/main.bundle.js?id=#{@uuid}"

- if Amber.settings.auto_reload?
  script src="/js/client_reload.js"