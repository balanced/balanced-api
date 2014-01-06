Feature: Refunds

  Scenario: Create a refund
    Given I have tokenized a customer card
    And I have debited that card

    When I make a POST request to the link "debits.refunds"
    Then I should get a 201 Created status code
    And the response is valid according to the "refunds" schema

  Scenario: Create a failed refund
    Given I have tokenized a customer card
    And I have debited that card

    When I make a POST request to the link "debits.refunds" with the body:
      """
      {
        "amount": 200000000
      }
      """
    Then I should get a 400 status code
    And the response is valid according to the "errors" schema

  Scenario: Refund after changed source
    Given I have created a debit
    When I change the default funding source
    And I create a refund
    Then the refund should go to the original card
