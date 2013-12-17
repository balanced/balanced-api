Feature: Tokenize a credit card
  "Tokenizing" a credit card is the process of sending Balanced a credit card
  number for storage. The API will then give the customer back a token that the
  customer will store. The idea is that if a customer stored the credit card data
  directly, the customer would legally be required to take extra precautions for safely storing the information, whereas with the token, Balanced worries about
  that, and the customer just charges against the token rather than the card.

  For more on tokenization as a concept, see ['tokenization' on
  Wikipedia.](http://en.wikipedia.org/wiki/Tokenization_%28data_security%29)

  @failing
  Scenario: Tokenize a card without a secret key
    Cards are able to be tokenized without sending along a secret key. When
    this happens, the customer gets less information than if the key was sent.

    When I POST to /cards without my secret key with the JSON API body:
      """
      {
        "number": "4111111111111111",
        "expiration_month": "12",
        "expiration_year": 2016
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "card_tokens" schema

    When I GET "cards.href" from the previous response
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema

  @failing
  Scenario: Retrieve a card
    Given I have tokenized a card
    When I GET to /cards/:card_id giving the card_id
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
