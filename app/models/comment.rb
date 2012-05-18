class Comment < ActiveRecord::Base
  belongs_to :entry

  attr_accessible :body, :email

  validates_presence_of :body, :email
end
