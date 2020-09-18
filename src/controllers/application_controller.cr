require "jasper_helpers"
require "../helpers/market_hours"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  include MarketHours
  LAYOUT = "application.slang"
  
  before_action do 
    only [:show, :edit, :index, :new] { uuid }
  end

  def current_user
    context.current_user
  end

  def is_authenicated?
    unless current_user
      redirect_to "/signin", flash: {"danger" => "Must be logged in"}
      false
    else
      true
    end
  end

  private def uuid
    @uuid = Random.rand
  end
end
