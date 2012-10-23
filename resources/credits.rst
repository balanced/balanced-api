Credits
=======

-  `Credit an Account`_
-  `Retrieve a Credit`_
-  `List All Credits`_
-  `Update A Credit`_


Credit an account
-----------------

.. code::

    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/credits    POST /v1/marketplaces/:marketplace_id/credits




Retrieve a credit
-----------------

.. code::

    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits/:credit_id    GET /v1/marketplaces/:marketplace_id/credits/:credit_id




List all credits
----------------

.. code::

    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits    GET /v1/marketplaces/:marketplace_id/credits


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 200 Ok

Body
^^^^

.. code:: javascript


    {
        "first_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1353,
                "available_at": "2012-10-23T19:43:04.147574Z",
                "created_at": "2012-10-23T12:43:04.183779Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HP5NYSsoidU4dyiWUcJbY",
                "meta": {
                    "hi": "bye"
                },
                "state": "cleared",
                "transaction_number": "CR491-644-0589",
                "updated_at": "2012-10-23T12:43:04.183780Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HP5NYSsoidU4dyiWUcJbY"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1342,
                "available_at": "2012-10-23T19:43:04.146572Z",
                "created_at": "2012-10-23T12:43:04.183424Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HP1uYoOPNIMEi1s6dThfY",
                "meta": {
                    "hi": "ta"
                },
                "state": "cleared",
                "transaction_number": "CR844-786-1507",
                "updated_at": "2012-10-23T12:43:04.183425Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HP1uYoOPNIMEi1s6dThfY"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1331,
                "available_at": "2012-10-23T19:43:04.145763Z",
                "created_at": "2012-10-23T12:43:04.182926Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HOXZ1fGn7ilKrughgbrVU",
                "meta": {},
                "state": "cleared",
                "transaction_number": "CR588-491-2240",
                "updated_at": "2012-10-23T12:43:04.182928Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HOXZ1fGn7ilKrughgbrVU"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1320,
                "available_at": "2012-10-23T19:43:04.144946Z",
                "created_at": "2012-10-23T12:43:04.182425Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HOUt5LAmJ1qgnfFDjctV8",
                "meta": {},
                "state": "cleared",
                "transaction_number": "CR911-193-4635",
                "updated_at": "2012-10-23T12:43:04.182426Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HOUt5LAmJ1qgnfFDjctV8"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1309,
                "available_at": "2012-10-23T19:43:04.144152Z",
                "created_at": "2012-10-23T12:43:04.182064Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HOR0HEIAYX1vMZPuMze5A",
                "meta": {
                    "hi": "bye"
                },
                "state": "cleared",
                "transaction_number": "CR106-103-9322",
                "updated_at": "2012-10-23T12:43:04.182066Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HOR0HEIAYX1vMZPuMze5A"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1298,
                "available_at": "2012-10-23T19:43:04.143314Z",
                "created_at": "2012-10-23T12:43:04.181499Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HONp9aiL6xs9TSZRn4csi",
                "meta": {
                    "hi": "bye"
                },
                "state": "cleared",
                "transaction_number": "CR929-650-4107",
                "updated_at": "2012-10-23T12:43:04.181500Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HONp9aiL6xs9TSZRn4csi"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1287,
                "available_at": "2012-10-23T19:43:04.142442Z",
                "created_at": "2012-10-23T12:43:04.181045Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HOJJ299ls6IXZcw8YfJcm",
                "meta": {},
                "state": "cleared",
                "transaction_number": "CR972-277-0487",
                "updated_at": "2012-10-23T12:43:04.181046Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HOJJ299ls6IXZcw8YfJcm"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1276,
                "available_at": "2012-10-23T19:43:04.141667Z",
                "created_at": "2012-10-23T12:43:04.180711Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HOGh9C2fgWElZg3SliWOS",
                "meta": {},
                "state": "cleared",
                "transaction_number": "CR667-003-1587",
                "updated_at": "2012-10-23T12:43:04.180712Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HOGh9C2fgWElZg3SliWOS"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1265,
                "available_at": "2012-10-23T19:43:04.140884Z",
                "created_at": "2012-10-23T12:43:04.180366Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HOCSpwyxlGKl4j9ar7Wxs",
                "meta": {
                    "hi": "ta"
                },
                "state": "cleared",
                "transaction_number": "CR605-024-9292",
                "updated_at": "2012-10-23T12:43:04.180368Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HOCSpwyxlGKl4j9ar7Wxs"
            },
            {
                "account": {
                    "balance": 0,
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/cards",
                    "created_at": "2012-10-23T12:43:04.044450Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/holds",
                    "id": "AC6HHSwLbEjCyGTILfm2avxM",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/transactions",
                    "updated_at": "2012-10-23T12:43:04.044451Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM"
                },
                "amount": 1254,
                "available_at": "2012-10-23T19:43:04.136091Z",
                "created_at": "2012-10-23T12:43:04.179868Z",
                "description": "hiya",
                "destination": {
                    "bank_code": "325182797",
                    "bank_name": null,
                    "created_at": "2012-10-23T12:43:04.042544Z",
                    "id": "BA6HHJNAuNmsGUDNYslcihOa",
                    "is_valid": true,
                    "last_four": "x234",
                    "meta": {},
                    "name": "Fit Finlay",
                    "updated_at": "2012-10-23T12:43:04.042545Z",
                    "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/accounts/AC6HHSwLbEjCyGTILfm2avxM/bank_accounts/BA6HHJNAuNmsGUDNYslcihOa"
                },
                "fee": 25,
                "id": "CR6HOz2HxdKSsZKbkoPA9JDY",
                "meta": {},
                "state": "cleared",
                "transaction_number": "CR177-580-0720",
                "updated_at": "2012-10-23T12:43:04.179870Z",
                "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits/CR6HOz2HxdKSsZKbkoPA9JDY"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 10,
        "uri": "/v1/marketplaces/TEST-MP6HEjwrOBgY5B7bFM5GkTdo/credits?limit=10&offset=0"
    }



Update a credit
---------------

.. code::

    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/credits/:credit_id    PUT /v1/marketplaces/:marketplace_id/credits/:credit_id





