Feature: Debit cards

  Scenario: Debit a card
    Given I have tokenized a card
    When I make a POST request to the link "cards.debits" with the body:
      """
      { "debits": [ {"amount": 2000 } ] }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Debit a customer card
    Given I have tokenized a customer card
    When I make a POST request to the link "cards.debits" with the body:
      """
      { "debits": [ {"amount": 2000 } ] }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Debit a verified bank account
    Given I have a verified bank account
    When I make a POST request to the link "bank_accounts.debits" with the body:
      """
      { "debits": [ {"amount": 2000 } ] }
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
      { "debits": [ {"amount": 2000 } ] }
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
      { "debits": [ {"amount": 1234 } ] }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

   Scenario: Failing to debit a customer
     Given I have created a customer without a card and bank account
     When I make a POST request to the link "customers.debits" with the body:
      """
      { "debits": [ {"amount": 8979 } ] }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "debits" schema

   Scenario: Debiting a card directly
     When I POST to /debits with the body:
      """
      {
        "debits": [{
          "amount": 1234,
          "source": {
            "number": "4111111111111111",
            "expiration_year": "2018",
            "expiration_month": 12
          }
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Debit unassociated card
    Given I have tokenized a card
    When I POST to /cards/:card_id/debits with the body:
    """
    {
      "debits": [{
        "amount": 5000
      }]
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
