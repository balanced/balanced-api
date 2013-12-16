Feature: Customers
  Customers are used for representing both buyers on a marketplace.
  Customers have cards and bank accounts associated to themselves.
  All debit and credits can be tracked for a specific customer.

  Scenario: Creating a customer
    When I POST to /customers with the JSON API body:
      """
      {
        "name": "Customer name",
        "email": "email@example.com"
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

  Scenario: Get a customer
    Given I have created a Customer
    When I GET to /customers/:customer_id giving the customer_id
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema

  Scenario: List all customers
    Given I have created more than one Customer
    When I GET to /customers
    Then I should get a 200 OK status code
    And there should be more than two customers paged

  Scenario: Remove a customer
    Given I have created a Customer
    When I DELETE to /customers/:customer_id giving the customer_id
    Then I should get a 204 OK status code
    And there should be no response body
