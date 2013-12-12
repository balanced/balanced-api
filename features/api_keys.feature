Feature: API Keys
  API Keys are what customers use to authenticate against the Balanced API.
  Generally speaking, this will be the first step that is needed to be taken by
  the customer to get started with the API.

  API keys are used to make authenticated requests by sending an HTTP Basic
  Auth header, using the key as the username, with no password.

  Scenario: Create an API Key
    To obtain a key, one must be created. This is done through an
    unauthenticated API request.

    When I POST to /api_keys without my secret key
    Then I should get a 201 Created status code
    And the response has this schema:
      """
      {
        "api_keys": {
          "type": "array",
          "minItems": 1,
          "maxItems": 1,
          "properties": {
            "href": { "type": "string" },
            "id": { "type": "string" },
            "secret": { "type": "string" },
            "links": { "type": "object" },
            "meta": { "type": "object" }
          }
        },
        "required": ["api_keys"]
      }
      """
