@cart

Feature: Add to cart and submit order

  Background:
    Given I am on digital home screen


  @cart_01
  Scenario: Verify User is able to add one product to cart

   Then I will add product to cart

  @cart_02
  Scenario: Verify User is able to add multiple products to cart

    Then I will add product to cart
    And I will continue shopping and add one more product

  @cart_03
  Scenario: Verify User is able to add multiple products to cart

    Then I will add product to cart
    And I will continue shopping and add one more product
    And I click on proceed to checkout button
    Then I sign in to account
    And I click on proceed to checkout button
    And I agree to T & C
    And I click on proceed to checkout button
    And I provide payment details
    And I click on confirm order button
    Then I verify the order confirmation


  @cart_04
  Scenario: Verify User is able to add two different products to cart

    Then I will add product to cart
    And I will continue shopping and add new product
    And I click on proceed to checkout button
    Then I sign in to account
    And I click on proceed to checkout button
    And I agree to T & C
    And I click on proceed to checkout button
    And I provide payment details
    And I click on confirm order button
    Then I verify the order confirmation