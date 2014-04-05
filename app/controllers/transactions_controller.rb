class TransactionsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @transactions = current_user.transactions
  end

  private
    def redirect_if_not_logged_in
      if !current_user
        redirect_to login_url unless !params[:username].nil?
      end
    end
end
