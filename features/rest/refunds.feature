Feature: Refunds
  Refunds are used to cancel a debit.  The marketplace can either refund the whole amount
  of the debit or a partial amount of the debit using "amount" when creating the refund.

  Scenario: Creating a full refund
    Given I have debited a card
    When I POST to /debits/:debit_id/refunds
    Then I should get a 201 Created status code
    And the response is valid according to the "refunds" schema

  Scenario: Creating a partial refund
    Given I have debited a card
    When I POST to /debits/:debit_id/refunds with the JSON API body:
    """
    {
      "refunds": [{
        "amount": 100
      }]
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "refunds" schema
    And the fields on this refund match:
    """
    {
      "amount": 100
    }
    """

  Scenario: Listing refunds for a debit
    Given I have created a refund for a debit
    When I GET to /debits/:debit_id/refunds
    Then I should get a 200 OK status code
    And the response is valid according to the "refunds" schema
    And the fields on these refunds match:
    """
    {
      "links": {
        "debit": ":debit_id"
      }
    }
    """

  Scenario: Retrieving a refund
    Given I have created a refund for a debit
    When I GET to /refunds/:refund_id
    Then I should get a 200 OK status code
    And the response is valid according to the "refunds" schema

  Scenario: Update a refund
    Given I have created a refund for a debit
    When I PUT to /refunds/:refund_id with the JSON API body:
    """
    {
      "refunds": [{
        "description": "The customer cancel the order"
      }]
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "refunds" schema
