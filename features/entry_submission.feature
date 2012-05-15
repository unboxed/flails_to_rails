Feature: Users can submit an entry
  In order to share something on the web
  As a user
  I want to submit an entry to the site

  Scenario: Successful submission
    When I visit the entry submission form
    And  I enter a URL and a title
    And  I enter my email address
    And  I submit my entry
    Then my entry should be created
