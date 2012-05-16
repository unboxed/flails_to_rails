Feature: Entries pagination
  In order to keep page sizes small
  As a user
  I want to see paginated entries

  @wip
  Scenario: Only the first 10 entries are displayed at first
    Given there are 11 entries
    When  I visit the entries page
    Then  I should see 10 entries
    And   there should be 2 pages
    And   I should be on page 1
