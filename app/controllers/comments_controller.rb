# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[new create]

  # GET /comments/new
  def new
    @comment ||= @commentable.comments.build
  end

  # POST /comments
  def create
    @comment = @commentable.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.root), notice: 'Comment was successfully created.' }
        format.text { render partial: 'comments/comment.html.erb', object: @comment }
      else
        format.html do
          if @comment.top_level?
            @post = @comment.commentable
            render 'posts/show'
          else
            render :new
          end
        end
        format.text { render :new, status: :bad_request }
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
