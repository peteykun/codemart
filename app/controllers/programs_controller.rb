class ProgramsController < ApplicationController
  before_action :load_programs
  before_action :redirect_if_not_logged_in
  before_action :set_program, only: [:show]

  # GET /programs
  def index
    respond_to do |format|
      format.html { redirect_to program_path Program.where(user_id: session[:user_id]).first }
      format.json {
        @app_key_matched = AppKey.where(key: params[:app_key]).count != 0
      }
    end
  end

  # GET /programs/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_programs
      if session[:user_id]
        @programs = Program.where(user_id: session[:user_id]).order('reward ASC')
      elsif params[:username] && params[:password]
        user = User.find_by_username(params[:username])

        if user && user.authenticate(params[:password])
          @programs = Program.where(user_id: user.id).order('reward ASC')
        end
      end
    end

    def set_program
      @program = Program.find(params[:id])
    end

    def redirect_if_not_logged_in
      if !current_user
        redirect_to login_url unless !params[:username].nil?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params[:program]
    end
end
