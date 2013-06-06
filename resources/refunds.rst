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
       "debit_uri": "v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDYuyQElBl6QdjbrUxkqEMo", 
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
       "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
       "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
       "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:36:56.751062Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
       "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
       "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1234, 
     "created_at": "2013-06-06T20:39:06.635274Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
       "created_at": "2013-06-06T20:36:56.502056Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
       "email_address": null, 
       "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds/RF120d61epwskWNk7xXC1rMm", 
     "transaction_number": "RF697-940-4324", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HL116NNb2pRRbFnXh0XLQ0CI", 
       "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "created_at": "2013-06-06T20:39:05.813502Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD114Moir7NNS9qbGEhp37qg", 
       "status": "succeeded", 
       "transaction_number": "W140-648-7273", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD114Moir7NNS9qbGEhp37qg/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "appears_on_statement_as": "example.com", 
       "id": "WD114Moir7NNS9qbGEhp37qg", 
       "available_at": "2013-06-06T20:39:05.550404Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF120d61epwskWNk7xXC1rMm"
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
       "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
       "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
       "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:36:56.751062Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
       "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
       "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T20:39:09.091979Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
       "created_at": "2013-06-06T20:36:56.502056Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
       "email_address": null, 
       "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds/RF14LMrLsbIPek1uYkzTyNf9", 
     "transaction_number": "RF294-294-6066", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HL13Y9vzRpRPiNmfxNe5gPKq", 
       "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "created_at": "2013-06-06T20:39:08.359391Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD13WqFrSWhiiEFT3YCjmQQO", 
       "status": "succeeded", 
       "transaction_number": "W570-695-1598", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD13WqFrSWhiiEFT3YCjmQQO/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "appears_on_statement_as": "example.com", 
       "id": "WD13WqFrSWhiiEFT3YCjmQQO", 
       "available_at": "2013-06-06T20:39:08.112677Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF14LMrLsbIPek1uYkzTyNf9"
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
     "first_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
           "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
           "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T20:36:56.751062Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
           "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
           "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T20:39:13.664749Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T20:36:56.502056Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
           "email_address": null, 
           "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds/RF19UewG7qGdRnZPbHsGFO9q", 
         "transaction_number": "RF786-994-2750", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HL1923XvLhZ72DDsrDFpYOhq", 
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
           "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD191AlSQe8MnkI7iNj4jCQo", 
           "id": "WD191AlSQe8MnkI7iNj4jCQo", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD191AlSQe8MnkI7iNj4jCQo/refunds", 
           "transaction_number": "W723-821-3601", 
           "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T20:39:12.880755Z", 
           "available_at": "2013-06-06T20:39:12.551826Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF19UewG7qGdRnZPbHsGFO9q"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
           "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
           "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T20:36:56.751062Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
           "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
           "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T20:39:11.639722Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T20:36:56.502056Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
           "email_address": null, 
           "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds/RF17DbCBI8p7IQiqmaslWfBE", 
         "transaction_number": "RF319-747-4846", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HL16JtktA6v8Ka1c5S31HZws", 
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
           "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD16HWE73H3TqtDK3UJHBCFW", 
           "id": "WD16HWE73H3TqtDK3UJHBCFW", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD16HWE73H3TqtDK3UJHBCFW/refunds", 
           "transaction_number": "W251-304-2203", 
           "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T20:39:10.821229Z", 
           "available_at": "2013-06-06T20:39:10.462125Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF17DbCBI8p7IQiqmaslWfBE"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds?limit=2&offset=6"
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
       "created_at": "2013-06-06T20:39:16.593781+00:00Z", 
       "transaction_number": "RF353-922-8834", 
       "amount": 1254, 
       "_uris": {}, 
       "meta": {
           "my-id": "0987654321"
       }, 
       "appears_on_statement_as": "example.com", 
       "id": "RF1dcvKkhkIOsnrJvm9CJDqg"
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
       "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
       "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
       "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:36:56.751062Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
       "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
       "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": "my new description", 
     "amount": 1254, 
     "created_at": "2013-06-06T20:39:19.161249Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
       "created_at": "2013-06-06T20:36:56.502056Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
       "email_address": null, 
       "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds/RF1g5eciD7SUh6Jk6bnuIK6q", 
     "transaction_number": "RF277-812-9903", 
     "_uris": {}, 
     "meta": {
       "my-id": "0987654321"
     }, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HL1fgJB2mVGG8FWEaoBe3UZc", 
       "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "created_at": "2013-06-06T20:39:18.420602Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD1ffXDwy4pmCG1GAVBFI8AO", 
       "status": "succeeded", 
       "transaction_number": "W250-162-4167", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD1ffXDwy4pmCG1GAVBFI8AO/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "appears_on_statement_as": "example.com", 
       "id": "WD1ffXDwy4pmCG1GAVBFI8AO", 
       "available_at": "2013-06-06T20:39:18.164974Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF1g5eciD7SUh6Jk6bnuIK6q"
   }

