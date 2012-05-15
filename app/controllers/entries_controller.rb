class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    Entry.create(params[:entry])
    render :nothing => true
  end
end
