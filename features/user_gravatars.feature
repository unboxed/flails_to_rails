Feature: Users have Gravatars
  In order to see who's behind a submission
  As a user
  I want to see users' Gravatars next to their entries

  Scenario: Viewing someone else's Gravatar
    Given someone else has submitted an entry
    When  I visit the entries page
    Then  I should see their Gravatar
