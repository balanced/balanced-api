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
     "first_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/transactions?limit=7&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
           "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
           "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:26.175472Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
           "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
           "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7IAhMPQc0iG4foyqgW6nv2/refunds", 
         "amount": 123, 
         "created_at": "2013-06-07T17:30:47.671132Z", 
         "account": {
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7IAhMPQc0iG4foyqgW6nv2", 
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
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-07T17:29:07.845193Z", 
           "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W416-164-6166", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7IAhMPQc0iG4foyqgW6nv2", 
           "amount": 123, 
           "created_at": "2013-06-07T17:30:46.838384Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7HDEPiGsGMnbCHMil3Gdb8", 
           "expires_at": "2013-06-14T17:30:46.702106Z", 
           "id": "HL7HDEPiGsGMnbCHMil3Gdb8", 
           "transaction_number": "HL481-713-0867", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ"
         }, 
         "id": "WD7IAhMPQc0iG4foyqgW6nv2", 
         "available_at": "2013-06-07T17:30:47.437744Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
           "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
           "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:26.175472Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
           "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
           "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 123, 
         "created_at": "2013-06-07T17:30:46.838384Z", 
         "account": {
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "expires_at": "2013-06-14T17:30:46.702106Z", 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7HDEPiGsGMnbCHMil3Gdb8", 
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
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-07T17:29:07.845193Z", 
           "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL481-713-0867", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7HDEPiGsGMnbCHMil3Gdb8", 
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
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7IAhMPQc0iG4foyqgW6nv2", 
           "id": "WD7IAhMPQc0iG4foyqgW6nv2", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7IAhMPQc0iG4foyqgW6nv2/refunds", 
           "transaction_number": "W416-164-6166", 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-07T17:30:47.671132Z", 
           "available_at": "2013-06-07T17:30:47.437744Z"
         }, 
         "id": "HL7HDEPiGsGMnbCHMil3Gdb8"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
           "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
           "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:26.175472Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
           "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
           "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 5544, 
         "created_at": "2013-06-07T17:30:46.186854Z", 
         "account": {
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds/RF7GUSzp52nc7rkrzUG4mAFx", 
         "transaction_number": "RF117-005-1843", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7FYdD6hR2GRazw45W0aN9U", 
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
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7FVQfYra0ZGGZfDglW6RE6", 
           "id": "WD7FVQfYra0ZGGZfDglW6RE6", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7FVQfYra0ZGGZfDglW6RE6/refunds", 
           "transaction_number": "W387-043-6571", 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-07T17:30:45.313075Z", 
           "available_at": "2013-06-07T17:30:45.036560Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF7GUSzp52nc7rkrzUG4mAFx"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
           "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
           "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:26.175472Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
           "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
           "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 5544, 
         "created_at": "2013-06-07T17:30:45.347016Z", 
         "account": {
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "expires_at": "2013-06-14T17:30:44.528589Z", 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7FYdD6hR2GRazw45W0aN9U", 
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
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-07T17:29:07.845193Z", 
           "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL148-760-8189", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7FYdD6hR2GRazw45W0aN9U", 
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
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7FVQfYra0ZGGZfDglW6RE6", 
           "id": "WD7FVQfYra0ZGGZfDglW6RE6", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7FVQfYra0ZGGZfDglW6RE6/refunds", 
           "transaction_number": "W387-043-6571", 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-07T17:30:45.313075Z", 
           "available_at": "2013-06-07T17:30:45.036560Z"
         }, 
         "id": "HL7FYdD6hR2GRazw45W0aN9U"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
           "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
           "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:26.175472Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
           "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
           "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7FVQfYra0ZGGZfDglW6RE6/refunds", 
         "amount": 5544, 
         "created_at": "2013-06-07T17:30:45.313075Z", 
         "account": {
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7FVQfYra0ZGGZfDglW6RE6", 
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
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-07T17:29:07.845193Z", 
           "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W387-043-6571", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7FVQfYra0ZGGZfDglW6RE6", 
           "amount": 5544, 
           "created_at": "2013-06-07T17:30:45.347016Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7FYdD6hR2GRazw45W0aN9U", 
           "expires_at": "2013-06-14T17:30:44.528589Z", 
           "id": "HL7FYdD6hR2GRazw45W0aN9U", 
           "transaction_number": "HL148-760-8189", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ"
         }, 
         "id": "WD7FVQfYra0ZGGZfDglW6RE6", 
         "available_at": "2013-06-07T17:30:45.036560Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU5zoAvSWj5KTtHBAm332Auk", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
           "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
           "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:49.249513Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
           "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
           "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
           "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 245, 
         "created_at": "2013-06-07T17:30:43.969104Z", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-07T17:28:48.666473Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
           "email_address": null, 
           "id": "AC5yJVw71VIXbxuGADgNRhjy", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR7EpXie4vDZapUek2CdxREs", 
         "transaction_number": "CR397-827-4405", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7EpXie4vDZapUek2CdxREs", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-07T17:30:43.739527Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
           "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
           "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:26.175472Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
           "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
           "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": "my new description", 
         "amount": 1254, 
         "created_at": "2013-06-07T17:30:42.040890Z", 
         "account": {
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds/RF7CfFS0ASJqZsaqYDx9SaK4", 
         "transaction_number": "RF641-675-3909", 
         "_uris": {}, 
         "meta": {
           "my-id": "0987654321"
         }, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7BrKELfrA9Leh0Yawyidll", 
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
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7Bqln2kU2z4YZMfDjxjiML", 
           "id": "WD7Bqln2kU2z4YZMfDjxjiML", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7Bqln2kU2z4YZMfDjxjiML/refunds", 
           "transaction_number": "W432-527-0260", 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-07T17:30:41.303424Z", 
           "available_at": "2013-06-07T17:30:41.100713Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF7CfFS0ASJqZsaqYDx9SaK4"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/transactions?limit=7&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/transactions?limit=7&offset=7", 
     "last_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/transactions?limit=7&offset=77"
   }

