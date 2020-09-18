require "../pipes/authenticate"

class Stock < Granite::Base
  connection pg
  table stocks

  belongs_to :user

  column id : Int64, primary: true
  column symbol : String?
  column company_name : String?
  column price : Float64?
  column amount : Float64?
  timestamps
end
