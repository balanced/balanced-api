Feature: Debit a card or bank account
  Debits is the action of charging a customers card or bank account.
  Upon a debit succeeding, the value will be reflected in the marketplace's escrow balance
  or in the escrow for an order.

  Scenario: Debiting a card
    Given I have tokenized a card
    When I POST to /cards/:card_id/debits with the body:
    """
    {
      "debits": [{
        "amount": 20000
      }]
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
    When I POST to /customers/:customer_id/debits with the body:
    """
    {
      "debits": [{
        "amount": 2000,
        "meta": {
          "product_id": "123123123"
        },
        "description": "Bob is giving me some $$$"
      }]
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
      },
      "meta": {
        "product_id": "123123123"
      },
      "description": "Bob is giving me some $$$"
    }
    """

  Scenario: List debits
    Given I have more than one debit
    When I GET to /debits
    Then I should get a 200 OK status code
    And the response is valid according to the "debits" schema

  Scenario: Update a debit description
    Given I have debited a card
    When I PUT to /debits/:debit_id with the body:
    """
    {
      "description": "something useful"
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "debits" schema
    And the fields on this debit match:
    """
    {
      "description": "something useful"
    }
    """

  Scenario: Update a debit meta
    Given I have debited a card
    When I PUT to /debits/:debit_id with the body:
    """
    {
      "debits": [{
        "meta": {
          "order.status": "shipped"
        }
      }]
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "debits" schema
    And the fields on this debit match:
    """
    {
      "meta": {
        "order.status": "shipped"
      }
    }
    """

  Scenario: Refund a debit
    Given I have debited a card
    When I POST to /debits/:debit_id/refunds
    Then I should get a 201 Created status code
    And the response is valid according to the "refunds" schema

  Scenario: Debit a card
    Given I have tokenized a card
    When I make a POST request to the link "cards.debits" with the body:
      """
      { "debits": [ {"amount": 2000 } ] }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Debit a card
    Given I have tokenized a card
    When I make a POST request to /debits with the body:
      """
      {
        "amount": 2000,
        "source": ":card_href"
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Debit a customer card
    Given I have tokenized a customer card
    When I make a POST request to the link "cards.debits" with the body:
      """
      { "debits": [ {"amount": 2000 } ] }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  @focus
  Scenario: Debit a verified bank account
    Given I have a verified bank account
    When I make a POST request to the link "bank_accounts.debits" with the body:
      """
      { "debits": [ {"amount": 2000 } ] }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
    And the fields on these debits match:
      """
      { "status": "succeeded" }
      """

  Scenario: Debits to unverified bank accounts fail
    Given I have attempted to verify a bank account and failed
    When I make a POST request to the link "bank_accounts.debits" with the body:
      """
      { "debits": [ {"amount": 2000 } ] }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "debits" schema
    And the fields on these debits match:
      """
      { "status": "failed" }
      """

   Scenario: Debit a customer
     Given I have created a customer
     When I make a POST request to the link "customers.debits" with the body:
      """
      { "debits": [ {"amount": 1234 } ] }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

   Scenario: Failing to debit a customer
     Given I have created a customer without a card and bank account
     When I make a POST request to the link "customers.debits" with the body:
      """
      { "debits": [ {"amount": 8979 } ] }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "debits" schema

   Scenario: Debiting a card directly
     When I POST to /debits with the body:
      """
      {
        "debits": [{
          "amount": 1234,
          "source": {
            "number": "4111111111111111",
            "expiration_year": "2018",
            "expiration_month": 12
          }
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Debit unassociated card
    Given I have tokenized a card
    When I POST to /cards/:card_id/debits with the body:
    """
    {
      "debits": [{
        "amount": 5000
      }]
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema
