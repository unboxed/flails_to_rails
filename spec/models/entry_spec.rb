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
end
