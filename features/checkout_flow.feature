Feature: Credit cards

  Scenario: Canceling an order
    Given I have an order
    Then I make a GET request to the link /orders/:order_id
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    """
      {
        "description": "Catherine Malandrino Black Top"
      }
    """

    Then I make a GET request to "orders.debits"
    Then I should get a 200 OK status code
    And the response is valid according to the "debits" schema
    """
      "amount": 10000,
      "description": "Catherine Malandrino Black Top"
    """

    Then I make a POST request to "debits.refunds"
    Then I should get a 201 OK status code
    And the response is valid according to the "refunds" schema
    """
      {
        "amount": 10000,
        "description": "Catherine Malandrino Black Top"
      }
    """

    Then I make a GET request to the link /orders/:order_id
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    """
      {
        "amount": 0,
        "amount_escrowed": 0,
        "currency": "USD",
        "description": "Catherine Malandrino Black Top"
      }
    """

