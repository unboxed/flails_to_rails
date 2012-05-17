class CommentsController < ApplicationController
  def index
    @entry = Entry.find(params[:entry_id])
    @comments = @entry.comments
    @new_comment = @entry.new_comment
  end
end
