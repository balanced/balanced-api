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

  Scenario: Debit a verified bank account
    Given I have a verified bank account
    When I make a POST request to the link "bank_accounts.debits" with the body:
      """
      { "amount": 20000 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
    And the fields on these debits match:
      """
      { "status": "succeeded" }
      """

  Scenario: Debits to unverified bank accounts fail
    Given I have attempted to verify a bank account and failed
    When I make a POST request to the link "bank_accounts.debits" with the body:
      """
      { "amount": 20000 }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "debits" schema
    And the fields on these debits match:
      """
      { "status": "failed" }
      """

   Scenario: Debit a customer
     Given I have created a customer
     When I make a POST request to the link "customers.debits" with the body:
      """
      { "amount": 1234 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

   Scenario: Failing to debit a customer
     Given I have created a customer without a card and bank account
     When I make a POST request to the link "customers.debits" with the body:
      """
      { "amount": 8979 }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "debits" schema
