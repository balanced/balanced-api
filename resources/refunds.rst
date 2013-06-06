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
       "debit_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1r3NLdZLWGqu3ZIKSgbTzs", 
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
     "amount": 1234, 
     "created_at": "2013-06-06T23:17:01.121328Z", 
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
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds/RF1uKMxlHz72LtrWydxweh67", 
     "transaction_number": "RF682-394-2814", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1tQTYAKBfgUSOZQXW9sR1J", 
       "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "created_at": "2013-06-06T23:17:00.285673Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1tOwhTGZ5Q1uFVVXcIO7qn", 
       "status": "succeeded", 
       "transaction_number": "W051-400-9787", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1tOwhTGZ5Q1uFVVXcIO7qn/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "appears_on_statement_as": "example.com", 
       "id": "WD1tOwhTGZ5Q1uFVVXcIO7qn", 
       "available_at": "2013-06-06T23:17:00.051080Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF1uKMxlHz72LtrWydxweh67"
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
     "amount": 1254, 
     "created_at": "2013-06-06T23:17:03.825927Z", 
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
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds/RF1xNoBiurkJKZJcCpHRm8Ev", 
     "transaction_number": "RF763-034-9657", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1x4opchILzgqf4pz9YjFTN", 
       "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "created_at": "2013-06-06T23:17:03.167560Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1x3tVCsnGgIGiGax4Req9V", 
       "status": "succeeded", 
       "transaction_number": "W746-203-4598", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1x3tVCsnGgIGiGax4Req9V/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "appears_on_statement_as": "example.com", 
       "id": "WD1x3tVCsnGgIGiGax4Req9V", 
       "available_at": "2013-06-06T23:17:02.873975Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF1xNoBiurkJKZJcCpHRm8Ev"
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
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds?limit=2&offset=0", 
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
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T23:17:07.831912Z", 
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
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds/RF1Ci9YHUtrYCW0MpLckK7ci", 
         "transaction_number": "RF744-378-7094", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1Bw1op2zo55IN90p6KaYwq", 
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
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1BuewrSQKJGQ2sebkYAgEa", 
           "id": "WD1BuewrSQKJGQ2sebkYAgEa", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1BuewrSQKJGQ2sebkYAgEa/refunds", 
           "transaction_number": "W406-438-3631", 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:17:07.110297Z", 
           "available_at": "2013-06-06T23:17:06.910136Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF1Ci9YHUtrYCW0MpLckK7ci"
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
         "amount": 1254, 
         "created_at": "2013-06-06T23:17:06.008421Z", 
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
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds/RF1AfACcaoMeLoa7A25ttRo3", 
         "transaction_number": "RF945-873-8752", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1zwj2fMCXWfkQ08ycLnKrI", 
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
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1zt39vSRb8THUbpHfvPbUO", 
           "id": "WD1zt39vSRb8THUbpHfvPbUO", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1zt39vSRb8THUbpHfvPbUO/refunds", 
           "transaction_number": "W144-501-2013", 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:17:05.320806Z", 
           "available_at": "2013-06-06T23:17:05.106835Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF1AfACcaoMeLoa7A25ttRo3"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds?limit=2&offset=6"
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
       "created_at": "2013-06-06T23:17:10.477015+00:00Z", 
       "transaction_number": "RF688-455-5745", 
       "amount": 1254, 
       "_uris": {}, 
       "meta": {
           "my-id": "0987654321"
       }, 
       "appears_on_statement_as": "example.com", 
       "id": "RF1FhcbvFdbVuGYTQKqntEBh"
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
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds/RF1HXOP1YXYrHMPig6RkWiwn", 
     "transaction_number": "RF434-341-5964", 
     "_uris": {}, 
     "meta": {
       "my-id": "0987654321"
     }, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HL1Hbt6EjR0u84VoK8qYldAc", 
       "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "created_at": "2013-06-06T23:17:12.160932Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1HaoXHKEgns47wamm5Q5X2", 
       "status": "succeeded", 
       "transaction_number": "W401-555-7796", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WD1HaoXHKEgns47wamm5Q5X2/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "appears_on_statement_as": "example.com", 
       "id": "WD1HaoXHKEgns47wamm5Q5X2", 
       "available_at": "2013-06-06T23:17:11.980158Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF1HXOP1YXYrHMPig6RkWiwn"
   }

