require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"

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
end
