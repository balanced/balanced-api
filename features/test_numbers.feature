Feature: Test numbers
  We provide our users with a number of test credit card and bank account
  numbers. These test numbers allow you to reproduce specific kinds of success
  or failures to test your system.

  Scenario: Credit success
    The 4111111111111111 code gives you a successful card that can be charged.

    Given I've tokenized the card "4111111111111111" with the CVV "123"
    When I debit the card
    Then I should get a 201 Created status code
    Then the response is valid according to the "debits" schema
    
