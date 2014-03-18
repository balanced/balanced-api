Feature: External accounts
  External accounts allow balanced to interact with external providers for
  charging and crediting to customers.

  Scenario: Tokenize an external account
    When I POST to /external_accounts without my secret key with the JSON API body:
    """
    {
      "provider": "test",
      "token": "123123123123"
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "external_account_tokens" schema

    When I GET "external_accounts.href" from the previous response
    Then I should get a 200 OK status code
    And the response is valid according to the "external_accounts" schema

  Scenario: Retrieve an external account
    Given I have tokenized an external account
    When I GET to /external_accounts/:external_account_id
    Then I should get a 200 OK status code
    And the response is valid according to the "external_accounts" schema

  Scenario: List external accounts
    Given I have tokenized more than one external account
    When I GET to /external_accounts
    Then I should get a 200 OK status code
    And the response is valid according to the "external_accounts" schema

  Scenario: Unstore an external account
    Given I have tokenized an external account
    When I DELETE to /external_accounts/:external_account_id
    Then I should get a 204 OK status code
    And there should be no response body

  Scenario: Debit an external account
    Given I have an external account
    When I POST to /external_accounts/:external_account_id/debits with the JSON API body:
    """
    {
      "amount": 1234
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  @failing
  Scenario: Add an external account to a customer
    # the patch permission has an issue with external accounts
    Given I have created a customer
    And I have tokenized an external account
    When I make a PATCH request to the href "href" with the body:
      """
      [{
        "op": "replace",
        "path": "/external_accounts/0/links/customer",
        "value": ":customer_id"
      }]
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "external_accounts" schema
    And the fields on this external_account match:
      """
        {
          "links": {
            "customer": ":customer_id"
          }
        }
      """
