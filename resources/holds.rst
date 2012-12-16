Holds
=====

- `Create a Hold`_
- `Retrieve a Hold`_
- `List all Holds`_
- `Update a Hold`_
- `Capture a Hold`_
- `Void a Hold`_

Fields
------

``id`` 
    **string**.  
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    hold was created. 
 
``amount`` 
    **integer**. Amount of the hold. 
 
``fee`` 
    **integer**. The fee charged by Balanced for this hold. 
 
``expires_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    hold was will expire and can **NO LONGER BE CAPTURED**. 
 
``description`` 
    **string**. A description of the hold, used for display purposes. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``debit`` 
    **object**. See `Debit <./debits.rst>`_. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``account`` 
    **object**. See `Account <./accounts.rst>`_. 
 
``uri`` 
    **string**.  
 
``is_void`` 
    **boolean**. A boolean flag indicating if the hold has been voided or not. 
 
``source`` 
    **object**. See `Card <./cards.rst>`_. 
 

Create a Hold
-------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/holds 
    POST /v1/marketplaces/:marketplace_id/holds 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. Value must be >= to the minimum debit amount allowed for *your* 
    marketplace. Value must be <= to the maximum debit amount allowed for *your* 
    marketplace. 
 
``appears_on_statement_as`` 
    *optional* **string**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``source_uri`` 
    *optional* **string**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 3421,  
        "meta": { 
            "id": "#12312123123" 
        },  
        "description": "Something tasty" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2/cards",  
            "created_at": "2012-12-15T22:50:38.609461Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2/holds",  
            "id": "AC715VUhF2zZEm2hjDhxPnu2",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2/transactions",  
            "uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2" 
        },  
        "amount": 3421,  
        "created_at": "2012-12-15T22:50:38.653384Z",  
        "debit": null,  
        "description": "Something tasty",  
        "expires_at": "2012-12-23T06:50:38.651188Z",  
        "fee": 30,  
        "id": "HL718Z5vJRGSD09TDibdbQGC",  
        "is_void": false,  
        "meta": { 
            "id": "#12312123123" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T22:50:38.625007Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCe6960fee474c11e2b74368a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/accounts/AC715VUhF2zZEm2hjDhxPnu2/cards/CCe6960fee474c11e2b74368a86d3cb93a" 
        },  
        "transaction_number": "HL785-873-0326",  
        "uri": "/v1/marketplaces/TEST-MP712guK9T6taUL1aqr5UvNM/holds/HL718Z5vJRGSD09TDibdbQGC" 
    } 
 

Retrieve a Hold
---------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id 
    GET /v1/marketplaces/:marketplace_id/holds/:hold_id 
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe/cards",  
            "created_at": "2012-12-15T22:50:39.925314Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe/holds",  
            "id": "AC72zH4Y6QfuOUhJPioyfNwe",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe/transactions",  
            "uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-15T22:50:39.944701Z",  
        "debit": null,  
        "description": "Something sour",  
        "expires_at": "2012-12-17T06:50:39.941257Z",  
        "fee": 30,  
        "id": "HL72B39wT1dEmrKh6D5MbwF4",  
        "is_void": false,  
        "meta": {},  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T22:50:39.940430Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCe75ec180474c11e2bbbb68a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/accounts/AC72zH4Y6QfuOUhJPioyfNwe/cards/CCe75ec180474c11e2bbbb68a86d3cb93a" 
        },  
        "transaction_number": "HL547-961-9000",  
        "uri": "/v1/marketplaces/TEST-MP72w3EsRxlSPCsy6dYm5goO/holds/HL72B39wT1dEmrKh6D5MbwF4" 
    } 
 

List all Holds
--------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/holds 
    GET /v1/marketplaces/:marketplace_id/holds 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/holds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/cards",  
                    "created_at": "2012-12-15T22:50:41.212071Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/holds",  
                    "id": "AC741qgQYgmBAGLmUjvy7pFw",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw" 
                },  
                "amount": 1233,  
                "created_at": "2012-12-15T22:50:41.231779Z",  
                "debit": null,  
                "description": "Something sweet",  
                "expires_at": "2012-12-17T06:50:41.228320Z",  
                "fee": 30,  
                "id": "HL742NsiUg7esNXRweBCHg4q",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T22:50:41.227539Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCe823384f474c11e2a8ab68a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/cards/CCe823384f474c11e2a8ab68a86d3cb93a" 
                },  
                "transaction_number": "HL146-552-5302",  
                "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/holds/HL742NsiUg7esNXRweBCHg4q" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/cards",  
                    "created_at": "2012-12-15T22:50:41.212071Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/holds",  
                    "id": "AC741qgQYgmBAGLmUjvy7pFw",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw" 
                },  
                "amount": 3344,  
                "created_at": "2012-12-15T22:50:41.236646Z",  
                "debit": null,  
                "description": "Something sour",  
                "expires_at": "2012-12-17T06:50:41.230320Z",  
                "fee": 30,  
                "id": "HL7438PNElrsuugyz2kEvaVY",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T22:50:41.227539Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCe823384f474c11e2a8ab68a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/cards/CCe823384f474c11e2a8ab68a86d3cb93a" 
                },  
                "transaction_number": "HL185-830-5567",  
                "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/holds/HL7438PNElrsuugyz2kEvaVY" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/cards",  
                    "created_at": "2012-12-15T22:50:41.212071Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/holds",  
                    "id": "AC741qgQYgmBAGLmUjvy7pFw",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw" 
                },  
                "amount": 6754,  
                "created_at": "2012-12-15T22:50:41.241739Z",  
                "debit": null,  
                "description": "Something spicy",  
                "expires_at": "2012-12-17T06:50:41.235308Z",  
                "fee": 30,  
                "id": "HL743uz3SBjqN8rDTHmQuLUu",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T22:50:41.227539Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCe823384f474c11e2a8ab68a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/cards/CCe823384f474c11e2a8ab68a86d3cb93a" 
                },  
                "transaction_number": "HL139-745-0062",  
                "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/holds/HL743uz3SBjqN8rDTHmQuLUu" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/cards",  
                    "created_at": "2012-12-15T22:50:41.212071Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/holds",  
                    "id": "AC741qgQYgmBAGLmUjvy7pFw",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw" 
                },  
                "amount": 1322,  
                "created_at": "2012-12-15T22:50:41.247001Z",  
                "debit": null,  
                "description": "Something tangy",  
                "expires_at": "2012-12-17T06:50:41.240195Z",  
                "fee": 30,  
                "id": "HL743RmeNhjnr1Ur5yt5P2We",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T22:50:41.227539Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCe823384f474c11e2a8ab68a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/cards/CCe823384f474c11e2a8ab68a86d3cb93a" 
                },  
                "transaction_number": "HL292-481-4766",  
                "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/holds/HL743RmeNhjnr1Ur5yt5P2We" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/holds?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 4,  
        "uri": "/v1/marketplaces/TEST-MP73XNoEZFzLvhe0YcddniqK/accounts/AC741qgQYgmBAGLmUjvy7pFw/holds?limit=10&offset=0" 
    } 
 

Update a Hold
-------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id 
    PUT /v1/marketplaces/:marketplace_id/holds/:hold_id 
 

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
            "the-address": "123 Fake Street" 
        },  
        "description": "Something really tasty" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC/cards",  
            "created_at": "2012-12-15T22:50:44.022021Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC/holds",  
            "id": "AC77bmSPMfj8c64CDrm5v4GC",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC/transactions",  
            "uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-15T22:50:44.041156Z",  
        "debit": null,  
        "description": "Something really tasty",  
        "expires_at": "2012-12-17T06:50:44.037639Z",  
        "fee": 30,  
        "id": "HL77cHrS5c7JKTOw1gdThqt4",  
        "is_void": false,  
        "meta": { 
            "the-address": "123 Fake Street" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T22:50:44.036873Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCe9cfdff8474c11e2b55a68a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/accounts/AC77bmSPMfj8c64CDrm5v4GC/cards/CCe9cfdff8474c11e2b55a68a86d3cb93a" 
        },  
        "transaction_number": "HL170-141-1367",  
        "uri": "/v1/marketplaces/TEST-MP777ORlk5GOZpez1wD9fUDM/holds/HL77cHrS5c7JKTOw1gdThqt4" 
    } 
 

Capture a Hold
--------------

Use ``hold_uri`` when `creating a debit <./debits.rst#create-a-debit>`_.

Request 
~~~~~~~ 
 
Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "hold_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/holds/HL78G3oVcWnRea89mHg6F6pY" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/cards",  
            "created_at": "2012-12-15T22:50:45.331576Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/holds",  
            "id": "AC78EGrWIl3l05Jr24275c4a",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/transactions",  
            "uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a" 
        },  
        "amount": 1233,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2012-12-16T06:50:45.381301Z",  
        "created_at": "2012-12-15T22:50:45.387667Z",  
        "description": null,  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a",  
            "amount": 1233,  
            "created_at": "2012-12-15T22:50:45.351167Z",  
            "description": "Something sour",  
            "expires_at": "2012-12-17T06:50:45.347717Z",  
            "fee": 30,  
            "id": "HL78G3oVcWnRea89mHg6F6pY",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/cards/CCea97b38c474c11e2824668a86d3cb93a",  
            "transaction_number": "HL117-205-0286",  
            "uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/holds/HL78G3oVcWnRea89mHg6F6pY" 
        },  
        "id": "WD78IzvB12KOpiYCjaa2Ceym",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/debits/WD78IzvB12KOpiYCjaa2Ceym/refunds",  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T22:50:45.346903Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCea97b38c474c11e2824668a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/accounts/AC78EGrWIl3l05Jr24275c4a/cards/CCea97b38c474c11e2824668a86d3cb93a" 
        },  
        "transaction_number": "W523-011-8215",  
        "uri": "/v1/marketplaces/TEST-MP78B8jkbE395iu0bGiRRJWi/debits/WD78IzvB12KOpiYCjaa2Ceym" 
    } 
 

Void a Hold
-----------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id 
    PUT /v1/marketplaces/:marketplace_id/holds/:hold_id 
 

Request
~~~~~~~

``is_void`` 
    *optional* **boolean**. Flag value, should be ``true`` or ``false``. 
 
``appears_on_statement_as`` 
    *optional* **string**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "is_void": true,  
        "meta": { 
            "reason": "Customer request" 
        } 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe/cards",  
            "created_at": "2012-12-15T22:50:47.988634Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe/holds",  
            "id": "AC7bDYjoAH9xR8wmB0abmbwe",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe/transactions",  
            "uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-15T22:50:48.008833Z",  
        "debit": null,  
        "description": "Something sour",  
        "expires_at": "2012-12-17T06:50:48.005178Z",  
        "fee": 30,  
        "id": "HL7bFnC0lxKNAu0YuJ3isNCy",  
        "is_void": true,  
        "meta": { 
            "reason": "Customer request" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T22:50:48.004356Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCec2d39cf474c11e2995868a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/accounts/AC7bDYjoAH9xR8wmB0abmbwe/cards/CCec2d39cf474c11e2995868a86d3cb93a" 
        },  
        "transaction_number": "HL096-206-5776",  
        "uri": "/v1/marketplaces/TEST-MP7bAl91PeYc0coOoOVEgLpg/holds/HL7bFnC0lxKNAu0YuJ3isNCy" 
    } 
 

