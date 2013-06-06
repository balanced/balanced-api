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
       "destination_uri": "v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
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
     "transaction_number": "CR193-850-3391", 
     "_uris": {}, 
     "id": "CR7gBE41TA6RCWJ5mV38W3WO", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T20:37:21.138026Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
       "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6RmrQXrOzK9trbNYtJ1q0o", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/credits", 
       "cards_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/cards", 
       "holds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:37:18.427303Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o", 
       "refunds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/refunds", 
       "debits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/debits", 
       "transactions_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
       "created_at": "2013-06-06T20:37:17.621572Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
       "email_address": null, 
       "id": "AC6QsguYqDOlly6X1OltA504", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T20:37:40.871119Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T20:37:21.138026Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
       "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits/CR7gBE41TA6RCWJ5mV38W3WO", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T20:37:40.706487Z"
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
       "destination_uri": "v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
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
     "transaction_number": "CR379-144-0296", 
     "_uris": {}, 
     "id": "CR7knL1wutgOZe9OCnxTAY2j", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T20:37:21.138026Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
       "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6RmrQXrOzK9trbNYtJ1q0o", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/credits", 
       "cards_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/cards", 
       "holds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:37:18.427303Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o", 
       "refunds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/refunds", 
       "debits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/debits", 
       "transactions_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
       "created_at": "2013-06-06T20:37:17.621572Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
       "email_address": null, 
       "id": "AC6QsguYqDOlly6X1OltA504", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T20:37:44.224574Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T20:37:21.138026Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
       "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits/CR7knL1wutgOZe9OCnxTAY2j", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T20:37:44.082283Z"
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
     "transaction_number": "CR742-587-1440", 
     "_uris": {}, 
     "id": "CR7nfG5wEFfoeA6wFfxVWQis", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T20:37:21.138026Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
       "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6RmrQXrOzK9trbNYtJ1q0o", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/credits", 
       "cards_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/cards", 
       "holds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:37:18.427303Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o", 
       "refunds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/refunds", 
       "debits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/debits", 
       "transactions_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
       "created_at": "2013-06-06T20:37:17.621572Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
       "email_address": null, 
       "id": "AC6QsguYqDOlly6X1OltA504", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
     }, 
     "fee": null, 
     "amount": 1243, 
     "created_at": "2013-06-06T20:37:46.781975Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T20:37:21.138026Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
       "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits/CR7nfG5wEFfoeA6wFfxVWQis", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T20:37:46.497430Z"
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
     "transaction_number": "CR284-932-9520", 
     "_uris": {}, 
     "id": "CR7p0150VS2ZmxJLrfwvbX1C", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T20:37:21.138026Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
       "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6RmrQXrOzK9trbNYtJ1q0o", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/credits", 
       "cards_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/cards", 
       "holds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:37:18.427303Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o", 
       "refunds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/refunds", 
       "debits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/debits", 
       "transactions_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
       "created_at": "2013-06-06T20:37:17.621572Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
       "email_address": null, 
       "id": "AC6QsguYqDOlly6X1OltA504", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T20:37:48.335613Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T20:37:21.138026Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
       "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits/CR7p0150VS2ZmxJLrfwvbX1C", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T20:37:48.044712Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6RmrQXrOzK9trbNYtJ1q0o", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/credits", 
           "cards_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/cards", 
           "holds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T20:37:18.427303Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o", 
           "refunds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/refunds", 
           "debits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/debits", 
           "transactions_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T20:37:50.492845Z", 
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
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T20:37:17.621572Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
           "email_address": null, 
           "id": "AC6QsguYqDOlly6X1OltA504", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits/CR7rqa6o6K6XQd1SrWyaphjM", 
         "transaction_number": "CR108-071-5617", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7rqa6o6K6XQd1SrWyaphjM", 
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
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T20:37:50.415512Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6RmrQXrOzK9trbNYtJ1q0o", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/credits", 
           "cards_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/cards", 
           "holds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T20:37:18.427303Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o", 
           "refunds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/refunds", 
           "debits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/debits", 
           "transactions_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T20:37:49.796530Z", 
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
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T20:37:17.621572Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
           "email_address": null, 
           "id": "AC6QsguYqDOlly6X1OltA504", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits/CR7qDVFWzAXsDJKDkfvlKQOA", 
         "transaction_number": "CR169-233-8661", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7qDVFWzAXsDJKDkfvlKQOA", 
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
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T20:37:49.667142Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/credits?limit=2&offset=8"
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
     "first_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Yet another description", 
         "created_at": "2013-06-06T20:37:53.453315Z", 
         "uri": "/v1/credits/CR7uKyGPuFE7NQhdSyJX8QPI", 
         "amount": 1452, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7uKyGPuFE7NQhdSyJX8QPI", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
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
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications"
         }
       }, 
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Another description", 
         "created_at": "2013-06-06T20:37:52.654034Z", 
         "uri": "/v1/credits/CR7tQRQuPmsZx4RjFEDXC2eq", 
         "amount": 431, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7tQRQuPmsZx4RjFEDXC2eq", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
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
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications"
         }
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits?limit=2&offset=2", 
     "last_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits?limit=2&offset=10"
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
     "first_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6RmrQXrOzK9trbNYtJ1q0o", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/credits", 
           "cards_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/cards", 
           "holds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T20:37:18.427303Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o", 
           "refunds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/refunds", 
           "debits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/debits", 
           "transactions_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T20:37:55.545314Z", 
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
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T20:37:17.621572Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
           "email_address": null, 
           "id": "AC6QsguYqDOlly6X1OltA504", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits/CR7x6VNsqs2pFMZu9dUoTybw", 
         "transaction_number": "CR384-378-6799", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7x6VNsqs2pFMZu9dUoTybw", 
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
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T20:37:55.259971Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6RmrQXrOzK9trbNYtJ1q0o", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/credits", 
           "cards_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/cards", 
           "holds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T20:37:18.427303Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o", 
           "refunds_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/refunds", 
           "debits_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/debits", 
           "transactions_uri": "/v1/customers/CU6RmrQXrOzK9trbNYtJ1q0o/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T20:37:54.654738Z", 
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
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T20:37:17.621572Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
           "email_address": null, 
           "id": "AC6QsguYqDOlly6X1OltA504", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits/CR7w6FSQOUSLqpy3T5mBc3d6", 
         "transaction_number": "CR410-643-7295", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7w6FSQOUSLqpy3T5mBc3d6", 
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
           "created_at": "2013-06-06T20:37:21.138026Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/credits", 
           "type": "checking", 
           "id": "BA6UpLzHRlxtQbqvjhDu1eXR", 
           "verifications_uri": "/v1/bank_accounts/BA6UpLzHRlxtQbqvjhDu1eXR/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T20:37:54.550011Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits?limit=2&offset=12"
   }

