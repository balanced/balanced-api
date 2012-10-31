Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**. A URI for a Balanced entity 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    refund was issued. 
 
``amount`` 
    **integer**. The amount of the refund. 
 
``fee`` 
    **integer**. The fee reversed by Balanced for this refund. 
 
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
 

Refund an Account
----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    POST /v1/marketplaces/:marketplace_id/refunds 
 

Request
~~~~~~~

``amount`` 
    *optional* **integer** or **null**. Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original 
    ``debit``. 
 
``description`` 
    *optional* **string** or **null**.  
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``debit_uri`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "debit_uri": "/v1/marketplaces/TEST-MP67v6ovkj1uPNdQvbDMVEBm/debits/WD67I6UtohMCzlaNnqceE1la",  
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
            "holds_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:35.292154Z",  
            "uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC69kqHjHDOCsucQbzOM1Uqw",  
            "credits_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw/cards" 
        },  
        "fee": -43,  
        "description": "abc123",  
        "created_at": "2012-10-31T09:55:35.478192Z",  
        "uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/refunds/RF69wXB7BLBysWYcYo2jupAE",  
        "transaction_number": "RF385-150-1752",  
        "amount": 1234,  
        "meta": {},  
        "debit": { 
            "hold_uri": null,  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W650-001-4317",  
            "source_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/accounts/AC69kqHjHDOCsucQbzOM1Uqw/bank_accounts/BA69k7vqEZ5CHhNQ6FrrXnWA",  
            "created_at": "2012-10-31T09:55:35.389195Z",  
            "uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/debits/WD69q5GpazYhah78jjHFYkmg",  
            "refunds_uri": "/v1/marketplaces/TEST-MP69cVSERB7ZYHPiFS80RZRy/debits/WD69q5GpazYhah78jjHFYkmg/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WD69q5GpazYhah78jjHFYkmg",  
            "available_at": "2012-10-31T16:55:35.374036Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RF69wXB7BLBysWYcYo2jupAE" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:36.868073Z",  
            "uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC6b6l1KKvXcCddhsdvJFg4A",  
            "credits_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A/cards" 
        },  
        "fee": -43,  
        "description": "abc123",  
        "created_at": "2012-10-31T09:55:36.944531Z",  
        "uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/refunds/RF6barjz6q9cNWHXoNvjEWFu",  
        "transaction_number": "RF111-222-3333",  
        "amount": 1254,  
        "meta": {},  
        "debit": { 
            "hold_uri": null,  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W305-868-1823",  
            "source_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/accounts/AC6b6l1KKvXcCddhsdvJFg4A/bank_accounts/BA6b66xvuU9M0tjpmYtVqtrC",  
            "created_at": "2012-10-31T09:55:36.940739Z",  
            "uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/debits/WD6bam9vFnvhqek3knoetbqk",  
            "refunds_uri": "/v1/marketplaces/TEST-MP6aZ0Mu58Fk8y4q0To2KeYk/debits/WD6bam9vFnvhqek3knoetbqk/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WD6bam9vFnvhqek3knoetbqk",  
            "available_at": "2012-10-31T16:55:36.926036Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RF6barjz6q9cNWHXoNvjEWFu" 
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
        "first_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/refunds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:38.321004Z",  
                    "uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC6cJE7Rg8TU7fW22C2XWWSE",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/cards" 
                },  
                "fee": -43,  
                "description": "abc123",  
                "created_at": "2012-10-31T09:55:38.437131Z",  
                "uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/refunds/RF6cPAaX4OC1AKO1Ow1WqGZC",  
                "transaction_number": "RF111-222-3333",  
                "amount": 1254,  
                "meta": {},  
                "debit": { 
                    "hold_uri": null,  
                    "fee": 43,  
                    "description": "abc123",  
                    "transaction_number": "W227-554-7900",  
                    "source_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/bank_accounts/BA6cJllr37H3KwYtQgz8YI1m",  
                    "created_at": "2012-10-31T09:55:38.431081Z",  
                    "uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/debits/WD6cPspwPgPuRJzzlqUValMg",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/debits/WD6cPspwPgPuRJzzlqUValMg/refunds",  
                    "amount": 1254,  
                    "meta": {},  
                    "appears_on_statement_as": "PND*TESTS",  
                    "id": "WD6cPspwPgPuRJzzlqUValMg",  
                    "available_at": "2012-10-31T16:55:38.405127Z" 
                },  
                "appears_on_statement_as": "PND*TESTS",  
                "id": "RF6cPAaX4OC1AKO1Ow1WqGZC" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:38.321004Z",  
                    "uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC6cJE7Rg8TU7fW22C2XWWSE",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/cards" 
                },  
                "fee": -15,  
                "description": "abc123",  
                "created_at": "2012-10-31T09:55:38.437703Z",  
                "uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/refunds/RF6cPPx4O3DXPe27R4IP7MDq",  
                "transaction_number": "RF111-222-3333",  
                "amount": 431,  
                "meta": {},  
                "debit": { 
                    "hold_uri": null,  
                    "fee": 15,  
                    "description": "abc123",  
                    "transaction_number": "W179-749-0299",  
                    "source_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/accounts/AC6cJE7Rg8TU7fW22C2XWWSE/bank_accounts/BA6cJllr37H3KwYtQgz8YI1m",  
                    "created_at": "2012-10-31T09:55:38.431583Z",  
                    "uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/debits/WD6cPIzf7O56eI1XMFspAjjK",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/debits/WD6cPIzf7O56eI1XMFspAjjK/refunds",  
                    "amount": 431,  
                    "meta": {},  
                    "appears_on_statement_as": "PND*TESTS",  
                    "id": "WD6cPIzf7O56eI1XMFspAjjK",  
                    "available_at": "2012-10-31T16:55:38.408761Z" 
                },  
                "appears_on_statement_as": "PND*TESTS",  
                "id": "RF6cPPx4O3DXPe27R4IP7MDq" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/refunds?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP6cC57ZyZrZFBTWHlBrKpTK/refunds?limit=10&offset=0" 
    } 
 

Update a Refund
--------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    GET /v1/marketplaces/:marketplace_id/refunds 
 

Request
~~~~~~~

``description`` 
    *optional* **string** or **null**.  
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:41.414790Z",  
            "uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC6gdnKnYtNexNGBmJlF9MDG",  
            "credits_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG/cards" 
        },  
        "fee": -43,  
        "description": "my new description",  
        "created_at": "2012-10-31T09:55:41.522837Z",  
        "uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/refunds/RF6giTcpTPKQySN8NISrQRQ8",  
        "transaction_number": "RF111-222-3333",  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "debit": { 
            "hold_uri": null,  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W233-859-7460",  
            "source_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/accounts/AC6gdnKnYtNexNGBmJlF9MDG/bank_accounts/BA6gd5oLH4VbdZP6poHJLwKE",  
            "created_at": "2012-10-31T09:55:41.520287Z",  
            "uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/debits/WD6giMy9qvjIHhlMduLoUcC0",  
            "refunds_uri": "/v1/marketplaces/TEST-MP6g6owojlwRdtlIQ2Gir2vO/debits/WD6giMy9qvjIHhlMduLoUcC0/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WD6giMy9qvjIHhlMduLoUcC0",  
            "available_at": "2012-10-31T16:55:41.492768Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RF6giTcpTPKQySN8NISrQRQ8" 
    } 
 

