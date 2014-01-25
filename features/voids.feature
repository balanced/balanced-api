Feature: voiding holds
  If you don't need a hold any more, you should void it rather than simply
  letting it expire. A hold removes money from someone's bank account, so
  banks want you to let them know if you're not planning on capturing the
  hold.

  @focus
  Scenario: Voiding a hold
    Given I have created a hold
    When I make a DELETE request to it
    Then I should get a 200 OK status code
    Then the response is valid according to the "card_holds" schema
    And the card_hold has a "voided_at" attribute
