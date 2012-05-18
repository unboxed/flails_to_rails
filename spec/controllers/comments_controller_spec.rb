require 'spec_helper'

describe CommentsController do
  describe "create" do
    let(:entry) { create(:entry) }
    let(:comment) { attributes_for(:comment, :entry => entry) }

    it "creates a new comment when given valid attributes" do
      lambda {
        post :create, :entry_id => entry.to_param, :comment => comment
      }.should change(Comment, :count).by(1)
    end

    it "correctly sets the parent entry" do
      post :create, :entry_id => entry.to_param, :comment => comment
      new_comment = Comment.last
      new_comment.entry.should == entry
    end

    it "redirects to the entry's comments page" do
      post :create, :entry_id => entry.to_param, :comment => comment
      response.should redirect_to entry_comments_path(entry)
    end
  end
end
