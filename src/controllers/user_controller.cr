class UserController < ApplicationController
  getter user = User.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_user }
  end

  def show
    render("show.slang")
  end

  def new
    render "new.slang"
  end

  def edit
    render("edit.slang")
  end

  def create
    begin
      unless params[:password] == params[:confirm_password]
        raise "Password do not match"
      end

      user = User.new user_params.validate!
      pass = user_params.validate!["password"]

      unless pass
        raise "Invalid password"
      end

      user.password = pass

      unless user.save
        raise "Could not create User!"
      end

      session[:user_id] = user.id
      redirect_to "/", flash: {"success" => "Created User successfully."}
    rescue exception
      flash[:danger] = exception.to_s
      render "new.slang"
    end
  end

  def update
    user.set_attributes user_params.validate!
    if user.save
      redirect_to "/", flash: {"success" => "User has been updated."}
    else
      flash[:danger] = "Could not update User!"
      render "edit.slang"
    end
  end

  def destroy
    user.destroy
    redirect_to "/", flash: {"success" => "User has been deleted."}
  end

  private def user_params
    params.validation do
      required :email
      optional :password
    end
  end

  private def set_user
    @user = current_user.not_nil!
  end
end
