Given(/^I have created an order$/) do                                                                                                                              
  step 'I have created a customer'
  step 'I make a POST request to /customers/:customer_id/orders'
end                                                                                                                                                                
