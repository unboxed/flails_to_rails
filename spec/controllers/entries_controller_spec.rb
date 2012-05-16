require 'spec_helper'

describe EntriesController do
  describe "create" do
    let(:entry) { attributes_for(:entry) }

    context "given valid attributes" do
      it "creates a new entry when given valid attributes" do
        lambda {
          post :create, :entry => entry
        }.should change(Entry, :count).by(1)
      end

      it "redirects to the entries index page" do
        post :create, :entry => entry
        response.should redirect_to entries_path
      end
    end

    it "renders the 'new' form again when given invalid attributes" do
      post :create, :entry => entry.except(:url)
      response.should render_template :new
    end
  end
end
