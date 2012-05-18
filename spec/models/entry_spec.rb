require 'spec_helper'

describe Entry do
  it "requires a url" do
    build(:entry, :url => '').should_not be_valid
  end

  it "requires an email" do
    build(:entry, :email => '').should_not be_valid
  end

  it "can instantiate a new comment with itself as the entry" do
    entry = Entry.new
    comment = entry.new_comment
    comment.entry.should == entry
  end

  it "initialises the new comment with the parameters given, if any" do
    entry = Entry.new
    comment = entry.new_comment(:body => "I love cats")
    comment.body.should == "I love cats"
  end
end
