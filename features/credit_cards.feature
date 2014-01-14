Feature: Credit cards

  @failing @gh-479
  Scenario: Add a card to a customer
    Given I have created a customer
    When I make a PATCH request to the href "href" with the body:
      """
        [{
          "op": "replace",
          "path": "/cards/0/links/customer",
          "value": "<%= @customer_id %>"
        }]
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "links": { "customer": "<%= @customer_id %>" }
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
    And the fields on this card match:
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
    And the fields on this card match:
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
    And the fields on this card match:
      """
        {
         "avs_postal_match": "unsupported"
        }
      """

  @failing @gh-438
  Scenario: AVS Postal code is unused
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
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
    And the fields on this card match:
      """
        {
          "avs_street_match": "yes"
        }
      """

  Scenario: AVS street does not match
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
    And the fields on this card match:
      """
        {
          "avs_street_match": "no"
        }
      """

  @failing @gh-438
  Scenario: AVS street match is null
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "avs_street_match": null
        }
      """

  @failing @gh-438
  Scenario: Detect a Visa card brand
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111 1111 1111 1111",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "brand": "Visa"
        }
      """

  @failing @gh-438
  Scenario: Detect a Mastercard card brand
    When I make a POST request to /cards with the body:
      """
        {
          "number": "5105 1051 0510 5100",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "brand": "MasterCard"
        }
      """

  @failing @gh-438
  Scenario: Detect an American Express card brand
    When I make a POST request to /cards with the body:
      """
        {
          "number": "3782 822463 10005",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "brand": "American Express"
        }
      """

  @failing @gh-438
  Scenario: Detect a Discover card brand
    When I make a POST request to /cards with the body:
      """
        {
          "number": "6011 1111 1111 1117",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "brand": "Discover"
        }
      """

  @failing @gh-480
  Scenario: Retrieving a card
    Given I have tokenized a card
    When  I make a GET request to /cards/:card_id
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
    """
        {
          "name": null,
          "number": "xxxxxxxxxxxx1111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "cvv": "xxx",
          "cvv_match": "yes",
          "cvv_result": "Match",
          "address": {
            "line1": "965 Mission St",
            "line2": null,
            "city": null,
            "state": null,
            "postal_code": "94103",
            "country_code": null
          },
          "avs_street_match": "yes",
          "avs_postal_match": "yes",
          "avs_result": "Postal code matches, but street address not verified.",
          "brand": "Visa",
          "meta": {}
        }
      """

  @failing @gh-438
  Scenario: Tokenizing a card
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111 1111 1111 1111",
          "expiration_month": "12",
          "expiration_year": "2016"
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """

    When I make a POST request to /cards with the body:
      """
        {
          "name": "Frida Kahlo",
          "number": "4111 1111 1111 1111",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "name": "Frida Kahlo"
        }
      """

    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111 1111 1111 1111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "address": {
            "line1": "7 Bis Rue de l'Abbé de l'Épée",
            "line2": "Apt 4",
            "city": "Versailles",
            "postal_code": "78000",
            "country_code": "FR"
          }
        }
      """
    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "address": {
            "line1": "7 Bis Rue de l'Abbé de l'Épée",
            "line2": "Apt 4",
            "city": "Versailles",
            "state": null,
            "postal_code": "78000",
            "country_code": "FR"
          }
        }
      """

  @failing @gh-481
  Scenario: Tokenization fails luhn test
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111112",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """
    Then I should get a 409 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
      """
        {
          "category_code": "card-not-validated"
        }
      """

  Scenario: Unstore a card
    Given I have tokenized a card
    When I make a DELETE request to /cards/:card_id
    Then I should get a 204 status code


  @failing
  Scenario: CVV matches
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "cvv": "123"
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    """
        {
         "cvv_match": "yes"
        }
      """

  @failing
  Scenario: CVV does not match
    When I make a POST request to /cards with the body:
      """
        {
           "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016,
            "cvv": "902"
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
      """
        {
         "cvv_match": "no"
        }
      """

  @failing
  Scenario: CVV is unsupported
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "cvv": "901"
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    """
        {
         "cvv_match": "unsupported"
        }
      """

  @failing
  Scenario: CVV is unused
    When I make a POST request to /cards with the body:
    """
        {
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    """
        {
         "cvv_match": null
        }
     """
