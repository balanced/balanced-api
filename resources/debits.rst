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
       "on_behalf_of_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte"
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
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4vY7ZnmqCGLoJ0mNs2Er7s", 
       "created_at": "2013-06-06T23:41:16.097426Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T23:41:15.421228Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL4w0aRF8ON9Y8lS36axjd5U", 
       "transaction_number": "HL047-579-6124", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "id": "HL4w0aRF8ON9Y8lS36axjd5U"
     }, 
     "id": "WD4vY7ZnmqCGLoJ0mNs2Er7s", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU39fUvgDHWJADM2SplV2JYj", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "bank_accounts_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/credits", 
       "cards_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/cards", 
       "holds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:40:00.745711Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "refunds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/refunds", 
       "debits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/debits", 
       "transactions_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
       "created_at": "2013-06-06T23:40:00.440155Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
       "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits", 
       "email_address": null, 
       "id": "AC38UBtmXyKEBQS90mN0U4ft", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4vY7ZnmqCGLoJ0mNs2Er7s/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T23:41:16.068247Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4vY7ZnmqCGLoJ0mNs2Er7s", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "id": "CC3WlOIMnA4AjcNTzG4dG5fA", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:40:44.399892Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W045-237-5476", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:41:15.777573Z"
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
       "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4y37o8rflIze0DU2V4zgcw", 
       "created_at": "2013-06-06T23:41:17.947855Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T23:41:17.300684Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL4y5ezFEDbjEvdFAC2H8QGA", 
       "transaction_number": "HL521-693-5235", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "id": "HL4y5ezFEDbjEvdFAC2H8QGA"
     }, 
     "id": "WD4y37o8rflIze0DU2V4zgcw", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU39fUvgDHWJADM2SplV2JYj", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "bank_accounts_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/credits", 
       "cards_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/cards", 
       "holds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:40:00.745711Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "refunds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/refunds", 
       "debits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/debits", 
       "transactions_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
       "created_at": "2013-06-06T23:40:00.440155Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
       "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits", 
       "email_address": null, 
       "id": "AC38UBtmXyKEBQS90mN0U4ft", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4y37o8rflIze0DU2V4zgcw/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T23:41:17.917637Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4y37o8rflIze0DU2V4zgcw", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "id": "CC3WlOIMnA4AjcNTzG4dG5fA", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:40:44.399892Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W464-986-6782", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:41:17.666073Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU39fUvgDHWJADM2SplV2JYj", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "bank_accounts_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/credits", 
           "cards_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/cards", 
           "holds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:40:00.745711Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "refunds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/refunds", 
           "debits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/debits", 
           "transactions_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4BUJq4sCTDgoOs6G3xi0fJ/refunds", 
         "amount": 431, 
         "created_at": "2013-06-06T23:41:21.351049Z", 
         "account": {
           "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:40:00.440155Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
           "email_address": null, 
           "id": "AC38UBtmXyKEBQS90mN0U4ft", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4BUJq4sCTDgoOs6G3xi0fJ", 
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
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T23:40:44.399892Z", 
           "id": "CC3WlOIMnA4AjcNTzG4dG5fA", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W464-518-5392", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4BUJq4sCTDgoOs6G3xi0fJ", 
           "amount": 431, 
           "created_at": "2013-06-06T23:41:21.403211Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL4BYnBO1JR8Va5QMFD7R6Kb", 
           "expires_at": "2013-06-13T23:41:20.746861Z", 
           "id": "HL4BYnBO1JR8Va5QMFD7R6Kb", 
           "transaction_number": "HL274-451-0526", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA"
         }, 
         "id": "WD4BUJq4sCTDgoOs6G3xi0fJ", 
         "available_at": "2013-06-06T23:41:21.122744Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU39fUvgDHWJADM2SplV2JYj", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "bank_accounts_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/credits", 
           "cards_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/cards", 
           "holds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:40:00.745711Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "refunds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/refunds", 
           "debits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/debits", 
           "transactions_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4AoWgR2QeFe6AljjhboyCe/refunds", 
         "amount": 1254, 
         "created_at": "2013-06-06T23:41:20.009146Z", 
         "account": {
           "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:40:00.440155Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
           "email_address": null, 
           "id": "AC38UBtmXyKEBQS90mN0U4ft", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4AoWgR2QeFe6AljjhboyCe", 
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
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T23:40:44.399892Z", 
           "id": "CC3WlOIMnA4AjcNTzG4dG5fA", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W087-946-6160", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4AoWgR2QeFe6AljjhboyCe", 
           "amount": 1254, 
           "created_at": "2013-06-06T23:41:20.065796Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL4AsTWYnWNcfqj3FeqlrDoS", 
           "expires_at": "2013-06-13T23:41:19.270647Z", 
           "id": "HL4AsTWYnWNcfqj3FeqlrDoS", 
           "transaction_number": "HL841-655-3762", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA"
         }, 
         "id": "WD4AoWgR2QeFe6AljjhboyCe", 
         "available_at": "2013-06-06T23:41:19.620218Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits?limit=2&offset=4"
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
       "transaction_number": "W608-062-0739", 
       "created_at": "2013-06-06T23:41:23.605923+00:00Z", 
       "on_behalf_of": null, 
       "refunds_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4Ermib5wY8rnHCVu30uH9s/refunds", 
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
       "id": "WD4Ermib5wY8rnHCVu30uH9s", 
       "available_at": "2013-06-06T23:41:23.374053+00:00Z"
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
       "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4GDGOTaxUkWcetISIB4Fck", 
       "created_at": "2013-06-06T23:41:25.571882Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T23:41:24.924929Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL4GESRPNYsFjGsFT1xqj0ha", 
       "transaction_number": "HL771-584-4642", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "id": "HL4GESRPNYsFjGsFT1xqj0ha"
     }, 
     "id": "WD4GDGOTaxUkWcetISIB4Fck", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU39fUvgDHWJADM2SplV2JYj", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "bank_accounts_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/credits", 
       "cards_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/cards", 
       "holds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:40:00.745711Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "refunds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/refunds", 
       "debits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/debits", 
       "transactions_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
       "created_at": "2013-06-06T23:40:00.440155Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
       "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits", 
       "email_address": null, 
       "id": "AC38UBtmXyKEBQS90mN0U4ft", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4GDGOTaxUkWcetISIB4Fck/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T23:41:25.554961Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4GDGOTaxUkWcetISIB4Fck", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "id": "CC3WlOIMnA4AjcNTzG4dG5fA", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:40:44.399892Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W800-407-2228", 
     "meta": {
       "my-id": "0987654321"
     }, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:41:25.283416Z"
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
       "id": "CU39fUvgDHWJADM2SplV2JYj", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "bank_accounts_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/credits", 
       "cards_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/cards", 
       "holds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:40:00.745711Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "refunds_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/refunds", 
       "debits_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/debits", 
       "transactions_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T23:41:30.651713Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
       "created_at": "2013-06-06T23:40:00.440155Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
       "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits", 
       "email_address": null, 
       "id": "AC38UBtmXyKEBQS90mN0U4ft", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds/RF4MniBuGoEFkmcEv7uO0LJJ", 
     "transaction_number": "RF024-949-4480", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL4LuWOsDLuHpm5lIIgtWPxg", 
       "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "created_at": "2013-06-06T23:41:29.857779Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4LtIAGv3zDcAYwVDikVyoa", 
       "status": "succeeded", 
       "transaction_number": "W555-476-2785", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD4LtIAGv3zDcAYwVDikVyoa/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
       "appears_on_statement_as": "example.com", 
       "id": "WD4LtIAGv3zDcAYwVDikVyoa", 
       "available_at": "2013-06-06T23:41:29.584439Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF4MniBuGoEFkmcEv7uO0LJJ"
   }

