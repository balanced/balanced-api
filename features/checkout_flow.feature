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

  Scenario: Existing buyer makes a purchase with a new card
    When I make a GET request to /customers/:customer_id
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema

    Then I make a GET request to "customers.source"
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema

    Then I make a POST request to /cards with the JSON API body:
      """
        {
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
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema

    When I make a GET request to /cards/:cards_id
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
      """
        {
          "avs_street_match": "yes",
          "avs_postal_match": "yes",
          "cvv_match": "yes"
        }
      """

    When I make a PATCH request to /customers/:customer_id with the JSON API body:
      """
        {
          "op": "replace",
          "path": "/customers/0/links/source",
          "value": "#{@cards_id}"
        }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema
      """
          {
            "links": { "source": "#{@cards_id}"
          }
      """

    When I make a POST request to /customers/:customer_id/orders with the body
      """
        {
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
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "orders" schema
      """
        {
        "links":{ "merchant": "#{@customers_id}"
        }
      """

    When I make a POST request to "customers.debits" with the body
      """
        {
          "amount": 10000,
          "order": "#{@orders_id}",
          "appears_on_statement_as": "Vaunte-Alice Ryan"
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "debits" schema
      """
        {
          "description": "Catherine Malandrino Black Top",
          "appears_on_statement_as": "BAL*Vaunte-Alice Ryan",
          "status": "succeeded",
          "links": {
            "order": "#{@orders_id}",
        }
      """


   When I make a PUT request to /orders/:order_id with the JSON API body:
      """
        {
          "meta": {
          "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
          "courier": "usps",
          "tracking_number": "9405510899359008595488"
        }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
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
    When I make a GET request to /customers/:customer_id
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema

    Then I make a GET request to "customers.source"
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema

    When I make a POST request to /customers/:customer_id/orders with the body:
      """
        {
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
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "orders" schema
      """
        {
        "links":{ "merchant": "#{@customers_id}"
        }
      """

    When I make a POST request to "customers.debits" with the body
      """
        {
          "amount": 10000,
          "order": "#{@orders_id}",
          "appears_on_statement_as": "Vaunte-Alice Ryan"
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "debits" schema
      """
        {
          "description": "Catherine Malandrino Black Top",
          "appears_on_statement_as": "BAL*Vaunte-Alice Ryan",
          "status": "succeeded",
          "links": {
            "order": "#{@orders_id}",
        }
      """


    When
      """
          {
            "meta": {
            "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
            "courier": "usps",
            "tracking_number": "9405510899359008595488"
          }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
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
    When I make a POST request to /cards with the JSON API body:
      """
        {
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
        }
     """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema

    When I make a GET request to /cards/:cards_id
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
      """
        {
          "avs_street_match": "yes",
          "avs_postal_match": "yes",
          "cvv_match": "yes"
        }
      """

    When I make a POST request to /customers
      """
        {
          "name": "Darius the Great",
          "email": "darius.great@gmail.com",
          "source": "#{@cards_id}",
          "meta": {
            "ip_address": "174.240.15.249"
        }
      """
    Then I should get a 201 OK status code
    And the response is valid according to the "customers" schema
      """
        {
          "links": {
            "source": "#{@cards_id}",
            "destination": null,
          }
        }
      """

    When I make a POST request to /customers/:customer_id/orders with the body
    """
        {
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
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "orders" schema
    """
        {
        "links":{ "merchant": "#{@customers_id}"
        }
      """

    When I make a POST request to "customers.debits" with the body
    """
        {
          "amount": 10000,
          "order": "#{@orders_id}",
          "appears_on_statement_as": "Vaunte-Alice Ryan"
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "debits" schema
    """
        {
          "description": "Catherine Malandrino Black Top",
          "appears_on_statement_as": "BAL*Vaunte-Alice Ryan",
          "status": "succeeded",
          "links": {
            "order": "#{@orders_id}",
        }
      """


    When I make a PUT request to /orders/:order_id with the JSON API body:
    """
        {
          "meta": {
          "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
          "courier": "usps",
          "tracking_number": "9405510899359008595488"
        }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "orders" schema
    """
          {
            "meta": {
              "listing": "https://www.vaunte.com/items/catherine-malandrino-black-top-42",
              "courier": "usps",
              "tracking_number": "9405510899359008595488"
            }
          }
      """
