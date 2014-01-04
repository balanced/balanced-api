Feature: Credit cards

  Scenario: Add a card to a customer
    Given I have created a customer
    When I make a PATCH request to the link "href" with the body:
    """
      {
        "op": "replace",
        "path": "/cards/0/links/customer",
        "value": "#{customers_id}"
      }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    """
      {
       "links": { "customer": "{customer,customers.id}" }
      }
    """

  Scenario: AVS Postal code matches
    When I make a POST request to /cards with the body:
      """
        {
         "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "address": {
            "postal_code": "94301"
          }
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
      """
        {
         "avs_postal_match": "yes"
        }
      """

  Scenario: AVS Postal code does not match
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "address": {
            "postal_code": "90210"
          }
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
      """
        {
         "avs_postal_match": "no"
        }
      """

  Scenario: AVS Postal code is unsupported
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "address": {
            "postal_code": "90211"
          }
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
      """
        {
         "avs_postal_match": "unsupported"
        }
      """

  Scenario: AVS Postal code is unused
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
      """
        {
         "avs_postal_match": null
        }
     """

 Scenario: AVS street matches
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "address": {
            "line1": "965 Mission St",
            "postal_code": "94103"
          }
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
      """
        {
          "avs_street_match": "yes"
        }
      """

  Scenario: AVS street does not matches
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "address": {
            "line1": "21 Jump St",
            "postal_code": "90210"
          }
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
      """
        {
          "avs_street_match": "no"
        }
      """

  Scenario: AVS street match is null
    When I make a POST request to /cards with the body:
    """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    """
        {
          "avs_street_match": null
        }
      """

