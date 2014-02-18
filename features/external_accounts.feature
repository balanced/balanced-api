Feature: External accounts

  Scenario: Retrieve an external account
    Given I have tokenized an external account
    When I GET to /external_accounts/:external_account_id
    Then I should get a 200 OK status code
    And the response is valid according to the "extneral_accounts" schema

  Scenario: List external accounts
    Given I have tokenized more than one external account
    When I GET to /external_accounts
    Then I should get a 200 OK status code
    And the response is valid according to the "external_accounts" schema

  Scenario: Unstore an external account
    Given I have tokenized an external account
    When I DELETE to /external_accounts/:external_accounts_id
    Then I should get a 204 OK status code
    And there should be no response body

  Scenario: Debit an external account
    Given I have an external account
    When I POST to /external_account/:external_account_id/debits with the JSON API body:
    """
    {
      "amount": 1234
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Add an external account to a customer
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
