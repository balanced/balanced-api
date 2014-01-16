Feature: Bank account verifications
  Bank account verifications are used when you want to debit from a bank account.
  In a production marketplace, you will create a bank account verification,
  at which point Balanced will create two micro deposists into your customers
  bank account, the amounts will be less than one dollar.  You can then verify
  the bank account by asking your customer for the value of the micro deposists
  and then submitting the values to Balanced.

  In a test marketplace, the micro deposit amounts will always be 1 cent

  Scenario: Creating a bank account verification
    Given I have tokenized a bank account
    When I POST to /bank_accounts/:bank_account_id/verifications
    Then I should get a 201 Created status code
    And the response is valid according to the "bank_account_verifications" schema

  Scenario: Get verification for a bank account
    Given I have a bank account with a verification
    When I GET to /bank_accounts/:bank_account_id/verifications
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_account_verifications" schema

  Scenario: Confirm a verification
    Given I have a bank account with a verification
    When I PUT to /verifications/:bank_account_verification_id with the JSON API body:
    """
    {
      "amount_1": 1,
      "amount_2": 1
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_account_verifications" schema
    And the fields on this bank_account_verification match:
    """
    {
      "verification_status": "succeeded"
    }
    """

  Scenario: Fail to confirm a verification
    Given I have a bank account with a verification
    When I PUT to /verifications/:bank_account_verification_id with the JSON API body:
    """
    {
      "amount_1": 2,
      "amount_2": 2
    }
    """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "errors" schema
