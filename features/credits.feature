Feature: Credit cards

  Scenario: Crediting a deleted card leads to failure
    Given I have tokenized a card
    When I make a DELETE request to the link "href"
    Then I should get a 204 status code

    When I make a POST request to /cards/:cards_id/credits
    Then I should get a 404 status code

    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
       "category_code": "not-found"
      }
    """

  Scenario: Credit a customer
    Given I have a customer with a tokenized bank account
    When  I POST to /customers/:customers_id/credit with the JSON API body:
    """
      {
        "amount": 500
      }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "debits" schema

  Scenario: Crediting without a funding source leads to failure
    Given I have a customer without an associated funding instrument
    When I POST to /customers/:customers_id/credit with the JSON API body:
    """
      {
        "amount": 1234
      }
    """
    Then I should get a 409 status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
    """
      {
       "category_code": "no-funding-destination"
      }
    """


