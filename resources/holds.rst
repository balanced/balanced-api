Holds
=====

- `Create a Hold`_
- `Retrieve a Hold`_
- `List all Holds`_
- `Update a Hold`_
- `Capture a Hold`_
- `Void a Hold`_

Fields
------

``account_email_address``
   **object**.

``account_name``
   **object**.

``amount``
   **integer**. Amount of the hold.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   hold was created.

``debit``
   **object**. See `Debit <./debits.rst>`_.

``description``
   **string**. A description of the hold, used for display purposes.

``expires_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   hold was will expire and can **NO LONGER BE CAPTURED**.

``id``
   **string**.

``is_void``
   **boolean**. A boolean flag indicating if the hold has been voided or not.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``source``
   **object**. See `Card <./cards.rst>`_.


``transaction_number``
   **string**. An identifier for this transaction.

``uri``
   **string**.

Deprecated
~~~~~~~~~~

Create a Hold
-------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts/:account_id/holds

Request
~~~~~~~

``amount``
   *required* **integer**.

``customer_uri``
   *optional* **string**.

``appears_on_statement_as``
   *optional* **string**. Text that will appear on the buyer's statement. Characters that can be
   used are limited to:

   - ASCII letters (``a-z`` and ``A-Z``)
   - Digits (``0-9``)
   - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

   Any other characters will be rejected.

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``source_uri``
   *optional* **string**.


Body
^^^^

.. code:: javascript

   {
       "source_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "meta": {
           "id": "#12312123123"
       }, 
       "amount": 3421, 
       "description": "Something tasty"
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
     "_type": "hold", 
     "description": "Something tasty", 
     "expires_at": "2013-06-13T22:45:36.012654Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL6fYpQD4mU9SQhktFdcXkTM", 
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
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-06T22:45:36.122475Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6fYpQD4mU9SQhktFdcXkTM", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
       "card_type": "visa", 
       "is_valid": true, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:44:24.496765Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL857-311-5443", 
     "_uris": {}, 
     "debit": null
   }

Retrieve a Hold
---------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id

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
     "_type": "hold", 
     "description": "Something tasty", 
     "expires_at": "2013-06-13T22:45:37.220065Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL6hk6cQrvpfS4V4WF5OLGqP", 
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
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-06T22:45:37.320001Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6hk6cQrvpfS4V4WF5OLGqP", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
       "card_type": "visa", 
       "is_valid": true, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:44:24.496765Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL572-572-7300", 
     "_uris": {}, 
     "debit": null
   }

List all Holds
--------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/holds

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
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds?limit=4&offset=0", 
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
         "description": "Something tangy", 
         "_uris": {}, 
         "amount": 1322, 
         "created_at": "2013-06-06T22:45:40.368113Z", 
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
         "expires_at": "2013-06-13T22:45:40.237877Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6kK4S8oHGTshqCnQEYPMSG", 
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
         "transaction_number": "HL574-981-4534", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL6kK4S8oHGTshqCnQEYPMSG"
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
         "description": "Something spicy", 
         "_uris": {}, 
         "amount": 6754, 
         "created_at": "2013-06-06T22:45:39.683737Z", 
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
         "expires_at": "2013-06-13T22:45:39.539697Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6jYKSAuVZpuDMGf5Yy6A4y", 
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
         "transaction_number": "HL226-639-9494", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL6jYKSAuVZpuDMGf5Yy6A4y"
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
         "description": "Something sour", 
         "_uris": {}, 
         "amount": 3344, 
         "created_at": "2013-06-06T22:45:38.946713Z", 
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
         "expires_at": "2013-06-13T22:45:38.846415Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6j9gPudMQMLNJZIRevySU8", 
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
         "transaction_number": "HL472-010-4020", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL6j9gPudMQMLNJZIRevySU8"
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
         "description": "Something sweet", 
         "_uris": {}, 
         "amount": 1233, 
         "created_at": "2013-06-06T22:45:38.473338Z", 
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
         "expires_at": "2013-06-13T22:45:38.336497Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6iC35LtowVXQaqlqh7xoTK", 
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
         "transaction_number": "HL143-770-7545", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL6iC35LtowVXQaqlqh7xoTK"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds?limit=4&offset=0", 
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
     "limit": 4, 
     "offset": 0, 
     "total": 20, 
     "next_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds?limit=4&offset=4", 
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds?limit=4&offset=16"
   }

Update a Hold
-------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id

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
       "_type": "hold", 
       "fee": null, 
       "description": "Something really tasty", 
       "created_at": "2013-06-06T22:45:41.747192+00:00Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:45:41.618332+00:00Z", 
       "transaction_number": "HL400-338-2806", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "the-address": "123 Fake Street"
       }, 
       "debit": null, 
       "id": "HL6mifxRl362e9m2bIjMlibY"
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
     "_type": "hold", 
     "description": "Something really tasty", 
     "expires_at": "2013-06-13T22:45:43.109529Z", 
     "is_void": false, 
     "meta": {
       "the-address": "123 Fake Street"
     }, 
     "id": "HL6nXmhDeUXfyklapWH9aTJK", 
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
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-06T22:45:43.221408Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6nXmhDeUXfyklapWH9aTJK", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
       "card_type": "visa", 
       "is_valid": true, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:44:24.496765Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL538-801-9989", 
     "_uris": {}, 
     "debit": null
   }

Capture a Hold
--------------

Use ``hold_uri`` when `creating a debit <./debits.rst#create-a-debit>`_.

Request
~~~~~~~

Body
^^^^

.. code:: javascript

   {
       "hold_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6prOUwcKTbukuC7r3HXcca", 
       "description": null, 
       "source_uri": null, 
       "amount": null, 
       "merchant_uri": null, 
       "meta": {}, 
       "appears_on_statement_as": null, 
       "on_behalf_of_uri": null
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
     "status": "succeeded", 
     "_type": "debit", 
     "description": null, 
     "on_behalf_of": null, 
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "_type": "hold", 
       "fee": null, 
       "description": "Something sour", 
       "debit_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6qwzlUxAXDhbZs3ywXsjYI", 
       "created_at": "2013-06-06T22:45:44.546011Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:45:44.429460Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6prOUwcKTbukuC7r3HXcca", 
       "transaction_number": "HL783-754-3054", 
       "amount": 3344, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "HL6prOUwcKTbukuC7r3HXcca"
     }, 
     "id": "WD6qwzlUxAXDhbZs3ywXsjYI", 
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
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6qwzlUxAXDhbZs3ywXsjYI/refunds", 
     "amount": 3344, 
     "created_at": "2013-06-06T22:45:45.504691Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD6qwzlUxAXDhbZs3ywXsjYI", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
       "card_type": "visa", 
       "is_valid": true, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:44:24.496765Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W944-364-6524", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:45:45.217350Z"
   }

Void a Hold
------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id

Request
~~~~~~~

``is_void``
   *optional* **boolean**. Flag value, should be ``true`` or ``false``. Defaults to ``null``.

``appears_on_statement_as``
   *optional* **string**. Text that will appear on the buyer's statement. Characters that can be
   used are limited to:

   - ASCII letters (``a-z`` and ``A-Z``)
   - Digits (``0-9``)
   - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

   Any other characters will be rejected.


Body
^^^^

.. code:: javascript

   {
       "_type": "hold", 
       "fee": null, 
       "description": "Something sour", 
       "created_at": "2013-06-06T22:45:46.721284+00:00Z", 
       "is_void": true, 
       "expires_at": "2013-06-13T22:45:46.613495+00:00Z", 
       "transaction_number": "HL677-461-1458", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "reason": "Customer request"
       }, 
       "debit": null, 
       "id": "HL6rTpuSEXnLcMyl6wcfduSY"
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
     "_type": "hold", 
     "description": "Something sour", 
     "expires_at": "2013-06-13T22:45:48.318103Z", 
     "is_void": true, 
     "meta": {
       "reason": "Customer request"
     }, 
     "id": "HL6tOgoL4DqoqgPI15V8b9wA", 
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
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-06T22:45:48.425689Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL6tOgoL4DqoqgPI15V8b9wA", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
       "card_type": "visa", 
       "is_valid": true, 
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
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:44:24.496765Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL115-737-4333", 
     "_uris": {}, 
     "debit": null
   }

