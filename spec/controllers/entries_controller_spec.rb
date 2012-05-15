require 'spec_helper'

describe EntriesController do
  describe "create" do
    let(:entry) { attributes_for(:entry) }

    it "creates a new entry with valid attributes" do
      lambda {
        post :create, :entry => entry
      }.should change(Entry, :count).by(1)
    end
  end
end
