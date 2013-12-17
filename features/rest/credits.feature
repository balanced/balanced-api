Feature: Credits
  Credit is the action of moving money out of the marketplace.
  The money will come from either the marketplace's escrow balance
  or an order and can be sent to a bank account.  If sent to a customer
  then that customer's default bank account will be used instead.

  Scenario: Credit a bank account
    Given I have sufficient funds in my marketplaces
    And I have tokenized a bank account
    When I POST to /bank_accounts/:bank_account_id/credits with the JSON API body:
    """
    {
      "amount": 1234
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema
