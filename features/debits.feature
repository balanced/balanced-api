Feature: Debit cards

  Scenario: Debit a card
    Given I have tokenized a card
    When I make a POST request to the link "cards.debits" with the body:
      """
      { "amount": 2000 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Debit a customer card
    Given I have tokenized a customer card
    When I make a POST request to the link "cards.debits" with the body:
      """
      { "amount": 2000 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Create a debit
    Given I have created a customer
    When I make a POST request to the link "customers.debits" with the body:
      """
      { "amount": 1234 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
