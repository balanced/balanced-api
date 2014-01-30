Feature: Orders

  Scenario: Create an order
    Given I have created a customer
    When I make a POST request to /customers/:customer_id/orders

    Then I should get a 201 Created status code
    And the response is valid according to the "orders" schema

  Scenario: Basic order flow
    Given I have a customer with a tokenized bank account
    When I make a POST request to /customers/:customer_id/orders
    Then I should get a 201 Created status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
      """
      {
        "links": { "merchant": ":customer_id" }
      }
      """

    When I fetch the customer
    And I make a POST request to the link "customers.debits" with the body:
      """
      {
        "debits": [{
          "amount": 10000,
          "order": ":order_id"
        }]
      }
      """

    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
    And the fields on this debit match:
      """
      {
        "links": {
          "order": ":order_id"
        }
      }
      """
      
    When I fetch the order
    And I make a GET request to /orders/:order_id

    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
      """
      {
        "amount": 10000,
        "amount_escrowed": 10000
      }
      """

    When I fetch the customer
    And I make a POST request to the link "customers.credits" with the body:
      """
      {
        "credits": [{
          "amount": 10000,
          "order": ":order_id"
        }]
      }
      """

    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema
    And the fields on this credit match:
      """
      {
        "links": {
          "order": ":order_id"
        }
      }
      """

    When I fetch the order
    And I make a GET request to /orders/:order_id

    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
      """
      {
        "amount": 10000,
        "amount_escrowed": 0
      }
      """

  Scenario: Checking escrow of order after creating a debit
    Given I have created an order
    And I have tokenized a customer card
    And I make a POST request to the link "cards.debits" with the body:
    """
      {
        "debits": [{
          "order": ":order_id",
          "amount": 1234
        }]
      }
    """

    When I make a GET request to /orders/:order_id
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "amount_escrowed": 1234
      }
    """

  Scenario: Checking escrow of order after creating a credit
    Given I have an order with a debit
    And I have tokenized a bank account and associated with the merchant
    And I POST to /bank_accounts/:bank_account_id/credits with the JSON API body:
    """
    {
      "credits": [{
        "order": ":order_id",
        "amount": 12345
      }]
    }
    """
    When I make a GET request to /orders/:order_id
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "amount": 12345,
        "amount_escrowed": 0
      }
    """

  Scenario: Orders cannot be credited more than escrow balance
    Given I have created an order
    And I have tokenized a bank account and associated with the merchant
    And I have tokenized a customer card
    And I make a POST request to the link "cards.debits" with the body:
    """
      {
        "debits": [{
          "order": ":order_id",
          "amount": 1234
        }]
      }
    """
    When I make a GET request to /orders/:order_id
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "amount_escrowed": 1234
      }
    """
    And I POST to /bank_accounts/:bank_account_id/credits with the JSON API body:
    """
    {
      "credits": [{
        "order": ":order_id",
        "amount": 2000
      ]}
    }
    """
    Then I should get a 409 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
       "category_code": "insufficient-funds"
      }
    """

  Scenario: Create a refund
    Given I have created an order
    And I have tokenized a customer card
    And I have debited that card

    When I make a POST request to the link "debits.refunds"
    And I make a GET request to /orders/:order_id
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "amount_escrowed": 0
      }
    """

  Scenario: Create a reversal
    Given I have an order with a debit
    And I make a POST request to /customers/:merchant_id/bank_accounts with the body:
    """
    {
      "bank_accounts": [{
        "name": "Michael Jordan",
        "account_number": "9900000002",
        "routing_number": "021000021",
        "account_type": "checking"
      }]
    }
    """
    And I make a POST request to the link "bank_accounts.credits" with the body:
    """
      {
        "credits": [{
          "order": ":order_id",
          "amount": 12345
        }]
      }
    """
    When I make a GET request to /orders/:order_id
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "amount_escrowed": 0
      }
    """

    When I make a POST request to the link "credits.reversals"
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema

    When I make a GET request to /orders/:order_id
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "amount_escrowed": 12345
      }
    """

  Scenario: Create a failed refund when insufficient funds are in order escrow
    Given I have created an order
    And I have tokenized a card
    When I make a POST request to the link "cards.debits" with the body:
    """
      {
        "debits": [{
          "order": ":order_id",
          "amount": 1234
        }]
      }
    """
    And I have tokenized a bank account and associated with the merchant
    Then I make a POST request to the link "bank_accounts.credits" with the body:
    """
      {
        "credits": [{
          "order": ":order_id",
          "amount": 1234
        }]
      }
    """

    When I make a POST request to the link "debits.refunds"
    Then I should get a 409 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
       "category_code": "insufficient-funds"
      }
    """

  Scenario: Transactions should inherit the description of the order by default
    Given I have a merchant with an order with the body:
    """
    {
      "description": "Beats by Dr. Dre"
    }
    """

    Then I should get a 201 Created status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "description": "Beats by Dr. Dre"
      }
    """

    Given I have another customer with a card
    Then I make a POST request to the link "customers.debits" with the body:
    """
      {
        "debits": [{
          "amount": 10000,
          "order": ":order_id"
        }]
      }
    """

    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
    And the fields on this debit match:
    """
      {
        "description": "Beats by Dr. Dre"
      }
    """

    # this scenario becomes complicted, as there are two different customers
    # that we need to reference.  The first customer is the merchant which the order
    # is created under.  The second is the one doing the buying.
    Then I make a GET request to /customers/:merchant_id
    And I make a POST request to the link "customers.credits" with the body:
    """
      {
        "credits": [{
          "amount": 10000,
          "order": ":order_id"
        }]
      }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema
    And the fields on this credit match:
    """
      {
        "description": "Beats by Dr. Dre"
      }
    """
