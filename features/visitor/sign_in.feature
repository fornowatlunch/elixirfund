Feature: User Login
  In order to find & donate products, and access my account
  As a visitor to the site
  I need to be able to login

  Scenario: Nonexistent user attempts to login
    Given I am a visitor
      And I do not exist as a user
    When I visit the login page
      And I login as a user
    Then I am on the login page
      And I see an invalid login message

  Scenario: Existent user attempts to login with an invalid email
    Given I am a visitor
      And I exist as a user
    When I visit the login page
      And I login as a user with an invalid email
    Then I am on the login page
      And I see an invalid login message

  Scenario: Existent user attempts to login with an invalid password
    Given I am a visitor
      And I exist as a user
    When I visit the login page
      And I login as a user with an invalid password
    Then I am on the login page
      And I see an invalid login message

  Scenario: Existent user attempts to login with valid credentials
    Given I am a visitor
      And I exist as a user
    When I visit the login page
      And I login as a user
    Then I am on the home page
      And I see a signed in message

  Scenario: Logged in user visits the login page
    Given I am a visitor
      And I exist as a user
    When I visit the sign in page
      And I login as a user
      And I visit the login page
    Then I am on the home page
      And I see an already authenticated message

