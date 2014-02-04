Feature: Accounts
  Accounts are a way to have a store of some kind of value.

  Scenario: Creating an Operating Account
    Given I have created a customer
    When I make a POST request to the link "accounts" with the body:
      """
      {
        "accounts":[{
          "account_type": "deposit",
          "description": "Redeemable balances migration",
          "meta": {
            "tag": "migration-redeemable-balance-account"
          }
        }]
      } 
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "accounts" schema
    And the fields on this account should match:
      """
      { "balance": 0 }
      """

  Scenario: Operating accounts may go negative
    Given I have created an operating account
    When I make a POST request to the link "accounts.debits" with the body:
      """
      { "amount": 1000 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
    And the fields on this debit should match:
      """
      {
        "amount": 1000,
        "status": "succeeded"
      }
      """

    When I fetch the account
    Then the fields on this account should match:
      """
      {
        "balance": -1000
      }
      """

  Scenario: Creating a Deposit Account
    Given I have created a customer
    When I make a POST request to the link "accounts" with the body:
      """
      {
        "accounts":[{
          "account_type": "deposit",
          "description": "Stored Value",
          "meta": {
            "tag": "customer-redeemable-balance-account"
          }
        }]
      } 
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "accounts" schema
    And the fields on this account should match:
      """
      { "balance": 0 }
      """

  Scenario: Deposit accounts may not go negative
    Given I have created a deposit account
    When I make a POST request to the link "accounts.debits" with the body:
      """
      { "amount": 1000 }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "errors" schema

    When I make a POST request to the link "accounts.credits" with the body:
      """
      { "amount": 1000 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema
    And the fields on this debit should match:
      """
      {
        "amount": 1000,
        "status": "succeeded"
      }
      """

    When I fetch the account
    Then the fields on this account should match:
      """
      {
        "balance": 1000
      }
      """

  Scenario: Creating a Line of Credit Account
    Given I have created a customer
    When I make a POST request to the link "accounts" with the body:
      """
      {
        "accounts":[{
          "account_type": "line-of-credit",
          "description": "Overweight shipping",
          "meta": {
            "tag": "customer-credit-line-account"
          }
        }]
      } 
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "accounts" schema
    And the fields on this account should match:
      """
      { "balance": 0 }
      """

  Scenario: Line of Credit Accounts may not go positive
    Given I have created a line of credit account
    When I make a POST request to the link "accounts.credits" with the body:
      """
      { "amount": 1000 }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "errors" schema

    When I make a POST request to the link "accounts.debits" with the body:
      """
      { "amount": 1000 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema
    And the fields on this debit should match:
      """
      {
        "amount": 1000,
        "status": "succeeded"
      }
      """

    When I fetch the account
    Then the fields on this account should match:
      """
      {
        "balance": -1000
      }
      """
