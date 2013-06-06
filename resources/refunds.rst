Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

``account_email_address``
   **object**.

``account_name``
   **object**.

``amount``
   **integer**. The amount of the refund.

``appears_on_statement_as``
   **string**. Text that will appear on the statement describing this refund.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   refund was issued.

``debit``
   **object**. The original debit associated with the refund.

``description``
   **string**. Free-text description of the refund.

``id``
   **string**.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``transaction_number``
   **string**. An identifier for this transaction.

``uri``
   **string**.

Deprecated
~~~~~~~~~~

Refund an Account
-----------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds

Request
~~~~~~~

``amount``
   *optional* **integer**. Defaults to ``null``.

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``debit_uri``
   *optional* **string**. If the resolving URI references a ``debit`` then that is used as the
   default. Otherwise no default is provided and this field is
   **required**.


Body
^^^^

.. code:: javascript

   {
       "debit_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5gRe0wOhw5my9bljkcY34S", 
       "amount": 1234, 
       "meta": {}, 
       "description": null
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
     "amount": 1234, 
     "created_at": "2013-06-06T23:42:01.019230Z", 
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
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds/RF5kwiDitbmuZebV9nryaQ8S", 
     "transaction_number": "RF099-030-0104", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5jwwtadMDNUtiHVwXgzJ8K", 
       "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "created_at": "2013-06-06T23:42:00.116851Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5jvLZkcq1POAaXVhZ7oaAG", 
       "status": "succeeded", 
       "transaction_number": "W059-205-4728", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5jvLZkcq1POAaXVhZ7oaAG/refunds", 
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
       "id": "WD5jvLZkcq1POAaXVhZ7oaAG", 
       "available_at": "2013-06-06T23:41:59.877382Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF5kwiDitbmuZebV9nryaQ8S"
   }

Retrieve a Refund
-----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id

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
     "created_at": "2013-06-06T23:42:03.508407Z", 
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
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds/RF5nkinxqAnaQIkiMjQReUo0", 
     "transaction_number": "RF613-063-4664", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5myMQPfNE1ACUEtUGdcXt4", 
       "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "created_at": "2013-06-06T23:42:02.817621Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5mxHyzXd35O5gIeXH81ri6", 
       "status": "succeeded", 
       "transaction_number": "W064-722-5336", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5mxHyzXd35O5gIeXH81ri6/refunds", 
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
       "id": "WD5mxHyzXd35O5gIeXH81ri6", 
       "available_at": "2013-06-06T23:42:02.618030Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF5nkinxqAnaQIkiMjQReUo0"
   }

List All Refunds
----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds

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
     "first_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds?limit=2&offset=0", 
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
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T23:42:07.782223Z", 
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
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds/RF5s8iwfkO7eGpsXo7jQm37I", 
         "transaction_number": "RF371-266-3435", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5rh2L1S7jWJ2R4vIkkRcVW", 
           "status": "succeeded", 
           "_type": "debit", 
           "fee": null, 
           "description": null, 
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
           "amount": 431, 
           "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5rf93OQP9qI6i4MmV5bTYk", 
           "id": "WD5rf93OQP9qI6i4MmV5bTYk", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5rf93OQP9qI6i4MmV5bTYk/refunds", 
           "transaction_number": "W622-825-9626", 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:42:06.991060Z", 
           "available_at": "2013-06-06T23:42:06.753309Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF5s8iwfkO7eGpsXo7jQm37I"
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
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T23:42:05.862374Z", 
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
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds/RF5pYrLUTD5TvN4rNySlJ9TO", 
         "transaction_number": "RF943-881-3155", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5pgeCBXdcWGrtnxeQDmKxO", 
           "status": "succeeded", 
           "_type": "debit", 
           "fee": null, 
           "description": null, 
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
           "amount": 1254, 
           "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5pfWpiS5NEOcFCdTQm91OM", 
           "id": "WD5pfWpiS5NEOcFCdTQm91OM", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5pfWpiS5NEOcFCdTQm91OM/refunds", 
           "transaction_number": "W258-683-9837", 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:42:05.226754Z", 
           "available_at": "2013-06-06T23:42:04.946298Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF5pYrLUTD5TvN4rNySlJ9TO"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds?limit=2&offset=0", 
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
     "total": 8, 
     "next_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds?limit=2&offset=6"
   }

Update a Refund
---------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id

Request
~~~~~~~

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values.


Body
^^^^

.. code:: javascript

   {
       "_type": "refund", 
       "fee": null, 
       "description": "my new description", 
       "created_at": "2013-06-06T23:42:10.474378+00:00Z", 
       "transaction_number": "RF974-116-4725", 
       "amount": 1254, 
       "_uris": {}, 
       "meta": {
           "my-id": "0987654321"
       }, 
       "appears_on_statement_as": "example.com", 
       "id": "RF5vafJ5NKEaISUzH1ptoOwT"
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
     "description": "my new description", 
     "amount": 1254, 
     "created_at": "2013-06-06T23:42:12.847012Z", 
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
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds/RF5xPug4h7Gq4tWrldfzAG14", 
     "transaction_number": "RF359-740-5596", 
     "_uris": {}, 
     "meta": {
       "my-id": "0987654321"
     }, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5x2AaFem3zfBw3BFJQWmJc", 
       "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
       "created_at": "2013-06-06T23:42:12.127870Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5x1kyzG4JIeweqHavSFF8e", 
       "status": "succeeded", 
       "transaction_number": "W216-127-2795", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5x1kyzG4JIeweqHavSFF8e/refunds", 
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
       "id": "WD5x1kyzG4JIeweqHavSFF8e", 
       "available_at": "2013-06-06T23:42:11.879188Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF5xPug4h7Gq4tWrldfzAG14"
   }

