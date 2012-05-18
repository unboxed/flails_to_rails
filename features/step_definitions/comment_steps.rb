Given /^an entry with two comments$/ do
  @comments = []

  Timecop.travel(3.days.ago) do
    @entry = submit_entry
    @comments << add_comment(@entry)
  end

  @comments << add_comment(@entry)
end

Given /^an entry(?: with no comments)?$/ do
  @entry = submit_entry
end

When /^I visit the comments page for the entry$/ do
  visit entry_comments_path(@entry)
end

Then /^I should see the two comments$/ do
  @comments.each do |comment|
    page.should have_comment(:body => comment.body, :email => comment.email)
  end
end

Then /^they should be sorted oldest\-first$/ do
  old, new = @comments
  page.should have_comment(:body => old.body, :position => 1)
  page.should have_comment(:body => new.body, :position => 2)
end

When /^I enter a comment$/ do
  @body = "True story."
  fill_in 'comment[body]', :with => @body
end

When /^I submit my comment$/ do
  click_on 'Add Comment'
end

Then /^my comment should be created$/ do
  visit entry_comments_path(@entry)
  page.should have_comment(:body => @body, :email => @email)
end

module CommentSteps
  def add_comment(entry)
    comment = attributes_for(:comment)

    visit entry_comments_path(entry)
    fill_in 'comment[body]', :with => comment[:body]
    fill_in 'Your email', :with => comment[:email]
    click_on 'Add Comment'

    Comment.last
  end
end

World(CommentSteps)
