Feature: Create Patient Profile
  In order to make my information available
  As a patient
  I need to be able to create a patient profile

  Scenario: Create profile after registering
    Given I am logged in as a user
    When I visit my account
    Then I see the create patient button
    When I click the create patient profile button
    Then I see the new patient form
    When I fill in the patient form
    Then I am on my account page
    And I see patient created message
    And I do not see the create patient button
    When I visit my patient page
    Then I am on my patient page
    And I see my patient information

