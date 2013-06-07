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

``customer``
   **string**. The customer against which this hold was created.

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
       "source_uri": "v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
     "expires_at": "2013-06-14T17:30:08.659984Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL70Q9QnQXYP1HGBrlVdNClW", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-07T17:30:08.778112Z", 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL70Q9QnQXYP1HGBrlVdNClW", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-07T17:29:07.845193Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL645-197-2439", 
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
     "expires_at": "2013-06-14T17:30:09.969024Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL72iqz1kMTSBn3ZlVwaxWn8", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-07T17:30:10.072517Z", 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL72iqz1kMTSBn3ZlVwaxWn8", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-07T17:29:07.845193Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL157-576-0662", 
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
     "first_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds?limit=4&offset=0", 
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something tangy", 
         "_uris": {}, 
         "amount": 1322, 
         "created_at": "2013-06-07T17:30:13.657872Z", 
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
         "expires_at": "2013-06-14T17:30:13.498427Z", 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL76krHHlrxdXfo039eurbvA", 
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
         "transaction_number": "HL545-476-4950", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL76krHHlrxdXfo039eurbvA"
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
         "description": "Something spicy", 
         "_uris": {}, 
         "amount": 6754, 
         "created_at": "2013-06-07T17:30:12.967405Z", 
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
         "expires_at": "2013-06-14T17:30:12.848718Z", 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL75yiPamBaelxKxr5I1RtMk", 
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
         "transaction_number": "HL535-788-3931", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL75yiPamBaelxKxr5I1RtMk"
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
         "description": "Something sour", 
         "_uris": {}, 
         "amount": 3344, 
         "created_at": "2013-06-07T17:30:12.381518Z", 
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
         "expires_at": "2013-06-14T17:30:12.160723Z", 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL74TBfmJHtsWJRxpKqgKYZy", 
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
         "transaction_number": "HL767-991-9735", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL74TBfmJHtsWJRxpKqgKYZy"
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
         "description": "Something sweet", 
         "_uris": {}, 
         "amount": 1233, 
         "created_at": "2013-06-07T17:30:11.706197Z", 
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
         "expires_at": "2013-06-14T17:30:11.561273Z", 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL747NaHNhXzY1P0arkpIyfc", 
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
         "transaction_number": "HL735-136-4104", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL747NaHNhXzY1P0arkpIyfc"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds?limit=4&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds?limit=4&offset=4", 
     "last_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds?limit=4&offset=16"
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
       "created_at": "2013-06-07T17:30:15.104962+00:00Z", 
       "is_void": false, 
       "expires_at": "2013-06-14T17:30:14.978696+00:00Z", 
       "transaction_number": "HL844-278-8641", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "the-address": "123 Fake Street"
       }, 
       "debit": null, 
       "id": "HL77Xlrp53QNIbwXLVWnzuv8"
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
     "expires_at": "2013-06-14T17:30:16.344208Z", 
     "is_void": false, 
     "meta": {
       "the-address": "123 Fake Street"
     }, 
     "id": "HL79uXiuQWztBdmFQa4rpz5C", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-07T17:30:16.475855Z", 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL79uXiuQWztBdmFQa4rpz5C", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-07T17:29:07.845193Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL052-754-7283", 
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
       "hold_uri": "v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7b5qNCLAV513rV9PsO3cab", 
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
       "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "_type": "hold", 
       "fee": null, 
       "description": "Something sour", 
       "debit_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7bZBoHpr65ZodwP1pKK6YG", 
       "created_at": "2013-06-07T17:30:17.886628Z", 
       "is_void": false, 
       "expires_at": "2013-06-14T17:30:17.763852Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7b5qNCLAV513rV9PsO3cab", 
       "transaction_number": "HL110-518-6809", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "HL7b5qNCLAV513rV9PsO3cab"
     }, 
     "id": "WD7bZBoHpr65ZodwP1pKK6YG", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7bZBoHpr65ZodwP1pKK6YG/refunds", 
     "amount": 3344, 
     "created_at": "2013-06-07T17:30:18.693686Z", 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7bZBoHpr65ZodwP1pKK6YG", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-07T17:29:07.845193Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W577-613-5365", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-07T17:30:18.437685Z"
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
       "created_at": "2013-06-07T17:30:20.059281+00:00Z", 
       "is_void": true, 
       "expires_at": "2013-06-14T17:30:19.923009+00:00Z", 
       "transaction_number": "HL960-109-2186", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "reason": "Customer request"
       }, 
       "debit": null, 
       "id": "HL7dwgEkF3yWldB30EgYGvQy"
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
     "expires_at": "2013-06-14T17:30:21.895846Z", 
     "is_void": true, 
     "meta": {
       "reason": "Customer request"
     }, 
     "id": "HL7fL7ngznkHHrnbBlkIbTKO", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-07T17:30:22.042343Z", 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7fL7ngznkHHrnbBlkIbTKO", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-07T17:29:07.845193Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL273-680-5335", 
     "_uris": {}, 
     "debit": null
   }

