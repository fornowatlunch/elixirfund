Feature: Patient Profile
  
  Scenario: Access profile from account
    Given I am logged in as a patient
    When I visit my account
    Then I see a link to my patient page
    When I follow the link to my patient page
    Then I am on my patient page
