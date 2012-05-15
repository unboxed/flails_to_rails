Feature: Users can view all submitted entries
  In order to see what people are submitting
  As a user
  I want to view a list of the most recent submitted entries

  @wip
  Scenario: Two entries, newest first
    Given there are two entries
    When  I visit the entries page
    Then  I should see the two entries
    And   they should each have a link to their URL
    And   the newer one should be at the top
