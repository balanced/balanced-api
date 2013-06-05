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
       "source_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
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
     "expires_at": "2013-06-12T02:32:23.360335Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL1ckLtWmW94QhwVyGV2dV7y", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-05T02:32:23.474291Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1ckLtWmW94QhwVyGV2dV7y", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-05T02:31:01.301776Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL106-627-8830", 
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
     "expires_at": "2013-06-12T02:32:24.523804Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL1dDwMCYIx7L8chNAQ97Mm3", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-05T02:32:24.634378Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1dDwMCYIx7L8chNAQ97Mm3", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-05T02:31:01.301776Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL605-737-8227", 
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
     "first_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds?limit=4&offset=0", 
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something tangy", 
         "_uris": {}, 
         "amount": 1322, 
         "created_at": "2013-06-05T02:32:28.184665Z", 
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
         "expires_at": "2013-06-12T02:32:28.007697Z", 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1hDcnPIF0cRAWoKXqoeJkc", 
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
         "transaction_number": "HL329-880-1862", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL1hDcnPIF0cRAWoKXqoeJkc"
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
         "description": "Something spicy", 
         "_uris": {}, 
         "amount": 6754, 
         "created_at": "2013-06-05T02:32:27.395083Z", 
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
         "expires_at": "2013-06-12T02:32:27.285461Z", 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1gKchK0pHkmr5KM8Nbui82", 
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
         "transaction_number": "HL597-730-7674", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL1gKchK0pHkmr5KM8Nbui82"
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
         "description": "Something sour", 
         "_uris": {}, 
         "amount": 3344, 
         "created_at": "2013-06-05T02:32:26.535337Z", 
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
         "expires_at": "2013-06-12T02:32:26.326878Z", 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1fLDPdAbilPGKY5hf8hsyy", 
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
         "transaction_number": "HL771-251-2462", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL1fLDPdAbilPGKY5hf8hsyy"
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
         "description": "Something sweet", 
         "_uris": {}, 
         "amount": 1233, 
         "created_at": "2013-06-05T02:32:25.738770Z", 
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
         "expires_at": "2013-06-12T02:32:25.622256Z", 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1eSHmyH7LQsoEHEuY1EuLC", 
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
         "transaction_number": "HL615-815-8803", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL1eSHmyH7LQsoEHEuY1EuLC"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds?limit=4&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds?limit=4&offset=4", 
     "last_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds?limit=4&offset=16"
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
       "created_at": "2013-06-05T02:32:29.928045+00:00Z", 
       "is_void": false, 
       "expires_at": "2013-06-12T02:32:29.805057+00:00Z", 
       "transaction_number": "HL601-150-1809", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "the-address": "123 Fake Street"
       }, 
       "debit": null, 
       "id": "HL1jAdZYH0zC1SbmDZ5UkrxY"
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
     "expires_at": "2013-06-12T02:32:31.493060Z", 
     "is_void": false, 
     "meta": {
       "the-address": "123 Fake Street"
     }, 
     "id": "HL1lxCzu75ydZRGjKXNDybsQ", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-05T02:32:31.661219Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1lxCzu75ydZRGjKXNDybsQ", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-05T02:31:01.301776Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL373-083-5429", 
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
       "hold_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1n0cwqd8gD6K1mUcNPEibe", 
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
       "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "_type": "hold", 
       "fee": null, 
       "description": "Something sour", 
       "debit_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1nU3K5bhuKvD3bOnlFV3qL", 
       "created_at": "2013-06-05T02:32:32.959270Z", 
       "is_void": false, 
       "expires_at": "2013-06-12T02:32:32.859518Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1n0cwqd8gD6K1mUcNPEibe", 
       "transaction_number": "HL962-605-8748", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "HL1n0cwqd8gD6K1mUcNPEibe"
     }, 
     "id": "WD1nU3K5bhuKvD3bOnlFV3qL", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1nU3K5bhuKvD3bOnlFV3qL/refunds", 
     "amount": 3344, 
     "created_at": "2013-06-05T02:32:33.762577Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WD1nU3K5bhuKvD3bOnlFV3qL", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-05T02:31:01.301776Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W680-091-1916", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-05T02:32:33.489727Z"
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
       "created_at": "2013-06-05T02:32:35.430838+00:00Z", 
       "is_void": true, 
       "expires_at": "2013-06-12T02:32:35.305837+00:00Z", 
       "transaction_number": "HL556-141-8612", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "reason": "Customer request"
       }, 
       "debit": null, 
       "id": "HL1pLXak1JWHAKul1RyDGmzQ"
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
     "expires_at": "2013-06-12T02:32:37.159595Z", 
     "is_void": true, 
     "meta": {
       "reason": "Customer request"
     }, 
     "id": "HL1rSjb9ig3SfjtkUDSzG94I", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-05T02:32:37.292553Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HL1rSjb9ig3SfjtkUDSzG94I", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-05T02:31:01.301776Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL133-156-6646", 
     "_uris": {}, 
     "debit": null
   }

