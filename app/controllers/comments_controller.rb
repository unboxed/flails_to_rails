class CommentsController < ApplicationController
  def index
    @entry = Entry.find(params[:entry_id])
    @comments = @entry.comments
    @new_comment = @entry.new_comment
  end

  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.new(params[:comment])
    if @comment.save
      flash[:success] = "Your comment was submitted successfully."
      redirect_to entry_comments_path(@entry)
    end
  end
end
