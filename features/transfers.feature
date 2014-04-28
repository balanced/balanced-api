Feature: Transfers
  Transfers allow you to send money between Accounts.

  Scenario: Transfer money between Accounts
    Given I have created an operating account
    Given I have a customer with a tokenized bank account
    When I make a POST request to the link "transfers" with the body:
      """
      {
        "destination": ":account_href",
        "amount": 123
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "transfers" schema
    And the fields on this transfer should match:
      """
      { "amount": 123 }
      """

    When I fetch the account
    Then the fields on this account should match:
      """
      {
        "balance": 123
      }
      """

    When I make a POST request to the link "transfers" with the body:
      """
      {
        "destination": ":bank_account_href",
        "amount": 123
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "transfers" schema
    And the fields on this transfer should match:
      """
      { "amount": 123 }
      """

    When I fetch the account
    Then the fields on this account should match:
      """
      {
        "balance": 123
      }
      """
