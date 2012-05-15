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
