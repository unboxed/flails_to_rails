class Entry < ActiveRecord::Base
  attr_accessible :email, :title, :url

  validates_presence_of :url, :email
end
