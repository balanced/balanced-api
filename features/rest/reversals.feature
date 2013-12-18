Feature: Reversal
  Reversals allow for canceling a credit to a bank account.
  A reversals can be partial or the full amount.

  @failing
  Scenario: Creating a full reversal
    Given I have credit a bank account
