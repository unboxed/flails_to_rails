Given /^an entry with two comments$/ do
  @comments = []

  Timecop.travel(3.days.ago) do
    @entry = submit_entry
    @comments << create(:comment, :entry => @entry)
  end

  @comments << create(:comment, :entry => @entry)
end

Given /^an entry with no comments$/ do
  @entry = submit_entry
end

When /^I visit the comments page for the entry$/ do
  visit entry_comments_path(@entry)
end

Then /^I should see the two comments$/ do
  @comments.each do |comment|
    page.should have_comment(:body => comment.body)
  end
end

Then /^they should be sorted oldest\-first$/ do
  old, new = @comments
  page.should have_comment(:body => old.body, :position => 1)
  page.should have_comment(:body => new.body, :position => 2)
end
