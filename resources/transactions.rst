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
     "first_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/transactions?limit=7&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6zEbRwNXbovDRX0bThtz18", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:10.328398Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1WxO8XwEGEzxJ5rer3x9c6/refunds", 
         "amount": 123, 
         "created_at": "2013-06-05T02:33:04.559930Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-05T02:30:09.949061Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
           "email_address": null, 
           "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1WxO8XwEGEzxJ5rer3x9c6", 
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
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-05T02:31:01.301776Z", 
           "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W120-586-9446", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1WxO8XwEGEzxJ5rer3x9c6", 
           "amount": 123, 
           "created_at": "2013-06-05T02:33:03.770304Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1VEKmdysQgzQNPU3Kr8DZ8", 
           "expires_at": "2013-06-12T02:33:03.651422Z", 
           "id": "HL1VEKmdysQgzQNPU3Kr8DZ8", 
           "transaction_number": "HL720-450-0861", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb"
         }, 
         "id": "WD1WxO8XwEGEzxJ5rer3x9c6", 
         "available_at": "2013-06-05T02:33:04.285081Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6zEbRwNXbovDRX0bThtz18", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:10.328398Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 123, 
         "created_at": "2013-06-05T02:33:03.770304Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-05T02:30:09.949061Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
           "email_address": null, 
           "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         }, 
         "expires_at": "2013-06-12T02:33:03.651422Z", 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1VEKmdysQgzQNPU3Kr8DZ8", 
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
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-05T02:31:01.301776Z", 
           "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL720-450-0861", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1VEKmdysQgzQNPU3Kr8DZ8", 
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
           "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1WxO8XwEGEzxJ5rer3x9c6", 
           "id": "WD1WxO8XwEGEzxJ5rer3x9c6", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1WxO8XwEGEzxJ5rer3x9c6/refunds", 
           "transaction_number": "W120-586-9446", 
           "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-05T02:33:04.559930Z", 
           "available_at": "2013-06-05T02:33:04.285081Z"
         }, 
         "id": "HL1VEKmdysQgzQNPU3Kr8DZ8"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6zEbRwNXbovDRX0bThtz18", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:10.328398Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 5544, 
         "created_at": "2013-06-05T02:33:02.934626Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-05T02:30:09.949061Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
           "email_address": null, 
           "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/refunds/RF1UIteCrR1CGj9De0QkNu4O", 
         "transaction_number": "RF534-188-3121", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1TPSrrst1O1ESJECbvMD1Y", 
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
           "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1TMIlTpA8pvzspYxE4BrVk", 
           "id": "WD1TMIlTpA8pvzspYxE4BrVk", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1TMIlTpA8pvzspYxE4BrVk/refunds", 
           "transaction_number": "W902-165-0239", 
           "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-05T02:33:02.115127Z", 
           "available_at": "2013-06-05T02:33:01.783549Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF1UIteCrR1CGj9De0QkNu4O"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6zEbRwNXbovDRX0bThtz18", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:10.328398Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 5544, 
         "created_at": "2013-06-05T02:33:02.160219Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-05T02:30:09.949061Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
           "email_address": null, 
           "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         }, 
         "expires_at": "2013-06-12T02:33:01.418994Z", 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1TPSrrst1O1ESJECbvMD1Y", 
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
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-05T02:31:01.301776Z", 
           "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL075-515-9768", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1TPSrrst1O1ESJECbvMD1Y", 
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
           "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1TMIlTpA8pvzspYxE4BrVk", 
           "id": "WD1TMIlTpA8pvzspYxE4BrVk", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1TMIlTpA8pvzspYxE4BrVk/refunds", 
           "transaction_number": "W902-165-0239", 
           "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-05T02:33:02.115127Z", 
           "available_at": "2013-06-05T02:33:01.783549Z"
         }, 
         "id": "HL1TPSrrst1O1ESJECbvMD1Y"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6zEbRwNXbovDRX0bThtz18", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:10.328398Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1TMIlTpA8pvzspYxE4BrVk/refunds", 
         "amount": 5544, 
         "created_at": "2013-06-05T02:33:02.115127Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-05T02:30:09.949061Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
           "email_address": null, 
           "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1TMIlTpA8pvzspYxE4BrVk", 
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
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-05T02:31:01.301776Z", 
           "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W902-165-0239", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1TMIlTpA8pvzspYxE4BrVk", 
           "amount": 5544, 
           "created_at": "2013-06-05T02:33:02.160219Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1TPSrrst1O1ESJECbvMD1Y", 
           "expires_at": "2013-06-12T02:33:01.418994Z", 
           "id": "HL1TPSrrst1O1ESJECbvMD1Y", 
           "transaction_number": "HL075-515-9768", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb"
         }, 
         "id": "WD1TMIlTpA8pvzspYxE4BrVk", 
         "available_at": "2013-06-05T02:33:01.783549Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
           "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
           "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:47.174948Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
           "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
           "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 245, 
         "created_at": "2013-06-05T02:33:00.794641Z", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-05T02:30:46.607596Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
           "email_address": null, 
           "id": "AC7es2SmXDh2rcN8tgzidSOe", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR1SjeiHmFlr0oUEoOJQDxqo", 
         "transaction_number": "CR877-373-1377", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR1SjeiHmFlr0oUEoOJQDxqo", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-05T02:33:00.624329Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6zEbRwNXbovDRX0bThtz18", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:10.328398Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": "my new description", 
         "amount": 1254, 
         "created_at": "2013-06-05T02:32:59.083098Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-05T02:30:09.949061Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
           "email_address": null, 
           "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/refunds/RF1QnTpS9srJYiBCupMLPsV4", 
         "transaction_number": "RF335-555-3266", 
         "_uris": {}, 
         "meta": {
           "my-id": "0987654321"
         }, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1PC5peuZnLWRjvjQ7jDhhK", 
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
           "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1PziRevjWQQw3qYyfQ6uNy", 
           "id": "WD1PziRevjWQQw3qYyfQ6uNy", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1PziRevjWQQw3qYyfQ6uNy/refunds", 
           "transaction_number": "W677-531-6747", 
           "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-05T02:32:58.358481Z", 
           "available_at": "2013-06-05T02:32:58.029746Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF1QnTpS9srJYiBCupMLPsV4"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/transactions?limit=7&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/transactions?limit=7&offset=7", 
     "last_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/transactions?limit=7&offset=77"
   }

