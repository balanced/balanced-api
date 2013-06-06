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
       "destination_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
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
     "transaction_number": "CR302-889-5095", 
     "_uris": {}, 
     "id": "CR51fktxehTAbkKYOW7A1wV2", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T22:44:08.203678Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA4F4eS5xHa5qWQxjENotkyy", 
       "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
       "account_number": "xxx233a"
     }, 
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
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T22:44:27.907280Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T22:44:08.203678Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA4F4eS5xHa5qWQxjENotkyy", 
       "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR51fktxehTAbkKYOW7A1wV2", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:44:27.766129Z"
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
       "destination_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
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
     "transaction_number": "CR712-276-7358", 
     "_uris": {}, 
     "id": "CR54hNt6JYcwffoe7pishKRF", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T22:44:08.203678Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA4F4eS5xHa5qWQxjENotkyy", 
       "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
       "account_number": "xxx233a"
     }, 
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
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T22:44:30.603931Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T22:44:08.203678Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA4F4eS5xHa5qWQxjENotkyy", 
       "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR54hNt6JYcwffoe7pishKRF", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:44:30.457181Z"
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
     "transaction_number": "CR433-435-5540", 
     "_uris": {}, 
     "id": "CR56RLZ0amrNmlqG4XGDwTsY", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T22:44:08.203678Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA4F4eS5xHa5qWQxjENotkyy", 
       "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
       "account_number": "xxx233a"
     }, 
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
     "fee": null, 
     "amount": 1243, 
     "created_at": "2013-06-06T22:44:32.901992Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T22:44:08.203678Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA4F4eS5xHa5qWQxjENotkyy", 
       "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR56RLZ0amrNmlqG4XGDwTsY", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:44:32.713513Z"
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
     "transaction_number": "CR137-344-1715", 
     "_uris": {}, 
     "id": "CR58jEDo2DbaNJ4jGLFR85Bm", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T22:44:08.203678Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA4F4eS5xHa5qWQxjENotkyy", 
       "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
       "account_number": "xxx233a"
     }, 
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
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T22:44:34.190995Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T22:44:08.203678Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
       "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA4F4eS5xHa5qWQxjENotkyy", 
       "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR58jEDo2DbaNJ4jGLFR85Bm", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:44:34.062397Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/credits?limit=2&offset=0", 
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
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T22:44:36.352897Z", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T22:44:04.299918Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/holds", 
           "email_address": null, 
           "id": "AC4AH8Q2WpuVJVujfM25B6Qg", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR5aKpsCjJcNICqaZEAl9MFq", 
         "transaction_number": "CR276-978-3332", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR5aKpsCjJcNICqaZEAl9MFq", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:44:36.235781Z"
       }, 
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
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T22:44:35.711566Z", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T22:44:04.299918Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/holds", 
           "email_address": null, 
           "id": "AC4AH8Q2WpuVJVujfM25B6Qg", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR5a1onz9N9ptOXKbMhVnZuS", 
         "transaction_number": "CR701-561-7322", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR5a1onz9N9ptOXKbMhVnZuS", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:44:35.553374Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/credits?limit=2&offset=8"
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
     "first_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Yet another description", 
         "created_at": "2013-06-06T22:44:40.260609Z", 
         "uri": "/v1/credits/CR5f8KCZJjEOxZ12t2b7YLtS", 
         "amount": 1452, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR5f8KCZJjEOxZ12t2b7YLtS", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
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
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications"
         }
       }, 
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Another description", 
         "created_at": "2013-06-06T22:44:39.425949Z", 
         "uri": "/v1/credits/CR5ecHMeUvtcJHK9vQ9VZv1e", 
         "amount": 431, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR5ecHMeUvtcJHK9vQ9VZv1e", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
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
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications"
         }
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits?limit=2&offset=2", 
     "last_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits?limit=2&offset=10"
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
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits?limit=2&offset=0", 
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
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T22:44:42.793981Z", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T22:44:04.299918Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/holds", 
           "email_address": null, 
           "id": "AC4AH8Q2WpuVJVujfM25B6Qg", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR5hZpGfmMu9YmLojPAC75BS", 
         "transaction_number": "CR446-594-4764", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR5hZpGfmMu9YmLojPAC75BS", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:44:42.631801Z"
       }, 
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
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T22:44:42.034200Z", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T22:44:04.299918Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/holds", 
           "email_address": null, 
           "id": "AC4AH8Q2WpuVJVujfM25B6Qg", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits/CR5h8ACwEUXEcKyHXqBDsGxW", 
         "transaction_number": "CR715-036-1209", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR5h8ACwEUXEcKyHXqBDsGxW", 
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
           "created_at": "2013-06-06T22:44:08.203678Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/credits", 
           "type": "checking", 
           "id": "BA4F4eS5xHa5qWQxjENotkyy", 
           "verifications_uri": "/v1/bank_accounts/BA4F4eS5xHa5qWQxjENotkyy/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:44:41.786211Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg/credits?limit=2&offset=12"
   }

