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
       "destination_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
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
     "transaction_number": "CR731-786-7738", 
     "_uris": {}, 
     "id": "CR7z5ID6ExIFpRG945Fz0OgM", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-05T02:30:50.606562Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7iVqRsIEB6YqybOqftoa2r", 
       "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
       "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
       "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-05T02:30:47.174948Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
       "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
       "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
       "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
       "created_at": "2013-06-05T02:30:46.607596Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
       "email_address": null, 
       "id": "AC7es2SmXDh2rcN8tgzidSOe", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-05T02:31:04.959894Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-05T02:30:50.606562Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7iVqRsIEB6YqybOqftoa2r", 
       "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR7z5ID6ExIFpRG945Fz0OgM", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-05T02:31:04.794965Z"
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
       "destination_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
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
     "transaction_number": "CR116-166-9850", 
     "_uris": {}, 
     "id": "CR7C35oczO6uHwed1ScOzFQc", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-05T02:30:50.606562Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7iVqRsIEB6YqybOqftoa2r", 
       "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
       "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
       "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-05T02:30:47.174948Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
       "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
       "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
       "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
       "created_at": "2013-06-05T02:30:46.607596Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
       "email_address": null, 
       "id": "AC7es2SmXDh2rcN8tgzidSOe", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-05T02:31:07.588612Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-05T02:30:50.606562Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7iVqRsIEB6YqybOqftoa2r", 
       "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR7C35oczO6uHwed1ScOzFQc", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-05T02:31:07.427514Z"
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
     "transaction_number": "CR468-962-7098", 
     "_uris": {}, 
     "id": "CR7EFsbMwuffUEfCiyd9bgAo", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-05T02:30:50.606562Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7iVqRsIEB6YqybOqftoa2r", 
       "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
       "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
       "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-05T02:30:47.174948Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
       "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
       "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
       "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
       "created_at": "2013-06-05T02:30:46.607596Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
       "email_address": null, 
       "id": "AC7es2SmXDh2rcN8tgzidSOe", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
     }, 
     "fee": null, 
     "amount": 1243, 
     "created_at": "2013-06-05T02:31:09.917873Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-05T02:30:50.606562Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7iVqRsIEB6YqybOqftoa2r", 
       "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR7EFsbMwuffUEfCiyd9bgAo", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-05T02:31:09.786139Z"
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
     "transaction_number": "CR976-221-6164", 
     "_uris": {}, 
     "id": "CR7G6vIrfTk5x9GXLdIH4wKO", 
     "bank_account": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-05T02:30:50.606562Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7iVqRsIEB6YqybOqftoa2r", 
       "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
       "account_number": "xxx233a"
     }, 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
       "email": null, 
       "_type": "customer", 
       "source_uri": null, 
       "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
       "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "business_name": null, 
       "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
       "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
       "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-05T02:30:47.174948Z", 
       "is_identity_verified": true, 
       "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
       "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
       "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
       "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
       "created_at": "2013-06-05T02:30:46.607596Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
       "email_address": null, 
       "id": "AC7es2SmXDh2rcN8tgzidSOe", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
     }, 
     "fee": null, 
     "amount": 1254, 
     "created_at": "2013-06-05T02:31:11.202850Z", 
     "destination": {
       "routing_number": "121042882", 
       "bank_name": "WELLS FARGO BANK NA", 
       "_type": "bank_account", 
       "verification_uri": null, 
       "name": "Homer Jay", 
       "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
       "bank_code": "121042882", 
       "type": "checking", 
       "created_at": "2013-06-05T02:30:50.606562Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
       "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
       "last_four": "233a", 
       "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
       "can_debit": false, 
       "id": "BA7iVqRsIEB6YqybOqftoa2r", 
       "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
       "account_number": "xxx233a"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR7G6vIrfTk5x9GXLdIH4wKO", 
     "state": "cleared", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-05T02:31:11.063034Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
           "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
           "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:47.174948Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
           "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
           "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-05T02:31:13.528902Z", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-05T02:30:46.607596Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
           "email_address": null, 
           "id": "AC7es2SmXDh2rcN8tgzidSOe", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR7IJ9pzoR37PnMUhRlMdTAz", 
         "transaction_number": "CR518-001-2817", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7IJ9pzoR37PnMUhRlMdTAz", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-05T02:31:13.406258Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
           "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
           "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:47.174948Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
           "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
           "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-05T02:31:12.959152Z", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-05T02:30:46.607596Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
           "email_address": null, 
           "id": "AC7es2SmXDh2rcN8tgzidSOe", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR7I5As9jdaR8WSjtbFR2JQA", 
         "transaction_number": "CR739-807-7898", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7I5As9jdaR8WSjtbFR2JQA", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-05T02:31:12.830837Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/credits?limit=2&offset=8"
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
     "first_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Yet another description", 
         "created_at": "2013-06-05T02:31:16.449217Z", 
         "uri": "/v1/credits/CR7M0VX73rxgcCraTjQxu4og", 
         "amount": 1452, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7M0VX73rxgcCraTjQxu4og", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
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
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications"
         }
       }, 
       {
         "status": "paid", 
         "_type": "credit", 
         "description": "Another description", 
         "created_at": "2013-06-05T02:31:15.696186Z", 
         "uri": "/v1/credits/CR7Las0PAVZAMNXhAHpZc7zQ", 
         "amount": 431, 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR7Las0PAVZAMNXhAHpZc7zQ", 
         "bank_account": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "Homer Jay", 
           "can_debit": false, 
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
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
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications"
         }
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits?limit=2&offset=2", 
     "last_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits?limit=2&offset=10"
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
     "first_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
           "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
           "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:47.174948Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
           "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
           "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-05T02:31:19.022234Z", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-05T02:30:46.607596Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
           "email_address": null, 
           "id": "AC7es2SmXDh2rcN8tgzidSOe", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR1QhBLSAf6Sp7b8QIoyN60", 
         "transaction_number": "CR329-011-3956", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR1QhBLSAf6Sp7b8QIoyN60", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-05T02:31:18.850150Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "email": null, 
           "_type": "customer", 
           "source_uri": null, 
           "bank_accounts_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/bank_accounts", 
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
           "destination_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "business_name": null, 
           "credits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/credits", 
           "cards_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/cards", 
           "holds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:47.174948Z", 
           "is_identity_verified": true, 
           "uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw", 
           "refunds_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/refunds", 
           "debits_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/debits", 
           "transactions_uri": "/v1/customers/CU7f5AM7kd7Y9NJRe3d7RXJw/transactions", 
           "ssn_last4": null, 
           "ein": "393483992"
         }, 
         "status": "paid", 
         "_type": "credit", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-05T02:31:18.319064Z", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "account": {
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/transactions", 
           "name": "William James", 
           "roles": [
             "merchant"
           ], 
           "created_at": "2013-06-05T02:30:46.607596Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/holds", 
           "email_address": null, 
           "id": "AC7es2SmXDh2rcN8tgzidSOe", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits/CR13figjSyrzm2Hi4OfgEGI", 
         "transaction_number": "CR707-798-4384", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR13figjSyrzm2Hi4OfgEGI", 
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
           "created_at": "2013-06-05T02:30:50.606562Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC7es2SmXDh2rcN8tgzidSOe", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe", 
           "last_four": "233a", 
           "fingerprint": "5RmnMJRZsh25mMx985ApmR", 
           "credits_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/credits", 
           "type": "checking", 
           "id": "BA7iVqRsIEB6YqybOqftoa2r", 
           "verifications_uri": "/v1/bank_accounts/BA7iVqRsIEB6YqybOqftoa2r/verifications", 
           "account_number": "xxx233a"
         }, 
         "available_at": "2013-06-05T02:31:18.168905Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe/credits?limit=2&offset=12"
   }

