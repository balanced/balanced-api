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
        "debit_uri": "/v1/marketplaces/TEST-MP4uemVwQ2zTTFWpANkof3mi/debits/WD4ukbk8QqHkhQTs8tFumDhM",  
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02/cards",  
            "created_at": "2012-12-15T19:56:32.625022Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02/holds",  
            "id": "AC4vOpI5whp10bGQVJNGJo02",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-15T19:56:32.716828Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-16T03:56:32.666630Z",  
            "created_at": "2012-12-15T19:56:32.672828Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/holds/HL4vRQqOkf3N5D4oyCga5fVU",  
            "id": "WD4vRFaAograwdpxtwqGBjGa",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/debits/WD4vRFaAograwdpxtwqGBjGa/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/accounts/AC4vOpI5whp10bGQVJNGJo02/cards/CC4vOv5Bfd7VdoIPNnQLXd90",  
            "transaction_number": "W064-679-1710",  
            "uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/debits/WD4vRFaAograwdpxtwqGBjGa" 
        },  
        "description": "abc123",  
        "fee": 0,  
        "id": "RF4vUOkvhYd3Z53iMOoFWiIa",  
        "meta": {},  
        "transaction_number": "RF917-671-3559",  
        "uri": "/v1/marketplaces/TEST-MP4vM2YVBELS1HE8TGjaPrtw/refunds/RF4vUOkvhYd3Z53iMOoFWiIa" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg/cards",  
            "created_at": "2012-12-15T19:56:33.984085Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg/holds",  
            "id": "AC4xlbL6iHsxfW5Eyb792uTg",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-15T19:56:34.043788Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-16T03:56:34.026390Z",  
            "created_at": "2012-12-15T19:56:34.032019Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/holds/HL4xoCyal52K8w4rEvHSHE0O",  
            "id": "WD4xotNmgOfIVPZsOVCS956q",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/debits/WD4xotNmgOfIVPZsOVCS956q/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/accounts/AC4xlbL6iHsxfW5Eyb792uTg/cards/CC4xlhFP9IAd5PrnZa8k9SH0",  
            "transaction_number": "W541-762-1719",  
            "uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/debits/WD4xotNmgOfIVPZsOVCS956q" 
        },  
        "description": "abc123",  
        "fee": 0,  
        "id": "RF4xpkYYtH5aWlonhlmquHN0",  
        "meta": {},  
        "transaction_number": "RF111-222-3333",  
        "uri": "/v1/marketplaces/TEST-MP4xiN6kRiEXnQrvyk3s7ED0/refunds/RF4xpkYYtH5aWlonhlmquHN0" 
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
        "first_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/refunds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/cards",  
                    "created_at": "2012-12-15T19:56:35.337284Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/holds",  
                    "id": "AC4yRxXrZnGmYtZaLeza8IiK",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "created_at": "2012-12-15T19:56:35.395498Z",  
                "debit": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK",  
                    "amount": 1254,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2012-12-16T03:56:35.379022Z",  
                    "created_at": "2012-12-15T19:56:35.385022Z",  
                    "description": "abc123",  
                    "fee": 43,  
                    "hold_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/holds/HL4yUXojUjUV8o0WGlh0OHcm",  
                    "id": "WD4yUPAJ2zaG0McuL2TdUc7E",  
                    "meta": {},  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/debits/WD4yUPAJ2zaG0McuL2TdUc7E/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/cards/CC4yRDBv7KXVCh13CyFuqSoy",  
                    "transaction_number": "W928-571-9186",  
                    "uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/debits/WD4yUPAJ2zaG0McuL2TdUc7E" 
                },  
                "description": "abc123",  
                "fee": 0,  
                "id": "RF4yVBuxvXtAphLfHXCgJQOS",  
                "meta": {},  
                "transaction_number": "RF111-222-3333",  
                "uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/refunds/RF4yVBuxvXtAphLfHXCgJQOS" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/cards",  
                    "created_at": "2012-12-15T19:56:35.337284Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/holds",  
                    "id": "AC4yRxXrZnGmYtZaLeza8IiK",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "created_at": "2012-12-15T19:56:35.423978Z",  
                "debit": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK",  
                    "amount": 431,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2012-12-16T03:56:35.407529Z",  
                    "created_at": "2012-12-15T19:56:35.412818Z",  
                    "description": "abc123",  
                    "fee": 15,  
                    "hold_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/holds/HL4yWUkB3N3F9LfP0J9O8Jey",  
                    "id": "WD4yWOf66QuhNhNzinc0fs02",  
                    "meta": {},  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/debits/WD4yWOf66QuhNhNzinc0fs02/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/accounts/AC4yRxXrZnGmYtZaLeza8IiK/cards/CC4yRDBv7KXVCh13CyFuqSoy",  
                    "transaction_number": "W719-885-3020",  
                    "uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/debits/WD4yWOf66QuhNhNzinc0fs02" 
                },  
                "description": "abc123",  
                "fee": 0,  
                "id": "RF4yXAOHx0dEN1xnhUSb4wPg",  
                "meta": {},  
                "transaction_number": "RF111-222-3333",  
                "uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/refunds/RF4yXAOHx0dEN1xnhUSb4wPg" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/refunds?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP4yP9MckBj9BJAYtfuSvYL0/refunds?limit=10&offset=0" 
    } 
 

Update a Refund
--------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    GET /v1/marketplaces/:marketplace_id/refunds 
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s/cards",  
            "created_at": "2012-12-15T19:56:38.160405Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s/holds",  
            "id": "AC4C2q0urCjTJyB5BGnC4A9s",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-15T19:56:38.219043Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-16T03:56:38.201987Z",  
            "created_at": "2012-12-15T19:56:38.208273Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/holds/HL4C5PH9eTkU2rcShb6MDDT4",  
            "id": "WD4C5HInlCiz5XSGdyFuQ1JM",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/debits/WD4C5HInlCiz5XSGdyFuQ1JM/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/accounts/AC4C2q0urCjTJyB5BGnC4A9s/cards/CC4C2uVNORYMWqdNUdjReMfo",  
            "transaction_number": "W461-868-8674",  
            "uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/debits/WD4C5HInlCiz5XSGdyFuQ1JM" 
        },  
        "description": "my new description",  
        "fee": 0,  
        "id": "RF4C6v1OFwmBNMTpxW9xQ3fY",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "transaction_number": "RF111-222-3333",  
        "uri": "/v1/marketplaces/TEST-MP4C02PoNIbFhD6Ir5ckJYtI/refunds/RF4C6v1OFwmBNMTpxW9xQ3fY" 
    } 
 

