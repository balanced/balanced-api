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

``customer``
   **string**. Customer receiving the refund.

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
       "debit_uri": "v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7jCV9LPA4Gdv4zybb0gQgm", 
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
     "amount": 1234, 
     "created_at": "2013-06-07T17:30:29.210681Z", 
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
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds/RF7nOZ0WvGbNUQDV44GnNHqM", 
     "transaction_number": "RF605-746-3496", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7mSduox6S5KoAS9xHOtDYu", 
       "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "created_at": "2013-06-07T17:30:28.346606Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7mQI8k8knIhHqq9EP8bBx0", 
       "status": "succeeded", 
       "transaction_number": "W586-878-5775", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7mQI8k8knIhHqq9EP8bBx0/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "appears_on_statement_as": "example.com", 
       "id": "WD7mQI8k8knIhHqq9EP8bBx0", 
       "available_at": "2013-06-07T17:30:28.062826Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF7nOZ0WvGbNUQDV44GnNHqM"
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
     "amount": 1254, 
     "created_at": "2013-06-07T17:30:32.156331Z", 
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
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds/RF7r8ovg2KpJg9iOBSrsX9Oi", 
     "transaction_number": "RF196-243-0592", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7qiYQelJ4VXX5eiREJ1Oys", 
       "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "created_at": "2013-06-07T17:30:31.384934Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7qgKklqOmwJsRURwfg4cTC", 
       "status": "succeeded", 
       "transaction_number": "W130-453-9022", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7qgKklqOmwJsRURwfg4cTC/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "appears_on_statement_as": "example.com", 
       "id": "WD7qgKklqOmwJsRURwfg4cTC", 
       "available_at": "2013-06-07T17:30:31.066421Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF7r8ovg2KpJg9iOBSrsX9Oi"
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
     "first_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds?limit=2&offset=0", 
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
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-07T17:30:36.993735Z", 
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
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds/RF7wzOOYfXRtojTHnnKPr46j", 
         "transaction_number": "RF566-056-0691", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7vOBYfqGOTLDyVKOGlgvbV", 
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
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7vNjhzyIXiAk9BX1J1Gb1B", 
           "id": "WD7vNjhzyIXiAk9BX1J1Gb1B", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7vNjhzyIXiAk9BX1J1Gb1B/refunds", 
           "transaction_number": "W950-087-5879", 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-07T17:30:36.298098Z", 
           "available_at": "2013-06-07T17:30:36.059778Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF7wzOOYfXRtojTHnnKPr46j"
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
         "amount": 1254, 
         "created_at": "2013-06-07T17:30:35.169906Z", 
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
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds/RF7uwDqFd3VPvjK7MxfgZi2P", 
         "transaction_number": "RF409-914-3080", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7txBLYHpcFHKj5BjWplxbi", 
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
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7tvQy9uDcRpEsjODJVsiRW", 
           "id": "WD7tvQy9uDcRpEsjODJVsiRW", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7tvQy9uDcRpEsjODJVsiRW/refunds", 
           "transaction_number": "W798-064-5254", 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-07T17:30:34.268759Z", 
           "available_at": "2013-06-07T17:30:33.755812Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF7uwDqFd3VPvjK7MxfgZi2P"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds?limit=2&offset=6"
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
       "created_at": "2013-06-07T17:30:39.638878+00:00Z", 
       "transaction_number": "RF509-499-9687", 
       "amount": 1254, 
       "_uris": {}, 
       "meta": {
           "my-id": "0987654321"
       }, 
       "appears_on_statement_as": "example.com", 
       "id": "RF7zyafVlglBj6pnzoVczvCy"
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
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds/RF7CfFS0ASJqZsaqYDx9SaK4", 
     "transaction_number": "RF641-675-3909", 
     "_uris": {}, 
     "meta": {
       "my-id": "0987654321"
     }, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL7BrKELfrA9Leh0Yawyidll", 
       "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "created_at": "2013-06-07T17:30:41.303424Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7Bqln2kU2z4YZMfDjxjiML", 
       "status": "succeeded", 
       "transaction_number": "W432-527-0260", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD7Bqln2kU2z4YZMfDjxjiML/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "appears_on_statement_as": "example.com", 
       "id": "WD7Bqln2kU2z4YZMfDjxjiML", 
       "available_at": "2013-06-07T17:30:41.100713Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF7CfFS0ASJqZsaqYDx9SaK4"
   }

