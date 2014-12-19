Feature: Settlements
  Settlement is the action of moving money out of an Account to a
  bank account.

  Scenario: Create a settlement
    Given I have an Account with sufficient funds
    When I POST to /accounts/:customer_payable_account_id/settlements with the body:
      """
      {
        "settlements": [{
          "funding_instrument": "/bank_accounts/:bank_account_id",
          "appears_on_statement_as": "Settlement Oct",
          "description": "Settlement for payouts from October"
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "settlements" schema
    And the fields on this settlement match:
      """
      {
        "amount": 30000,
        "appears_on_statement_as": "BAL*Settlement Oct",
        "description": "Settlement for payouts from October",
        "links": {
          "destination": ":bank_account_id"
        }
      }
      """

  Scenario: List settlements
    Given I have 2 settlements
    When I GET to /settlements
    Then I should get a 200 OK status code
    And the response is valid according to the "settlements" schema

  Scenario: Retrieving settlements for a bank account
    Given I have a bank account with a settlement
    When I GET to /bank_accounts/:bank_account_id/settlements
    Then I should get a 200 OK status code
    And the response is valid according to the "settlements" schema
    And the fields on these settlements match:
      """
      {
        "links": {
          "destination": ":bank_account_id"
        }
      }
      """

  Scenario: Updating a settlement description
    Given I have a bank account with a settlement
    When I PUT to /settlements/:settlement_id with the body:
      """
      {
        "description": "A new settlement description"
      }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "settlements" schema
    And the fields on this settlement match:
      """
      {
        "description": "A new settlement description"
      }
      """

  Scenario: Updating a settlement meta
    Given I have a bank account with a settlement
    When I PUT to /settlements/:settlement_id with the body:
      """
      {
        "meta": {
          "reference_number": "546512"
        }
      }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "settlements" schema
    And the fields on this settlement match:
      """
      {
        "meta": {
          "reference_number": "546512"
        }

      }
      """

  Scenario: Creating a settlement without a funding destination leads to failure
    Given I have a customer with a tokenized bank account
    When I POST to /accounts/:customer_payable_account_id/settlements with the body:
    """
      {
        "settlements": [{
          "description": "Will this credit work? Nobody knows"
        }]
      }
    """
    Then I should get a 400 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
       "category_code": "request"
      }
    """

  Scenario: Creating a settlement for an Account with insufficient funds fails
    Given I have a customer with a tokenized bank account
    When I POST to /accounts/:customer_payable_account_id/settlements with the body:
    """
      {
        "settlements": [{
          "funding_instrument": "/bank_accounts/:bank_account_id"
        }]
      }
    """
    Then I should get a 409 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
       "category_code": "account-nothing-to-settle"
      }
    """

  Scenario: Settlement fails
    Given I have an Account with sufficient funds
    And I have tokenized a failing bank account associated with the merchant
    When I POST to /accounts/:customer_payable_account_id/settlements with the body:
    """
      {
        "settlements": [{
        "funding_instrument": "/bank_accounts/:bank_account_id",
        "description": "Will this settlement work? Certainly not!"
        }]
      }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "settlements" schema
    And the fields on this settlement match:
    """
      { "status": "failed" }
    """

  Scenario: Retrieving credits for a settlement
    Given I have a bank account with a settlement
    When I GET to /settlements/:settlement_id/credits
    Then I should get a 200 OK status code
    And the response is valid according to the "credits" schema
    And the fields on these credits match:
    """
      {
        "links": {
          "destination": ":customer_payable_account_id"
        }
      }
    """

  Scenario: Retrieving reversals for a settlement
    Given I have a bank account with a settlement
    Then I POST to /credits/:credit_id/reversals
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    Then I settle the account
    When I GET to /settlements/:settlement_id/reversals
    Then I should get a 200 OK status codek
    And the response is valid according to the "reversals" schema
    And the fields on these reversals match:
    """
      "links": {
        "credit": ":credit_id"
      }
    """

Scenario: Retrieving events for a settlement
  Given I have a bank account with a settlement
  When I GET to /settlements/:settlement_id/events
  Then I should get a 200 OK status code
  And the response is valid according to the "events" schema
  And the fields on these events match:
  """
    {
      "entity": {
        "settlements": {
          "links": {
            "source": ":customer_payable_account_id"
          }
        }
      }
    }
  """

  Scenario: Retrieving source for a settlement
    Given I have a bank account with a settlement
    When I GET to /resources/:customer_payable_account_id
    Then I should get a 200 OK status code
    And the response is valid according to the "accounts" schema
    And the fields on this account match:
    """
      {"id": ":customer_payable_account_id"}
    """

  Scenario: Retrieving destination for a settlement
    Given I have a bank account with a settlement
    When I GET to /resources/:bank_account_id
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_accounts" schema
    And the fields on this bank_account match:
    """
      {"id": ":bank_account_id"}
    """

  Scenario: Create settlement with negative account balance from bank account
    Given I have a bank account with a settlement
    When I GET to /settlements/:settlement_id
    Then I should get a 200 OK status code
    And the response is valid according to the "settlements" schema
    And the fields on this settlement match:
    """
      {
        "amount": 12345,
        "appears_on_statement_as": "BAL*example.com"
      }
    """
    And I GET to /accounts/:customer_payable_account_id
    Then I should get a 200 OK status code
    And the fields on this account match:
    """
      {
        "balance": 0
      }
    """
    And I POST to /credits/:credit_id/reversals
    Then I should get a 201 CREATED status code
    And the response is valid according to the "reversals" schema
    And I GET to /accounts/:customer_payable_account_id
    Then I should get a 200 OK status code
    And the fields on this account match:
    """
      {
        "balance": -12345
      }
    """
    When I POST to /accounts/:customer_payable_account_id/settlements with the body:
    """
      {
        "settlements": [{
          "funding_instrument": "/bank_accounts/:bank_account_id",
          "appears_on_statement_as": "Settlement Oct",
          "description": "Settlement for payouts from October"
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "settlements" schema
    And the fields on this settlement match:
    """
      {
        "amount": 12345,
        "appears_on_statement_as": "BAL*Settlement Oct",
        "description": "Settlement for payouts from October",
        "links": {
          "destination": ":customer_payable_account_id"
        }
      }
    """

    And I GET to /accounts/:customer_payable_account_id
    Then I should get a 200 OK status code
    And the fields on this account match:
    """
      {
        "balance": 0
      }
    """

  Scenario: Settle an account with negative balance from another order
    Given I have a bank account with a settlement
    When I GET to /settlements/:settlement_id
    Then I should get a 200 OK status code
    And the response is valid according to the "settlements" schema
    And the fields on this settlement match:
    """
      {
        "amount": 12345,
        "appears_on_statement_as": "BAL*Settlement Oct",
        "description": "Settlement for payouts from October",
        "links": {
          "destination": ":bank_account_id"
        }
      }
    """

    And I GET to /accounts/:customer_payable_account_id
    Then I should get a 200 OK status code
    And the fields on this account match:
    """
      {
        "balance": 0
      }
    """
    And I POST to /credits/:credit_id/reversals
    Then I should get a 201 CREATED status code
    And the response is valid according to the "reversals" schema
    And I GET to /accounts/:customer_payable_account_id
    Then I should get a 200 OK status code
    And the fields on this account match:
    """
      {
        "balance": -12345
      }
    """
    And I have a bank account with a settlement
    And I GET to /accounts/:customer_payable_account_id
    Then I should get a 200 OK status code
    And the fields on this account match:
    """
      {
        "balance": 0
      }
    """
