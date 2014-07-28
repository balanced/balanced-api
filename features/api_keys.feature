Feature: API Keys
  API Keys are what customers use to authenticate against the Balanced API.
  Generally speaking, this will be the first step that is needed to be taken by
  the customer to get started with the API.

  API keys are used to make authenticated requests by sending an HTTP Basic
  Auth header, using the key as the username, with no password.

  API keys by default have full access to perform any operation on your
  marketplace. You can create API keys with limited permissions that have
  restricted access.

  Scenario: Create an API Key for a new marketplace
    To obtain a key, one must be created. This is done through an
    unauthenticated API request.

    When I POST to /api_keys without my secret key
    Then I should get a 201 Created status code
    And the response is valid according to the "api_keys" schema

  Scenario: Create a new api key for a marketplace
    To obtain a key, one must be created using the existing secret key
    for a marketplace

    When I POST to /api_keys
    Then I should get a 201 Created status code
    And the response is valid according to the "api_keys" schema

  Scenario: Retrieve information about an existing API key
    Right now, there's not a whole lot of extra information, but we support it
    anyway.

    Given I have created an API key
    When I GET to /api_keys/:api_key giving the key
    Then I should get a 200 OK status code
    And the response is valid according to the "api_keys" schema

  Scenario: List all API keys
    Customers can make as many keys as they'd like. Being able to see all of
    them is a good thing.

    Given I have created more than one API keys
    When I GET to /api_keys
    Then I should get a 200 OK status code
    And the response is valid according to the "api_keys" schema

  Scenario: Remove an API key
    Sometimes, a customer just doesn't want an API key any more. Deleting that
    key will get rid of it.

    Given I have created an API key
    When I DELETE to /api_keys/:api_key giving the key
    Then I should get a 204 OK status code
    And there should be no response body

  Scenario: Create an API key with limited permissions
    By specifying permissions for a key you can restrict the operations that
    it is able to perform to either being able to write (POST, DELETE, and PUT)
    or read (GET) to a set of endpoints.

    Given I have created an API key
    When I POST to /api_keys with the body:
    """
    {
	"api_keys": [{
          "permissions": [
	    {
	      "path": "/customers",
	      "permissions": ["read", "write"]
            },
	    {
	      "path": "/debits",
	      "permissions": ["read"]
	    }
	  ]
	}]
    }
    """
    Then I should get a 201 Created status code
    And the response is valid according to the "api_keys" schema
    When I POST to /customers
    Then I should get a 201 Created status code
    And the response is valid according to the "customers" schema
    When I POST to /debits
    Then I should get a 401 Unauthorized status code