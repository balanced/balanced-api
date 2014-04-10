Feature: Marketplace

  Scenario: Get marketplace
    When I GET to /marketplaces
    Then the response is valid according to the "marketplaces" schema
