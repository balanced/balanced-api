Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

``id`` 
    **string**.  
 
``uri`` 
    **string**.  
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    refund was issued. 
 
``amount`` 
    **integer**. The amount of the refund. 
 
``description`` 
    **string**. Free-text description of the refund. 
 
``account`` 
    **object**. Account receiving the refund. 
 
``appears_on_statement_as`` 
    **string**. Text that will appear on the statement describing this refund. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``debit`` 
    **object**. The original debit associated with the refund. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 

Deprecated
~~~~~~~~~~

``fee`` 
    **null**. The fee charged by Balanced. 
 

Refund an Account
----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    POST /v1/marketplaces/:marketplace_id/refunds 
 

Request
~~~~~~~

``amount`` 
    *optional* **integer**. Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original 
    ``debit``. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``debit_uri`` 
    *optional* **string**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "debit_uri": "/v1/marketplaces/TEST-MP5NLpOarrpfeHkVb155JDLZ/debits/WD5NWc3ggGZVrypj49zH3qL1",  
        "amount": 1234 
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
        "account": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET/cards",  
            "created_at": "2012-12-20T03:10:04.166351Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET/holds",  
            "id": "AC5Q5r1SyOz2pYuIkzh4rlET",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET/transactions",  
            "uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-20T03:10:04.316789Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-20T03:10:04.239134Z",  
            "created_at": "2012-12-20T03:10:04.248701Z",  
            "description": "abc123",  
            "fee": null,  
            "hold_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/holds/HL5Qbm3rBALfaJk98I0VOyfp",  
            "id": "WD5Qb39w3tMpX6HdIeRiyNr5",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/debits/WD5Qb39w3tMpX6HdIeRiyNr5/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/accounts/AC5Q5r1SyOz2pYuIkzh4rlET/cards/CC5Q5AYFyqQa22S2navY5j59",  
            "transaction_number": "W686-683-4039",  
            "uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/debits/WD5Qb39w3tMpX6HdIeRiyNr5" 
        },  
        "description": "abc123",  
        "fee": null,  
        "id": "RF5QfSQqe6jl9jHD1OIz5qdJ",  
        "meta": {},  
        "transaction_number": "RF981-900-5649",  
        "uri": "/v1/marketplaces/TEST-MP5Q0jRLPdwqAtdgXypvzs8H/refunds/RF5QfSQqe6jl9jHD1OIz5qdJ" 
    } 
 

Retrieve a Refund
----------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id 
    GET /v1/marketplaces/:marketplace_id/refunds/:refund_id 
 

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
        "account": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF/cards",  
            "created_at": "2012-12-20T03:10:06.231423Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF/holds",  
            "id": "AC5Sprx5SqcNxFdiJsOwjWrF",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF/transactions",  
            "uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-20T03:10:06.338412Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-20T03:10:06.303265Z",  
            "created_at": "2012-12-20T03:10:06.315492Z",  
            "description": "abc123",  
            "fee": null,  
            "hold_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/holds/HL5SvtGpw6OcvPTm5Ko7bbVN",  
            "id": "WD5Svc04BIH2SYcpT5X9lgMr",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/debits/WD5Svc04BIH2SYcpT5X9lgMr/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/accounts/AC5Sprx5SqcNxFdiJsOwjWrF/cards/CC5SpCgFA90NHzqyKRWbNKyD",  
            "transaction_number": "W919-426-5036",  
            "uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/debits/WD5Svc04BIH2SYcpT5X9lgMr" 
        },  
        "description": "abc123",  
        "fee": null,  
        "id": "RF5SwSkJopxodmUSmDj7G9eX",  
        "meta": {},  
        "transaction_number": "RF111-222-3333",  
        "uri": "/v1/marketplaces/TEST-MP5SjGhRFOjwIiEuxBLG3ryP/refunds/RF5SwSkJopxodmUSmDj7G9eX" 
    } 
 

List All refunds
---------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    GET /v1/marketplaces/:marketplace_id/refunds 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/refunds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/cards",  
                    "created_at": "2012-12-20T03:10:08.069952Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/holds",  
                    "id": "AC5UtE6sEKq0cHTT1w5GkDrZ",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "created_at": "2012-12-20T03:10:08.188670Z",  
                "debit": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ",  
                    "amount": 1254,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2012-12-20T03:10:08.156267Z",  
                    "created_at": "2012-12-20T03:10:08.166997Z",  
                    "description": "abc123",  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/holds/HL5UAzbF2kZrlaLiYfTNFOMP",  
                    "id": "WD5UAjg9yNB15kfizoK5VRWr",  
                    "meta": {},  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/debits/WD5UAjg9yNB15kfizoK5VRWr/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/cards/CC5UtOj4bJVS7f0jWeE2qDZh",  
                    "transaction_number": "W721-034-7233",  
                    "uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/debits/WD5UAjg9yNB15kfizoK5VRWr" 
                },  
                "description": "abc123",  
                "fee": null,  
                "id": "RF5UBSLhRwlggM1kCwtiTOfh",  
                "meta": {},  
                "transaction_number": "RF111-222-3333",  
                "uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/refunds/RF5UBSLhRwlggM1kCwtiTOfh" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/cards",  
                    "created_at": "2012-12-20T03:10:08.069952Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/holds",  
                    "id": "AC5UtE6sEKq0cHTT1w5GkDrZ",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "created_at": "2012-12-20T03:10:08.251129Z",  
                "debit": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ",  
                    "amount": 431,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2012-12-20T03:10:08.215640Z",  
                    "created_at": "2012-12-20T03:10:08.227465Z",  
                    "description": "abc123",  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/holds/HL5UEPmvIjzzIwNClninaHPt",  
                    "id": "WD5UEAQ7vxgIRFQMtOmkzcDV",  
                    "meta": {},  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/debits/WD5UEAQ7vxgIRFQMtOmkzcDV/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/accounts/AC5UtE6sEKq0cHTT1w5GkDrZ/cards/CC5UtOj4bJVS7f0jWeE2qDZh",  
                    "transaction_number": "W179-156-4934",  
                    "uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/debits/WD5UEAQ7vxgIRFQMtOmkzcDV" 
                },  
                "description": "abc123",  
                "fee": null,  
                "id": "RF5UGgpBiuXKPzw1OhLcQgPF",  
                "meta": {},  
                "transaction_number": "RF111-222-3333",  
                "uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/refunds/RF5UGgpBiuXKPzw1OhLcQgPF" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/refunds?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP5UnVKi8MQzJkPApthbF98D/refunds?limit=10&offset=0" 
    } 
 

Update a Refund
--------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id 
    PUT /v1/marketplaces/:marketplace_id/refunds/:refund_id 
 

Request
~~~~~~~

``description`` 
    *optional* **string**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "meta": { 
            "my-id": "0987654321" 
        },  
        "description": "my new description" 
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
        "account": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x/cards",  
            "created_at": "2012-12-20T03:10:12.789878Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x/holds",  
            "id": "AC5ZMMKMDrQF3XLOUhBnXH1x",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x/transactions",  
            "uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-20T03:10:12.888871Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-20T03:10:12.858927Z",  
            "created_at": "2012-12-20T03:10:12.870893Z",  
            "description": "abc123",  
            "fee": null,  
            "hold_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/holds/HL5ZSCDDladA5rRX0sayCPIv",  
            "id": "WD5ZSjzwfZPuI2grCXsk8afV",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/debits/WD5ZSjzwfZPuI2grCXsk8afV/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/accounts/AC5ZMMKMDrQF3XLOUhBnXH1x/cards/CC5ZMVHVbWymFw1qi9w7zupB",  
            "transaction_number": "W543-129-7682",  
            "uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/debits/WD5ZSjzwfZPuI2grCXsk8afV" 
        },  
        "description": "my new description",  
        "fee": null,  
        "id": "RF5ZTFox7c7Pu1D8W5YTaRY7",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "transaction_number": "RF111-222-3333",  
        "uri": "/v1/marketplaces/TEST-MP5ZGRSkE8O0lroua0t0E2NZ/refunds/RF5ZTFox7c7Pu1D8W5YTaRY7" 
    } 
 

