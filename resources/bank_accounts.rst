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
     "credits_uri": "/v1/bank_accounts/BA4yP6FgE4OSZ2VS3KfvvTfg/credits", 
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
     "id": "BA4yP6FgE4OSZ2VS3KfvvTfg", 
     "verifications_uri": "/v1/bank_accounts/BA4yP6FgE4OSZ2VS3KfvvTfg/verifications", 
     "customer": null, 
     "verification_uri": null, 
     "name": "Homer Jay", 
     "created_at": "2013-06-06T22:44:02.638408Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/bank_accounts/BA4yP6FgE4OSZ2VS3KfvvTfg", 
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
     "credits_uri": "/v1/bank_accounts/BA4zAuqPbIkr2ZN8hJkgpULw/credits", 
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
     "id": "BA4zAuqPbIkr2ZN8hJkgpULw", 
     "verifications_uri": "/v1/bank_accounts/BA4zAuqPbIkr2ZN8hJkgpULw/verifications", 
     "customer": null, 
     "verification_uri": null, 
     "name": "Homer Jay", 
     "created_at": "2013-06-06T22:44:03.312300Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/bank_accounts/BA4zAuqPbIkr2ZN8hJkgpULw", 
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
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4BiE0lXFM0L888UPzDlD5K", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4AsBU48bFa2ZYqiZs1hiye", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/credits", 
           "cards_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/cards", 
           "holds_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:44:04.837713Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K", 
           "refunds_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/refunds", 
           "debits_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/debits", 
           "transactions_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/transactions", 
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
         "created_at": "2013-06-06T22:44:04.088404Z", 
         "verification_uri": null, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4AsBU48bFa2ZYqiZs1hiye", 
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
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/holds", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/transactions", 
           "created_at": "2013-06-06T22:44:04.299918Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/refunds", 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/debits", 
           "email_address": null, 
           "id": "AC4AH8Q2WpuVJVujfM25B6Qg", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/cards"
         }, 
         "routing_number": "121042882", 
         "credits_uri": "/v1/bank_accounts/BA4AsBU48bFa2ZYqiZs1hiye/credits", 
         "type": "checking", 
         "id": "BA4AsBU48bFa2ZYqiZs1hiye", 
         "verifications_uri": "/v1/bank_accounts/BA4AsBU48bFa2ZYqiZs1hiye/verifications"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts?limit=2&offset=0", 
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
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts?limit=2&offset=0"
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
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4BiE0lXFM0L888UPzDlD5K", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4AsBU48bFa2ZYqiZs1hiye", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/credits", 
           "cards_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/cards", 
           "holds_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:44:04.837713Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K", 
           "refunds_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/refunds", 
           "debits_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/debits", 
           "transactions_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/transactions", 
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
         "created_at": "2013-06-06T22:44:04.088404Z", 
         "verification_uri": null, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4AsBU48bFa2ZYqiZs1hiye", 
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
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/holds", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/transactions", 
           "created_at": "2013-06-06T22:44:04.299918Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/refunds", 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/debits", 
           "email_address": null, 
           "id": "AC4AH8Q2WpuVJVujfM25B6Qg", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/cards"
         }, 
         "routing_number": "121042882", 
         "credits_uri": "/v1/bank_accounts/BA4AsBU48bFa2ZYqiZs1hiye/credits", 
         "type": "checking", 
         "id": "BA4AsBU48bFa2ZYqiZs1hiye", 
         "verifications_uri": "/v1/bank_accounts/BA4AsBU48bFa2ZYqiZs1hiye/verifications"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts?limit=2&offset=0", 
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
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts?limit=2&offset=0"
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
       "created_at": "2013-06-06T22:44:06.844501+00:00Z", 
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
       "credits_uri": "v1/bank_accounts/BA4DysLcKZHOI1QQzMQ9nm40/credits", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "routing_number": "121042882", 
       "can_debit": false, 
       "id": "BA4DysLcKZHOI1QQzMQ9nm40", 
       "verifications_uri": "v1/bank_accounts/BA4DysLcKZHOI1QQzMQ9nm40/verifications", 
       "account_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg"
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
     "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
     "bank_name": "WELLS FARGO BANK NA", 
     "_type": "bank_account", 
     "bank_code": "121042882", 
     "account": {
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "_type": "account", 
       "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "created_at": "2013-06-06T22:44:04.299918Z", 
       "meta": {}, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/refunds", 
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
       "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/debits", 
       "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/transactions", 
       "email_address": null, 
       "id": "AC4AH8Q2WpuVJVujfM25B6Qg", 
       "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/cards"
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
     "id": "BA4F4eS5xHa5qWQxjENotkyy", 
     "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU4BiE0lXFM0L888UPzDlD5K", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/credits", 
       "cards_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/cards", 
       "holds_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T22:44:04.837713Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K", 
       "refunds_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/refunds", 
       "debits_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/debits", 
       "transactions_uri": "/v1/customers/CU4BiE0lXFM0L888UPzDlD5K/transactions", 
       "ssn_last4": null, 
       "ein": "393483992"
     }, 
     "verification_uri": null, 
     "name": "Homer Jay", 
     "created_at": "2013-06-06T22:44:08.203678Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
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



