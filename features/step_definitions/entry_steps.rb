Given /^there are no entries$/ do
  # Do nothing, as the database is cleared before each test
end

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

Then /^my entry should be created$/ do
  visit entries_path
  page.should have_entry(:title => @title, :url => @url)
end

Given /^there are two entries$/ do
  @entries = []
  Timecop.travel(3.days.ago) do
    @entries << submit_entry(:title => "This is old news")
  end
  @entries << submit_entry(:title => "This is breaking news")
end

When /^I visit the entries page$/ do
  visit entries_path
end

Then /^I should see the two entries$/ do
  @entries.each do |entry|
    page.should have_entry(:title => entry.title, :url => entry.url)
  end
end

Then /^they should be sorted most-recent-first/ do
  old, new = @entries
  page.should have_entry(:title => new.title, :position => 1)
  page.should have_entry(:title => old.title, :position => 2)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Given /^there are (\d+) entries$/ do |count|
  @entries = []
  count.to_i.times do
    @entries << submit_entry
  end
end

Then /^I should see (\d+) entries$/ do |count|
  page.should have_entries(count.to_i)
end

Then /^there should be (\d+) pages$/ do |count|
  page.should have_pages(count.to_i)
end

Then /^I should be on page (\d+)$/ do |page_num|
  page.should be_on_page(page_num.to_i)
end

Given /^someone else has submitted an entry$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see their Gravatar$/ do
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
