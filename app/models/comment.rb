class Comment < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :body, :email
end
