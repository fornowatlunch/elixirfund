Feature: Manage my wishlist
  In order to inform others of things i would like
  As a patient
  I need to be able to manage my wishlist

  Scenario: Access my wishlist from my account
    Given I am logged in as a patient
    And there are products
    When I visit my account
    Then there is a link to my wishlist

  Scenario: Empty wishlist
    Given I am logged in as a patient
    And there are products
    When I visit my account
    And I follow the link to my wishlist
    Then there are no products in my wishlist

  Scenario: Add an item to my wishlist
    Given I am logged in as a patient
    And there are products
    When I visit my account
    And I follow the link to my wishlist
    Then there is a link to add products
    When I click the button to add a product
    And I add a product to my wishlist
    Then I am on my wishlist page
    And I see the product I selected

  @javascript
  Scenario: Remove an item to my wishlist
    Given I am logged in as a patient
    And there are products
    And I have a product in my wishlist
    When I visit my account
    And I follow the link to my wishlist
    Then there is a button to remove the product from my wishlist
    When I click the button to remove the product from my wishlist
    Then I am on my wishlist page
    And there are no products in my wishlist

