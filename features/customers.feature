Feature: Customers

  Scenario: Creating a customer
    When I POST to /customers with the JSON API body:
      """
      {
        "name": "Balanced Testing"
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
      """
      {
        "name": "Balanced Testing"
      }
      """

  Scenario: Set the default destination
    Given I have created a customer without a card and bank account
    And I have tokenized a bank account
    When I make a PATCH request to /customers/:customer_id with the body:
    """
    [{
      "op": "replace",
      "path": "/customers/0/links/destination",
      "value": ":bank_account_id"
    }]
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
    """
      {
        "links": { "destination": ":bank_account_id" }
      }
    """

  @failing @gh-468
  Scenario: Underwrite a customer
    When I Post to /customers with the body:
    """
      {
        "name": "Henry Ford"
      }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
    """
    {
      "merchant_status": "no-match"
    }
    """

    When I PUT to /customers/:customer_id with the body:
    """
    {
      "dob_month": 7,
      "dob_year": 1963,
      "address": {
        "postal_code": "48120"
      }
    }
    """
    Then debug
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
    """
    {
      "merchant_status": "underwritten"
    }
    """
