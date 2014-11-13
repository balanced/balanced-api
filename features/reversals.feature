Feature: Reversal
  Reversals allow for canceling a credit to a bank account.
  A reversals can be partial or the full amount.

  Scenario: Creating a full reversal
    Given I have a bank account with a credit
    When I POST to /credits/:credit_id/reversals
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema

  Scenario: Creating a partial reversal
    Given I have a bank account with a credit
    When I POST to /credits/:credit_id/reversals with the body:
    """
    {
      "reversals": [{
        "amount": 100
      }]
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
    """
    {
      "amount": 100
    }
    """

  Scenario: Creating a reversal with extra info
    Given I have a bank account with a credit
    When I POST to /credits/:credit_id/reversals with the body:
    """
    {
      "description": "useful description",
      "meta": {
        "extra": "info"
      }
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
    """
    {
      "description": "useful description",
      "meta": {
        "extra": "info"
      }
    }
    """


  Scenario: List reversals
    Given I have a bank account with a reversal
    When I GET to /credits/:credit_id/reversals
    Then I should get a 200 OK status code
    And the response is valid according to the "reversals" schema

  Scenario: Retrieving a reversal
    Given I have a bank account with a reversal
    When I GET to /reversals/:reversal_id
    Then I should get a 200 OK status code
    And the response is valid according to the "reversals" schema

  Scenario: Update a reversal
    Given I have a bank account with a reversal
    When I PUT to /reversals/:reversal_id with the body:
    """
    {
      "reversals": [{
        "description": "merchant did not ship item, taking my money back"
      }]
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
    """
    {
      "description": "merchant did not ship item, taking my money back"
    }
    """

  Scenario: Reverse a credit.

    Given I have tokenized a bank account
    When I make a POST request to the link "bank_accounts.credits" with the body:
      """
      { "credits": [{"amount": 2000 }] }
      """
    When I make a POST request to the link "credits.reversals"
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema

  Scenario: Failed reversal
    You can't reverse a particular amount.

    Given I have tokenized a bank account
    When I make a POST request to the link "bank_accounts.credits" with the body:
      """
      { "credits": [{"amount": 2000 }] }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

    When I make a POST request to the link "credits.reversals" with the body:
      """
      { "reversals": [{"amount": 10000000 }] }
      """
    Then I should get a 400 status code
    And the response is valid according to the "errors" schema

  Scenario: Reverse a bank account credit successfully
    When I POST to /credits with the body:
      """
      {
        "credits": [{
          "amount": 1234,
          "destination": {
            "name": "Michael Jordan",
            "account_number": "9900000095",
            "routing_number": "021000021",
            "account_type": "checking"
          }
        }]
      }
      """

    When I make a POST request to the link "credits.reversals"
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
      """
      { "status": "succeeded" }
      """

  Scenario: Reverse a bank account credit unsuccessfully

    When I POST to /credits with the body:
      """
      {
        "credits": [{
          "amount": 1234,
          "destination": {
            "name": "Michael Jordan",
            "account_number": "9900000004",
            "routing_number": "021000021",
            "account_type": "checking"
          }
        }]
      }
      """

    When I make a POST request to the link "credits.reversals"
    Then I should get a 409 Conflict status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
      """
      { "status": "failed" }
      """

  Scenario: Reverse an Account credit before settlement
    Given I have an Account with sufficient funds
    When I POST to /credits/:credit_2_id/reversals with the body:
      """
      {
        "reversals": [{
            "amount": 1000
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
      """
      { "status": "succeeded" }
      """

  Scenario: Reverse an Account credit after settlement
    Given I have an Account with sufficient funds
    When I make a POST request to the link "accounts.settlements" with the body:
      """
      {
        "settlements": [{
            "description": "Batch A",
            "destination": /bank_accounts/:bank_account_id
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
      """
      {
        "amount": 3000,
        "status": "pending"
      }
      """

    When I POST to /credits/:credit_id_2/reversals
    Then I should get a 201 Created status code
    And the response is valid according to the "reversals" schema
    And the fields on this reversal match:
     """
     {
       "amount": 1000,
       "status": "pending"
     }
     """

    When I make a POST request to the link "accounts.settlements"
    Then I should get a 201 Created status code
    And the response is valid according to the "settlements" schema

    When I GET to /reversals/:reversal_id
    Then I should get a 200 OK status code
    And the response is valid according to the "reversals" schema
    And the fields on this credit match:
      """
      { "status": "succeeded" }
      """

    When I make a GET request to the link "reversals.order"
    Then I should get a 200 OK status code
    And the fields on this order match:
     """
     { "amount_escrowed": 1000 }
     """