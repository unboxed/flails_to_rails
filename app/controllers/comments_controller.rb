class CommentsController < ApplicationController
  def index
    @entry = Entry.find(params[:entry_id])
    @comments = @entry.comments
  end
end
