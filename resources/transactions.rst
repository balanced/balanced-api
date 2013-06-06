Transactions
============

Unified view of `Holds <./holds.rst>`_, `Debits <./debits.rst>`_, `Refunds <./refunds.rst>`_ and `Credits <./credits.rst>`_.

- `List Transactions`_

Fields
------

- `Holds <./holds.rst>`_
- `Debits <./debits.rst>`_
- `Refunds <./refunds.rst>`_
- `Credits <./credits.rst>`_

List Transactions
-----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/transactions


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/transactions?limit=7&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
           "phone": null, 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "facebook": null, 
           "address": {}, 
           "destination_uri": null, 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5mzLeyX1TMLVw5sZrtC0hY/refunds", 
         "amount": 123, 
         "created_at": "2013-06-06T22:01:49.888579Z", 
         "account": {
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5mzLeyX1TMLVw5sZrtC0hY", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:00:05.933421Z", 
           "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W569-900-7150", 
         "_uris": {
           "refunds_uri": {
             "_type": "page", 
             "key": "refunds"
           }
         }, 
         "meta": {}, 
         "on_behalf_of": null, 
         "appears_on_statement_as": "example.com", 
         "hold": {
           "_type": "hold", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "debit_uri": {
               "_type": "debit", 
               "key": "debit"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }
           }, 
           "debit_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5mzLeyX1TMLVw5sZrtC0hY", 
           "amount": 123, 
           "created_at": "2013-06-06T22:01:49.114257Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5lI0E7VyouyteRwLdcPgJ1", 
           "expires_at": "2013-06-13T22:01:48.960293Z", 
           "id": "HL5lI0E7VyouyteRwLdcPgJ1", 
           "transaction_number": "HL919-080-5256", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK"
         }, 
         "id": "WD5mzLeyX1TMLVw5sZrtC0hY", 
         "available_at": "2013-06-06T22:01:49.636648Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
           "phone": null, 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "facebook": null, 
           "address": {}, 
           "destination_uri": null, 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 123, 
         "created_at": "2013-06-06T22:01:49.114257Z", 
         "account": {
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "expires_at": "2013-06-13T22:01:48.960293Z", 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5lI0E7VyouyteRwLdcPgJ1", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:00:05.933421Z", 
           "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL919-080-5256", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5lI0E7VyouyteRwLdcPgJ1", 
           "status": "succeeded", 
           "_type": "debit", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "hold_uri": {
               "_type": "hold", 
               "key": "hold"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }
           }, 
           "amount": 123, 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5mzLeyX1TMLVw5sZrtC0hY", 
           "id": "WD5mzLeyX1TMLVw5sZrtC0hY", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5mzLeyX1TMLVw5sZrtC0hY/refunds", 
           "transaction_number": "W569-900-7150", 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:01:49.888579Z", 
           "available_at": "2013-06-06T22:01:49.636648Z"
         }, 
         "id": "HL5lI0E7VyouyteRwLdcPgJ1"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
           "phone": null, 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "facebook": null, 
           "address": {}, 
           "destination_uri": null, 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 5544, 
         "created_at": "2013-06-06T22:01:48.292377Z", 
         "account": {
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds/RF5kMjwl3z3DmuyUqtOKyaVa", 
         "transaction_number": "RF338-815-8847", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5jQAmPJLvAnxBPfBvTO7fE", 
           "status": "succeeded", 
           "_type": "debit", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "hold_uri": {
               "_type": "hold", 
               "key": "hold"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }
           }, 
           "amount": 5544, 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5jOJRb8swWjWzEH5xf9gFM", 
           "id": "WD5jOJRb8swWjWzEH5xf9gFM", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5jOJRb8swWjWzEH5xf9gFM/refunds", 
           "transaction_number": "W214-117-9807", 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:01:47.441316Z", 
           "available_at": "2013-06-06T22:01:47.206624Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF5kMjwl3z3DmuyUqtOKyaVa"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
           "phone": null, 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "facebook": null, 
           "address": {}, 
           "destination_uri": null, 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 5544, 
         "created_at": "2013-06-06T22:01:47.467529Z", 
         "account": {
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "expires_at": "2013-06-13T22:01:46.792218Z", 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5jQAmPJLvAnxBPfBvTO7fE", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:00:05.933421Z", 
           "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL166-444-0746", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5jQAmPJLvAnxBPfBvTO7fE", 
           "status": "succeeded", 
           "_type": "debit", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "hold_uri": {
               "_type": "hold", 
               "key": "hold"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }
           }, 
           "amount": 5544, 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5jOJRb8swWjWzEH5xf9gFM", 
           "id": "WD5jOJRb8swWjWzEH5xf9gFM", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5jOJRb8swWjWzEH5xf9gFM/refunds", 
           "transaction_number": "W214-117-9807", 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:01:47.441316Z", 
           "available_at": "2013-06-06T22:01:47.206624Z"
         }, 
         "id": "HL5jQAmPJLvAnxBPfBvTO7fE"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
           "phone": null, 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "facebook": null, 
           "address": {}, 
           "destination_uri": null, 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5jOJRb8swWjWzEH5xf9gFM/refunds", 
         "amount": 5544, 
         "created_at": "2013-06-06T22:01:47.441316Z", 
         "account": {
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5jOJRb8swWjWzEH5xf9gFM", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:00:05.933421Z", 
           "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W214-117-9807", 
         "_uris": {
           "refunds_uri": {
             "_type": "page", 
             "key": "refunds"
           }
         }, 
         "meta": {}, 
         "on_behalf_of": null, 
         "appears_on_statement_as": "example.com", 
         "hold": {
           "_type": "hold", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "debit_uri": {
               "_type": "debit", 
               "key": "debit"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }
           }, 
           "debit_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5jOJRb8swWjWzEH5xf9gFM", 
           "amount": 5544, 
           "created_at": "2013-06-06T22:01:47.467529Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5jQAmPJLvAnxBPfBvTO7fE", 
           "expires_at": "2013-06-13T22:01:46.792218Z", 
           "id": "HL5jQAmPJLvAnxBPfBvTO7fE", 
           "transaction_number": "HL166-444-0746", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK"
         }, 
         "id": "WD5jOJRb8swWjWzEH5xf9gFM", 
         "available_at": "2013-06-06T22:01:47.206624Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU386UYGkRIxJ1og2jajjTE2", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
           "phone": "+16505551234", 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "destination_uri": {
               "_type": "bank_account", 
               "key": "destination"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "facebook": null, 
           "address": {}, 
           "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
           "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
           "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:46.783063Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
           "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
           "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
           "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 245, 
         "created_at": "2013-06-06T22:01:46.198901Z", 
         "destination": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "_uris": {
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }, 
             "verifications_uri": {
               "_type": "page", 
               "key": "verifications"
             }
           }, 
           "bank_code": "121042882", 
           "can_debit": false, 
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T21:59:46.286553Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
           "email_address": null, 
           "id": "AC37yiAn5M6zGCC30kJX3whg", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR5iqt6ZQ7j8rJGrPd13QVZ0", 
         "transaction_number": "CR862-611-1840", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR5iqt6ZQ7j8rJGrPd13QVZ0", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "_uris": {
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }, 
             "verifications_uri": {
               "_type": "page", 
               "key": "verifications"
             }
           }, 
           "bank_code": "121042882", 
           "can_debit": false, 
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:01:46.062536Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
           "phone": null, 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "facebook": null, 
           "address": {}, 
           "destination_uri": null, 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": "my new description", 
         "amount": 1254, 
         "created_at": "2013-06-06T22:01:44.533886Z", 
         "account": {
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
           "_uris": {
             "transactions_uri": {
               "_type": "page", 
               "key": "transactions"
             }, 
             "bank_accounts_uri": {
               "_type": "page", 
               "key": "bank_accounts"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "debits_uri": {
               "_type": "page", 
               "key": "debits"
             }, 
             "holds_uri": {
               "_type": "page", 
               "key": "holds"
             }, 
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "cards_uri": {
               "_type": "page", 
               "key": "cards"
             }
           }, 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds/RF5gyeLnC8e5SLrZDKgnYNwk", 
         "transaction_number": "RF201-250-2211", 
         "_uris": {}, 
         "meta": {
           "my-id": "0987654321"
         }, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5fz656KG354jE8v9TWNOFI", 
           "status": "succeeded", 
           "_type": "debit", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "hold_uri": {
               "_type": "hold", 
               "key": "hold"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }
           }, 
           "amount": 1254, 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5fxzUnj15klyIUdrdxBy3g", 
           "id": "WD5fxzUnj15klyIUdrdxBy3g", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5fxzUnj15klyIUdrdxBy3g/refunds", 
           "transaction_number": "W396-588-2338", 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:01:43.633429Z", 
           "available_at": "2013-06-06T22:01:43.379091Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF5gyeLnC8e5SLrZDKgnYNwk"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/transactions?limit=7&offset=0", 
     "_uris": {
       "first_uri": {
         "_type": "page", 
         "key": "first"
       }, 
       "next_uri": {
         "_type": "page", 
         "key": "next"
       }, 
       "previous_uri": {
         "_type": "page", 
         "key": "previous"
       }, 
       "last_uri": {
         "_type": "page", 
         "key": "last"
       }
     }, 
     "limit": 7, 
     "offset": 0, 
     "counts": {
       "refund": 11, 
       "account": 21, 
       "credit": 16, 
       "bank_account": 12, 
       "debit": 22, 
       "hold": 34, 
       "card": 14
     }, 
     "total": 83, 
     "next_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/transactions?limit=7&offset=7", 
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/transactions?limit=7&offset=77"
   }

