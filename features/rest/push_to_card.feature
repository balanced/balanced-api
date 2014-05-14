Feature: Push to card
  Scenario: Tokenize a debit card
    When I POST to /cards with the JSON API body:
      """
      {
        "cards": [{
          "name": "Johannes Bach",
          "number": "4342561111111118",
          "expiration_month": "05",
          "expiration_year": "2015"
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
      {
        "can_credit": true,
        "type": "debit",
        "category": "classic",
        "bank_name": "WELLS FARGO BANK, N.A."
      }
      """

  Scenario: Push money to a card
    Given I have sufficient funds in my marketplace
    When I POST to /credits with the JSON API body:
      """
      {
        "credits": [{
          "destination": {
            "name": "Johannes Bach",
            "number": "4342561111111118",
            "expiration_month": "12",
            "expiration_year": 2016
          },
            "amount": 1234
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema
    And the fields on this credit match:
      """
      {
        "status": "succeeded"
      }
      """

  Scenario: Push money to an existing debit card
    Given I have sufficient funds in my marketplace
    And I have a tokenized debit card
    When I POST to /cards/:debit_card_id/credits with the JSON API body:
      """
      {
        "credits": [{
          "amount": 1234
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema
    And the fields on this credit match:
      """
      {
        "status": "succeeded"
      }
      """
    And the credit was successfully created

  Scenario: Fail to push money to a card
    We provide a card number, "4111111111111111", which has a `can_credit` of
    false. This scenario happens most often with credit cards, which you cannot
    push money to.

    Given I have sufficient funds in my marketplace
    When I POST to /credits with the JSON API body:
      """
      {
        "amount": 1234,
        "destination": {
          "name": "Georg Telemann",
          "number": "4111111111111111",
          "expiration_month": "12",
          "expiration_year": "2016"
        }
      }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
      """
      {
        "category_type": "banking",
        "category_code": "funding-destination-not-creditable"
      }
      """
    But the credit was successfully created
    And the fields on this credit match:
      """
      {
        "status": "failed",
        "failure_reason_code": "funding-destination-not-creditable"
      }
      """

  Scenario: Pushing money to a card cannot exceed $2,500
    Given I have a tokenized debit card
    And I have sufficient funds in my marketplace
    When I POST to /cards/:debit_card_id/credits with the JSON API body:
      """
      {
        "amount": 250001
      }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
      """
      {
        "category_code": "amount-exceeds-limit"
      }
      """
    But the credit was successfully created
    And the fields on this credit match:
      """
      {
        "status": "failed",
        "failure_reason_code": "amount-exceeds-limit"
      }
      """

  Scenario: Push money to a card requires cardholder name
    Given I have sufficient funds in my marketplace
    When I POST to /credits with the JSON API body:
      """
      {
        "credits": [{
          "destination": {
            "number": "4342561111111118",
            "expiration_month": "12",
            "expiration_year": 2016
          },
            "amount": 1234
        }]
      }
      """
    Then I should get a 400 Bad Request status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
      """
      {
        "category_type": "request",
        "category_code": "request"
      }
      """
