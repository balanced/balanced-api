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

  Scenario: Retrieve information about an existing API key
    Right now, there's not a whole lot of extra information, but we support it
    anyway.

    Given I have created an API key
    When I GET to /api_keys/:api_key giving the key
    Then I should get a 200 OK status code
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

  Scenario: List all API keys
    Customers can make as many keys as they'd like. Being able to see all of
    them is a good thing.

    Given I have created more than one API keys
    When I GET to /api_keys
    Then I should get a 200 OK status code
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
        "properties": {
          "meta": {
            "type": "object",
            "properties": {
              "first": { "type": "string" },
              "href": { "type": "string" },
              "last": { "type": "string" },
              "limit": { "type": "integer" },
              "next": { "type": ["string", "null"] },
              "offset": { "type": "integer" },
              "previous": { "type": ["string", "null"] },
              "total": { "type": "integer" }
            }
          }
        },
        "required": ["api_keys"]
      }
      """
