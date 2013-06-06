Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

``account_email_address``
   **object**.

``account_name``
   **object**.

``amount``
   **integer**. The amount of the refund.

``appears_on_statement_as``
   **string**. Text that will appear on the statement describing this refund.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   refund was issued.

``debit``
   **object**. The original debit associated with the refund.

``description``
   **string**. Free-text description of the refund.

``id``
   **string**.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``transaction_number``
   **string**. An identifier for this transaction.

``uri``
   **string**.

Deprecated
~~~~~~~~~~

Refund an Account
-----------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds

Request
~~~~~~~

``amount``
   *optional* **integer**. Defaults to ``null``.

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``debit_uri``
   *optional* **string**. If the resolving URI references a ``debit`` then that is used as the
   default. Otherwise no default is provided and this field is
   **required**.


Body
^^^^

.. code:: javascript

   {
       "debit_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6xoGJd1fJRaFzL3yZPJKyc", 
       "amount": 1234, 
       "meta": {}, 
       "description": null
   }

Response
~~~~~~~~


Headers
^^^^^^^

.. code::

   Status: 201 CREATED


Body
^^^^

.. code:: javascript

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
     "amount": 1234, 
     "created_at": "2013-06-06T22:45:54.920132Z", 
     "account": {
       "_type": "account", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
       "created_at": "2013-06-06T22:43:41.675985Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
       "email_address": null, 
       "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
       "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds/RF6B78D5zoHNfv5spp2Fouxa", 
     "transaction_number": "RF724-602-8306", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6AiXht1p7yiGSOAWu6Q5lM", 
       "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "created_at": "2013-06-06T22:45:54.149327Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6AftbDvnAIieqQ1pKTYuEy", 
       "status": "succeeded", 
       "transaction_number": "W921-313-3160", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6AftbDvnAIieqQ1pKTYuEy/refunds", 
       "amount": 1254, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "appears_on_statement_as": "example.com", 
       "id": "WD6AftbDvnAIieqQ1pKTYuEy", 
       "available_at": "2013-06-06T22:45:53.927928Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF6B78D5zoHNfv5spp2Fouxa"
   }

Retrieve a Refund
-----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id

Response
~~~~~~~~


Headers
^^^^^^^

.. code::

   Status: 201 CREATED


Body
^^^^

.. code:: javascript

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
     "amount": 1254, 
     "created_at": "2013-06-06T22:45:57.369948Z", 
     "account": {
       "_type": "account", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
       "created_at": "2013-06-06T22:43:41.675985Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
       "email_address": null, 
       "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
       "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds/RF6DRF3Ku5AEADqadmzrDvgO", 
     "transaction_number": "RF723-016-4036", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6D0SXUC0wGJ1dsbJcscIuY", 
       "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "created_at": "2013-06-06T22:45:56.565091Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6CXQaiH5rKA8Cl0P3lKuWc", 
       "status": "succeeded", 
       "transaction_number": "W117-160-4290", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6CXQaiH5rKA8Cl0P3lKuWc/refunds", 
       "amount": 1254, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "appears_on_statement_as": "example.com", 
       "id": "WD6CXQaiH5rKA8Cl0P3lKuWc", 
       "available_at": "2013-06-06T22:45:56.277770Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF6DRF3Ku5AEADqadmzrDvgO"
   }

List All Refunds
----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds

Request
~~~~~~~

Response
~~~~~~~~

Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds?limit=2&offset=0", 
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
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T22:46:02.001758Z", 
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
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds/RF6J4EbsjdkTuE8acSJFe926", 
         "transaction_number": "RF094-413-4601", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6IauWOKaCaCp9zQyAiuTs6", 
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
           "amount": 431, 
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6I5CxQh8RrOF1Bk417vbXc", 
           "id": "WD6I5CxQh8RrOF1Bk417vbXc", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6I5CxQh8RrOF1Bk417vbXc/refunds", 
           "transaction_number": "W236-355-8504", 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:46:01.120840Z", 
           "available_at": "2013-06-06T22:46:00.887336Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF6J4EbsjdkTuE8acSJFe926"
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
         "amount": 1254, 
         "created_at": "2013-06-06T22:45:59.889338Z", 
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
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds/RF6GHm2FEZbBEjeoGIb35FhY", 
         "transaction_number": "RF509-160-3230", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6FT6tqGjLIXF2FLr9DIK3K", 
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
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6FQMQr8IBBbeSMrRv9P6Vi", 
           "id": "WD6FQMQr8IBBbeSMrRv9P6Vi", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6FQMQr8IBBbeSMrRv9P6Vi/refunds", 
           "transaction_number": "W093-316-8933", 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:45:59.131220Z", 
           "available_at": "2013-06-06T22:45:58.805277Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF6GHm2FEZbBEjeoGIb35FhY"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds?limit=2&offset=0", 
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
     "limit": 2, 
     "offset": 0, 
     "total": 8, 
     "next_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds?limit=2&offset=6"
   }

Update a Refund
---------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id

Request
~~~~~~~

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values.


Body
^^^^

.. code:: javascript

   {
       "_type": "refund", 
       "fee": null, 
       "description": "my new description", 
       "created_at": "2013-06-06T22:46:05.050605+00:00Z", 
       "transaction_number": "RF677-302-1585", 
       "amount": 1254, 
       "_uris": {}, 
       "meta": {
           "my-id": "0987654321"
       }, 
       "appears_on_statement_as": "example.com", 
       "id": "RF6MvQ1V9DLYrjCrCBKTTBzF"
   }

Response
~~~~~~~~


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

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
     "description": "my new description", 
     "amount": 1254, 
     "created_at": "2013-06-06T22:46:08.033642Z", 
     "account": {
       "_type": "account", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
       "created_at": "2013-06-06T22:43:41.675985Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
       "email_address": null, 
       "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
       "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds/RF6PRzBDSiSnNmUjdOG1aAnK", 
     "transaction_number": "RF575-553-1793", 
     "_uris": {}, 
     "meta": {
       "my-id": "0987654321"
     }, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6OJKKVfa9OwKYppGuuLktG", 
       "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "created_at": "2013-06-06T22:46:06.995803Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6OH3hCiC6gcltPH0YwvvQc", 
       "status": "succeeded", 
       "transaction_number": "W619-973-5221", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6OH3hCiC6gcltPH0YwvvQc/refunds", 
       "amount": 1254, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "appears_on_statement_as": "example.com", 
       "id": "WD6OH3hCiC6gcltPH0YwvvQc", 
       "available_at": "2013-06-06T22:46:06.668357Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF6PRzBDSiSnNmUjdOG1aAnK"
   }

