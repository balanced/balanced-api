Feature: Callbacks

  Scenario: Create a callback
    When I POST to /callbacks with the JSON API body:
      """
      {
        "url":"http://www.example.com/callback"
      }
      """
    Then I should get a 201 Created status code
    # TODO: Callback schema?
