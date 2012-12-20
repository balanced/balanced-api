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
 

Deprecated
~~~~~~~~~~

``fee`` 
    **null**. The fee charged by Balanced. 
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh/cards",  
            "created_at": "2012-12-20T03:09:16.649133Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh/holds",  
            "id": "AC4YDUFwG8hQDGeWIDGIDwbh",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh" 
        },  
        "amount": 3421,  
        "created_at": "2012-12-20T03:09:16.730595Z",  
        "debit": null,  
        "description": "Something tasty",  
        "expires_at": "2012-12-27T03:09:16.727669Z",  
        "fee": null,  
        "id": "HL4YJAxPIGuECE84a9b5vWtt",  
        "is_void": false,  
        "meta": { 
            "id": "#12312123123" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-20T03:09:16.676057Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCa39465aa4a5211e2a52b80ee7316ae43",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/accounts/AC4YDUFwG8hQDGeWIDGIDwbh/cards/CCa39465aa4a5211e2a52b80ee7316ae43" 
        },  
        "transaction_number": "HL310-824-3149",  
        "uri": "/v1/marketplaces/TEST-MP4YwC4VcuLmkAgfdr6S0EMz/holds/HL4YJAxPIGuECE84a9b5vWtt" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3/cards",  
            "created_at": "2012-12-20T03:09:18.745018Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3/holds",  
            "id": "AC5104JaAetHxU9VvjpmSlO3",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3/transactions",  
            "uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-20T03:09:18.781306Z",  
        "debit": null,  
        "description": "Something sour",  
        "expires_at": "2012-12-21T03:09:18.774072Z",  
        "fee": null,  
        "id": "HL512ydk785sNIWBWoxTcNTZ",  
        "is_void": false,  
        "meta": {},  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-20T03:09:18.768375Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCa4d3c5144a5211e2971d80ee7316ae43",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/accounts/AC5104JaAetHxU9VvjpmSlO3/cards/CCa4d3c5144a5211e2971d80ee7316ae43" 
        },  
        "transaction_number": "HL786-456-8938",  
        "uri": "/v1/marketplaces/TEST-MP50R0utcZKsXzuDUZLHmXgn/holds/HL512ydk785sNIWBWoxTcNTZ" 
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
        "first_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/holds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/cards",  
                    "created_at": "2012-12-20T03:09:20.741966Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/holds",  
                    "id": "AC53fjQsxOGJP54GNA0q6MLN",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN" 
                },  
                "amount": 1322,  
                "created_at": "2012-12-20T03:09:20.807194Z",  
                "debit": null,  
                "description": "Something tangy",  
                "expires_at": "2012-12-21T03:09:20.795622Z",  
                "fee": null,  
                "id": "HL53jSaB0Yef7kWXoGA5oiuD",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-20T03:09:20.768798Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCa60510e64a5211e2bde480ee7316ae43",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/cards/CCa60510e64a5211e2bde480ee7316ae43" 
                },  
                "transaction_number": "HL608-750-1896",  
                "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/holds/HL53jSaB0Yef7kWXoGA5oiuD" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/cards",  
                    "created_at": "2012-12-20T03:09:20.741966Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/holds",  
                    "id": "AC53fjQsxOGJP54GNA0q6MLN",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN" 
                },  
                "amount": 6754,  
                "created_at": "2012-12-20T03:09:20.798192Z",  
                "debit": null,  
                "description": "Something spicy",  
                "expires_at": "2012-12-21T03:09:20.788298Z",  
                "fee": null,  
                "id": "HL53jeNYlITCb5pB00t766Hx",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-20T03:09:20.768798Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCa60510e64a5211e2bde480ee7316ae43",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/cards/CCa60510e64a5211e2bde480ee7316ae43" 
                },  
                "transaction_number": "HL667-218-9099",  
                "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/holds/HL53jeNYlITCb5pB00t766Hx" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/cards",  
                    "created_at": "2012-12-20T03:09:20.741966Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/holds",  
                    "id": "AC53fjQsxOGJP54GNA0q6MLN",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN" 
                },  
                "amount": 3344,  
                "created_at": "2012-12-20T03:09:20.790340Z",  
                "debit": null,  
                "description": "Something sour",  
                "expires_at": "2012-12-21T03:09:20.778119Z",  
                "fee": null,  
                "id": "HL53iHmjuQNisabelwr2L9m3",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-20T03:09:20.768798Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCa60510e64a5211e2bde480ee7316ae43",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/cards/CCa60510e64a5211e2bde480ee7316ae43" 
                },  
                "transaction_number": "HL087-198-9987",  
                "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/holds/HL53iHmjuQNisabelwr2L9m3" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/cards",  
                    "created_at": "2012-12-20T03:09:20.741966Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/holds",  
                    "id": "AC53fjQsxOGJP54GNA0q6MLN",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN" 
                },  
                "amount": 1233,  
                "created_at": "2012-12-20T03:09:20.781412Z",  
                "debit": null,  
                "description": "Something sweet",  
                "expires_at": "2012-12-21T03:09:20.773968Z",  
                "fee": null,  
                "id": "HL53i3CDzx0RTrnvjTk51Jzd",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-20T03:09:20.768798Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCa60510e64a5211e2bde480ee7316ae43",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/cards/CCa60510e64a5211e2bde480ee7316ae43" 
                },  
                "transaction_number": "HL994-182-2692",  
                "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/holds/HL53i3CDzx0RTrnvjTk51Jzd" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/holds?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 4,  
        "uri": "/v1/marketplaces/TEST-MP537e3G80LyhFIyBVLewX2r/accounts/AC53fjQsxOGJP54GNA0q6MLN/holds?limit=10&offset=0" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h/cards",  
            "created_at": "2012-12-20T03:09:25.592208Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h/holds",  
            "id": "AC58HxjW7DsPptvPQIkE9f1h",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h/transactions",  
            "uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-20T03:09:25.636079Z",  
        "debit": null,  
        "description": "Something really tasty",  
        "expires_at": "2012-12-21T03:09:25.627857Z",  
        "fee": null,  
        "id": "HL58KAgotD8o3HqVCc5XmFSH",  
        "is_void": false,  
        "meta": { 
            "the-address": "123 Fake Street" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-20T03:09:25.625603Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCa8e97ad64a5211e28ae480ee7316ae43",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/accounts/AC58HxjW7DsPptvPQIkE9f1h/cards/CCa8e97ad64a5211e28ae480ee7316ae43" 
        },  
        "transaction_number": "HL564-358-8783",  
        "uri": "/v1/marketplaces/TEST-MP58y56SLyWkmtAfGBb7psST/holds/HL58KAgotD8o3HqVCc5XmFSH" 
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
        "hold_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/holds/HL5btUl4MLt2mbpDXvvB8OFt" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/cards",  
            "created_at": "2012-12-20T03:09:28.011789Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/holds",  
            "id": "AC5bqg8gK4fOzRBLolYTolTJ",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/transactions",  
            "uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ" 
        },  
        "amount": 1233,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2012-12-20T03:09:28.128725Z",  
        "created_at": "2012-12-20T03:09:28.142283Z",  
        "description": null,  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ",  
            "amount": 1233,  
            "created_at": "2012-12-20T03:09:28.064121Z",  
            "description": "Something sour",  
            "expires_at": "2012-12-21T03:09:28.057039Z",  
            "fee": null,  
            "id": "HL5btUl4MLt2mbpDXvvB8OFt",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/cards/CCaa5c096a4a5211e2a81f80ee7316ae43",  
            "transaction_number": "HL865-548-7029",  
            "uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/holds/HL5btUl4MLt2mbpDXvvB8OFt" 
        },  
        "id": "WD5bzigqwmD9P9ulUnhHQfuj",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/debits/WD5bzigqwmD9P9ulUnhHQfuj/refunds",  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-20T03:09:28.054937Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCaa5c096a4a5211e2a81f80ee7316ae43",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/accounts/AC5bqg8gK4fOzRBLolYTolTJ/cards/CCaa5c096a4a5211e2a81f80ee7316ae43" 
        },  
        "transaction_number": "W391-510-7515",  
        "uri": "/v1/marketplaces/TEST-MP5beLFNp3fof42N30qjT4TF/debits/WD5bzigqwmD9P9ulUnhHQfuj" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz/cards",  
            "created_at": "2012-12-20T03:09:32.727911Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz/holds",  
            "id": "AC5gJ7XRFCeTU08D7WZWKSAz",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz/transactions",  
            "uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-20T03:09:32.772625Z",  
        "debit": null,  
        "description": "Something sour",  
        "expires_at": "2012-12-21T03:09:32.765781Z",  
        "fee": null,  
        "id": "HL5gMeIKf2MSqvA1zkviS2Wv",  
        "is_void": true,  
        "meta": { 
            "reason": "Customer request" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-20T03:09:32.759521Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CCad2a88384a5211e28d3680ee7316ae43",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/accounts/AC5gJ7XRFCeTU08D7WZWKSAz/cards/CCad2a88384a5211e28d3680ee7316ae43" 
        },  
        "transaction_number": "HL501-225-7125",  
        "uri": "/v1/marketplaces/TEST-MP5gAflXzImOKKFqSO5pFiwj/holds/HL5gMeIKf2MSqvA1zkviS2Wv" 
    } 
 

