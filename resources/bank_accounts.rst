Bank Accounts
=============

- `Create a Bank Account`_
- `Retrieve a Bank Account`_
- `List All Bank Accounts`_
- `List All Bank Accounts for an Account`_
- `Associate a Bank Account with an Account`_
- `Delete a Bank Account`_

Fields
------

``account_number``
   **string**.

``bank_name``
   **string**. The name of the bank.

``can_debit``
   **boolean**. Flag indicating whether this funding instrument can be debited (true)
   or not (false).

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   bank account was tokenized.

``credits_uri``
   **string**.

``customer``
   **object**.

``fingerprint``
   **string**. Uniquely identifies the bank account (``account_number`` and
   ``routing_number``).

``id``
   **string**.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``name``
   **string**. Name of the account holder.

``routing_number``
   **string**. Meets `MICR <http://en.wikipedia.org/wiki/Routing_transit_number#MICR_Routing_number_format>`_
   routing number format. Specified in FedACH database defined by the
   `US Federal Reserve <http://www.fedwiredirectory.frb.org/>`_.

``type``
   **string**. ``checking`` or ``savings``.

``uri``
   **string**.

``verification_uri``
   **string**. Most recent verification for this bank account.

``verifications_uri``
   **string**.

Deprecated
~~~~~~~~~~

Create a Bank Account
---------------------

.. code::


   POST /v1/bank_accounts

Request
~~~~~~~

``name``
   *required* **string**. Name on the bank account.

``account_number``
   *required* **string**. Bank account number.

``routing_number``
   *required* **string**. Bank account code.

``type``
   *required* **string**. ``checking`` or ``savings``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.


Body
^^^^

.. code:: javascript

   {
       "bank_code": "121042882", 
       "type": "checking", 
       "name": "Homer Jay", 
       "account_number": "112233a"
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
     "credits_uri": "/v1/bank_accounts/BA7rWnkOptgo18CS7Y0fq00M/credits", 
     "bank_name": "WELLS FARGO BANK NA", 
     "_type": "bank_account", 
     "bank_code": "121042882", 
     "account": null, 
     "_uris": {
       "verifications_uri": {
         "_type": "page", 
         "key": "verifications"
       }, 
       "credits_uri": {
         "_type": "page", 
         "key": "credits"
       }
     }, 
     "meta": {}, 
     "last_four": "233a", 
     "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
     "routing_number": "121042882", 
     "can_debit": false, 
     "id": "BA7rWnkOptgo18CS7Y0fq00M", 
     "verifications_uri": "/v1/bank_accounts/BA7rWnkOptgo18CS7Y0fq00M/verifications", 
     "customer": null, 
     "verification_uri": null, 
     "name": "Homer Jay", 
     "created_at": "2013-06-06T23:15:19.891351Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/bank_accounts/BA7rWnkOptgo18CS7Y0fq00M", 
     "is_valid": true, 
     "account_number": "xxx233a", 
     "type": "checking"
   }

Retrieve a Bank Account
-----------------------

Request
~~~~~~~

.. code::


   HEAD /v1/bank_accounts/:bank_account_id
   GET /v1/bank_accounts/:bank_account_id


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "credits_uri": "/v1/bank_accounts/BA7sMCJTO0OpZr0xlboujhHV/credits", 
     "bank_name": "WELLS FARGO BANK NA", 
     "_type": "bank_account", 
     "bank_code": "121042882", 
     "account": null, 
     "_uris": {
       "verifications_uri": {
         "_type": "page", 
         "key": "verifications"
       }, 
       "credits_uri": {
         "_type": "page", 
         "key": "credits"
       }
     }, 
     "meta": {}, 
     "last_four": "233a", 
     "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
     "routing_number": "121042882", 
     "can_debit": false, 
     "id": "BA7sMCJTO0OpZr0xlboujhHV", 
     "verifications_uri": "/v1/bank_accounts/BA7sMCJTO0OpZr0xlboujhHV/verifications", 
     "customer": null, 
     "verification_uri": null, 
     "name": "Homer Jay", 
     "created_at": "2013-06-06T23:15:20.621683Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/bank_accounts/BA7sMCJTO0OpZr0xlboujhHV", 
     "is_valid": true, 
     "account_number": "xxx233a", 
     "type": "checking"
   }

List All Bank Accounts
----------------------

.. code::


   HEAD /v1/bank_accounts
   GET /v1/bank_accounts

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
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts?limit=2&offset=0", 
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
           "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7tN2c6bVhXZmd4tial5j9d", 
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
         "bank_name": "WELLS FARGO BANK NA", 
         "_type": "bank_account", 
         "name": "Homer Jay", 
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
         "bank_code": "121042882", 
         "can_debit": false, 
         "created_at": "2013-06-06T23:15:21.532588Z", 
         "verification_uri": null, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7tN2c6bVhXZmd4tial5j9d", 
         "is_valid": true, 
         "meta": {}, 
         "account_number": "xxx233a", 
         "last_four": "233a", 
         "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
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
         "routing_number": "121042882", 
         "credits_uri": "/v1/bank_accounts/BA7tN2c6bVhXZmd4tial5j9d/credits", 
         "type": "checking", 
         "id": "BA7tN2c6bVhXZmd4tial5j9d", 
         "verifications_uri": "/v1/bank_accounts/BA7tN2c6bVhXZmd4tial5j9d/verifications"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts?limit=2&offset=0", 
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
     "total": 1, 
     "next_uri": null, 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts?limit=2&offset=0"
   }

List All Bank Accounts for an Account
-------------------------------------

.. code::


   HEAD /v1/marketplaces/:marketplace_id/accounts/:account_id/bank_accounts
   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/bank_accounts

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
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts?limit=2&offset=0", 
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
           "destination_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7tN2c6bVhXZmd4tial5j9d", 
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
         "bank_name": "WELLS FARGO BANK NA", 
         "_type": "bank_account", 
         "name": "Homer Jay", 
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
         "bank_code": "121042882", 
         "can_debit": false, 
         "created_at": "2013-06-06T23:15:21.532588Z", 
         "verification_uri": null, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7tN2c6bVhXZmd4tial5j9d", 
         "is_valid": true, 
         "meta": {}, 
         "account_number": "xxx233a", 
         "last_four": "233a", 
         "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
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
         "routing_number": "121042882", 
         "credits_uri": "/v1/bank_accounts/BA7tN2c6bVhXZmd4tial5j9d/credits", 
         "type": "checking", 
         "id": "BA7tN2c6bVhXZmd4tial5j9d", 
         "verifications_uri": "/v1/bank_accounts/BA7tN2c6bVhXZmd4tial5j9d/verifications"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts?limit=2&offset=0", 
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
     "total": 1, 
     "next_uri": null, 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts?limit=2&offset=0"
   }

Associate a Bank Account with an Account
----------------------------------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/bank_accounts/:bank_account_id

Request
~~~~~~~

``account_uri``
   *optional* **string**. URI of an account with which to associate the bank account.


Body
^^^^

.. code:: javascript

   {
       "customer": null, 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "name": "Homer Jay", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:15:24.218030+00:00Z", 
       "account_number": "xxx233a", 
       "verification_uri": null, 
       "is_valid": true, 
       "_uris": {
           "verifications_uri": {
               "_type": "page", 
               "key": "verifications"
           }, 
           "credits_uri": {
               "_type": "page", 
               "key": "credits"
           }
       }, 
       "meta": {}, 
       "credits_uri": "v1/bank_accounts/BA7wNes0t3jy9MVZCrjxlmzc/credits", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "routing_number": "121042882", 
       "can_debit": false, 
       "id": "BA7wNes0t3jy9MVZCrjxlmzc", 
       "verifications_uri": "v1/bank_accounts/BA7wNes0t3jy9MVZCrjxlmzc/verifications", 
       "account_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr"
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
     "credits_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/credits", 
     "bank_name": "WELLS FARGO BANK NA", 
     "_type": "bank_account", 
     "bank_code": "121042882", 
     "account": {
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "_type": "account", 
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "created_at": "2013-06-06T23:15:21.686412Z", 
       "meta": {}, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
       "_uris": {
         "holds_uri": {
           "_type": "page", 
           "key": "holds"
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
         "transactions_uri": {
           "_type": "page", 
           "key": "transactions"
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
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
       "email_address": null, 
       "id": "AC7tYY6I2HACOAiftgFo4oCr", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
     }, 
     "_uris": {
       "verifications_uri": {
         "_type": "page", 
         "key": "verifications"
       }, 
       "credits_uri": {
         "_type": "page", 
         "key": "credits"
       }
     }, 
     "meta": {}, 
     "last_four": "233a", 
     "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
     "routing_number": "121042882", 
     "can_debit": false, 
     "id": "BA7yjK61Em0zNOHfrvt5pLfw", 
     "verifications_uri": "/v1/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw/verifications", 
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
         "holds_uri": {
           "_type": "page", 
           "key": "holds"
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
         "transactions_uri": {
           "_type": "page", 
           "key": "transactions"
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
     "verification_uri": null, 
     "name": "Homer Jay", 
     "created_at": "2013-06-06T23:15:25.550266Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts/BA7yjK61Em0zNOHfrvt5pLfw", 
     "is_valid": true, 
     "account_number": "xxx233a", 
     "type": "checking"
   }

Delete a Bank Account
---------------------

Request
~~~~~~~

.. code::


   DELETE /v1/bank_accounts/:bank_account_id


Headers
^^^^^^^

.. code::

   Status: 204 NO CONTENT


Body
^^^^

.. code:: javascript



