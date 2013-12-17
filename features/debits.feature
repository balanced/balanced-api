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
    And the response is valid according to the "debits" schema
    And the fields on this debit match:
    """
    {
      "amount": 20000
    }
    """

  Scenario: Retrieving debits for a card
    Given I have debited a card
    When I GET to /cards/:card_id/debits
    Then I should get a 200 OK status code
    And the response is valid according to the "debits" schema
    And the fields on these debits match:
    """
    {
      "links": {
        "source": ":card_id"
      }
    }
    """

  Scenario: Debiting a customer
    If the debit is done directly on the customer resource
    then that customers default "funding source" will be used
    when preforming the debit.
    Given I have a customer with a card
    When I POST to /customers/:customer_id/debits with the JSON API body:
    """
    {
      "amount": 2000
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
    And the fields on this debit match:
    """
    {
      "amount": 2000,
      "links": {
        "customer": ":customer_id"
      }
    }
    """
