require "./spec_helper"

def stock_hash
  {"symbol" => "Fake", "company_name" => "Fake", "price" => "1.00", "user_id" => "1", "amount" => "1.00"}
end

def stock_params
  params = [] of String
  params << "symbol=#{stock_hash["symbol"]}"
  params << "company_name=#{stock_hash["company_name"]}"
  params << "price=#{stock_hash["price"]}"
  params << "user_id=#{stock_hash["user_id"]}"
  params << "amount=#{stock_hash["amount"]}"
  params.join("&")
end

def create_stock
  model = Stock.new(stock_hash)
  model.save
  model
end

class StockControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe StockControllerTest do
  subject = StockControllerTest.new

  it "renders stock index template" do
    Stock.clear
    response = subject.get "/stocks"

    response.status_code.should eq(200)
    response.body.should contain("stocks")
  end

  it "renders stock show template" do
    Stock.clear
    model = create_stock
    location = "/stocks/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Stock")
  end

  it "renders stock new template" do
    Stock.clear
    location = "/stocks/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Stock")
  end

  it "renders stock edit template" do
    Stock.clear
    model = create_stock
    location = "/stocks/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Stock")
  end

  it "creates a stock" do
    Stock.clear
    response = subject.post "/stocks", body: stock_params

    response.headers["Location"].should eq "/stocks"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a stock" do
    Stock.clear
    model = create_stock
    response = subject.patch "/stocks/#{model.id}", body: stock_params

    response.headers["Location"].should eq "/stocks"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a stock" do
    Stock.clear
    model = create_stock
    response = subject.delete "/stocks/#{model.id}"

    response.headers["Location"].should eq "/stocks"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
