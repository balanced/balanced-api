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

  @failing
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

