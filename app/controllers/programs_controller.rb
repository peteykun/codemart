class ProgramsController < ApplicationController
  before_action :load_programs
  before_action :redirect_if_not_logged_in
  before_action :set_program, only: [:show]

  # GET /programs
  def index
    respond_to do |format|
      format.html { redirect_to program_path Program.where(user_id: session[:user_id]).first }
      format.json
    end
  end

  # GET /programs/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_programs
      @programs = Program.where(user_id: session[:user_id])
    end

    def set_program
      @program = Program.find(params[:id])
    end

    def redirect_if_not_logged_in
      if !current_user
        redirect_to login_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params[:program]
    end
end
