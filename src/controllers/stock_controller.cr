
class StockController < ApplicationController
  getter stock = Stock.new

  before_action do
    redirected
    only [:show, :edit, :update, :destroy] { set_stock }
    only [:create, :update] { same_user }
  end

  def index
    stocks = Stock.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    stock = Stock.new stock_params.validate!
    if stock.save
      redirect_to action: :index, flash: {"success" => "Stock has been created."}
    else
      flash[:danger] = "Could not create Stock!"
      render "new.slang"
    end
  end

  def update
    stock.set_attributes stock_params.validate!
    if stock.save
      redirect_to action: :index, flash: {"success" => "Stock has been updated."}
    else
      flash[:danger] = "Could not update Stock!"
      render "edit.slang"
    end
  end

  def destroy
    stock.destroy
    redirect_to action: :index, flash: {"success" => "Stock has been deleted."}
  end

  private def stock_params
    params.validation do
      required :symbol
      required :company_name
      required :price
      required :user_id
      required :amount
    end
  end

  private def set_stock
    @stock = Stock.find! params[:id]
  end

  private def same_user
    unless session[:user_id] == params[:user_id]
      session.delete(:user_id)
      flash[:info] = "No hacks. See ya later!"
      redirect_to "/"
      false
    else
      true
    end
  end

  private def redirected
    unless session[:user_id]
      redirect_to "/", flash: {"danger" => "Must be authenticated"}
      false
    else
      true
    end
  end
end
