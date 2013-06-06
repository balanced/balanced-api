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
       "destination_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
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
     "transaction_number": "CR737-300-0857", 
     "_uris": {}, 
     "id": "CR3yrtPVOxG3LkuqKiNYF9no", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T21:59:49.419282Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
       "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU386UYGkRIxJ1og2jajjTE2", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
       "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
       "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T21:59:46.783063Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
       "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
       "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
       "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
       "created_at": "2013-06-06T21:59:46.286553Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
       "email_address": null, 
       "id": "AC37yiAn5M6zGCC30kJX3whg", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T22:00:10.195030Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T21:59:49.419282Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
       "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR3yrtPVOxG3LkuqKiNYF9no", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:00:10.049802Z"
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
       "destination_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
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
     "transaction_number": "CR755-616-5663", 
     "_uris": {}, 
     "id": "CR3BozVpK7LRyeqTWE2lsaNV", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T21:59:49.419282Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
       "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU386UYGkRIxJ1og2jajjTE2", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
       "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
       "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T21:59:46.783063Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
       "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
       "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
       "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
       "created_at": "2013-06-06T21:59:46.286553Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
       "email_address": null, 
       "id": "AC37yiAn5M6zGCC30kJX3whg", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T22:00:12.812106Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T21:59:49.419282Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
       "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR3BozVpK7LRyeqTWE2lsaNV", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:00:12.703322Z"
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
     "transaction_number": "CR726-291-7086", 
     "_uris": {}, 
     "id": "CR3DUtylsYlMlD2XByzLX18A", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T21:59:49.419282Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
       "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU386UYGkRIxJ1og2jajjTE2", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
       "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
       "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T21:59:46.783063Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
       "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
       "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
       "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
       "created_at": "2013-06-06T21:59:46.286553Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
       "email_address": null, 
       "id": "AC37yiAn5M6zGCC30kJX3whg", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
     }, 
     "fee": null, 
     "amount": 1243, 
     "created_at": "2013-06-06T22:00:15.053436Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T21:59:49.419282Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
       "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR3DUtylsYlMlD2XByzLX18A", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:00:14.903660Z"
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
     "transaction_number": "CR892-492-0298", 
     "_uris": {}, 
     "id": "CR3FmZBuXEVcYnKZvZsyyLDE", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T21:59:49.419282Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
       "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU386UYGkRIxJ1og2jajjTE2", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
       "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
       "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T21:59:46.783063Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
       "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
       "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
       "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
       "created_at": "2013-06-06T21:59:46.286553Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
       "email_address": null, 
       "id": "AC37yiAn5M6zGCC30kJX3whg", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T22:00:16.354463Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-06T21:59:49.419282Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
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
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
       "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR3FmZBuXEVcYnKZvZsyyLDE", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:00:16.233638Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU386UYGkRIxJ1og2jajjTE2", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
           "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
           "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:46.783063Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
           "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
           "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
           "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T22:00:18.800013Z", 
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
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T21:59:46.286553Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
           "email_address": null, 
           "id": "AC37yiAn5M6zGCC30kJX3whg", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR3I7Ld1AXb2gyvJar5cZ9cA", 
         "transaction_number": "CR680-538-4563", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR3I7Ld1AXb2gyvJar5cZ9cA", 
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
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:00:18.661318Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU386UYGkRIxJ1og2jajjTE2", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
           "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
           "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:46.783063Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
           "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
           "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
           "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T22:00:18.126972Z", 
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
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T21:59:46.286553Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
           "email_address": null, 
           "id": "AC37yiAn5M6zGCC30kJX3whg", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR3HmAfaMpL1VBTrueaw4SYC", 
         "transaction_number": "CR105-013-3232", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR3HmAfaMpL1VBTrueaw4SYC", 
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
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:00:18.019416Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/credits?limit=2&offset=8"
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
     "first_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Yet another description", 
         "created_at": "2013-06-06T22:00:21.780697Z", 
         "uri": "/v1/credits/CR3LtBH5WIwfjzYjnovgA5Ko", 
         "amount": 1452, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR3LtBH5WIwfjzYjnovgA5Ko", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
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
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications"
         }
       }, 
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Another description", 
         "created_at": "2013-06-06T22:00:21.085758Z", 
         "uri": "/v1/credits/CR3KHek35RMTzjhbRGoMV5zk", 
         "amount": 431, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR3KHek35RMTzjhbRGoMV5zk", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
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
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications"
         }
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits?limit=2&offset=2", 
     "last_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits?limit=2&offset=10"
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
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU386UYGkRIxJ1og2jajjTE2", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
           "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
           "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:46.783063Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
           "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
           "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
           "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T22:00:24.134539Z", 
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
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T21:59:46.286553Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
           "email_address": null, 
           "id": "AC37yiAn5M6zGCC30kJX3whg", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR3O7T0hlaJYgTA75aFZm7Ee", 
         "transaction_number": "CR438-255-0691", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR3O7T0hlaJYgTA75aFZm7Ee", 
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
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:00:23.983519Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU386UYGkRIxJ1og2jajjTE2", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/credits", 
           "cards_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/cards", 
           "holds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:46.783063Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2", 
           "refunds_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/refunds", 
           "debits_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/debits", 
           "transactions_uri": "/v1/customers/CU386UYGkRIxJ1og2jajjTE2/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T22:00:23.352628Z", 
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
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-06T21:59:46.286553Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
           "email_address": null, 
           "id": "AC37yiAn5M6zGCC30kJX3whg", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits/CR3NfAYbsP8mkymJ2OAZ6M0f", 
         "transaction_number": "CR680-945-0513", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR3NfAYbsP8mkymJ2OAZ6M0f", 
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
           "created_at": "2013-06-06T21:59:49.419282Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/credits", 
           "type": "checking", 
           "id": "BA3b5eeNUSPVOzD6xKJLHCN1", 
           "verifications_uri": "/v1/bank_accounts/BA3b5eeNUSPVOzD6xKJLHCN1/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-06T22:00:23.250933Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits?limit=2&offset=12"
   }

