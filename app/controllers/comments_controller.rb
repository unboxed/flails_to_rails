class CommentsController < ApplicationController
  def index
    @entry = Entry.find(params[:entry_id])
    @comments = @entry.comments
    @new_comment = @entry.new_comment
  end

  def create
    @entry = Entry.find(params[:entry_id])
    @new_comment = @entry.new_comment(params[:comment])

    if @new_comment.save
      flash[:success] = "Your comment was submitted successfully."
      redirect_to entry_comments_path(@entry)
    else
      @comments = @entry.comments
      render :index
    end
  end
end
