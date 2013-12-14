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
