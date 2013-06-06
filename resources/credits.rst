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
       "destination_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
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
     "transaction_number": "CR240-715-6767", 
     "_uris": {}, 
     "id": "CR40pvUXxzuT2AV8VJRhpXz2", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:40:27.690719Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
       "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU3Ahbq6rbFqlPUBLoie3WWI", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/credits", 
       "cards_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/cards", 
       "holds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:40:24.776193Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI", 
       "refunds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/refunds", 
       "debits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/debits", 
       "transactions_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/transactions", 
       "created_at": "2013-06-06T23:40:24.200395Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/refunds", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/debits", 
       "email_address": null, 
       "id": "AC3zD5GQ6tzAHb4NjiEuKFte", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T23:40:48.009232Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:40:27.690719Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
       "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR40pvUXxzuT2AV8VJRhpXz2", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:40:47.886269Z"
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
       "destination_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
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
     "transaction_number": "CR818-882-2455", 
     "_uris": {}, 
     "id": "CR43jrvHd1K4rNMdjtHLP9vh", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:40:27.690719Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
       "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU3Ahbq6rbFqlPUBLoie3WWI", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/credits", 
       "cards_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/cards", 
       "holds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:40:24.776193Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI", 
       "refunds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/refunds", 
       "debits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/debits", 
       "transactions_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/transactions", 
       "created_at": "2013-06-06T23:40:24.200395Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/refunds", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/debits", 
       "email_address": null, 
       "id": "AC3zD5GQ6tzAHb4NjiEuKFte", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T23:40:50.586670Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:40:27.690719Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
       "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR43jrvHd1K4rNMdjtHLP9vh", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:40:50.510920Z"
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
     "transaction_number": "CR942-359-9573", 
     "_uris": {}, 
     "id": "CR45KRvRDn97zvSIQFGexw7u", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:40:27.690719Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
       "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU3Ahbq6rbFqlPUBLoie3WWI", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/credits", 
       "cards_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/cards", 
       "holds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:40:24.776193Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI", 
       "refunds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/refunds", 
       "debits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/debits", 
       "transactions_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/transactions", 
       "created_at": "2013-06-06T23:40:24.200395Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/refunds", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/debits", 
       "email_address": null, 
       "id": "AC3zD5GQ6tzAHb4NjiEuKFte", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/cards"
     }, 
     "fee": null, 
     "amount": 1243, 
     "created_at": "2013-06-06T23:40:52.764237Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:40:27.690719Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
       "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR45KRvRDn97zvSIQFGexw7u", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:40:52.615230Z"
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
     "transaction_number": "CR100-415-9658", 
     "_uris": {}, 
     "id": "CR47rSHdH4DnGvT5PwQSnerY", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:40:27.690719Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
       "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU3Ahbq6rbFqlPUBLoie3WWI", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/credits", 
       "cards_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/cards", 
       "holds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:40:24.776193Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI", 
       "refunds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/refunds", 
       "debits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/debits", 
       "transactions_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/transactions", 
       "created_at": "2013-06-06T23:40:24.200395Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/refunds", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/debits", 
       "email_address": null, 
       "id": "AC3zD5GQ6tzAHb4NjiEuKFte", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T23:40:54.272905Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T23:40:27.690719Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
       "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
       "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR47rSHdH4DnGvT5PwQSnerY", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:40:54.167746Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU3Ahbq6rbFqlPUBLoie3WWI", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/credits", 
           "cards_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/cards", 
           "holds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:40:24.776193Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI", 
           "refunds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/refunds", 
           "debits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/debits", 
           "transactions_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T23:40:56.427586Z", 
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
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:40:24.200395Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/holds", 
           "email_address": null, 
           "id": "AC3zD5GQ6tzAHb4NjiEuKFte", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR49SKnjy7zKoOxm6I5nUq3Z", 
         "transaction_number": "CR681-538-0085", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR49SKnjy7zKoOxm6I5nUq3Z", 
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
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:40:56.326942Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU3Ahbq6rbFqlPUBLoie3WWI", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/credits", 
           "cards_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/cards", 
           "holds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:40:24.776193Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI", 
           "refunds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/refunds", 
           "debits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/debits", 
           "transactions_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T23:40:55.761387Z", 
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
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:40:24.200395Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/holds", 
           "email_address": null, 
           "id": "AC3zD5GQ6tzAHb4NjiEuKFte", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR497UBZKsQduvYDvvHV7jja", 
         "transaction_number": "CR826-597-7460", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR497UBZKsQduvYDvvHV7jja", 
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
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:40:55.647267Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/credits?limit=2&offset=8"
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
     "first_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Yet another description", 
         "created_at": "2013-06-06T23:40:59.094418Z", 
         "uri": "/v1/credits/CR4cS6dC8k4gFmWRLy22GNlY", 
         "amount": 1452, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR4cS6dC8k4gFmWRLy22GNlY", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
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
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications"
         }
       }, 
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Another description", 
         "created_at": "2013-06-06T23:40:58.535202Z", 
         "uri": "/v1/credits/CR4cfwumtqp4vT4ufHnfr9Sw", 
         "amount": 431, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR4cfwumtqp4vT4ufHnfr9Sw", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
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
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications"
         }
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits?limit=2&offset=2", 
     "last_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits?limit=2&offset=10"
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
     "first_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU3Ahbq6rbFqlPUBLoie3WWI", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/credits", 
           "cards_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/cards", 
           "holds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:40:24.776193Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI", 
           "refunds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/refunds", 
           "debits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/debits", 
           "transactions_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T23:41:00.983501Z", 
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
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:40:24.200395Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/holds", 
           "email_address": null, 
           "id": "AC3zD5GQ6tzAHb4NjiEuKFte", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR4f0qRLEzHD8gZryGxHnis7", 
         "transaction_number": "CR323-590-5022", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR4f0qRLEzHD8gZryGxHnis7", 
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
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:41:00.866488Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU3Ahbq6rbFqlPUBLoie3WWI", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/credits", 
           "cards_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/cards", 
           "holds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:40:24.776193Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI", 
           "refunds_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/refunds", 
           "debits_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/debits", 
           "transactions_uri": "/v1/customers/CU3Ahbq6rbFqlPUBLoie3WWI/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T23:41:00.302937Z", 
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
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T23:40:24.200395Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/holds", 
           "email_address": null, 
           "id": "AC3zD5GQ6tzAHb4NjiEuKFte", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR4eeLGLdvznRr1HoAfubmAy", 
         "transaction_number": "CR150-616-5964", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR4eeLGLdvznRr1HoAfubmAy", 
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
           "created_at": "2013-06-06T23:40:27.690719Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/credits", 
           "type": "checking", 
           "id": "BA3DyoEbHKGnPYHXG6m0GF32", 
           "verifications_uri": "/v1/bank_accounts/BA3DyoEbHKGnPYHXG6m0GF32/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T23:41:00.165168Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits?limit=2&offset=12"
   }

