Transactions
============

Unified view of `Holds <./holds.rst>`_, `Debits <./debits.rst>`_, `Refunds <./refunds.rst>`_ and `Credits <./credits.rst>`_.

- `List Transactions`_

Fields
------

- `Holds <./holds.rst>`_
- `Debits <./debits.rst>`_
- `Refunds <./refunds.rst>`_
- `Credits <./credits.rst>`_

List Transactions
-----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/transactions


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "first_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/transactions?limit=7&offset=0", 
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
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 123, 
         "created_at": "2013-06-06T23:42:17.502087Z", 
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
         "expires_at": "2013-06-13T23:42:17.330651Z", 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5D3VU0f8mkrVEPJqXvxR3i", 
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
         "transaction_number": "HL972-918-6921", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5D3VU0f8mkrVEPJqXvxR3i", 
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
           "amount": 123, 
           "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5DRFd23u28Llhc4ItrtGo6", 
           "id": "WD5DRFd23u28Llhc4ItrtGo6", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5DRFd23u28Llhc4ItrtGo6/refunds", 
           "transaction_number": "W682-265-8784", 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:42:18.218656Z", 
           "available_at": "2013-06-06T23:42:18.000835Z"
         }, 
         "id": "HL5D3VU0f8mkrVEPJqXvxR3i"
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
         "amount": 5544, 
         "created_at": "2013-06-06T23:42:16.765199Z", 
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
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds/RF5CeJhGXoF2At7zisCX5Aac", 
         "transaction_number": "RF025-718-6357", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5BjP3QUDpMyl4otLzWcF8C", 
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
           "amount": 5544, 
           "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5Bi1V0JXhYJr46WgxAYxS2", 
           "id": "WD5Bi1V0JXhYJr46WgxAYxS2", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5Bi1V0JXhYJr46WgxAYxS2/refunds", 
           "transaction_number": "W821-829-7988", 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:42:15.923748Z", 
           "available_at": "2013-06-06T23:42:15.652733Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF5CeJhGXoF2At7zisCX5Aac"
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
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 5544, 
         "created_at": "2013-06-06T23:42:15.949230Z", 
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
         "expires_at": "2013-06-13T23:42:15.309258Z", 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5BjP3QUDpMyl4otLzWcF8C", 
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
         "transaction_number": "HL709-114-1170", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5BjP3QUDpMyl4otLzWcF8C", 
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
           "amount": 5544, 
           "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5Bi1V0JXhYJr46WgxAYxS2", 
           "id": "WD5Bi1V0JXhYJr46WgxAYxS2", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5Bi1V0JXhYJr46WgxAYxS2/refunds", 
           "transaction_number": "W821-829-7988", 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:42:15.923748Z", 
           "available_at": "2013-06-06T23:42:15.652733Z"
         }, 
         "id": "HL5BjP3QUDpMyl4otLzWcF8C"
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
         "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5Bi1V0JXhYJr46WgxAYxS2/refunds", 
         "amount": 5544, 
         "created_at": "2013-06-06T23:42:15.923748Z", 
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
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5Bi1V0JXhYJr46WgxAYxS2", 
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
         "transaction_number": "W821-829-7988", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5Bi1V0JXhYJr46WgxAYxS2", 
           "amount": 5544, 
           "created_at": "2013-06-06T23:42:15.949230Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5BjP3QUDpMyl4otLzWcF8C", 
           "expires_at": "2013-06-13T23:42:15.309258Z", 
           "id": "HL5BjP3QUDpMyl4otLzWcF8C", 
           "transaction_number": "HL709-114-1170", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "source_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA"
         }, 
         "id": "WD5Bi1V0JXhYJr46WgxAYxS2", 
         "available_at": "2013-06-06T23:42:15.652733Z"
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
         "amount": 245, 
         "created_at": "2013-06-06T23:42:14.604887Z", 
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
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3zD5GQ6tzAHb4NjiEuKFte/credits/CR5zNEV85WQbteXogrqN0vDE", 
         "transaction_number": "CR829-807-6741", 
         "state": "cleared", 
         "_uris": {}, 
         "meta": {}, 
         "appears_on_statement_as": "example.com", 
         "id": "CR5zNEV85WQbteXogrqN0vDE", 
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
         "available_at": "2013-06-06T23:42:14.482212Z"
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
         "description": "my new description", 
         "amount": 1254, 
         "created_at": "2013-06-06T23:42:12.847012Z", 
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
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/refunds/RF5xPug4h7Gq4tWrldfzAG14", 
         "transaction_number": "RF359-740-5596", 
         "_uris": {}, 
         "meta": {
           "my-id": "0987654321"
         }, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5x2AaFem3zfBw3BFJQWmJc", 
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
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5x1kyzG4JIeweqHavSFF8e", 
           "id": "WD5x1kyzG4JIeweqHavSFF8e", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5x1kyzG4JIeweqHavSFF8e/refunds", 
           "transaction_number": "W216-127-2795", 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:42:12.127870Z", 
           "available_at": "2013-06-06T23:42:11.879188Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF5xPug4h7Gq4tWrldfzAG14"
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
         "_type": "hold", 
         "fee": null, 
         "description": null, 
         "_uris": {}, 
         "amount": 1254, 
         "created_at": "2013-06-06T23:42:12.145557Z", 
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
         "expires_at": "2013-06-13T23:42:11.531791Z", 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5x2AaFem3zfBw3BFJQWmJc", 
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
         "transaction_number": "HL301-998-6825", 
         "meta": {}, 
         "is_void": false, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/holds/HL5x2AaFem3zfBw3BFJQWmJc", 
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
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5x1kyzG4JIeweqHavSFF8e", 
           "id": "WD5x1kyzG4JIeweqHavSFF8e", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/debits/WD5x1kyzG4JIeweqHavSFF8e/refunds", 
           "transaction_number": "W216-127-2795", 
           "customer_uri": "/v1/customers/CU39fUvgDHWJADM2SplV2JYj", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T23:42:12.127870Z", 
           "available_at": "2013-06-06T23:42:11.879188Z"
         }, 
         "id": "HL5x2AaFem3zfBw3BFJQWmJc"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/transactions?limit=7&offset=0", 
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
     "limit": 7, 
     "offset": 0, 
     "counts": {
       "refund": 11, 
       "account": 21, 
       "credit": 16, 
       "bank_account": 12, 
       "debit": 21, 
       "hold": 34, 
       "card": 14
     }, 
     "total": 82, 
     "next_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/transactions?limit=7&offset=7", 
     "last_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/transactions?limit=7&offset=77"
   }

