- if stock.errors
  ul.errors
    - stock.errors.each do |error|
      li = error.to_s

== form(action: "/stocks/#{stock.id.to_s}", method: stock.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "symbol", value: stock.symbol, placeholder: "Symbol", class: "form-control")
  .form-group
    == text_field(name: "company_name", value: stock.company_name, placeholder: "Company_name", class: "form-control")
  .form-group
    == text_field(name: "price", value: stock.price, placeholder: "Price", class: "form-control")
  .form-group
    == text_field(name: "user_id", value: stock.user_id, placeholder: "User Id", class: "form-control")
  .form-group
    == text_field(name: "amount", value: stock.amount, placeholder: "Amount", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/stocks", class: "btn btn-light btn-sm")
