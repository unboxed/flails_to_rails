When /^I visit the entry submission form$/ do
  visit new_entry_path
end

When /^I enter a URL and a title/ do
  @url = "http://www.unboxedconsulting.com"
  @title = "These guys rock"
  fill_in 'URL', :with => @url
  fill_in 'Title', :with => @title
end

When /^I enter my email address$/ do
  @email = 'user@example.com'
  fill_in 'Your email', :with => @email
end

When /^I submit my entry$/ do
  click_on 'Create Entry'
end

# Change this as soon as we have a page showing submitted entries
Then /^my entry should be created$/ do
  entry = Entry.last
  entry.url.should == @url
  entry.title.should == @title
  entry.email.should == @email
end

Given /^there are two entries$/ do
  entry1 = submit_entry :title => "This is old news"
  entry2 = submit_entry :title => "This is breaking news"
  @entries = [entry1, entry2]
end

When /^I visit the entries page$/ do
  visit entries_path
end

Then /^I should see the two entries$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^they should each have a link to their URL$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the newer one should be at the top$/ do
  pending # express the regexp above with the code you wish you had
end

module EntrySteps
  def submit_entry(args = {})
    entry = attributes_for(:entry).merge(args)

    visit new_entry_path
    fill_in 'URL', :with => entry[:url]
    fill_in 'Title', :with => entry[:title]
    fill_in 'Your email', :with => entry[:email]
    click_on 'Create Entry'

    Entry.last
  end
end

World(EntrySteps)
