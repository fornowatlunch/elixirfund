Feature: User Registration
  In order to become a patient or to connect with a patient
  As a visitor to the site
  I need to be able to register

  Scenario: User registers with valid information
    Given I am a visitor
    When I visit the user registration page
      And I register
    Then I am on the home page
      And I see a successful registration message

  Scenario: User registers with blank email
    Given I am a visitor
    When I visit the user registration page
      And I register with no email
    Then I see a user not saved message
      And I see an email cant be blank message
  
  Scenario: User registers with blank password
    Given I am a visitor
    When I visit the user registration page
      And I register with no password
    Then I see a user not saved message
      And I see a password cant be blank message

  Scenario: User registers with invalid email
    Given I am a visitor
    When I visit the user registration page
      And I register with an invalid email
    Then I see a user not saved message
      And I see an email is invalid message

  Scenario: User registers with short password
    Given I am a visitor
    When I visit the user registration page
      And I register with a short password
    Then I see a user not saved message
      And I see a password too short message

  Scenario: User registers with long password
    Given I am a visitor
    When I visit the user registration page
      And I register with a long password
    Then I see a user not saved message
      And I see a password too long message

  Scenario: User registers with non matching confirmation
    Given I am a visitor
    When I visit the user registration page
      And I register with a blank password confirmation
    Then I see a user not saved message
      And I see a password confirmation message

