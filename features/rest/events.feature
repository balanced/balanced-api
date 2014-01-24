Feature: Events
  Events represent action that occue inside the Balanced system.
  They can not be created by the customer, and instead are automatically created
  when actions are completed.

  Scenario: List events
    When I GET to /events
    Then I should get a 200 OK status code
    And the response is valid according to the "events" schema
