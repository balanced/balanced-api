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
       "source_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
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
     "expires_at": "2013-06-13T23:16:43.822440Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL1brEMNCHICpQx8cQREewSA", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-06T23:16:43.959572Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1brEMNCHICpQx8cQREewSA", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "CC6d1n4vID0GHQvPo8To1eU", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:15:44.176785Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL340-084-0724", 
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
     "expires_at": "2013-06-13T23:16:44.978170Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL1cIwI72vCOzArkdqJc6RMb", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-06T23:16:45.084870Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1cIwI72vCOzArkdqJc6RMb", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "CC6d1n4vID0GHQvPo8To1eU", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:15:44.176785Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL244-537-4179", 
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
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds?limit=4&offset=0", 
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something tangy", 
         "_uris": {}, 
         "amount": 1322, 
         "created_at": "2013-06-06T23:16:47.941396Z", 
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
         "expires_at": "2013-06-13T23:16:47.853019Z", 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1fVvvUrydrwwIv4vExAnUQ", 
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
         "transaction_number": "HL176-867-2064", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL1fVvvUrydrwwIv4vExAnUQ"
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
         "description": "Something spicy", 
         "_uris": {}, 
         "amount": 6754, 
         "created_at": "2013-06-06T23:16:47.429113Z", 
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
         "expires_at": "2013-06-13T23:16:47.314423Z", 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1flO6vxe3VEqEg5kpZaUNY", 
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
         "transaction_number": "HL845-598-4583", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL1flO6vxe3VEqEg5kpZaUNY"
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
         "description": "Something sour", 
         "_uris": {}, 
         "amount": 3344, 
         "created_at": "2013-06-06T23:16:46.910600Z", 
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
         "expires_at": "2013-06-13T23:16:46.756689Z", 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1eLgF5qPX0yO5gvkT8UMLA", 
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
         "transaction_number": "HL229-015-6344", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL1eLgF5qPX0yO5gvkT8UMLA"
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
         "description": "Something sweet", 
         "_uris": {}, 
         "amount": 1233, 
         "created_at": "2013-06-06T23:16:46.332262Z", 
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
         "expires_at": "2013-06-13T23:16:46.193306Z", 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1e76OU9m6JqsKOuc6XZiMU", 
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
         "transaction_number": "HL386-864-5249", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL1e76OU9m6JqsKOuc6XZiMU"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds?limit=4&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds?limit=4&offset=4", 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds?limit=4&offset=16"
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
       "created_at": "2013-06-06T23:16:49.158251+00:00Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T23:16:49.062742+00:00Z", 
       "transaction_number": "HL426-293-8723", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "the-address": "123 Fake Street"
       }, 
       "debit": null, 
       "id": "HL1himTh3Pc1DvtcFeRiyroA"
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
     "expires_at": "2013-06-13T23:16:50.172778Z", 
     "is_void": false, 
     "meta": {
       "the-address": "123 Fake Street"
     }, 
     "id": "HL1iy7tOS2BjCYyOIFhSrIuQ", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-06T23:16:50.273267Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1iy7tOS2BjCYyOIFhSrIuQ", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "CC6d1n4vID0GHQvPo8To1eU", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:15:44.176785Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL946-451-8639", 
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
       "hold_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1k0SwQH5rFsqW3JL6pznmE", 
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
       "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "_type": "hold", 
       "fee": null, 
       "description": "Something sour", 
       "debit_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1kWACGhOYntCojB0Xip66A", 
       "created_at": "2013-06-06T23:16:51.574787Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T23:16:51.475212Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1k0SwQH5rFsqW3JL6pznmE", 
       "transaction_number": "HL878-082-2226", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "HL1k0SwQH5rFsqW3JL6pznmE"
     }, 
     "id": "WD1kWACGhOYntCojB0Xip66A", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1kWACGhOYntCojB0Xip66A/refunds", 
     "amount": 3344, 
     "created_at": "2013-06-06T23:16:52.405165Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1kWACGhOYntCojB0Xip66A", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "CC6d1n4vID0GHQvPo8To1eU", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:15:44.176785Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W130-572-5369", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:16:52.098668Z"
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
       "created_at": "2013-06-06T23:16:53.554528+00:00Z", 
       "is_void": true, 
       "expires_at": "2013-06-13T23:16:53.426929+00:00Z", 
       "transaction_number": "HL395-102-3239", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "reason": "Customer request"
       }, 
       "debit": null, 
       "id": "HL1mf5ULExgn3IzFfGZbHC4D"
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
     "expires_at": "2013-06-13T23:16:55.222027Z", 
     "is_void": true, 
     "meta": {
       "reason": "Customer request"
     }, 
     "id": "HL1ofRMZGeK4FfX0G8bl1HiU", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-06T23:16:55.348905Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1ofRMZGeK4FfX0G8bl1HiU", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "CC6d1n4vID0GHQvPo8To1eU", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:15:44.176785Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL872-997-1232", 
     "_uris": {}, 
     "debit": null
   }

