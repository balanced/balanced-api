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

``customer``
   **string**. The customer to which this debit is associated.

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
   *optional* **string**. A customer or the account of a merchant, usually a seller or service
   provider, that is associated with this card charge or bank account
   debit.

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

``customer_uri``
   *optional* **string**.

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
       "on_behalf_of_uri": "v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC5yJVw71VIXbxuGADgNRhjy"
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
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6vb4PwDh9m0hFGmVJXKNFk", 
       "created_at": "2013-06-07T17:29:40.656863Z", 
       "is_void": false, 
       "expires_at": "2013-06-14T17:29:39.655886Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL6vcDSvUoKaumH3OAGSF3Ei", 
       "transaction_number": "HL719-806-0837", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "HL6vcDSvUoKaumH3OAGSF3Ei"
     }, 
     "id": "WD6vb4PwDh9m0hFGmVJXKNFk", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
       "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
       "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-07T17:28:26.175472Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
       "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
       "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6vb4PwDh9m0hFGmVJXKNFk/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-07T17:29:40.634703Z", 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6vb4PwDh9m0hFGmVJXKNFk", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-07T17:29:07.845193Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W876-892-3171", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-07T17:29:40.271188Z"
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
       "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6xyUtZqjQSwTny3hpFnQiI", 
       "created_at": "2013-06-07T17:29:42.772933Z", 
       "is_void": false, 
       "expires_at": "2013-06-14T17:29:42.104286Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL6xALvOlaqSfc8biBZNxtfi", 
       "transaction_number": "HL949-835-6527", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "HL6xALvOlaqSfc8biBZNxtfi"
     }, 
     "id": "WD6xyUtZqjQSwTny3hpFnQiI", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
       "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
       "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-07T17:28:26.175472Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
       "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
       "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6xyUtZqjQSwTny3hpFnQiI/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-07T17:29:42.746501Z", 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6xyUtZqjQSwTny3hpFnQiI", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-07T17:29:07.845193Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W878-053-1780", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-07T17:29:42.499348Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
           "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
           "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:26.175472Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
           "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
           "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6BldK5UlKK4ZXnw7K2TG36/refunds", 
         "amount": 431, 
         "created_at": "2013-06-07T17:29:46.106594Z", 
         "account": {
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6BldK5UlKK4ZXnw7K2TG36", 
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
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-07T17:29:07.845193Z", 
           "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W149-011-7204", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6BldK5UlKK4ZXnw7K2TG36", 
           "amount": 431, 
           "created_at": "2013-06-07T17:29:46.137048Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL6Bnme2UAAIj2syVJnmddrW", 
           "expires_at": "2013-06-14T17:29:45.419149Z", 
           "id": "HL6Bnme2UAAIj2syVJnmddrW", 
           "transaction_number": "HL731-291-7215", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ"
         }, 
         "id": "WD6BldK5UlKK4ZXnw7K2TG36", 
         "available_at": "2013-06-07T17:29:45.846251Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
           "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
           "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-07T17:28:26.175472Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
           "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
           "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6zSSn24eFfIydNS9vMP1rp/refunds", 
         "amount": 1254, 
         "created_at": "2013-06-07T17:29:44.809615Z", 
         "account": {
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6zSSn24eFfIydNS9vMP1rp", 
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
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-07T17:29:07.845193Z", 
           "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W066-824-4015", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6zSSn24eFfIydNS9vMP1rp", 
           "amount": 1254, 
           "created_at": "2013-06-07T17:29:44.829668Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL6zUhUzw9rAHge9sO2gfZ71", 
           "expires_at": "2013-06-14T17:29:44.181709Z", 
           "id": "HL6zUhUzw9rAHge9sO2gfZ71", 
           "transaction_number": "HL751-408-2347", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ"
         }, 
         "id": "WD6zSSn24eFfIydNS9vMP1rp", 
         "available_at": "2013-06-07T17:29:44.542984Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits?limit=2&offset=4"
   }

Update a Debit
--------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id

Request
~~~~~~~

``on_behalf_of_uri``
   *optional* **string**. A customer or the account of a merchant, usually a seller or service
   provider, that is associated with this card charge or bank account
   debit.

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
       "transaction_number": "W830-729-6438", 
       "created_at": "2013-06-07T17:29:48.163950+00:00Z", 
       "on_behalf_of": null, 
       "refunds_uri": "v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6DE6BMgDsDUd22DSN9GVj8/refunds", 
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
       "id": "WD6DE6BMgDsDUd22DSN9GVj8", 
       "available_at": "2013-06-07T17:29:47.892539+00:00Z"
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
       "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6G9BbBNZYf9vTKzlJg4WEU", 
       "created_at": "2013-06-07T17:29:50.413141Z", 
       "is_void": false, 
       "expires_at": "2013-06-14T17:29:49.745118Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL6GbxrePr59FYRYvagnz5Pa", 
       "transaction_number": "HL911-068-9923", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "HL6GbxrePr59FYRYvagnz5Pa"
     }, 
     "id": "WD6G9BbBNZYf9vTKzlJg4WEU", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
       "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
       "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-07T17:28:26.175472Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
       "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
       "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6G9BbBNZYf9vTKzlJg4WEU/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-07T17:29:50.385593Z", 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6G9BbBNZYf9vTKzlJg4WEU", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "id": "CC5Uj9iEBgd7fhJTmmCdwQyQ", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-07T17:29:07.845193Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W613-287-1619", 
     "meta": {
       "my-id": "0987654321"
     }, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-07T17:29:50.131808Z"
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
       "id": "CU59rpQCwKvEF1AbOzk3h2ki", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "bank_accounts_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/credits", 
       "cards_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/cards", 
       "holds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-07T17:28:26.175472Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "refunds_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/refunds", 
       "debits_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/debits", 
       "transactions_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1254, 
     "created_at": "2013-06-07T17:29:55.925713Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
       "created_at": "2013-06-07T17:28:25.862643Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
       "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
       "email_address": null, 
       "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/refunds/RF6MnmnY9RERtNAhjTOdJmwC", 
     "transaction_number": "RF145-173-7931", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/holds/HL6LqLVmX7XFMQpjzfaVfdXW", 
       "customer_uri": "/v1/customers/CU59rpQCwKvEF1AbOzk3h2ki", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
       "created_at": "2013-06-07T17:29:55.051373Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6LoXKc9mDaEwY6E6VD1xXW", 
       "status": "succeeded", 
       "transaction_number": "W389-119-7547", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/debits/WD6LoXKc9mDaEwY6E6VD1xXW/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
       "appears_on_statement_as": "example.com", 
       "id": "WD6LoXKc9mDaEwY6E6VD1xXW", 
       "available_at": "2013-06-07T17:29:54.864313Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF6MnmnY9RERtNAhjTOdJmwC"
   }

