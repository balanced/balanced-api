Feature: Credits
  Credit is the action of moving money out of the marketplace.
  The money will come from either the marketplace's escrow balance
  or an order and can be sent to a bank account.  If sent to a customer
  then that customer's default bank account will be used instead.

  Scenario: Credit a bank account
    Given I have sufficient funds in my marketplace
    And I have tokenized a bank account
    When I POST to /bank_accounts/:bank_account_id/credits with the JSON API body:
      """
      {
        "credits": [{
          "amount": 1234
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

  Scenario: List credits
    Given I have more than two credits
    When I GET to /credits
    Then I should get a 200 OK status code
    And the response is valid according to the "credits" schema

  Scenario: Retrieving credits for a bank account
    Given I have a bank account with a credit
    When I GET to /bank_accounts/:bank_account_id/credits
    Then I should get a 200 OK status code
    And the response is valid according to the "credits" schema
    And the fields on these credits match:
      """
      {
        "links": {
          "destination": ":bank_account_id"
        }
      }
      """

  Scenario: Updating a credit description
    Given I have a bank account with a credit
    When I PUT to /credits/:credit_id with the body:
      """
      {
        "description": "A new credit description"
      }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "credits" schema
    And the fields on this credit match:
      """
      {
        "description": "A new credit description"
      }
      """

  Scenario: Updating a credit meta
    Given I have a bank account with a credit
    When I PUT to /credits/:credit_id with the body:
      """
      {
        "meta": {
          "something": "random"
        }
      }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "credits" schema
    And the fields on this credit match:
      """
      {
        "meta": {
          "something": "random"
        }
      }
      """
