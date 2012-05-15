require 'spec_helper'

describe Entry do
  it "requires a url" do
    build(:entry, :url => '').should_not be_valid
  end

  it "requires an email" do
    build(:entry, :email => '').should_not be_valid
  end
end
