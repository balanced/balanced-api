Feature: Reversals

  Scenario: Reverse a credit.

    Given I have tokenized a bank account
    When I make a POST request to the link "bank_accounts.credits" with the body:
      """
      { "amount": 2000 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

    When I make a POST request to the link "credits.reversals"
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema

  Scenario: Failed reversal
    You can't reverse a particular amount.

    Given I have tokenized a bank account
    When I make a POST request to the link "bank_accounts.credits" with the body:
      """
      { "amount": 2000 }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

    When I make a POST request to the link "credits.reversals" with the body:
      """
      { "amount": 10000000 }
      """
    Then I should get a 400 status code
    And the response is valid according to the "errors" schema

  Scenario: Reverse a bank account credit successfully

    When I POST to /credits with the JSON API body:
      """
      {
        "amount": 1234,
        "destination": {
          "name": "Michael Jordan",
          "account_number": "9900000095",
          "routing_number": "021000021",
          "account_type": "checking"
        }
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

    When I make a POST request to the link "credits.reversals"
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
      """
      { "status": "succeeded" }
      """

  Scenario: Reverse a bank account credit unsuccessfully

    When I POST to /credits with the JSON API body:
      """
      {
        "amount": 1234,
        "destination": {
          "name": "Michael Jordan",
          "account_number": "9900000004",
          "routing_number": "021000021",
          "account_type": "checking"
        }
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

    When I make a POST request to the link "credits.reversals"
    Then I should get a 409 Conflict status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
      """
      { "status": "failed" }
      """
