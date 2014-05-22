Feature: Credit cards
  "Tokenizing" a credit card is the process of sending Balanced a credit card
  number for storage. The API will then give the customer back a token that the
  customer will store. The idea is that if a customer stored the credit card data
  directly, the customer would legally be required to take extra precautions for safely storing the information, whereas with the token, Balanced worries about
  that, and the customer just charges against the token rather than the card.

  For more on tokenization as a concept, see ['tokenization' on
  Wikipedia.](http://en.wikipedia.org/wiki/Tokenization_%28data_security%29)

  Scenario: Tokenize a card without a secret key
    Cards are able to be tokenized without sending along a secret key. When
    this happens, the customer gets less information than if the key was sent.

    When I POST to /cards without my secret key with the JSON API body:
      """
      {
        "number": "4111111111111111",
        "expiration_month": "12",
        "expiration_year": 2016,
        "meta": {
          "create": "can set on create"
        }
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "card_tokens" schema

    When I GET "cards.href" from the previous response
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
      {
        "can_credit": false,
        "can_debit": true,
        "bank_name": "JPMORGAN CHASE BANK, N.A."
      }
      """


  Scenario: Retrieve a card
    Given I have tokenized a card
    When I GET to /cards/:card_id giving the card_id
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema

  Scenario: List cards
    Given I have tokenized more than one card
    When I GET to /cards
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema

  Scenario: Remove a card
    Given I have tokenized a card
    When I DELETE to /cards/:card_id
    Then I should get a 204 OK status code
    And there should be no response body

  Scenario: Update a card
    Given I have tokenized a card
    When I PUT to /cards/:card_id giving the card_id, with the body:
      """
      {
        "cards": [{
          "meta": {
            "something": "random"
          }
        }]
      }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema



  Scenario: Debit a card
    Given I have tokenized a card
    When I POST to /cards/:card_id/debits giving the card_id, with the body:
      """
      {
        "debits": [{
          "amount": "50"
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

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
          "cards": [{
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016,
            "address": {
              "postal_code": "94301"
            }
          }]
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
          "cards": [{
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016,
            "address": {
              "postal_code": "90210"
            }
          }]
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
          "cards": [{
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016,
            "address": {
              "postal_code": "90211"
            }
          }]
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
          "cards": [{
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016
          }]
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
          "cards": [{
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016,
            "address": {
              "line1": "965 Mission St",
              "postal_code": "94103"
            }
          }]
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
        "cards": [{
          "number": "4111111111111111",
          "expiration_month": 12,
          "expiration_year": 2016,
          "address": {
            "line1": "21 Jump St",
            "postal_code": "90210"
          }
        }]
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
          "cards": [{
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016
          }]
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
          "cards": [{
            "number": "4111 1111 1111 1111",
            "expiration_month": 12,
            "expiration_year": 2016
          }]
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
          "cards": [{
            "number": "5105 1051 0510 5100",
            "expiration_month": 12,
            "expiration_year": 2016
          }]
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
          "cards": [{
            "number": "3782 822463 10005",
            "expiration_month": 12,
            "expiration_year": 2016
          }]
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
        "cards": [{
          "number": "6011 1111 1111 1117",
          "expiration_month": 12,
          "expiration_year": 2016
        }]
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

  @failing
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
          "cards": [{
            "number": "4111 1111 1111 1111",
            "expiration_month": "12",
            "expiration_year": "2016"
          }]
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
          "cards": [{
            "name": "Frida Kahlo",
            "number": "4111 1111 1111 1111",
            "expiration_month": 12,
            "expiration_year": 2016
          }]
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
          "cards": [{
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
          }]
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

  Scenario: Tokenization fails luhn test
    When I make a POST request to /cards with the body:
      """
        {
          "cards": [{
            "number": "4111111111111112",
            "expiration_month": 12,
            "expiration_year": 2016
          }]
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

  Scenario: Unstored cards aren't visible from the index
    Given I have unstored a card
    And I make a GET request to /cards
    Then I should not see that card in the results

  Scenario: Unstored cards are still GET-able
    Given I have unstored a card
    And I make a GET request to it
    Then I should see that card in the results

  Scenario: CVV matches
    When I make a POST request to /cards with the body:
      """
        {
          "cards": [{
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016,
            "cvv": "123"
          }]
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
          "cards": [{
            "number": "5112000200000002",
            "expiration_month": 12,
            "expiration_year": 2016,
            "cvv": "200"
          }]
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
          "cards": [{
            "number": "4457000300000007 ",
            "expiration_month": 12,
            "expiration_year": 2016,
            "cvv": "901"
          }]
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
          "cards": [{
            "number": "4111111111111111",
            "expiration_month": 12,
            "expiration_year": 2016
          }]
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

  Scenario: Associating a card to a marketplace with GET
    Given I make a POST request to /cards with the body:
      """
      {
        "expiration_month": 12,
        "cvv": 123,
        "number": 5105105105105100,
        "expiration_year": 2020
      }
      """
    When I make a GET request to the href "href"
    And I make a GET request to /cards
    Then I should see the original card in the list
