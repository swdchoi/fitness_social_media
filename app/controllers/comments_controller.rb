class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
    render "sessions/comments/show"
  end

  # GET /comments/new
  def new
    @session = Session.find(params[:session_id])
    @comment = @session.comments.build

    render "sessions/comments/new"
  end

  # GET /comments/1/edit
  def edit
    render "sessions/comments/edit"
  end

  # POST /comments or /comments.json
  def create
    @session = Session.find(params[:session_id])
    @comment = @session.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @session, notice: "Comment was successfully created." }
        @commentn = @session.comments.build
        format.turbo_stream { render "sessions/comments/create" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to @session, status: :see_other, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @session = Session.find(params[:session_id])
      @comment = @session.comments.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.expect(comment: [ :user_id, :session_id, :comment ])
    end
end
