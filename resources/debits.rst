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
       "on_behalf_of_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4AH8Q2WpuVJVujfM25B6Qg"
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
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5DMqr62vNthWwpfiD7XGyQ", 
       "created_at": "2013-06-06T22:45:02.188930Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:45:01.401012Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL5DO2RamEO3xBHNbgvDB0Vq", 
       "transaction_number": "HL573-998-0695", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "HL5DO2RamEO3xBHNbgvDB0Vq"
     }, 
     "id": "WD5DMqr62vNthWwpfiD7XGyQ", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
       "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
       "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T22:43:42.219634Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
       "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
       "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
       "created_at": "2013-06-06T22:43:41.675985Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
       "email_address": null, 
       "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
       "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5DMqr62vNthWwpfiD7XGyQ/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T22:45:02.165834Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5DMqr62vNthWwpfiD7XGyQ", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:44:24.496765Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W678-211-8245", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:45:01.908157Z"
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
       "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5GeNQQNcNS9cI02r67dXE2", 
       "created_at": "2013-06-06T22:45:04.376051Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:45:03.684351Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL5GggjRvkYpfUnWsvKrUZw2", 
       "transaction_number": "HL329-244-3897", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "HL5GggjRvkYpfUnWsvKrUZw2"
     }, 
     "id": "WD5GeNQQNcNS9cI02r67dXE2", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
       "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
       "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T22:43:42.219634Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
       "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
       "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
       "created_at": "2013-06-06T22:43:41.675985Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
       "email_address": null, 
       "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
       "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5GeNQQNcNS9cI02r67dXE2/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T22:45:04.361599Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5GeNQQNcNS9cI02r67dXE2", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:44:24.496765Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W503-715-5887", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:45:04.070580Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
           "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
           "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:43:42.219634Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
           "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
           "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5KSKYiGfDcva4mkFenSGrQ/refunds", 
         "amount": 431, 
         "created_at": "2013-06-06T22:45:08.484680Z", 
         "account": {
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T22:43:41.675985Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
           "email_address": null, 
           "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5KSKYiGfDcva4mkFenSGrQ", 
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
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:44:24.496765Z", 
           "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W530-290-0311", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5KSKYiGfDcva4mkFenSGrQ", 
           "amount": 431, 
           "created_at": "2013-06-06T22:45:08.505764Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL5KUeT6R6wAjKCG0VZaFyFU", 
           "expires_at": "2013-06-13T22:45:07.899536Z", 
           "id": "HL5KUeT6R6wAjKCG0VZaFyFU", 
           "transaction_number": "HL527-713-8329", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0"
         }, 
         "id": "WD5KSKYiGfDcva4mkFenSGrQ", 
         "available_at": "2013-06-06T22:45:08.270234Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
           "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
           "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T22:43:42.219634Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
           "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
           "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5JnO2D5z9xuHEdUJPRQ5TO/refunds", 
         "amount": 1254, 
         "created_at": "2013-06-06T22:45:07.149851Z", 
         "account": {
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T22:43:41.675985Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
           "email_address": null, 
           "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
           "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5JnO2D5z9xuHEdUJPRQ5TO", 
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
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:44:24.496765Z", 
           "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W583-812-7786", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5JnO2D5z9xuHEdUJPRQ5TO", 
           "amount": 1254, 
           "created_at": "2013-06-06T22:45:07.183200Z", 
           "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL5Jq9Zizwh1BK0IrPfShSpa", 
           "expires_at": "2013-06-13T22:45:06.256982Z", 
           "id": "HL5Jq9Zizwh1BK0IrPfShSpa", 
           "transaction_number": "HL608-942-7343", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
           "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0"
         }, 
         "id": "WD5JnO2D5z9xuHEdUJPRQ5TO", 
         "available_at": "2013-06-06T22:45:06.819618Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits?limit=2&offset=4"
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
       "transaction_number": "W558-572-2516", 
       "created_at": "2013-06-06T22:45:11.387910+00:00Z", 
       "on_behalf_of": null, 
       "refunds_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5O9MsTbzHOhWxgRzK1v67d/refunds", 
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
       "id": "WD5O9MsTbzHOhWxgRzK1v67d", 
       "available_at": "2013-06-06T22:45:10.982855+00:00Z"
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
       "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5QN680OhU4RJAbHRjyZVGO", 
       "created_at": "2013-06-06T22:45:13.770340Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:45:12.947526Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL5QPHJ28qmBhI4YpeDqfUzU", 
       "transaction_number": "HL925-171-4339", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "HL5QPHJ28qmBhI4YpeDqfUzU"
     }, 
     "id": "WD5QN680OhU4RJAbHRjyZVGO", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
       "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
       "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T22:43:42.219634Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
       "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
       "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
       "created_at": "2013-06-06T22:43:41.675985Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
       "email_address": null, 
       "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
       "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5QN680OhU4RJAbHRjyZVGO/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T22:45:13.732624Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5QN680OhU4RJAbHRjyZVGO", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "id": "CC4Xpwa5KhoSRi91u2L7i6U0", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:44:24.496765Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W006-078-2777", 
     "meta": {
       "my-id": "0987654321"
     }, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:45:13.386290Z"
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
       "id": "CU4bRFpZP6HcG0OsV3QfqZFo", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "bank_accounts_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/credits", 
       "cards_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/cards", 
       "holds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T22:43:42.219634Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "refunds_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/refunds", 
       "debits_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/debits", 
       "transactions_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T22:45:21.525726Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
       "created_at": "2013-06-06T22:43:41.675985Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
       "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits", 
       "email_address": null, 
       "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
       "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/refunds/RF5Zy77LhTxbcw2TXraWNSzY", 
     "transaction_number": "RF789-886-2370", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/holds/HL5Y9MFADCXebqw6zSKLhtr0", 
       "customer_uri": "/v1/customers/CU4bRFpZP6HcG0OsV3QfqZFo", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards/CC4Xpwa5KhoSRi91u2L7i6U0", 
       "created_at": "2013-06-06T22:45:20.252304Z", 
       "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5Y7jYurerh0kHtATui5d66", 
       "status": "succeeded", 
       "transaction_number": "W936-066-4154", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/debits/WD5Y7jYurerh0kHtATui5d66/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
       "appears_on_statement_as": "example.com", 
       "id": "WD5Y7jYurerh0kHtATui5d66", 
       "available_at": "2013-06-06T22:45:19.711682Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF5Zy77LhTxbcw2TXraWNSzY"
   }

