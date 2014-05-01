Feature: Test numbers
  We provide our users with a number of test credit card and bank account
  numbers. These test numbers allow you to reproduce specific kinds of success
  or failures to test your system.


  Scenario: Successful VISA charge.
    The 4111111111111111 code gives you a VISA card that can be charged.

    Given I've tokenized the card "4111111111111111" with the CVV "123"
    When I debit the card
    Then I should get a 201 Created status code
    Then the response is valid according to the "debits" schema

  Scenario: Successful MasterCard charge.
    The 5105105105015100 code gives you a MasterCard card that can be charged.

    Given I've tokenized the card "5105105105105100" with the CVV "123"
    When I debit the card
    Then I should get a 201 Created status code
    Then the response is valid according to the "debits" schema

  Scenario: Successful AMEX charge.
    The 3411111111111111 code gives you an AMEX card that can be charged.

    Given I've tokenized the card "3411111111111111" with the CVV "1234"
    When I debit the card
    Then I should get a 201 Created status code
    Then the response is valid according to the "debits" schema
    
  Scenario: Not enough funds
    The 4444444444444448 number gives you a VISA card which can be tokenized
    but will not be accepted for creating holds or debits. This type of failure
    is what you would expect if you try to create a hold on a card with
    insufficient funds.

    Given I've tokenized the card "444444444444448" with the CVV "123"
    When I debit the card
    Then I should get a 201 Created status code
    Then the response is valid according to the "debits" schema

  Scenario: Cancelled card
    The 4222222222222220 number gives you a VISA card which cannot be tokenized
    but passes a Luhn check. You could expect this failure when a user tried to
    enter in a credit card which used to work but has been canceled.

    When I try to tokenize the card "4222222222222220" with the CVV "123"
    Then I should get a 402 Payment Required status code

  Scenario: CVV does not match
    The 5112000200000002 number gives you a MasterCard card which fails
    its CVV match.

    Given I've tokenized the card "5112000200000002" with the CVV "200"
    Then I should get a 201 Created status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
         "cvv_match": "no"
        }
      """

  Scenario: CVV is unsupported
    The 4457000300000007 number gives you a MasterCard card which doesn't
    support CVV.

    Given I've tokenized the card "4457000300000007" with the CVV "901"
    Then I should get a 201 CREATED status code
    And the response is valid according to the "cards" schema
    And the fields on this card match:
      """
        {
         "cvv_match": "unsupported"
        }
      """

  @focus
  Scenario: A disputed debit.
    The 6500000000000002 number gives you a Discover card which causes
    any debits to be disputed.

    Given I've tokenized the card "6500000000000002" with the CVV "123"
    When I debit the card
    Then I should get a 201 Created status code
    Then the response is valid according to the "debits" schema
    And the debit has a link to a dispute
