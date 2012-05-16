class EntriesController < ApplicationController
  def index
    @entries = Entry.most_recent_first
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      flash[:success] = "Your entry was submitted successfully."
      redirect_to entries_path
    else
      render :new
    end
  end
end
