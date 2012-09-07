Feature: Product Index
  In order to find what products are available
  As a visitor or donor
  I need a product index that shows me the products

  Scenario: No products available
    When I visit the products page
    Then I see no products

  Scenario: Products available
    Given I have a partner with 3 products
    When I visit the products page
    Then I see all the products
