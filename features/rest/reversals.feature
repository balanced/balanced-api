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
    When I POST to /credits/:credit_id/reversals with the JSON API body:
    """
    {
      "amount": 100
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
    When I POST to /credits/:credit_id/reversals with the JSON API body:
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
    When I PUT to /reversals/:reversal_id with the JSON API body:
    """
    {
      "description": "merchant did not ship item, taking my money back"
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
