Feature: User logout
  In order to protect my account from unauthorized access
  As a user
  I need to be able to logout

  Scenario: Logout
    Given I exist as a user
    When I visit the sign in page
      And I login as a user
    Then I am on the home page
      And I see a sign out link
    When I click the sign out link
    Then I am on the home page
      And I see a signed out message
      And I see the login form
