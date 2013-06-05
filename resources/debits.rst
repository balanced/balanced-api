Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_
- `Refund a Debit`_

Fields
------

``account_email_address``
   **object**.

``account_name``
   **object**.

``amount``
   **integer**. The amount of the debit.

``appears_on_statement_as``
   **string**. The text that will appear on the buyer's statement.

``available_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   transaction is guaranteed to clear.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   debit was created.

``description``
   **string**. Free-text description of the debit.

``hold``
   **object**. The original hold for this debit, if this debit was to a card.
   If the debit was to a bank account, this field will be null.

``id``
   **string**.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``refunds_uri``
   **string**. URI for any partial or complete refunds of this debit.

``source``
   **object**. The funding source (card or bank account) for this debit.

``status``
   **string**. One of ``pending``, ``charged``, ``failed``.

``transaction_number``
   **string**. An identifier for this transaction.

``uri``
   **string**. The URI of the debit.

Deprecated
~~~~~~~~~~

Debit an Account
----------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts/:account_id/debits

Request
~~~~~~~

``on_behalf_of_uri``
   *optional* **string**. The account of a merchant, usually a seller or service provider, that
   is associated with this card charge or bank account debit.

``amount``
   *optional* **integer**. If the resolving URI references a hold then this is hold amount. You can
   always capture less than the hold amount (e.g. a partial capture).
   Otherwise its the maximum per debit amount for your marketplace. If the resolving URI references a hold then the default ``amount``
   is the ``amount`` associated with that hold. Otherwise no default
   is provided and this field is **required**.

``appears_on_statement_as``
   *optional* **string**. Text that will appear on the buyer's statement. Characters that can be
   used are limited to:

   - ASCII letters (``a-z`` and ``A-Z``)
   - Digits (``0-9``)
   - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

   Any other characters will be rejected.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``description``
   *optional* **string**. Defaults to ``null``.

``hold_uri``
   *optional* **string**. If no ``hold`` is provided one my be generated and captured if the
   funding source is a card. If the resolved URI references a ``hold`` it will be used. Otherwise
   defaults to ``null``.

``source_uri``
   *optional* **string**. URI of a specific bank account or card to be debited.

``bank_account_uri``
   *optional* **string**. **Deprecated**
   This field is deprecated in favour of ``source_uri``.


Body
^^^^

.. code:: javascript

   {
       "hold_uri": null, 
       "description": null, 
       "source_uri": null, 
       "amount": 1254, 
       "merchant_uri": null, 
       "meta": {}, 
       "appears_on_statement_as": null, 
       "on_behalf_of_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC7es2SmXDh2rcN8tgzidSOe"
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
     "status": "succeeded", 
     "_type": "debit", 
     "description": null, 
     "on_behalf_of": {
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
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDFWBGzSb1VuSlRY6jDbGEm", 
       "created_at": "2013-06-05T02:31:54.701465Z", 
       "is_void": false, 
       "expires_at": "2013-06-12T02:31:53.974860Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HLFXMQzyo6284JmhLwgMmr4", 
       "transaction_number": "HL869-411-1656", 
       "amount": 1254, 
       "_uris": {
         "debit_uri": {
           "_type": "debit", 
           "key": "debit"
         }, 
         "source_uri": {
           "_type": "card", 
           "key": "source"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "HLFXMQzyo6284JmhLwgMmr4"
     }, 
     "id": "WDFWBGzSb1VuSlRY6jDbGEm", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6zEbRwNXbovDRX0bThtz18", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
       "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
       "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-05T02:30:10.328398Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
       "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
       "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
       "ssn_last4": null, 
       "ein": null
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDFWBGzSb1VuSlRY6jDbGEm/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-05T02:31:54.684724Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDFWBGzSb1VuSlRY6jDbGEm", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
       "card_type": "visa", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-05T02:31:01.301776Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W954-848-3948", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-05T02:31:54.353484Z"
   }

Retrieve a Debit
----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id

Request
~~~~~~~


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "status": "succeeded", 
     "_type": "debit", 
     "description": null, 
     "on_behalf_of": null, 
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDI1UtytSoDsMj8HGFhiJqf", 
       "created_at": "2013-06-05T02:31:56.542027Z", 
       "is_void": false, 
       "expires_at": "2013-06-12T02:31:55.870092Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HLI2zDGLW5h4WkDD3WiEidx", 
       "transaction_number": "HL771-193-5503", 
       "amount": 1254, 
       "_uris": {
         "debit_uri": {
           "_type": "debit", 
           "key": "debit"
         }, 
         "source_uri": {
           "_type": "card", 
           "key": "source"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "HLI2zDGLW5h4WkDD3WiEidx"
     }, 
     "id": "WDI1UtytSoDsMj8HGFhiJqf", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6zEbRwNXbovDRX0bThtz18", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
       "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
       "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-05T02:30:10.328398Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
       "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
       "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
       "ssn_last4": null, 
       "ein": null
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDI1UtytSoDsMj8HGFhiJqf/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-05T02:31:56.532771Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDI1UtytSoDsMj8HGFhiJqf", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
       "card_type": "visa", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-05T02:31:01.301776Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W210-052-5681", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-05T02:31:56.245016Z"
   }

List All Debits
---------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits

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
     "first_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6zEbRwNXbovDRX0bThtz18", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:10.328398Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDM8bDHuDTDCSG9dZJHejWo/refunds", 
         "amount": 431, 
         "created_at": "2013-06-05T02:32:00.176953Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-05T02:30:09.949061Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
           "email_address": null, 
           "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDM8bDHuDTDCSG9dZJHejWo", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-05T02:31:01.301776Z", 
           "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W034-381-6104", 
         "_uris": {
           "refunds_uri": {
             "_type": "page", 
             "key": "refunds"
           }
         }, 
         "meta": {}, 
         "on_behalf_of": null, 
         "appears_on_statement_as": "example.com", 
         "hold": {
           "_type": "hold", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "debit_uri": {
               "_type": "debit", 
               "key": "debit"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }
           }, 
           "debit_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDM8bDHuDTDCSG9dZJHejWo", 
           "amount": 431, 
           "created_at": "2013-06-05T02:32:00.199880Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HLM9NJoKG5HyXUnfUv0nP0s", 
           "expires_at": "2013-06-12T02:31:59.517256Z", 
           "id": "HLM9NJoKG5HyXUnfUv0nP0s", 
           "transaction_number": "HL056-046-8192", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb"
         }, 
         "id": "WDM8bDHuDTDCSG9dZJHejWo", 
         "available_at": "2013-06-05T02:31:59.902646Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6zEbRwNXbovDRX0bThtz18", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-05T02:30:10.328398Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDKzmceCi4ivLj9RcDw74kv/refunds", 
         "amount": 1254, 
         "created_at": "2013-06-05T02:31:58.790536Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-05T02:30:09.949061Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
           "email_address": null, 
           "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDKzmceCi4ivLj9RcDw74kv", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-05T02:31:01.301776Z", 
           "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W662-022-6597", 
         "_uris": {
           "refunds_uri": {
             "_type": "page", 
             "key": "refunds"
           }
         }, 
         "meta": {}, 
         "on_behalf_of": null, 
         "appears_on_statement_as": "example.com", 
         "hold": {
           "_type": "hold", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "debit_uri": {
               "_type": "debit", 
               "key": "debit"
             }, 
             "source_uri": {
               "_type": "card", 
               "key": "source"
             }
           }, 
           "debit_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDKzmceCi4ivLj9RcDw74kv", 
           "amount": 1254, 
           "created_at": "2013-06-05T02:31:58.812514Z", 
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HLKAU8RYo0uJ5VNPSyiAFxd", 
           "expires_at": "2013-06-12T02:31:58.232743Z", 
           "id": "HLKAU8RYo0uJ5VNPSyiAFxd", 
           "transaction_number": "HL617-372-7612", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
           "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb"
         }, 
         "id": "WDKzmceCi4ivLj9RcDw74kv", 
         "available_at": "2013-06-05T02:31:58.589297Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits?limit=2&offset=0", 
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
     "total": 6, 
     "next_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits?limit=2&offset=4"
   }

Update a Debit
--------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id

Request
~~~~~~~

``on_behalf_of_uri``
   *optional* **string**. The account of a merchant, usually a seller or service provider, that
   is associated with this card charge or bank account debit.

``merchant_uri``
   *optional* **string**. **Deprecated** The account of a merchant, usually a seller or service
   provider, that is associated with this card charge or bank account
   debit. Deprecated in favour of ``on_behalf_of_uri``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values.

``description``
   *optional* **string**.


Body
^^^^

.. code:: javascript

   {
       "status": "succeeded", 
       "_type": "debit", 
       "fee": null, 
       "description": "my new description", 
       "transaction_number": "W482-148-6456", 
       "created_at": "2013-06-05T02:32:02.756466+00:00Z", 
       "on_behalf_of": null, 
       "refunds_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDP20G4ju66PYWkgmGCKZkI/refunds", 
       "amount": 1254, 
       "_uris": {
           "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
           }
       }, 
       "meta": {
           "my-id": "0987654321"
       }, 
       "appears_on_statement_as": "example.com", 
       "id": "WDP20G4ju66PYWkgmGCKZkI", 
       "available_at": "2013-06-05T02:32:02.418683+00:00Z"
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
     "status": "succeeded", 
     "_type": "debit", 
     "description": "my new description", 
     "on_behalf_of": null, 
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDRn3tLL7VL809NsCaF0Guu", 
       "created_at": "2013-06-05T02:32:04.872969Z", 
       "is_void": false, 
       "expires_at": "2013-06-12T02:32:04.143695Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HLRpFk4nQvaMF7s5wPq82lY", 
       "transaction_number": "HL510-821-1177", 
       "amount": 1254, 
       "_uris": {
         "debit_uri": {
           "_type": "debit", 
           "key": "debit"
         }, 
         "source_uri": {
           "_type": "card", 
           "key": "source"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "HLRpFk4nQvaMF7s5wPq82lY"
     }, 
     "id": "WDRn3tLL7VL809NsCaF0Guu", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6zEbRwNXbovDRX0bThtz18", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
       "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
       "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-05T02:30:10.328398Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
       "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
       "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
       "ssn_last4": null, 
       "ein": null
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDRn3tLL7VL809NsCaF0Guu/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-05T02:32:04.835749Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDRn3tLL7VL809NsCaF0Guu", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "id": "CC7uYy1Z3UTZykFqReFNpvwb", 
       "card_type": "visa", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-05T02:31:01.301776Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W454-717-4855", 
     "meta": {
       "my-id": "0987654321"
     }, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-05T02:32:04.586544Z"
   }

Refund a Debit
--------------

.. code::


   POST /v1/marketplaces/:marketplace_id/debits/:debit_id/refunds

Request
~~~~~~~

``amount``
   *optional* **integer**. Defaults to ``null``.

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.


Body
^^^^

.. code:: javascript

   {}

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
       "id": "CU6zEbRwNXbovDRX0bThtz18", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits", 
       "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards", 
       "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-05T02:30:10.328398Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds", 
       "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits", 
       "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1254, 
     "created_at": "2013-06-05T02:32:10.360516Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
       "created_at": "2013-06-05T02:30:09.949061Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
       "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
       "email_address": null, 
       "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
       "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/refunds/RFXAjGbMmnfYDzaIk1wG2hq", 
     "transaction_number": "RF021-791-1600", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/holds/HLWC09fM9emaqijjqBaerBS", 
       "customer_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
       "created_at": "2013-06-05T02:32:09.475514Z", 
       "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDWAxDifERCdWb2Ha4LhFYk", 
       "status": "succeeded", 
       "transaction_number": "W778-306-3621", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/debits/WDWAxDifERCdWb2Ha4LhFYk/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
       "appears_on_statement_as": "example.com", 
       "id": "WDWAxDifERCdWb2Ha4LhFYk", 
       "available_at": "2013-06-05T02:32:09.122325Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RFXAjGbMmnfYDzaIk1wG2hq"
   }

