class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
  before_action :authenticate_user!, only: [:destroy]

  def create
    @user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
    if @user
      if !@user.confirmed?
        redirect_to new_confirmation_path, alert: "Please confirm you email"
      else
        after_login_path = session[:user_return_to] || root_path
        active_session = login @user
        remember(active_session) if params[:user][:remember_me] == "1"
        redirect_to after_login_path, notice: "Successfully signed in!"
      end
    else
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    forget_active_session
    logout
    redirect_to login_path, notice: "Successfully logged out. Session cleared!"
  end

  def new
  end
end
