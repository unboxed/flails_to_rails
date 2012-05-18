Feature: Users have Gravatars
  In order to see who's behind an entry or a comment
  As a user
  I want to see users' Gravatars next to their contribution

  Scenario: Viewing the Gravatar of the user who submitted an entry
    Given someone else has submitted an entry
    When  I visit the entries page
    Then  I should see their Gravatar

  @wip
  Scenario: Viewing the Gravatar of the user who wrote an entry
    Given an entry
    And   someone else has commented on the entry
    When  I visit the comments page for the entry
    Then  I should see their Gravatar
