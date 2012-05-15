When /^I visit the entry submission form$/ do
  visit new_entry_path
end

When /^I enter a URL and a title/ do
  fill_in 'Url', :with => "http://www.unboxedconsulting.com"
  fill_in 'Title', :with => "These guys rock"
end

When /^I enter my email address$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I submit my entry$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^my entry should be created$/ do
  pending # express the regexp above with the code you wish you had
end
