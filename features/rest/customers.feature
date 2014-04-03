Feature: Customers
  Customers are used for representing both buyers on a marketplace.
  Customers have cards and bank accounts associated to themselves.
  All debit and credits can be tracked for a specific customer.

  Scenario: Creating a customer
    When I POST to /customers with the JSON API body:
      """
      {
        "customers": [{
          "name": "Customer name",
          "email": "email@example.com",
          "ssn_last4": "5555"
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
      """
      {
        "name": "Customer name",
        "email": "email@example.com"
      }
      """

  Scenario: Creating a business customer
    When I POST to /customers with the JSON API body:
    """
    {
      "business_name": "Lucky something",
      "phone": "123123123",
      "ein": "999999999",
      "address": {
        "line1": "123 Fake street",
        "line2": "Suite 345",
        "city": "San Francisco",
        "state": "California",
        "postal_code": "94000",
        "country_code": "US"
      }
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "customers" schema

  Scenario: Get a customer
    Given I have created a customer
    When I GET to /customers/:customer_id giving the customer_id
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema

  Scenario: List all customers
    Given I have created more than one customer
    When I GET to /customers
    Then I should get a 200 OK status code
    And there should be more than two customers paged

  Scenario: Remove a customer
    Given I have created a customer
    When I DELETE to /customers/:customer_id giving the customer_id
    Then I should get a 204 OK status code
    And there should be no response body

  Scenario: Update a customer
    Given I have created a customer
    When I make a PUT request to the href "href" with the body:
      """
      {
        "customers": [{
          "email": "asdf@balancedpayments.com"
        }]
      }
      """
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema
    And the fields on this customer match:
      """
      {
        "email": "asdf@balancedpayments.com"
      }
      """

  Scenario: Add a card to a customer
    Given I have tokenized a card
    And I have created a customer
    When I PUT to /cards/:card_id with the JSON API body:
    """
    {
      "cards": [{
        "links": {
          "customer": ":customer_id"
        }
      }]
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
    """
    {
      "links": {
        "customer": ":customer_id"
      }
    }
    """

  Scenario: Add a bank account to a customer
    Given I have tokenized a bank account
    And I have created a customer
    When I PUT to /bank_accounts/:bank_account_id with the JSON API body:
    """
    {
      "bank_accounts": [{
        "links": {
          "customer": ":customer_id"
        }
      }]
    }
    """
    Then I should get a 200 OK status code
    And the response is valid according to the "bank_accounts" schema
    And the fields on this bank_account match:
    """
    {
      "links": {
        "customer": ":customer_id"
      }
    }
    """
