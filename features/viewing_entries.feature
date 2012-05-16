Feature: Users can view all submitted entries
  In order to see what people are submitting
  As a user
  I want to view a list of the most recent submitted entries

  Scenario: Two entries, newest first
    Given there are two entries
    When  I visit the entries page
    Then  I should see the two entries
    And   they should be sorted most-recent-first

  Scenario: No entries, empty page
    Given there are no entries
    When  I visit the entries page
    Then  I should see "There is nothing here"
