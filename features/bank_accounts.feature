Feature: Bank accounts
  The bank account resource respresent a funding source or
  destiation that is backed by a bank account.  Marketplaces
  are able to credit out to bank accounts without doing any verifications
  but to debit from a bank account, micro deposit verifications are
  required.

  @failing
  Scenario: Tokenize a bank account
    When I POST to /bank_accounts without my secret key with the JSON API body:
    """
    {
      "name": "That guy over there",
      "routing_number": "321174851",
      "account_number": "9900000001",
      "account_type": "checking"
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "bank_account_tokens" schema

    When I GET "bank_accounts.href" from the previous response
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_accounts" schema
