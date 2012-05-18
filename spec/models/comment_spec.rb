require 'spec_helper'

describe Comment do
  it "fails validation without a body" do
    comment = build(:comment, :body => '')
    comment.should_not be_valid
  end

  it "fails validation without an email" do
    comment = build(:comment, :email => '')
    comment.should_not be_valid
  end
end
