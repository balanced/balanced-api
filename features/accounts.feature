Feature: Accounts
  Accounts are funding instruments which are able to store a balance internally with the Balanced system.

  Scenario: List accounts
    Given I have created a customer
    When I GET to /accounts
    Then I should get a 200 OK status code
    And the response is valid according to the "accounts" schema

  Scenario: Retrieving accounts for a customer
    Given I have created a customer
    When I GET to /customers/:customer_id/accounts
    Then I should get a 200 OK status code
    And the response is valid according to the "accounts" schema
    And the fields on these accounts match:
      """
      {
        "links": {
          "customer": ":customer_id"
        }
      }
      """

  Scenario: Credit a customer payable account
    Given I have an order with a debit
    When I POST to /accounts/:customer_payable_account_id/credits with the body:
    """
    {
      "credits": [{
        "amount": 234,
        "order": "/orders/:order_id"
      }]
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

  Scenario: Retrieving credits for an account
    Given I have an Account with sufficient funds
    When I GET to /accounts/:customer_payable_account_id/credits
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

  # Currently there are no debitable accounts
  Scenario: Retrieving debits for an account
    Given I have an Account with sufficient funds
    When I GET to /accounts/:customer_payable_account_id/debits
    Then I should get a 200 OK status code
    And the fields on these debits match:
    """
      {
        "meta": {
          "total": 0
        }
      }
    """

  # Currently there are no debitable accounts, thus no refunds
  Scenario: Retrieving refunds for an account
    Given I have an Account with a credit
    Then I POST to /credits/:credit_id/reversals
    When I POST to /debits/:debit_id/refunds
    Then I should get a 201 Created status code
    And the response is valid according to the "refunds" schema

    When I GET to /accounts/:customer_payable_account_id/refunds
    Then I should get a 200 OK status code
    And the fields on these refunds match:
    """
      {
        "meta": {
          "total": 0
        }
      }
    """

  Scenario: Retrieving reversals for an account
    Given I have an Account with a credit
    Then I POST to /credits/:credit_id/reversals
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    When I GET to /accounts/:customer_payable_account_id/reversals
    Then I should get a 200 OK status code
    And the response is valid according to the "reversals" schema
    And the fields on these reversals match:
    """
      {
        "links": {
          "credit": ":credit_id_1"
        }
      }
    """

  Scenario: Retrieving settlements for an account
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
    When I GET to /accounts/:customer_payable_account_id/settlements
    Then I should get a 200 OK status code
    And the response is valid according to the "settlements" schema
    And the fields on these settlements match:
    """
      {
        "links": {
          "source": ":customer_payable_account_id"
        }
      }
      """