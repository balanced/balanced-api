Feature: Disputes occur when customers dispute transactions

  Scenario: Retrieve a dispute
    Given I have a dispute
    When I GET to /disputes/:dispute_id
    Then I should get a 200 OK status code
    And the response is valid according to the "disputes" schema

  Scenario: List disputes
    Given I have a dispute
    When I GET to /disputes
    Then I should get a 200 OK status code
    And the response is valid according to the "disputes" schema

  Scenario: Retrieve a dispute document
    Given I have a dispute with submitted documents
    When I GET to /dispute_documents/:dispute_document_id
    Then I should get a 200 OK status code
    And the response is valid according to the "dispute_document" schema

  Scenario: List dispute documents for a dispute
    Given I have a dispute with submitted documents
    When I GET to /disputes/:dispute_id/dispute_documents
    Then I should get a 200 OK status code
    And the response is valid according to the "dispute_documents" schema

  Scenario: List dispute documents
    Given I have a dispute with submitted documents
    When I GET to /dispute_documents
    Then I should get a 200 OK status code
    And the response is valid according to the "dispute_documents" schema