Feature: Debit a card or bank account
  Debits is the action of charging a customers card or bank account.
  Upon a debit succeeding, the value will be reflected in the marketplace's escrow balance
  or in the escrow for an order.

  Scenario: Debiting a card
    Given I have tokenized a card
    When I POST to /cards/:card_id/debits with the JSON API body:
    """
    {
      "amount": 20000
    }
    """
    Then I should get a 201 Created status code
