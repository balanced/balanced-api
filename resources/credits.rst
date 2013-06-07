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

``customer``
   **string**. Present if the credit went to a customer instead of directly to a
   bank account.

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
       "destination_uri": "v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
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
     "transaction_number": "CR483-155-2455", 
     "_uris": {}, 
     "id": "CR5YnJ2k96l0S1Usa7BFjI08", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-07T17:28:52.120940Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
       "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU5zoAvSWj5KTtHBAm332Auk", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
       "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
       "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-07T17:28:49.249513Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
       "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
       "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
       "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
       "created_at": "2013-06-07T17:28:48.666473Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
       "email_address": null, 
       "id": "AC5yJVw71VIXbxuGADgNRhjy", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-07T17:29:11.467390Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-07T17:28:52.120940Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
       "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR5YnJ2k96l0S1Usa7BFjI08", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-07T17:29:11.374234Z"
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
       "destination_uri": "v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
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
     "transaction_number": "CR095-151-1855", 
     "_uris": {}, 
     "id": "CR61bVbleL2W7HDroG5MolKU", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-07T17:28:52.120940Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
       "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU5zoAvSWj5KTtHBAm332Auk", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
       "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
       "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-07T17:28:49.249513Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
       "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
       "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
       "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
       "created_at": "2013-06-07T17:28:48.666473Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
       "email_address": null, 
       "id": "AC5yJVw71VIXbxuGADgNRhjy", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-07T17:29:13.965549Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-07T17:28:52.120940Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
       "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR61bVbleL2W7HDroG5MolKU", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-07T17:29:13.847940Z"
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
     "transaction_number": "CR407-781-8579", 
     "_uris": {}, 
     "id": "CR63D0fB2MH2HV38Wyx7E6B8", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-07T17:28:52.120940Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
       "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU5zoAvSWj5KTtHBAm332Auk", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
       "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
       "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-07T17:28:49.249513Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
       "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
       "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
       "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
       "created_at": "2013-06-07T17:28:48.666473Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
       "email_address": null, 
       "id": "AC5yJVw71VIXbxuGADgNRhjy", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
     }, 
     "fee": null, 
     "amount": 1243, 
     "created_at": "2013-06-07T17:29:16.140048Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-07T17:28:52.120940Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
       "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR63D0fB2MH2HV38Wyx7E6B8", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-07T17:29:16.003092Z"
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
     "transaction_number": "CR632-459-5141", 
     "_uris": {}, 
     "id": "CR64XiGwAb6Q6X7OOqLn477i", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-07T17:28:52.120940Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
       "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU5zoAvSWj5KTtHBAm332Auk", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
       "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
       "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-07T17:28:49.249513Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
       "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
       "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
       "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
       "created_at": "2013-06-07T17:28:48.666473Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
       "email_address": null, 
       "id": "AC5yJVw71VIXbxuGADgNRhjy", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-07T17:29:17.312428Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-07T17:28:52.120940Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
       "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
       "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR64XiGwAb6Q6X7OOqLn477i", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-07T17:29:17.171105Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU5zoAvSWj5KTtHBAm332Auk", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
           "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
           "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:49.249513Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
           "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
           "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
           "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-07T17:29:19.555036Z", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-07T17:28:48.666473Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
           "email_address": null, 
           "id": "AC5yJVw71VIXbxuGADgNRhjy", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR67tHypjQtQ5NtDJ9fZt2kE", 
         "transaction_number": "CR823-999-4570", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR67tHypjQtQ5NtDJ9fZt2kE", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-07T17:29:19.437750Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU5zoAvSWj5KTtHBAm332Auk", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
           "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
           "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:49.249513Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
           "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
           "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
           "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-07T17:29:18.853548Z", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-07T17:28:48.666473Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
           "email_address": null, 
           "id": "AC5yJVw71VIXbxuGADgNRhjy", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR66GMD08dyYmmEc9Trg6xLW", 
         "transaction_number": "CR913-897-1521", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR66GMD08dyYmmEc9Trg6xLW", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-07T17:29:18.718335Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/credits?limit=2&offset=8"
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
     "first_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Yet another description", 
         "created_at": "2013-06-07T17:29:22.156658Z", 
         "uri": "/v1/credits/CR6ap76TYvOC9iCNpsPuz9fI", 
         "amount": 1452, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR6ap76TYvOC9iCNpsPuz9fI", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
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
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications"
         }
       }, 
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Another description", 
         "created_at": "2013-06-07T17:29:21.571645Z", 
         "uri": "/v1/credits/CR69KkpbRJZlBSSPNb7UVo9G", 
         "amount": 431, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR69KkpbRJZlBSSPNb7UVo9G", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
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
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications"
         }
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits?limit=2&offset=2", 
     "last_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits?limit=2&offset=10"
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
     "first_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU5zoAvSWj5KTtHBAm332Auk", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
           "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
           "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:49.249513Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
           "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
           "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
           "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-07T17:29:23.965602Z", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-07T17:28:48.666473Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
           "email_address": null, 
           "id": "AC5yJVw71VIXbxuGADgNRhjy", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR6crgmDO2oHuUTg3ZSItGdG", 
         "transaction_number": "CR331-985-6049", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR6crgmDO2oHuUTg3ZSItGdG", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-07T17:29:23.855560Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU5zoAvSWj5KTtHBAm332Auk", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/credits", 
           "cards_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/cards", 
           "holds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:49.249513Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk", 
           "refunds_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/refunds", 
           "debits_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/debits", 
           "transactions_uri": "/v1/customers/CU5zoAvSWj5KTtHBAm332Auk/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-07T17:29:23.420727Z", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-07T17:28:48.666473Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/holds", 
           "email_address": null, 
           "id": "AC5yJVw71VIXbxuGADgNRhjy", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits/CR6bPq7j6Zd7TWwA8Ym4XDZu", 
         "transaction_number": "CR026-862-5219", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR6bPq7j6Zd7TWwA8Ym4XDZu", 
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
           "created_at": "2013-06-07T17:28:52.120940Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC5yJVw71VIXbxuGADgNRhjy", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/credits", 
           "type": "checking", 
           "id": "BA5CCEaAtwOFwbSafVgHQTOi", 
           "verifications_uri": "/v1/bank_accounts/BA5CCEaAtwOFwbSafVgHQTOi/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-07T17:29:23.266227Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy/credits?limit=2&offset=12"
   }

