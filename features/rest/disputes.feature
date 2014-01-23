Feature: Disputes occur when customers dispute transactions

  Scenario: Retrieving debits for a card
    Given I have debited a card
    When I GET to /disputes/:dispute_id
    Then I should get a 200 OK status code
    And the response is valid according to the "dispute" schema
    """
    {
      "links": {
        "source": ":card_id"
      }
    }
    """

  Scenario: List disputes
    Given I have more than one dispute
    When I GET to /disputes
    Then I should get a 200 OK status code
    And the response is valid according to the "disputes" schema
