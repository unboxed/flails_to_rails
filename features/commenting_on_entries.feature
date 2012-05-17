Feature: Commenting on entries
  In order to voice my opinions
  As a user
  I want to be able to comment on an entry

  Scenario: Adding the first comment to an entry
    Given an entry with no comments
    When  I visit the comments page for the entry
    And   I enter a comment
    And   I enter my email address
    And   I submit my comment
    Then  my comment should be created
