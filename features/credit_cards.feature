Feature: Credit cards

  Scenario: Add a card to a customer
    Given I have tokenized a card
    And I have created a customer
    When I make a PATCH request to /cards/:card_id with the body:
      """
        [{
          "op": "replace",
          "path": "/cards/0/links/customer",
          "value": ":customer_id"
        }]
      """
    Then I should get a 200 OK status code
    And I make a GET request to /cards/:card_id
    Then the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
          "links": { "customer": ":customer_id" }
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
            "city": "Balo Alto",
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
    # the api returns a 400, while running it locally returns a 409
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
    And the fields on this card match:
    """
        {
         "cvv_match": "yes"
        }
      """

  Scenario: CVV does not match
    When I make a POST request to /cards with the body:
      """
        {
           "number": "5112000200000002",
            "expiration_month": 12,
            "expiration_year": 2016,
            "cvv": "200"
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
         "cvv_match": "no"
        }
      """

  Scenario: CVV is unsupported
    When I make a POST request to /cards with the body:
      """
        {
          "number": "4457000300000007 ",
          "expiration_month": 12,
          "expiration_year": 2016,
          "cvv": "901"
        }
      """

    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
    """
        {
         "cvv_match": "unsupported"
        }
      """

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
    And the fields on this card match:
    """
        {
         "cvv_match": null
        }
     """

  Scenario: Adding card metadata
    Given I have tokenized a card
    When I make a PATCH request to the href "href" with the body:
      """
       [{
        "op": "add",
        "path": "/cards/0/meta/asdf",
        "value": "the value to be added"
      }]
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
       { "meta": { "asdf": "the value to be added" } }
      """

  Scenario: Updating card metadata
    Given I have tokenized a card
    When I make a PATCH request to the href "href" with the body:
      """
       [{
        "op": "add",
        "path": "/cards/0/meta/asdf",
        "value": "the value to be added"
      }]
      """

    Then I fetch the card
    And I make a PATCH request to the href "href" with the body:
      """
       [{
        "op": "replace",
        "path": "/cards/0/meta/asdf",
        "value": "new value"
      }]
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
       { "meta": { "asdf": "new value" } }
      """

  Scenario: Safely updating the metadata
    Given I have tokenized a card
    When I make a PATCH request to the href "href" with the body:
      """
       [{
        "op": "add",
        "path": "/cards/0/meta/asdf",
        "value": "the value to be tested"
      }]
      """

    Then I fetch the card
    And I make a PATCH request to the href "href" with the body:
      """
      [{
        "op": "test",
        "path": "/cards/0/meta/asdf",
        "value": "the value to be tested"
      },{
        "op": "replace",
        "path": "/cards/0/meta/asdf",
        "value": "after checking the value"
      }]
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
       { "meta": { "asdf": "after checking the value" } }
      """

  Scenario: Failing to safely update the metadata
    Given I have tokenized a card
    When I make a PATCH request to the href "href" with the body:
      """
       [{
        "op": "add",
        "path": "/cards/0/meta/asdf",
        "value": "the value to be tested"
      }]
      """

    Then I fetch the card
    And I make a PATCH request to the href "href" with the body:
      """
      [{
        "op": "test",
        "path": "/cards/0/meta/asdf",
        "value": "not the right value"
      },{
        "op": "replace",
        "path": "/cards/0/meta/asdf",
        "value": "after checking the value"
      }]
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "errors" schema

  Scenario: Moving metadata
    Given I have tokenized a card
    When I make a PATCH request to the href "href" with the body:
      """
       [{
        "op": "add",
        "path": "/cards/0/meta/asdf",
        "value": "the value to be moved"
      }]
      """

    Then I fetch the card
    And I make a PATCH request to the href "href" with the body:
      """
      [{
        "op": "move",
        "from": "/cards/0/meta/asdf",
        "path": "/cards/0/meta/zxcv"
      }]
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
       { "meta": { "zxcv": "the value to be moved" } }
      """

  Scenario: Removing metadata
    Given I have tokenized a card
    When I make a PATCH request to the href "href" with the body:
      """
       [{
        "op": "add",
        "path": "/cards/0/meta/asdf",
        "value": "the value to be moved"
      }]
      """

    Then I fetch the card
    And I make a PATCH request to the href "href" with the body:
      """
      [{
        "op": "remove",
        "path": "/cards/0/meta/asdf"
      }]
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
       { "meta": { } }
      """
