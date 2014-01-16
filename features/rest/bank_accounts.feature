Feature: Bank accounts
  The bank account resource respresents a funding source or
  destination that is backed by a bank account.  Marketplaces
  are able to credit out to bank accounts without doing any verifications
  but to debit from a bank account, micro deposit verifications are
  required.

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

  Scenario: Retrieve a bank account
    Given I have tokenized a bank account
    When I GET to /bank_accounts/:bank_account_id
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_accounts" schema

  Scenario: List bank accounts
    Given I have tokenized more than one bank account
    When I GET to /bank_accounts
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_accounts" schema

  Scenario: Unstore a bank account
    Given I have tokenized a bank account
    When I DELETE to /bank_accounts/:bank_account_id
    Then I should get a 204 OK status code
    And there should be no response body

  Scenario: Update a bank account
    Given I have tokenized a bank account
    When I PUT to /bank_accounts/:bank_account_id with the JSON API body:
    """
    {
      "meta": {
        "random": "hello world"
      }
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_accounts" schema

  Scenario: Credit a bank account
    Given I have sufficient funds in my marketplace
    And I have tokenized a bank account
    When I POST to /bank_accounts/:bank_account_id/credits with the JSON API body:
    """
    {
      "amount": 1234
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

  Scenario: Debit a bank account
    Given I have a verified bank account
    When I POST to /bank_accounts/:bank_account_id/debits with the JSON API body:
    """
    {
      "amount": 1234
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  @failing @gh-449
  Scenario: Infer bank names
    When I POST to /bank_accounts with the JSON API body:
    """
    {
      "name": "Michael Johnson",
      "account_number": "982379283",
      "routing_number": "121000358",
      "account_type": "checking"
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "bank_accounts" schema
    And the fields on this bank account match:
      """
        {"bank_name": "BANK OF AMERICA, N.A."}
      """

    When I POST to /bank_accounts with the JSON API body:
    """
    {
      "name": "Maurice Green",
      "account_number": "33727930",
      "routing_number": "322271627",
      "account_type": "checking"
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "bank_accounts" schema
    And the fields on this bank account match:
      """
        {"bank_name": "J.P. MORGAN CHASE BANK, N.A."}
      """

  @failing @gh-449
  Scenario: Add a bank account to a customer
    Given I have created a customer
    And I have tokenized a bank account
    When I make a PATCH request to the href "href" with the body:
      """
      [{
        "op": "replace",
        "path": "/bank_accounts/0/links/customer",
        "value": "<%= @customer_id %>"
      }]
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_accounts" schema
    And the fields on this bank account match:
      """
        { "links": { "customer": "<%= @customer_id %>" } }
      """
