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
    And the fields on these credits match:
      """
      {
        "links": {
          "customer": ":customer_id"
        }
      }
      """

  Scenario: Credit a customer deposit account
    Given I have an order with a debit
    When I POST to /accounts/:customer_payable_account_id/credits
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