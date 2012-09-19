Feature: Invite People to connect
  In order to invite people i know to join the site and connect with me
  As a patient
  I need to be able to send out invitations

  Scenario: Send email invitation
    Given I am logged in as a patient
    When I visit my account
    Then there is a link to send an invitation
    When I follow the send invitation link
    Then I am on the new invitation page
    When I send an email invitation
    Then I am on my account page
    And I see an invitation sent message
    And the invitee should receive an email
