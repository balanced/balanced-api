Feature: Refunds
 
  Scenario: Create a refund
    Given I have tokenized a customer card
    And I have debited that card

    When I make a POST request to the link "debits.refunds"
    Then I should get a 201 Created status code
    And the response is valid according to the "refunds" schema
