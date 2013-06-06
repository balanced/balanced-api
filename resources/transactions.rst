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
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/transactions?limit=7&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU74SnDBcVISAI37kzTFU2yQ", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
           "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
           "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:14:59.370052Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
           "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
           "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1NmO7EhvugtRFOMAURidEI/refunds", 
         "amount": 123, 
         "created_at": "2013-06-06T23:17:17.673434Z", 
         "account": {
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
           "email_address": null, 
           "id": "AC74u3FlUdGRzoRVqobCvhfW", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1NmO7EhvugtRFOMAURidEI", 
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
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T23:15:44.176785Z", 
           "id": "CC6d1n4vID0GHQvPo8To1eU", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W049-641-9495", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1NmO7EhvugtRFOMAURidEI", 
           "amount": 123, 
           "created_at": "2013-06-06T23:17:16.966332Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1MzwNZM2XKrdTVLiF5JZl8", 
           "expires_at": "2013-06-13T23:17:16.828052Z", 
           "id": "HL1MzwNZM2XKrdTVLiF5JZl8", 
           "transaction_number": "HL572-667-7406", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU"
         }, 
         "id": "WD1NmO7EhvugtRFOMAURidEI", 
         "available_at": "2013-06-06T23:17:17.486332Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU74SnDBcVISAI37kzTFU2yQ", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
           "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
           "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:14:59.370052Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
           "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
           "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 123, 
         "created_at": "2013-06-06T23:17:16.966332Z", 
         "account": {
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
           "email_address": null, 
           "id": "AC74u3FlUdGRzoRVqobCvhfW", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
         }, 
         "expires_at": "2013-06-13T23:17:16.828052Z", 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1MzwNZM2XKrdTVLiF5JZl8", 
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
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T23:15:44.176785Z", 
           "id": "CC6d1n4vID0GHQvPo8To1eU", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL572-667-7406", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1MzwNZM2XKrdTVLiF5JZl8", 
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
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1NmO7EhvugtRFOMAURidEI", 
           "id": "WD1NmO7EhvugtRFOMAURidEI", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1NmO7EhvugtRFOMAURidEI/refunds", 
           "transaction_number": "W049-641-9495", 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:17:17.673434Z", 
           "available_at": "2013-06-06T23:17:17.486332Z"
         }, 
         "id": "HL1MzwNZM2XKrdTVLiF5JZl8"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU74SnDBcVISAI37kzTFU2yQ", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
           "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
           "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:14:59.370052Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
           "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
           "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 5544, 
         "created_at": "2013-06-06T23:17:16.327927Z", 
         "account": {
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
           "email_address": null, 
           "id": "AC74u3FlUdGRzoRVqobCvhfW", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds/RF1LQCNKoF7lA2QE17Fp9YGy", 
         "transaction_number": "RF290-100-4145", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1Lad4HSFYw3mybNultTbao", 
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
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1L8CzEwr5VkvwjCliPAJL2", 
           "id": "WD1L8CzEwr5VkvwjCliPAJL2", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1L8CzEwr5VkvwjCliPAJL2/refunds", 
           "transaction_number": "W058-413-2400", 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:17:15.694468Z", 
           "available_at": "2013-06-06T23:17:15.404568Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF1LQCNKoF7lA2QE17Fp9YGy"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU74SnDBcVISAI37kzTFU2yQ", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
           "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
           "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:14:59.370052Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
           "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
           "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 5544, 
         "created_at": "2013-06-06T23:17:15.717068Z", 
         "account": {
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
           "email_address": null, 
           "id": "AC74u3FlUdGRzoRVqobCvhfW", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
         }, 
         "expires_at": "2013-06-13T23:17:15.006501Z", 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1Lad4HSFYw3mybNultTbao", 
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
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T23:15:44.176785Z", 
           "id": "CC6d1n4vID0GHQvPo8To1eU", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL721-443-0839", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1Lad4HSFYw3mybNultTbao", 
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
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1L8CzEwr5VkvwjCliPAJL2", 
           "id": "WD1L8CzEwr5VkvwjCliPAJL2", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1L8CzEwr5VkvwjCliPAJL2/refunds", 
           "transaction_number": "W058-413-2400", 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:17:15.694468Z", 
           "available_at": "2013-06-06T23:17:15.404568Z"
         }, 
         "id": "HL1Lad4HSFYw3mybNultTbao"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU74SnDBcVISAI37kzTFU2yQ", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
           "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
           "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:14:59.370052Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
           "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
           "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1L8CzEwr5VkvwjCliPAJL2/refunds", 
         "amount": 5544, 
         "created_at": "2013-06-06T23:17:15.694468Z", 
         "account": {
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
           "email_address": null, 
           "id": "AC74u3FlUdGRzoRVqobCvhfW", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1L8CzEwr5VkvwjCliPAJL2", 
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
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T23:15:44.176785Z", 
           "id": "CC6d1n4vID0GHQvPo8To1eU", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W058-413-2400", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1L8CzEwr5VkvwjCliPAJL2", 
           "amount": 5544, 
           "created_at": "2013-06-06T23:17:15.717068Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1Lad4HSFYw3mybNultTbao", 
           "expires_at": "2013-06-13T23:17:15.006501Z", 
           "id": "HL1Lad4HSFYw3mybNultTbao", 
           "transaction_number": "HL721-443-0839", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU"
         }, 
         "id": "WD1L8CzEwr5VkvwjCliPAJL2", 
         "available_at": "2013-06-06T23:17:15.404568Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
           "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
           "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:15:22.148564Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
           "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
           "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 245, 
         "created_at": "2013-06-06T23:17:14.307209Z", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:15:21.686412Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
           "email_address": null, 
           "id": "AC7tYY6I2HACOAiftgFo4oCr", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CR1JzHvZbrte8iS7hGZludjo", 
         "transaction_number": "CR210-103-0482", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR1JzHvZbrte8iS7hGZludjo", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:17:14.194394Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU74SnDBcVISAI37kzTFU2yQ", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
           "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
           "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:14:59.370052Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
           "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
           "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": "my new description", 
         "amount": 1254, 
         "created_at": "2013-06-06T23:17:12.866478Z", 
         "account": {
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
           "email_address": null, 
           "id": "AC74u3FlUdGRzoRVqobCvhfW", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds/RF1HXOP1YXYrHMPig6RkWiwn", 
         "transaction_number": "RF434-341-5964", 
         "_uris": {}, 
         "meta": {
           "my-id": "0987654321"
         }, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1Hbt6EjR0u84VoK8qYldAc", 
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
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1HaoXHKEgns47wamm5Q5X2", 
           "id": "WD1HaoXHKEgns47wamm5Q5X2", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1HaoXHKEgns47wamm5Q5X2/refunds", 
           "transaction_number": "W401-555-7796", 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:17:12.160932Z", 
           "available_at": "2013-06-06T23:17:11.980158Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF1HXOP1YXYrHMPig6RkWiwn"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/transactions?limit=7&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/transactions?limit=7&offset=7", 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/transactions?limit=7&offset=77"
   }

