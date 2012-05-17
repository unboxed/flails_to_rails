class Entry < ActiveRecord::Base
  has_many :comments

  attr_accessible :email, :title, :url

  validates_presence_of :url, :email

  def self.most_recent_first
    order('created_at DESC')
  end

  def new_comment
    comment = Comment.new
    comment.entry = self
    comment
  end
end
