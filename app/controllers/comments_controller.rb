class CommentsController < ApplicationController
  before_action :set_commentable, only: [:new, :create]

  # GET /comments/new
  def new
    @comment ||= Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.root), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: post_path(@comment.root) }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_commentable
    @commentable ||= begin
                       commentable_class = [Comment, Post].find do |k|
                         params["#{k.name.underscore}_id"]
                       end
                       commentable_class.find(params["#{commentable_class.name.underscore}_id"])
                     end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
