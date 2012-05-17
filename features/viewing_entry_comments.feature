Feature: Viewing an entry's comments
  In order to see what people are saying
  As a user
  I want to view mine and other people's comments on an entry

  @wip
  Scenario: Two comments, oldest first
    Given an entry with two comments
    When  I visit the comments page for the entry
    Then  I should see the two comments
    And   they should be sorted oldest-first
