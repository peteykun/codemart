class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :buy, :report]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

    def buy
      @own = @comment.have_rights?(current_user)
      @enough_money = current_user.money >= @comment.price
      
      if !@own and @enough_money
        @comment.buyers << current_user
        @comment.save

        User.transaction do
          comment_writer = @comment.user
          comment_writer.lock!
          current_user.lock!
          
          current_user.money -= @comment.price
          current_user.save!

          comment_writer.money += @comment.price
          comment_writer.save!

          t = Transaction.new
          t.debitor = current_user
          t.credited = comment_writer
          t.amount = @comment.price
          t.description = "Bought " + comment_writer.username + "'s comment"
          t.save
        end
      end
    end

  def report
    @comment.reported = true
    @comment.save
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :price)
    end
end
