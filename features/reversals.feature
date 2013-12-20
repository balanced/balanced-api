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

