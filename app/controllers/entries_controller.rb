class EntriesController < ApplicationController
  def index

  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      render :nothing => true
    else
      render :new
    end
  end
end
