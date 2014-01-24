Given(/^I have created a refund for a debit$/) do
  step 'I have debited a card'
  @client.post("/debits/#{@debit_id}/refunds", {})
  @refund_id = @client['refunds']['id']
  @client.add_hydrate :refund_id, @refund_id
end

When(/^I change the default funding source$/) do
  @client.post('/cards',
    {
      number: "4111 1111 1111 1111",
      expiration_month: 12,
      expiration_year: 2016,
    }
  )
  @other_card_id = @client['cards']['id']

  @client.patch(@customer_url,
     [{
      op: "replace",
      path: "/customers/0/links/source",
      value: @other_card_id
    }]
  )
end

When(/^I create a refund$/) do
  @original_card_id = @card_id # creating the refund will make a new card
  step 'I have created a refund for a debit'
end

Then(/^the refund should go to the original card$/) do
  @client.get(@debit_url)
  step "I should get a 200 OK status code"
  step 'the response is valid according to the "debits" schema'
  step "the fields on these debits match:", %Q/{ "links": { "source": "#{@original_card_id}" } }/
end

