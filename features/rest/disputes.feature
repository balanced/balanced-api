Feature: Disputes occur when customers dispute transactions

  @failing
  Scenario: Retrieve a dispute
    Given I have a dispute
    When I GET to /disputes/:dispute_id
    Then I should get a 200 OK status code
    And the response is valid according to the "disputes" schema

  @failing
  Scenario: List disputes
    Given I have a dispute
    When I GET to /disputes
    Then I should get a 200 OK status code
    And the response is valid according to the "disputes" schema
