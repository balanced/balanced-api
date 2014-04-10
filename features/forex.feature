Feature: Forex
  Foreign currency exchange, hereafter 'forex', is a feature that allows
  marketplaces to charge thier buyers in non-USD currencies.

  This provides a better experience for customers who have accounts denominated
  in other currencies, and reduces chargeback rates for those customers as well.

  The fee is reflected in the response back from the debit. See the schema for
  debits for more details.

  Scenario: Debit a card in €
    Given I have tokenized a card
    When I make a POST request to the link "cards.debits" with the body:
      """
      {
        "debits": [{
          "amount": 2000,
          "currency": "EUR"
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Debiting a card directly in €
    When I POST to /debits with the body:
      """
      {
        "debits": [{
          "amount": 1234,
          "source": {
            "number": "4111111111111111",
            "expiration_year": "2018",
            "expiration_month": 12
          },
          "currency": "EUR"
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

