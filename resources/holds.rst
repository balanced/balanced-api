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
       "source_uri": "v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
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
     "expires_at": "2013-06-13T20:38:47.294920Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HLGmx9AiSPZqYuhgjZI5Wdk", 
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
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-06T20:38:47.404277Z", 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLGmx9AiSPZqYuhgjZI5Wdk", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "CC7ci8uopveqNjOYwe4hgB2M", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T20:37:37.036245Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL607-851-8221", 
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
     "expires_at": "2013-06-13T20:38:48.401230Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HLHBCoczBLOt8KwLJ7CdI5s", 
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
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-06T20:38:48.500426Z", 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLHBCoczBLOt8KwLJ7CdI5s", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "CC7ci8uopveqNjOYwe4hgB2M", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T20:37:37.036245Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL151-342-1051", 
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
     "first_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds?limit=4&offset=0", 
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something tangy", 
         "_uris": {}, 
         "amount": 1322, 
         "created_at": "2013-06-06T20:38:51.654273Z", 
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
         "expires_at": "2013-06-13T20:38:51.367792Z", 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLL9qcxhHD6Oamdi9yFAHba", 
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
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T20:37:37.036245Z", 
           "id": "CC7ci8uopveqNjOYwe4hgB2M", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL993-181-4498", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HLL9qcxhHD6Oamdi9yFAHba"
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something spicy", 
         "_uris": {}, 
         "amount": 6754, 
         "created_at": "2013-06-06T20:38:50.881253Z", 
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
         "expires_at": "2013-06-13T20:38:50.773377Z", 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLKhTyiRwnoPxfU3I4xfuqj", 
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
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T20:37:37.036245Z", 
           "id": "CC7ci8uopveqNjOYwe4hgB2M", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL688-450-6928", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HLKhTyiRwnoPxfU3I4xfuqj"
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something sour", 
         "_uris": {}, 
         "amount": 3344, 
         "created_at": "2013-06-06T20:38:50.392712Z", 
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
         "expires_at": "2013-06-13T20:38:50.218504Z", 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLJJpFN0w0uhZs7mfQSwDc4", 
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
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T20:37:37.036245Z", 
           "id": "CC7ci8uopveqNjOYwe4hgB2M", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL065-834-3997", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HLJJpFN0w0uhZs7mfQSwDc4"
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something sweet", 
         "_uris": {}, 
         "amount": 1233, 
         "created_at": "2013-06-06T20:38:49.657002Z", 
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
         "expires_at": "2013-06-13T20:38:49.515599Z", 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLITNqbVObCgmLEbFj5cJM2", 
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
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T20:37:37.036245Z", 
           "id": "CC7ci8uopveqNjOYwe4hgB2M", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL026-744-5698", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HLITNqbVObCgmLEbFj5cJM2"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds?limit=4&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds?limit=4&offset=4", 
     "last_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds?limit=4&offset=16"
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
       "created_at": "2013-06-06T20:38:52.947258+00:00Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T20:38:52.832019+00:00Z", 
       "transaction_number": "HL149-229-4646", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "the-address": "123 Fake Street"
       }, 
       "debit": null, 
       "id": "HLMBHGlLfHtKlvbpL3pV50u"
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
     "expires_at": "2013-06-13T20:38:55.329696Z", 
     "is_void": false, 
     "meta": {
       "the-address": "123 Fake Street"
     }, 
     "id": "HLPooIQn6AQiWrxxidge9Z0", 
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
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-06T20:38:55.423679Z", 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLPooIQn6AQiWrxxidge9Z0", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "CC7ci8uopveqNjOYwe4hgB2M", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T20:37:37.036245Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL610-979-0195", 
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
       "hold_uri": "v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLQIfXbjIodZ42B4tPnPAzo", 
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
       "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "_type": "hold", 
       "fee": null, 
       "description": "Something sour", 
       "debit_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDRNliBW6h7BkoOKfJyOaPZ", 
       "created_at": "2013-06-06T20:38:56.597568Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T20:38:56.503009Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLQIfXbjIodZ42B4tPnPAzo", 
       "transaction_number": "HL643-954-0927", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "HLQIfXbjIodZ42B4tPnPAzo"
     }, 
     "id": "WDRNliBW6h7BkoOKfJyOaPZ", 
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
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDRNliBW6h7BkoOKfJyOaPZ/refunds", 
     "amount": 3344, 
     "created_at": "2013-06-06T20:38:57.556045Z", 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDRNliBW6h7BkoOKfJyOaPZ", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "CC7ci8uopveqNjOYwe4hgB2M", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T20:37:37.036245Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W223-724-3222", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T20:38:57.263392Z"
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
       "created_at": "2013-06-06T20:38:59.008742+00:00Z", 
       "is_void": true, 
       "expires_at": "2013-06-13T20:38:58.575921+00:00Z", 
       "transaction_number": "HL863-450-6221", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "reason": "Customer request"
       }, 
       "debit": null, 
       "id": "HLTqEHKpRdHLqHzpPlUQoDt"
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
     "expires_at": "2013-06-13T20:39:00.531887Z", 
     "is_void": true, 
     "meta": {
       "reason": "Customer request"
     }, 
     "id": "HLVgjHsJkdOdXvOc9oq3VIr", 
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
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-06T20:39:00.638876Z", 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLVgjHsJkdOdXvOc9oq3VIr", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "CC7ci8uopveqNjOYwe4hgB2M", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T20:37:37.036245Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL964-554-1464", 
     "_uris": {}, 
     "debit": null
   }

