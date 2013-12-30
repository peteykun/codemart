class SessionsController < ApplicationController
  before_action :check_if_logged_in, only: [:new, :create]

  # Login:          new, create
  # Logout:         destroy

  # GET /sessions/new
  def new
    if current_user
      redirect_to root_url
    end
  end

  # POST /sessions
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to programs_url
    else
      @error = 'Invalid username or password.'
      render 'new'
    end
  end

  # DELETE /sessions/1
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private
    def check_if_logged_in
      if current_user
        redirect_to root_url
      end
    end
end
