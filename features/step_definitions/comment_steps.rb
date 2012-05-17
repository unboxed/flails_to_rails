Given /^an entry with two comments$/ do
  @entry = submit_entry
  @comments = []
  2.times do
    @comments << create(:comment, :entry => @entry)
  end
end

When /^I visit the comments page for the entry$/ do
  visit entry_comments_path(@entry)
end

Then /^I should see the two comments$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^they should be sorted oldest\-first$/ do
  pending # express the regexp above with the code you wish you had
end
