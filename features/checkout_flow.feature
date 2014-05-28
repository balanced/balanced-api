Feature: Basic checkout flow
  A simple scenarios depicting how one would could use orders to manage
  and track the flow of funds.

  Scenario: Canceling an order
    Given I have an order with a debit
    When I POST to /debits/:debit_id/refunds

    Then I make a GET request to /orders/:order_id
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
    {
      "amount": 0,
      "amount_escrowed": 0
    }
    """

  Scenario: Existing buyer makes a purchase with a new card
    Given I have created a customer

    Then I POST to /cards with the body:
      """
        {
          "cards": [{
            "name": "Darius the Great",
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016,
            "cvv": "123",
            "address": {
              "line1": "965 Mission St",
              "line2": "Suite 425",
              "city": "San Francisco",
              "state": "CA",
              "postal_code": "94103"
            }
          }]
        }
      """

    When I make a GET request to /cards/:card_id
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "avs_street_match": "yes",
          "avs_postal_match": "yes",
          "cvv_match": "yes"
        }
      """

    When I PATCH to /cards/:card_id with the body:
      """
        [{
          "op": "replace",
          "path": "/cards/0/links/customer",
          "value": ":customer_id"
        }]
      """
    And the fields on this card match:
      """
          {
            "links": { "customer": ":customer_id" }
          }
      """

    When I make a POST request to the link "customers.orders" with the body:
      """
        {
          "orders": [{
            "description": "Catherine Malandrino Black Top",
            "delivery_address": {
              "line1": "965 Mission St",
              "line2": "Suite 425",
              "city": "San Francisco",
              "state": "CA",
              "postal_code": "94103"
            },
            "meta": {
              "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42"
            }
          }]
        }
      """
    And the fields on this order match:
      """
        {
        "links":{ "merchant": ":customer_id" }
        }
      """

    When I make a POST request to /customers/:customer_id/debits with the body:
      """
        {
          "debits": [{
            "amount": 10000,
            "order": ":order_id",
            "appears_on_statement_as": "Vaunte-Alice Ryan"
          }]
        }
      """
    And the fields on this debit match:
      """
        {
          "description": "Catherine Malandrino Black Top",
          "appears_on_statement_as": "BAL*Vaunte-Alice Ryan",
          "status": "succeeded",
          "links": {
            "order": ":order_id"
          }
        }
      """

   When I PUT to /orders/:order_id with the body:
      """
        {
          "orders": [{
            "meta": {
              "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
              "courier": "usps",
              "tracking_number": "9405510899359008595488"
             }
          }]
        }
      """
    And the fields on this order match:
      """
        {
          "meta": {
            "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
            "courier": "usps",
            "tracking_number": "9405510899359008595488"
          }
        }
      """

  Scenario: Existing buyer makes a purchase with an existing card
    Given I have created a customer

    When I make a POST request to /customers/:customer_id/orders with the body:
      """
        {
          "orders": [{
            "description": "Catherine Malandrino Black Top",
            "delivery _address": {
              "line1": "965 Mission St",
              "line2": "Suite 425",
              "city": "San Francisco",
              "state": "CA",
              "postal_code": "94103"
            },
            "meta": {
              "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42"
            }
          }]
        }
      """
    And the fields on this order match:
      """
        {
        "links":{ "merchant": ":customer_id" }
        }
      """

    When I make a POST request to the link "customers.debits" with the body:
      """
        {
          "debits": [{
            "amount": 10000,
            "order": ":order_id",
            "appears_on_statement_as": "Vaunte-Alice Ryan"
          }]
        }
      """
    And the fields on this debit match:
      """
        {
          "description": "Catherine Malandrino Black Top",
          "appears_on_statement_as": "BAL*Vaunte-Alice Ryan",
          "status": "succeeded",
          "links": {
            "order": ":order_id"
          }
        }
      """

    When I PUT to /orders/:order_id with the body:
      """
        {
          "orders": [{
            "meta": {
              "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
              "courier": "usps",
              "tracking_number": "9405510899359008595488"
            }
          }]
        }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
      """
        {
          "meta": {
            "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
            "courier": "usps",
            "tracking_number": "9405510899359008595488"
          }
        }
      """

  Scenario: New buyer makes a purchase
    When I POST to /cards with the body:
      """
        {
          "cards": [{
            "name": "Darius the Great",
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016,
            "cvv": "123",
            "address": {
              "line1": "965 Mission St",
              "line2": "Suite 425",
              "city": "San Francisco",
              "state": "CA",
              "postal_code": "94103"
            }
          }]
        }
     """
    And the fields on this card match:
      """
        {
          "avs_street_match": "yes",
          "avs_postal_match": "yes",
          "cvv_match": "yes"
        }
      """

    When I make a POST request to /customers with the body:
      """
        {
          "customers": [{
            "name": "Darius the Great",
            "email": "darius.great@gmail.com",
            "source": ":card_id",
            "meta": {
              "ip_address": "174.240.15.249"
            }
          }]
        }
      """

    And the fields on this customer match:
      """
        {
          "links": {
            "source": ":card_id",
            "destination": null
          }
        }
      """

    When I make a POST request to /customers/:customer_id/orders with the body:
      """
        {
          "orders": [{
            "description": "Catherine Malandrino Black Top",
            "delivery_address": {
              "line1": "965 Mission St",
              "line2": "Suite 425",
              "city": "San Francisco",
              "state": "CA",
              "postal_code": "94103"
            },
            "meta": {
              "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42"
            }
          }]
        }
      """
    And the fields on this order match:
      """
        {
        "links":{ "merchant": ":customer_id" }
        }
      """

    When I make a POST request to the link "customers.debits" with the body:
      """
        {
          "debits": [{
            "amount": 10000,
            "order": ":order_id",
            "appears_on_statement_as": "Vaunte-Alice Ryan"
          }]
        }
      """
    And the fields on this debit match:
      """
        {
          "description": "Catherine Malandrino Black Top",
          "appears_on_statement_as": "BAL*Vaunte-Alice Ryan",
          "status": "succeeded",
          "links": {
            "order": ":order_id"
          }
        }
      """


    When I PUT to /orders/:order_id with the body:
      """
        {
          "orders": [{
            "meta": {
              "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
              "courier": "usps",
              "tracking_number": "9405510899359008595488"
            }
          }]
        }
      """

    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    And the fields on this order match:
    """
      {
        "meta": {
          "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
          "courier": "usps",
          "tracking_number": "9405510899359008595488"
        }
      }
      """
