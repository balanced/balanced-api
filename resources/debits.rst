Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_

Fields
------

``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**. The URI of the debit. 
 
``amount`` 
    **integer**. The amount of the debit. 
 
``fee`` 
    **integer**. The fee charged by Balanced for this debit. 
 
``description`` 
    **string**. Free-text description of the debit. 
 
``hold`` 
    **object**. The original hold for this debit, if this debit was to a card. 
    If the debit was to a bank account, this field will be null.  
 
``refunds_uri`` 
    **string**. URI for any partial or complete refunds of this debit. 
 
``appears_on_statement_as`` 
    **string**. The text that will appear on the buyer's statement. 
 
``account`` 
    **object**. The account to which this debit is associated. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    debit was created. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``available_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    transaction is guaranteed to clear. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``source`` 
    **object**. The funding source (card or bank account) for this debit.  
 

Debit an Account
----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/debits 
    POST /v1/marketplaces/:marketplace_id/holds/:hold_id/debits 
    POST /v1/marketplaces/:marketplace_id/debits 
 

Request
~~~~~~~

``amount`` 
    *optional* **integer** or **null**. If the resolving URI references a hold then this is hold amount. You can 
    always capture less than the hold amount (e.g. a partial capture). 
    Otherwise its the maximum per debit amount for your marketplace. Value must be >= the minimum per debit ``amount`` for *your* 
    marketplace. Value must be <= the maximum per debit ``amount`` for *your* 
    marketplace. 
 
``appears_on_statement_as`` 
    *optional* **string** or **null**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``description`` 
    *optional* **string** or **null**.  
 
``merchant_uri`` 
    *optional* **string** or **null**. URI referencing the merchant account on behalf of whom the 
    debit is being done. This is different from marketplace. 
    In a peer-to-peer transaction, there are three parties: 
 
    1. Marketplace 
    2. Seller/Service provider 
    3. Buyer 
 
    This merchant account represents 2. 
 
``hold_uri`` 
    *optional* **string** or **null**. If no ``hold`` is provided one my be generated and captured if the 
    source is a card. 
 
``source_uri`` 
    *optional* **string** or **null**.  
 
``bank_account_uri`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
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
            "holds_uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:09.410546Z",  
            "uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC5GdDB4J5sykCg7nitWHOfO",  
            "credits_uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO/cards" 
        },  
        "fee": 43,  
        "description": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/debits/WD5GmZUeKn0shQpbGnvGFIdS/refunds",  
        "created_at": "2012-10-31T09:55:09.555939Z",  
        "transaction_number": "W407-657-3620",  
        "uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/debits/WD5GmZUeKn0shQpbGnvGFIdS",  
        "source": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-31T09:55:09.406246Z",  
            "uri": "/v1/marketplaces/TEST-MP5G6jypakEhMKgV8BOmGLqI/accounts/AC5GdDB4J5sykCg7nitWHOfO/bank_accounts/BA5GdkvTakOKPE886DOB1MvW",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA5GdkvTakOKPE886DOB1MvW" 
        },  
        "amount": 1234,  
        "meta": {},  
        "appears_on_statement_as": "hiya.bom",  
        "hold": null,  
        "id": "WD5GmZUeKn0shQpbGnvGFIdS",  
        "available_at": "2012-10-31T16:55:09.543973Z" 
    } 
 

Retrieve a Debit
----------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id 
    GET /v1/marketplaces/:marketplace_id/holds/:hold_id/debits/:debit_id 
    GET /v1/marketplaces/:marketplace_id/debits/:debit_id 
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:10.868346Z",  
            "uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC5HRidOHjlk34gH10HozphW",  
            "credits_uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW/cards" 
        },  
        "fee": 43,  
        "description": "abc123",  
        "refunds_uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/debits/WD5HVvYPbP0KTm5DiWB1Ikmg/refunds",  
        "created_at": "2012-10-31T09:55:10.935555Z",  
        "transaction_number": "W964-472-3592",  
        "uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/debits/WD5HVvYPbP0KTm5DiWB1Ikmg",  
        "source": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-31T09:55:10.864169Z",  
            "uri": "/v1/marketplaces/TEST-MP5HJZ7A8Vll92PLLzuD2rFa/accounts/AC5HRidOHjlk34gH10HozphW/bank_accounts/BA5HQZAMa9QXfsTmlOOkX3RW",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA5HQZAMa9QXfsTmlOOkX3RW" 
        },  
        "amount": 1254,  
        "meta": {},  
        "appears_on_statement_as": "PND*TESTS",  
        "hold": null,  
        "id": "WD5HVvYPbP0KTm5DiWB1Ikmg",  
        "available_at": "2012-10-31T16:55:10.929090Z" 
    } 
 

List All Debits
---------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits 
    GET /v1/marketplaces/:marketplace_id/holds/:hold_id/debits 
    GET /v1/marketplaces/:marketplace_id/debits 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:12.223094Z",  
                    "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/transactions",  
                    "email_address": "email.8@y.com",  
                    "id": "AC5JnLswVWfvdOeDbp2Dh5bu",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/cards" 
                },  
                "fee": 349999,  
                "description": null,  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-31T09:55:12.239407Z",  
                    "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/cards/CCbc567c5c237b11e2b85980ee7316ae44",  
                    "id": "CCbc567c5c237b11e2b85980ee7316ae44",  
                    "card_type": "visa",  
                    "is_valid": true,  
                    "meta": {},  
                    "country_code": "USA",  
                    "postal_code": "94110",  
                    "brand": "Visa",  
                    "street_address": "Somewhere over the rainbow",  
                    "name": "Jet Li" 
                },  
                "created_at": "2012-10-31T09:55:12.274523Z",  
                "transaction_number": "W059-804-8655",  
                "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits/WD5JpNw9FrWBau6IzRXp1CYY",  
                "refunds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits/WD5JpNw9FrWBau6IzRXp1CYY/refunds",  
                "amount": 9999999,  
                "meta": {},  
                "appears_on_statement_as": "hiya.bom",  
                "hold": { 
                    "fee": 30,  
                    "description": null,  
                    "created_at": "2012-10-31T09:55:12.281565Z",  
                    "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/holds/HL5JrJZbEHdUdpCY8bUtiLDm",  
                    "expires_at": "2012-11-07T16:55:12.250610Z",  
                    "transaction_number": "HL847-376-3326",  
                    "amount": 9999999,  
                    "meta": {},  
                    "is_void": false,  
                    "account_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu",  
                    "source_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnLswVWfvdOeDbp2Dh5bu/cards/CCbc567c5c237b11e2b85980ee7316ae44",  
                    "id": "HL5JrJZbEHdUdpCY8bUtiLDm" 
                },  
                "id": "WD5JpNw9FrWBau6IzRXp1CYY",  
                "available_at": "2012-10-31T16:55:12.251369Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:12.221933Z",  
                    "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC5JnGlXy2VDJEyifKMaVJQw",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/cards" 
                },  
                "fee": 43,  
                "description": "abc123",  
                "source": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-10-31T09:55:12.217612Z",  
                    "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/bank_accounts/BA5JnnlRKOZtjzUAXBT7SaqM",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BA5JnnlRKOZtjzUAXBT7SaqM" 
                },  
                "created_at": "2012-10-31T09:55:12.322556Z",  
                "transaction_number": "W621-829-1845",  
                "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits/WD5JttbipF0wIt3dlNz7sCfq",  
                "refunds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits/WD5JttbipF0wIt3dlNz7sCfq/refunds",  
                "amount": 1254,  
                "meta": {},  
                "appears_on_statement_as": "PND*TESTS",  
                "hold": null,  
                "id": "WD5JttbipF0wIt3dlNz7sCfq",  
                "available_at": "2012-10-31T16:55:12.305841Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:12.221933Z",  
                    "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC5JnGlXy2VDJEyifKMaVJQw",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/cards" 
                },  
                "fee": 15,  
                "description": "abc123",  
                "source": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-10-31T09:55:12.217612Z",  
                    "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/accounts/AC5JnGlXy2VDJEyifKMaVJQw/bank_accounts/BA5JnnlRKOZtjzUAXBT7SaqM",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BA5JnnlRKOZtjzUAXBT7SaqM" 
                },  
                "created_at": "2012-10-31T09:55:12.323331Z",  
                "transaction_number": "W350-075-4676",  
                "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits/WD5JtC6i0ZcO4UfQXlzCHH4U",  
                "refunds_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits/WD5JtC6i0ZcO4UfQXlzCHH4U/refunds",  
                "amount": 431,  
                "meta": {},  
                "appears_on_statement_as": "PND*TESTS",  
                "hold": null,  
                "id": "WD5JtC6i0ZcO4UfQXlzCHH4U",  
                "available_at": "2012-10-31T16:55:12.307751Z" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 3,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP5JhhwYkM6gYt2dw0bGSoKM/debits?limit=10&offset=0" 
    } 
 

Update a Debit
--------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id 
    PUT /v1/marketplaces/:marketplace_id/holds/:hold_id/debits/:debit_id 
    PUT /v1/marketplaces/:marketplace_id/debits/:debit_id 
 

Request
~~~~~~~

``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``description`` 
    *optional* **string** or **null**.  
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:15.313583Z",  
            "uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC5MRgZcKIBQjzwqHG3TqLlO",  
            "credits_uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO/cards" 
        },  
        "fee": 43,  
        "description": "my new description",  
        "refunds_uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/debits/WD5MWUMQx6pfFIxHnV8mk4ba/refunds",  
        "created_at": "2012-10-31T09:55:15.410551Z",  
        "transaction_number": "W688-171-4687",  
        "uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/debits/WD5MWUMQx6pfFIxHnV8mk4ba",  
        "source": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-31T09:55:15.309504Z",  
            "uri": "/v1/marketplaces/TEST-MP5MJZrJLlYPUyn0ZYEPGtTu/accounts/AC5MRgZcKIBQjzwqHG3TqLlO/bank_accounts/BA5MQYPUXxEtoFGttGSNE8FC",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA5MQYPUXxEtoFGttGSNE8FC" 
        },  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "hold": null,  
        "id": "WD5MWUMQx6pfFIxHnV8mk4ba",  
        "available_at": "2012-10-31T16:55:15.395247Z" 
    } 
 

