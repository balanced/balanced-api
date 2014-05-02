Given(/^I've tokenized the card "(.*?)" with the CVV "(.*?)"$/) do |number, cvv|
  step %Q{I try to tokenize the card "#{number}" with the CVV "#{cvv}"}

  puts @client.last_body
  @card_id = @client['cards']['id']
  @client.add_hydrate(:card_id, @card_id)
end

When(/^I debit the card$/) do
  @client.post(@client.hydrater("/cards/:card_id/debits"),
    {
      "debits" => [{
        "amount" => 100
      }]
    }
  )
puts @client.last_body
end

When(/^I try to tokenize the card "(.*?)" with the CVV "(.*?)"$/) do |number, cvv|
  require 'date'

  @client.post('/cards',
    {
      number: number,
        expiration_month: Date.today.month,
        expiration_year: Date.today.year + 1,
        cvv: cvv,
        address: {
          line1: "965 Mission St",
          postal_code: "94103"
        }
    }
  )
end

And(/^the debit has a link to a dispute$/) do
  @dispute_id = nil
  count = 60
  while @dispute_id.nil? and count > 0
    count -= 1
    @client.get("/debits/#{@disputed_debit_id}")
    @dispute_id = @client['debits']['links']['dispute']
    sleep 3
  end
  raise 'Unable to get a dispute in 3 minutes' if count == 0
end

When(/^I try to tokenize the bank account "(.*?)" with the routing number "(.*?)"$/) do |account_number, routing_number|
  @client.post('/bank_accounts', {
                 name: "Henry Ford",
                 routing_number: routing_number,
                 account_number: account_number,
                 account_type: "checking",
               })
end
