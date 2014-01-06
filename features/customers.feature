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
  
  @failing
  Scenario: Set the default funding source
    When I POST to /cards with the body:
      """
       {
        "number": "4111 1111 1111 1111",
        "expiration_month": 12,
        "expiration_year": 2016,
        "cvv": "123",
        "address": {
          "line1": "965 Mission St",
          "postal_code": "94103"
        }
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "cards" schema

    Given I have created a customer
    When I make a PUT request to the link "href" with the body:
      """
      {
        "links": {
            "source": "#{@card_id}",
         }
      }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
      """
      {
        "links": {
          "source": "#{@card_id}"
        }
      }
      """


  @failing
  Scenario: Set the default destination
    When I make a PATCH request to the link "href" with the body:
    """
      {
        "op": "replace",
        "path": "/customers/0/links/destination",
        "value": "#{@bank_accounts_id}"
      }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
    """
      {
        "links": { "destination": "#{@bank_accounts_id}" }
      }
    """


  @failing
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
      "merchant_status": "need-more-information"
    }
    """

    When I make a PUT request to the link "href" with the body:
    """
    {
      "dob_month": 7,
      "dob_year": 1963,
      "address": {
        "postal_code": "48120"
      }
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
    """
    {
      "merchant_status": "underwritten"
    }
    """
