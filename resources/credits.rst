Credits
=======

- `Credit a New Bank Account`_
- `Credit an Existing Bank Account`_
- `Credit a Merchant`_
- `Retrieve a Credit`_
- `List All Credits`_
- `List All Credits for a Bank Account`_
- `List All Credits for a Merchant`_

Fields
------

``account_email_address``
   **object**.

``account_name``
   **object**.

``amount``
   **integer**. Amount of the credit.

``appears_on_statement_as``
   **string**. The text that will appear on the merchant's bank statement.

``bank_account``
   **object**. `Bank Account <./bank_accounts.rst>`_.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_.

``description``
   **string**.

``id``
   **string**.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``status``
   **string**. One of ``pending``, ``paid``, ``failed``.

``uri``
   **string**.

Deprecated
~~~~~~~~~~

``destination``
   **object**. The funding destination for this credit (i.e., a bank account).

``state``
   **string**. Use ``status`` instead.

Credit a New Bank Account
-------------------------

.. code::


   POST /v1/credits

Request
~~~~~~~

``amount``
   *required* **integer**. USD cents. You must have ``amount`` funds transferred to cover the
   credit.

``bank_account``

   .. cssclass:: nested1

   *required* **object**.

      `BankAccount <./bank_accounts.rst>`_.


``description``
   *optional* **string** or **null**. Defaults to ``null``.

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
       "destination_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "amount": 1254, 
       "meta": {}, 
       "description": "Something descriptive"
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
     "status": "paid", 
     "_type": "credit", 
     "description": "Something descriptive", 
     "transaction_number": "CR720-265-7831", 
     "_uris": {}, 
     "id": "CRauxSjc35x83LJJKgOyfay", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:25.550266Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "verifications_uri": {
           "_type": "page", 
           "key": "verifications"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }, 
         "credits_uri": {
           "_type": "page", 
           "key": "credits"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
       "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
       "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
       "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:15:22.148564Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
       "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
       "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
       "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
       "ssn_last4": null, 
       "ein": "393483992"
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
       "created_at": "2013-06-06T23:15:21.686412Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
       "email_address": null, 
       "id": "AC7tYY6I2HACOAiftgFo4oCr", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T23:15:47.984468Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:25.550266Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "verifications_uri": {
           "_type": "page", 
           "key": "verifications"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }, 
         "credits_uri": {
           "_type": "page", 
           "key": "credits"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
       "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CRauxSjc35x83LJJKgOyfay", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:15:47.781009Z"
   }

Credit an Existing Bank Account
-------------------------------

.. code::


   POST /v1/bank_accounts/:bank_account_id/credits

Request
~~~~~~~

``amount``
   *required* **integer**. USD cents. You must have ``amount`` funds transferred to cover the
   credit.

``description``
   *optional* **string** or **null**. Defaults to ``null``.

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
       "destination_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "amount": 1254, 
       "meta": {}, 
       "description": "Something descriptive"
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
     "status": "paid", 
     "_type": "credit", 
     "description": "Something descriptive", 
     "transaction_number": "CR453-621-3055", 
     "_uris": {}, 
     "id": "CRdOd5gtDFlgBlyJk7Zs5PG", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:25.550266Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "verifications_uri": {
           "_type": "page", 
           "key": "verifications"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }, 
         "credits_uri": {
           "_type": "page", 
           "key": "credits"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
       "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
       "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
       "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:15:22.148564Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
       "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
       "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
       "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
       "ssn_last4": null, 
       "ein": "393483992"
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
       "created_at": "2013-06-06T23:15:21.686412Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
       "email_address": null, 
       "id": "AC7tYY6I2HACOAiftgFo4oCr", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T23:15:50.936665Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:25.550266Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "verifications_uri": {
           "_type": "page", 
           "key": "verifications"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }, 
         "credits_uri": {
           "_type": "page", 
           "key": "credits"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
       "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CRdOd5gtDFlgBlyJk7Zs5PG", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:15:50.832013Z"
   }

Credit a Merchant
-----------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts/:account_id/credits

Request
~~~~~~~

``amount``
   *required* **integer**. USD cents.

``description``
   *optional* **string** or **null**. Defaults to ``null``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``appears_on_statement_as``
   *optional* **string**. Text that will appear on the buyer's statement. Characters that can be
   used are limited to:

   - ASCII letters (``a-z`` and ``A-Z``)
   - Digits (``0-9``)
   - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

   Any other characters will be rejected.

``destination_uri``
   *optional* **string**.


Body
^^^^

.. code:: javascript

   {
       "description": null, 
       "debit_uri": null, 
       "appears_on_statement_as": null, 
       "amount": 1243, 
       "meta": {}, 
       "destination_uri": null
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
     "status": "paid", 
     "_type": "credit", 
     "description": null, 
     "transaction_number": "CR114-677-7189", 
     "_uris": {}, 
     "id": "CRg6fpiz6Wlhe6iHw1mfx9K", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:25.550266Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "verifications_uri": {
           "_type": "page", 
           "key": "verifications"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }, 
         "credits_uri": {
           "_type": "page", 
           "key": "credits"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
       "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
       "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
       "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:15:22.148564Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
       "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
       "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
       "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
       "ssn_last4": null, 
       "ein": "393483992"
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
       "created_at": "2013-06-06T23:15:21.686412Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
       "email_address": null, 
       "id": "AC7tYY6I2HACOAiftgFo4oCr", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
     }, 
     "fee": null, 
     "amount": 1243, 
     "created_at": "2013-06-06T23:15:52.973497Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:25.550266Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "verifications_uri": {
           "_type": "page", 
           "key": "verifications"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }, 
         "credits_uri": {
           "_type": "page", 
           "key": "credits"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
       "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CRg6fpiz6Wlhe6iHw1mfx9K", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:15:52.886394Z"
   }

Retrieve a Credit
-----------------

Request
~~~~~~~

.. code::


   GET /v1/credits/:credit_id


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "status": "paid", 
     "_type": "credit", 
     "description": null, 
     "transaction_number": "CR235-184-6466", 
     "_uris": {}, 
     "id": "CRi3sX0awNR0SJ5JP6q1dpl", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:25.550266Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "verifications_uri": {
           "_type": "page", 
           "key": "verifications"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }, 
         "credits_uri": {
           "_type": "page", 
           "key": "credits"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
       "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
       "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
       "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:15:22.148564Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
       "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
       "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
       "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
       "ssn_last4": null, 
       "ein": "393483992"
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
       "created_at": "2013-06-06T23:15:21.686412Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
       "email_address": null, 
       "id": "AC7tYY6I2HACOAiftgFo4oCr", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T23:15:54.706110Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:25.550266Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "verifications_uri": {
           "_type": "page", 
           "key": "verifications"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }, 
         "credits_uri": {
           "_type": "page", 
           "key": "credits"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
       "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CRi3sX0awNR0SJ5JP6q1dpl", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:15:54.206339Z"
   }

List All Credits
----------------

.. code::


   GET /v1/credits

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.

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
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
           "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
           "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:15:22.148564Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
           "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
           "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T23:15:56.795899Z", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:15:21.686412Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
           "email_address": null, 
           "id": "AC7tYY6I2HACOAiftgFo4oCr", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CRkoYBq9TTs8xp4zWMnRQdi", 
         "transaction_number": "CR126-001-1366", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CRkoYBq9TTs8xp4zWMnRQdi", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:15:56.670997Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
           "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
           "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:15:22.148564Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
           "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
           "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T23:15:56.171071Z", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:15:21.686412Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
           "email_address": null, 
           "id": "AC7tYY6I2HACOAiftgFo4oCr", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CRjHcwoBZa9AwIqvwGIF3mg", 
         "transaction_number": "CR701-258-5813", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CRjHcwoBZa9AwIqvwGIF3mg", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:15:55.995776Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/credits?limit=2&offset=0", 
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
     "total": 9, 
     "next_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/credits?limit=2&offset=8"
   }

List All Credits for a Bank Account
-----------------------------------

.. code::


   GET /v1/bank_accounts/:bank_account_id/credits

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.
   
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
     "first_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Yet another description", 
         "created_at": "2013-06-06T23:15:59.352017Z", 
         "uri": "/v1/credits/CRnh2trP7qaX9ioO6xj7xq0", 
         "amount": 1452, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CRnh2trP7qaX9ioO6xj7xq0", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "_uris": {
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "verifications_uri": {
               "_type": "page", 
               "key": "verifications"
             }
           }, 
           "meta": {}, 
           "account_number": "xxx233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications"
         }
       }, 
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Another description", 
         "created_at": "2013-06-06T23:15:58.761551Z", 
         "uri": "/v1/credits/CRmCgK33ulGLQfhRYz6nPk3", 
         "amount": 431, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CRmCgK33ulGLQfhRYz6nPk3", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "_uris": {
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "verifications_uri": {
               "_type": "page", 
               "key": "verifications"
             }
           }, 
           "meta": {}, 
           "account_number": "xxx233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications"
         }
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits?limit=2&offset=0", 
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
     "total": 12, 
     "next_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits?limit=2&offset=2", 
     "last_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits?limit=2&offset=10"
   }

List All Credits for a Merchant
-------------------------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
           "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
           "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:15:22.148564Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
           "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
           "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T23:16:01.145715Z", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:15:21.686412Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
           "email_address": null, 
           "id": "AC7tYY6I2HACOAiftgFo4oCr", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CRpiknWOxlHlFFYu8V7zd1M", 
         "transaction_number": "CR077-004-9427", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CRpiknWOxlHlFFYu8V7zd1M", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:16:01.004903Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/credits", 
           "cards_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/cards", 
           "holds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:15:22.148564Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd", 
           "refunds_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/refunds", 
           "debits_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/debits", 
           "transactions_uri": "/v1/customers/CU7uvbB0cQKpTJ7wPHCVyxNd/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T23:16:00.521287Z", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:15:21.686412Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
           "email_address": null, 
           "id": "AC7tYY6I2HACOAiftgFo4oCr", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits/CRoAojZjPPQWw4rLk7tiWEK", 
         "transaction_number": "CR089-324-3184", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CRoAojZjPPQWw4rLk7tiWEK", 
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
           "created_at": "2013-06-06T23:15:25.550266Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
           "type": "checking", 
           "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
           "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:16:00.380484Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits?limit=2&offset=0", 
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
     "total": 14, 
     "next_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits?limit=2&offset=12"
   }

