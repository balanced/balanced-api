Given(/^I have created an operating account$/) do
  step "I have created a customer"
  step 'I make a POST request to the link "accounts" with the body:', <<-body
      {
        "accounts":[{
          "account_type": "deposit",
          "description": "Redeemable balances migration",
          "meta": {
            "tag": "migration-redeemable-balance-account"
          }
        }]
      } 
body
end

Given(/^I have created a deposit account$/) do
  step "I have created a customer"
  step 'I make a POST request to the link "accounts" with the body:', <<-body
      {
        "accounts":[{
          "account_type": "deposit",
          "description": "Stored Value",
          "meta": {
            "tag": "customer-redeemable-balance-account"
          }
        }]
      } 
body
end

Given(/^I have created a line of credit account$/) do
  step "I have created a customer"
  step 'I make a POST request to the link "accounts" with the body:', <<-body
      {
        "accounts":[{
          "account_type": "line-of-credit",
          "description": "Overweight shipping",
          "meta": {
            "tag": "customer-credit-line-account"
          }
        }]
      } 
body
end
