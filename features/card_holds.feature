Feature: Card Holds
  If a hold is successfully created, then the hold can be captured at a later time.
  The money will still be in that person bank account, however they will not be able to
  use those funds for

  If you don't need a hold any more, you should void it rather than simply
  letting it expire. A hold removes money from someone's bank account, so
  banks want you to let them know if you're not planning on capturing the
  hold.

  Scenario: Creating a hold
    Given I have tokenized a card
    When I make a POST request to /cards/:card_id/card_holds with the body:
    """
    {
      "amount": 1234,
      "description": "something for the dashboard",
      "meta": {
        "something": "random"
      }
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "card_holds" schema

  Scenario: Capturing a hold
    Given I have created a hold
    When I make a POST request to /card_holds/:card_hold_id/debits
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Voiding a hold
    Given I have created a hold
    When I make a DELETE request to it
    Then I should get a 200 OK status code
    And the response is valid according to the "card_holds" schema
    And the card_hold has a "voided_at" attribute set

  Scenario: Voided holds aren't visible from the index
    Given I have voided a hold
    When I fetch the card
    And I make a GET request to /card_holds
    Then I should not see that hold in the results

  Scenario: Updating a hold description
    Given I have created a hold
    When I make a PUT request to /card_holds/:card_hold_id with the body:
    """
    {
      "description": "the new description of a hold"
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "card_holds" schema
    And the fields on this card_hold match:
    """
    {
      "description": "the new description of a hold"
    }
    """

  Scenario: Updating a hold meta
    Given I have created a hold
    When I make a PUT request to /card_holds/:card_hold_id with the body:
    """
    {
      "meta": {
        "something": "random"
      }
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "card_holds" schema
    And the fields on this card_hold match:
    """
    {
      "meta": {
        "something": "random"
      }
    }
    """
