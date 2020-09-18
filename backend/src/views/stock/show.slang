h1 Show Stock
p = stock.symbol
p = stock.company_name
p = stock.price
p = stock.user.id
p = stock.amount
p
  == link_to("Back", "/stocks", class: "btn btn-light btn-sm")
  == link_to("Edit", "/stocks/#{stock.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/stocks/#{stock.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
