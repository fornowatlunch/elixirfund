Feature: User Registration
  In order to become a patient or to connect with a patient
  As a visitor to the site
  I need to be able to register

  Scenario: User registers with valid information
    Given I am a visitor
    When I register as a user
    Then I am on the home page
      And I see a successful registration message

