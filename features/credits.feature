Feature: Credits
  Credits are used for sending money to a customer

  Scenario: Crediting a deleted card leads to failure
    Given I have tokenized a card
    When I make a DELETE request to the href "href"
    Then I should get a 204 status code

    When I make a POST request to /cards/:card_id/credits
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
    When  I POST to /customers/:customer_id/credits with the JSON API body:
    """
      {
        "amount": 500,
        "appears_on_statment_as": "Your lucky day"
      }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "credits" schema

  Scenario: Crediting without a funding source leads to failure
    Given I have created a customer
    When I POST to /customers/:customer_id/credits with the JSON API body:
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
