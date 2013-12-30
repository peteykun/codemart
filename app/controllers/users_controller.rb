class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :check_if_logged_in, only: [:new, :create]

  # Leaderboard:    index
  # Registration:   new, create
  # Profile:        show

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      @user.money = 0;
      @user.karma = 1;
      @user.save

      session[:user_id] = @user.id
      redirect_to programs_url
    else
      render 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def check_if_logged_in
      if current_user
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
