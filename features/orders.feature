Feature: Orders

  @failing @gh-469
  Scenario: Create an order
    Given I have created a customer
    When I make a POST request to /customers/:customer_id/orders

    Then I should get a 201 Created status code
    And the response is valid according to the "orders" schema

  @failing @gh-469
  Scenario: Checking escrow of order after creating a debit
    Given I have created an order
    And I have tokenized a customer card
    And I make a POST request to the link "cards.debits" with the body:
    """
      {
        "order": "<%= @order_id %>",
        "amount": 1234
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

  @failing @gh-469
  Scenario: Checking escrow of order after creating a credit
    Given I have created an order
    And I have sufficient funds in my marketplace
    And I have tokenized a bank account
    And I POST to /bank_accounts/:bank_account_id/credits with the JSON API body:
    """
    {
       "order": "<%= @orders_id %>",
       "amount": 1234
    }
    """
    When I make a GET request to /orders/:order_id
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "amount_escrowed": 0
      }
    """


  @failing @gh-469
  Scenario: Orders cannot be credited more than escrow balance
    Given I have created an order
    And I have tokenized a customer card
    And I make a POST request to the link "cards.debits" with the body:
    """
      {
      "order": "<%= @orders_id $>",
      "amount": 1234
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
      "order": "<%= @orders_id %>",
      "amount": 2000
    }
    """
    Then I should get a 409 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
       "category_code": "account-insufficient-funds"
      }
    """

  @failing @gh-469
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


  @failing @gh-469
  Scenario: Create a reversal
    Given I have created an order
    And I have tokenized a customer card
    And I make a POST request to /customers/:customer_id/orders with the body:
    """
      {
      "order": "<%= @orders_id %>",
      "amount": 1234
      }
    """
    And I have tokenized a bank account
    And I make a POST request to the link "bank_accounts.credits" with the body:
    """
      {
        "order": "<%= @orders_id %>",
        "amount": 1234
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
        "amount_escrowed": 0
      }
    """


  @failing
  Scenario: Create a failed refund when insufficient funds are in order escrow
    Given I have tokenized a card
    When I make a POST request to the link "cards.debits" with the body:
    """
      {
        "order": "#{@orders_id}",
        "amount": 1234
      }
    """
    And I have tokenized a bank account
    Then I make a POST request to the link "bank_accounts.credits" with the body:
    """
        "order": "#{@orders_id}",
        "amount": 1234
    """
    When I make a POST request to the link "debits.refunds"
    Then I should get a 409 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
       "category_code": "account-insufficient-funds"
      }
    """

  @failing
  Scenario: Transactions should inherit the description of the order by default
    Given I have tokenized a bank account
    When I make a POST request to the link "customers.orders" with the body:
    """
      {
       "description": "Beats by Dr. Dre" }
      }
    """

    Then I should get a 201 Created status code
    And the response is valid according to the "orders" schema
    """
      {
        { "description": "Beats by Dr. Dre" }
      }
    """

    And I make a POST request to the link "customers.debits" with the body:
    """
      {
        "amount": 10000,
        "order": "#{@orders_id}",
      }
    """

    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
    """
      {
        "description": "Beats by Dr. Dre" }
      }
    """

    And I make a POST request to the link "customers.credits" with the body:
    """
      {
        "amount": 10000,
        "order": "#{@orders_id}",
      }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
    """
      {
        { "description": "Beats by Dr. Dre"}
      }
    """

  @failing
  Scenario: Crediting an unverified merchant will result in failure
    Given I have an unverified customer with a tokenized card
    And I make a POST request to 'customers.orders'

    And I make a POST request to the link "cards.debits" with the body:
    """
      {
        "order": "#{@orders_id}",
        "amount": 1234
      }
    """
    Then I should get a 201 Created status code

    And I make a POST request to the link "bank_accounts.credits" with the body:
    """
      {
        "amount": 1234,
        "order": "#{@orders_id}",
      }
    """
    Then I should get a 409 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
        "description": "Order requires that merchant CU[a-zA-Z0-9]{16,32} be underwritten.",
        "category_code": "order-kyc"
      }
    """
