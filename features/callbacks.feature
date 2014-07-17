Feature: Callbacks

  Scenario: Create a callback
    When I POST to /callbacks with the body:
      """
      {
        "callbacks": [{
          "url":"http://www.example.com/callback"
        }]
      }
      """
    Then I should get a 201 Created status code
    And the response is valid according to the "callbacks" schema

  Scenario: Retrieve information about an existing callback
    Given I have created a callback
    When I GET to /callbacks/:callback_id giving the callback_id
    Then I should get a 200 OK status code
    And the response is valid according to the "callbacks" schema

  Scenario: You can't create two callbacks
    When I POST to /callbacks with the body:
      """
      {
        "url":"http://www.example.com/callback"
      }
      """
    When I POST to /callbacks with the body:
      """
      {
        "url":"http://www.example.com/callback"
      }
      """
    Then I should get a 409 Conflict status code
    And the response is valid according to the "errors" schema
    And the fields on this error match:
      """
      { "category_code": "duplicate-webhook-url" }
      """

  Scenario: Create a callback using GET method
    When I POST to /callbacks with the body:
    """
    {
      "url": "http://www.example.com/callback",
      "method": "get"
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "callbacks" schema
    And the fields on this callback match:
    """
    {
      "method": "get"
    }
    """

  Scenario: List all callbacks
    You can only have one callback, but if you don't know the ID,
    getting the list makes sense. It'll just only have one.

    Given I have created a callback
    When I GET to /callbacks
    Then I should get a 200 OK status code

  Scenario: Remove a callback
    Given I have created a callback
    When I DELETE to /callbacks/:callback_id giving the callback_id
    Then I should get a 204 OK status code
    And there should be no response body
