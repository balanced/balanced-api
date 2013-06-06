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
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/transactions?limit=7&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
           "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
           "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:43:42.219634Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
           "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
           "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 123, 
         "created_at": "2013-06-06T22:46:13.724503Z", 
         "account": {
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T22:43:41.675985Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
           "email_address": null, 
           "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
         }, 
         "expires_at": "2013-06-13T22:46:13.606832Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6WgGCDBdqx2Q6qV2puyjuL", 
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
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:44:24.496765Z", 
           "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL106-010-4794", 
         "meta": {}, 
         "is_void": true, 
         "debit": null, 
         "id": "HL6WgGCDBdqx2Q6qV2puyjuL"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
           "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
           "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:43:42.219634Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
           "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
           "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6Vznc06O2uVEwRmQcfwz3q/refunds", 
         "amount": 123, 
         "created_at": "2013-06-06T22:46:13.107146Z", 
         "account": {
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T22:43:41.675985Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
           "email_address": null, 
           "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6Vznc06O2uVEwRmQcfwz3q", 
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
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:44:24.496765Z", 
           "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W752-379-5478", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6Vznc06O2uVEwRmQcfwz3q", 
           "amount": 123, 
           "created_at": "2013-06-06T22:46:12.202039Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6UyfRRKPdreVFq5dJknaRG", 
           "expires_at": "2013-06-13T22:46:12.078487Z", 
           "id": "HL6UyfRRKPdreVFq5dJknaRG", 
           "transaction_number": "HL778-360-4438", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0"
         }, 
         "id": "WD6Vznc06O2uVEwRmQcfwz3q", 
         "available_at": "2013-06-06T22:46:12.709075Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
           "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
           "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:43:42.219634Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
           "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
           "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 123, 
         "created_at": "2013-06-06T22:46:12.202039Z", 
         "account": {
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T22:43:41.675985Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
           "email_address": null, 
           "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
         }, 
         "expires_at": "2013-06-13T22:46:12.078487Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6UyfRRKPdreVFq5dJknaRG", 
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
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:44:24.496765Z", 
           "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL778-360-4438", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6UyfRRKPdreVFq5dJknaRG", 
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
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6Vznc06O2uVEwRmQcfwz3q", 
           "id": "WD6Vznc06O2uVEwRmQcfwz3q", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6Vznc06O2uVEwRmQcfwz3q/refunds", 
           "transaction_number": "W752-379-5478", 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:46:13.107146Z", 
           "available_at": "2013-06-06T22:46:12.709075Z"
         }, 
         "id": "HL6UyfRRKPdreVFq5dJknaRG"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
           "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
           "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:43:42.219634Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
           "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
           "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 5544, 
         "created_at": "2013-06-06T22:46:11.555320Z", 
         "account": {
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T22:43:41.675985Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
           "email_address": null, 
           "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds/RF6TPfJwdExgaNR68IJEWJ8C", 
         "transaction_number": "RF463-892-1390", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6T28akdAnbloSF5IcyetYK", 
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
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6T1e7154uOMNM596YM8x4u", 
           "id": "WD6T1e7154uOMNM596YM8x4u", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6T1e7154uOMNM596YM8x4u/refunds", 
           "transaction_number": "W580-866-3105", 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:46:10.838025Z", 
           "available_at": "2013-06-06T22:46:10.536303Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF6TPfJwdExgaNR68IJEWJ8C"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
           "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
           "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:43:42.219634Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
           "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
           "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 5544, 
         "created_at": "2013-06-06T22:46:10.850707Z", 
         "account": {
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T22:43:41.675985Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
           "email_address": null, 
           "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
         }, 
         "expires_at": "2013-06-13T22:46:10.157352Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6T28akdAnbloSF5IcyetYK", 
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
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:44:24.496765Z", 
           "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL281-498-8308", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6T28akdAnbloSF5IcyetYK", 
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
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6T1e7154uOMNM596YM8x4u", 
           "id": "WD6T1e7154uOMNM596YM8x4u", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6T1e7154uOMNM596YM8x4u/refunds", 
           "transaction_number": "W580-866-3105", 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:46:10.838025Z", 
           "available_at": "2013-06-06T22:46:10.536303Z"
         }, 
         "id": "HL6T28akdAnbloSF5IcyetYK"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
           "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
           "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:43:42.219634Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
           "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
           "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6T1e7154uOMNM596YM8x4u/refunds", 
         "amount": 5544, 
         "created_at": "2013-06-06T22:46:10.838025Z", 
         "account": {
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T22:43:41.675985Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
           "email_address": null, 
           "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6T1e7154uOMNM596YM8x4u", 
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
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:44:24.496765Z", 
           "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W580-866-3105", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6T1e7154uOMNM596YM8x4u", 
           "amount": 5544, 
           "created_at": "2013-06-06T22:46:10.850707Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6T28akdAnbloSF5IcyetYK", 
           "expires_at": "2013-06-13T22:46:10.157352Z", 
           "id": "HL6T28akdAnbloSF5IcyetYK", 
           "transaction_number": "HL281-498-8308", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0"
         }, 
         "id": "WD6T1e7154uOMNM596YM8x4u", 
         "available_at": "2013-06-06T22:46:10.536303Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4BiE0lXFM0L888UPzDlD5K", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/credits", 
           "cards_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/cards", 
           "holds_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:44:04.837713Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K", 
           "refunds_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/refunds", 
           "debits_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/debits", 
           "transactions_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 245, 
         "created_at": "2013-06-06T22:46:09.562437Z", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T22:44:04.299918Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/holds", 
           "email_address": null, 
           "id": "AC4AH8Q2WpuVJVujfM25B6Qg", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR6RA2830JuZyWgJoZ1GgJG8", 
         "transaction_number": "CR816-634-4612", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR6RA2830JuZyWgJoZ1GgJG8", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:46:09.441520Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/transactions?limit=7&offset=0", 
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
       "hold": 35, 
       "card": 14
     }, 
     "total": 84, 
     "next_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/transactions?limit=7&offset=7", 
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/transactions?limit=7&offset=77"
   }

