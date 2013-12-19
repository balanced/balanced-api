Feature: The resources resource.
  The resources resource is interesting. Basically, it's a global lookup
  system. It allows you to take the unique ID of any Balanced entity and
  get a representation.

  Such meta.

  Scenario: Look up a resource.
    As an example, maybe a Balanced user has stored a Customer ID rather than a
    Customer URL. This allows them to retrieve a Customer representation without
    worrying about the actual structure of our usual URLs.

    Given I have created a customer
    When I GET to /resources/:customer_id giving the customer_id
    Then I should get a 200 OK status code
    And the response is valid according to the "customers" schema
