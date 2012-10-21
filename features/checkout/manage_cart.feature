Feature: Manage my cart
  In order to provide items to patients 
  As a user
  I need to be able to manage a cart of items

  Scenario: Add an item to my cart
  	Given I am logged in as a user
  	And I visit a patient profile
  	And there are items in the wishlist
  	When I click the button to add to cart
  	Then that item is in my cart

  Scenario: Remove an item to my cart
  	Given I am logged in as a user
  	And I have 1 item in my cart
  	When I click the link to remove item from cart
  	Then there are no items in my cart

  Scenario: View items in my cart
  	Given I am logged in as a user
  	And I have 1 item in my cart
  	When I click the link to show my cart
  	Then I can see that item

