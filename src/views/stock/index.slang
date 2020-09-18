.row
  .col-sm-11
    h2 Stocks
  .col-sm-1
    a.btn.btn-success.btn-sm href="/stocks/new" New
.table-responsive.bg-white
  table.table.table-striped
    thead
      tr
        th Symbol
        th Company_name
        th Price
        th User
        th Amount
        th Actions
    tbody
      - stocks.each do |stock|
        tr
          td = stock.symbol
          td = stock.company_name
          td = stock.price
          td = stock.user.id
          td = stock.amount
          td
            span
              == link_to("Show", "/stocks/#{stock.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/stocks/#{stock.id}/edit", class: "btn btn-success btn-sm")
