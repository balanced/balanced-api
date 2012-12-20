Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_
- `Refund a Debit`_

Fields
------

``id`` 
    **string**.  
 
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
    *optional* **integer**. If the resolving URI references a hold then this is hold amount. You can 
    always capture less than the hold amount (e.g. a partial capture). 
    Otherwise its the maximum per debit amount for your marketplace. Value must be >= the minimum per debit ``amount`` for *your* 
    marketplace. Value must be <= the maximum per debit ``amount`` for *your* 
    marketplace. 
 
``appears_on_statement_as`` 
    *optional* **string**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 
``merchant_uri`` 
    *optional* **string**. URI referencing the merchant account on behalf of whom the 
    debit is being done. This is different from marketplace. 
    In a peer-to-peer transaction, there are three parties: 
 
    1. Marketplace 
    2. Seller/Service provider 
    3. Buyer 
 
    This merchant account represents 2. 
 
``hold_uri`` 
    *optional* **string**. If no ``hold`` is provided one my be generated and captured if the 
    funding source is a card. 
 
``source_uri`` 
    *optional* **string**.  
 
``bank_account_uri`` 
    *optional* **string**.  
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/cards",  
            "created_at": "2012-12-18T22:08:10.018156Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/holds",  
            "id": "AC3C3zOlT7lZhpVEt4wInv0S",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2012-12-19T06:08:10.077772Z",  
        "created_at": "2012-12-18T22:08:10.084290Z",  
        "description": null,  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S",  
            "amount": 1234,  
            "created_at": "2012-12-18T22:08:10.086190Z",  
            "description": null,  
            "expires_at": "2012-12-26T06:08:10.077457Z",  
            "fee": 30,  
            "id": "HL3C8jggMLLSW5sU4vKeVM9Q",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/cards/CC3C3Erax28QSU0rnxzlDNRE",  
            "transaction_number": "HL323-694-6071",  
            "uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/holds/HL3C8jggMLLSW5sU4vKeVM9Q" 
        },  
        "id": "WD3C88PHo8vthO1wi4nEEzdE",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/debits/WD3C88PHo8vthO1wi4nEEzdE/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-18T22:08:10.020137Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC3C3Erax28QSU0rnxzlDNRE",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/accounts/AC3C3zOlT7lZhpVEt4wInv0S/cards/CC3C3Erax28QSU0rnxzlDNRE" 
        },  
        "transaction_number": "W620-646-7154",  
        "uri": "/v1/marketplaces/TEST-MP3C15Tq5DRJ8cqxhQ8uLalk/debits/WD3C88PHo8vthO1wi4nEEzdE" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/cards",  
            "created_at": "2012-12-18T22:08:11.318828Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/holds",  
            "id": "AC3Dwh6wx00RADu2sX4A4BSO",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2012-12-19T06:08:11.361438Z",  
        "created_at": "2012-12-18T22:08:11.367020Z",  
        "description": "abc123",  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO",  
            "amount": 1254,  
            "created_at": "2012-12-18T22:08:11.368139Z",  
            "description": null,  
            "expires_at": "2012-12-20T06:08:11.358580Z",  
            "fee": 30,  
            "id": "HL3DzIhQCeA2YIG4MEJW2kci",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/cards/CC3DwlVUCuP2Yo1dPp2rMtWa",  
            "transaction_number": "HL208-786-8775",  
            "uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/holds/HL3DzIhQCeA2YIG4MEJW2kci" 
        },  
        "id": "WD3DzyUuGZzZGWgxUuT6RM4G",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/debits/WD3DzyUuGZzZGWgxUuT6RM4G/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-18T22:08:11.320833Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC3DwlVUCuP2Yo1dPp2rMtWa",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/accounts/AC3Dwh6wx00RADu2sX4A4BSO/cards/CC3DwlVUCuP2Yo1dPp2rMtWa" 
        },  
        "transaction_number": "W583-341-3105",  
        "uri": "/v1/marketplaces/TEST-MP3DtSuuBDL9kse6DzbEeHUe/debits/WD3DzyUuGZzZGWgxUuT6RM4G" 
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
        "first_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/cards",  
                    "created_at": "2012-12-18T22:08:12.601415Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/debits",  
                    "email_address": "email.4@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/holds",  
                    "id": "AC3EXI13mjOtnpnUrhssBXHc",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc" 
                },  
                "amount": 9999999,  
                "appears_on_statement_as": "hiya.bom",  
                "available_at": "2012-12-19T06:08:12.613437Z",  
                "created_at": "2012-12-18T22:08:12.623575Z",  
                "description": null,  
                "fee": 349999,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc",  
                    "amount": 9999999,  
                    "created_at": "2012-12-18T22:08:12.626994Z",  
                    "description": null,  
                    "expires_at": "2012-12-26T06:08:12.613084Z",  
                    "fee": 30,  
                    "id": "HL3EZs4vm7HKrnqfmU3rBymS",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/cards/CC78481f9e49a211e29ba668a86d3cb93a",  
                    "transaction_number": "HL225-242-0038",  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/holds/HL3EZs4vm7HKrnqfmU3rBymS" 
                },  
                "id": "WD3EZ9Sz21zon6KXX9xME0MW",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits/WD3EZ9Sz21zon6KXX9xME0MW/refunds",  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-18T22:08:12.607563Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC78481f9e49a211e29ba668a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXI13mjOtnpnUrhssBXHc/cards/CC78481f9e49a211e29ba668a86d3cb93a" 
                },  
                "transaction_number": "W035-368-3724",  
                "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits/WD3EZ9Sz21zon6KXX9xME0MW" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/cards",  
                    "created_at": "2012-12-18T22:08:12.600805Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/holds",  
                    "id": "AC3EXFEWbmkt7heaYRxUq5hU",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2012-12-19T06:08:12.646479Z",  
                "created_at": "2012-12-18T22:08:12.652112Z",  
                "description": "abc123",  
                "fee": 43,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU",  
                    "amount": 1254,  
                    "created_at": "2012-12-18T22:08:12.653261Z",  
                    "description": null,  
                    "expires_at": "2012-12-20T06:08:12.642324Z",  
                    "fee": 30,  
                    "id": "HL3F1knoXQttE1Lb7FMHdCLU",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/cards/CC3EXKRpbY2KgY2bPc1lBk5I",  
                    "transaction_number": "HL757-850-9710",  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/holds/HL3F1knoXQttE1Lb7FMHdCLU" 
                },  
                "id": "WD3F1bwqEsJ7eUDXaiHdL7zI",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits/WD3F1bwqEsJ7eUDXaiHdL7zI/refunds",  
                "source": { 
                    "brand": "American Express",  
                    "card_type": "amex",  
                    "created_at": "2012-12-18T22:08:12.602904Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC3EXKRpbY2KgY2bPc1lBk5I",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/cards/CC3EXKRpbY2KgY2bPc1lBk5I" 
                },  
                "transaction_number": "W980-103-0596",  
                "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits/WD3F1bwqEsJ7eUDXaiHdL7zI" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/cards",  
                    "created_at": "2012-12-18T22:08:12.600805Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/holds",  
                    "id": "AC3EXFEWbmkt7heaYRxUq5hU",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2012-12-19T06:08:12.664341Z",  
                "created_at": "2012-12-18T22:08:12.669079Z",  
                "description": "abc123",  
                "fee": 15,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU",  
                    "amount": 431,  
                    "created_at": "2012-12-18T22:08:12.670240Z",  
                    "description": null,  
                    "expires_at": "2012-12-20T06:08:12.661676Z",  
                    "fee": 30,  
                    "id": "HL3F2vDjVOoi6hA4MnDR3nrY",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/cards/CC3EXKRpbY2KgY2bPc1lBk5I",  
                    "transaction_number": "HL561-167-1489",  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/holds/HL3F2vDjVOoi6hA4MnDR3nrY" 
                },  
                "id": "WD3F2qaK6oq2XI6Uj5oy4IUW",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits/WD3F2qaK6oq2XI6Uj5oy4IUW/refunds",  
                "source": { 
                    "brand": "American Express",  
                    "card_type": "amex",  
                    "created_at": "2012-12-18T22:08:12.602904Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC3EXKRpbY2KgY2bPc1lBk5I",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/accounts/AC3EXFEWbmkt7heaYRxUq5hU/cards/CC3EXKRpbY2KgY2bPc1lBk5I" 
                },  
                "transaction_number": "W846-231-0558",  
                "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits/WD3F2qaK6oq2XI6Uj5oy4IUW" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP3EVhNj3zZzMrxrfaiwQKi6/debits?limit=10&offset=0" 
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
    *optional* **object**. Single level mapping from string keys to string values. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/cards",  
            "created_at": "2012-12-18T22:08:15.457823Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/holds",  
            "id": "AC3IaTWTTwQSdoMhVFTD2JCi",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2012-12-19T06:08:15.504444Z",  
        "created_at": "2012-12-18T22:08:15.510515Z",  
        "description": "my new description",  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi",  
            "amount": 1254,  
            "created_at": "2012-12-18T22:08:15.512019Z",  
            "description": null,  
            "expires_at": "2012-12-20T06:08:15.501653Z",  
            "fee": 30,  
            "id": "HL3IeFzXgtljOubgxVat2f7c",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/cards/CC3IaYFlxLtdXtuVSxP1KA0G",  
            "transaction_number": "HL726-642-9314",  
            "uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/holds/HL3IeFzXgtljOubgxVat2f7c" 
        },  
        "id": "WD3Ieu87Il7UYiy1r9jZPYUy",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "refunds_uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/debits/WD3Ieu87Il7UYiy1r9jZPYUy/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-18T22:08:15.459847Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC3IaYFlxLtdXtuVSxP1KA0G",  
            "is_valid": true,  
            "last_four": "1117",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/accounts/AC3IaTWTTwQSdoMhVFTD2JCi/cards/CC3IaYFlxLtdXtuVSxP1KA0G" 
        },  
        "transaction_number": "W705-562-2527",  
        "uri": "/v1/marketplaces/TEST-MP3I8kSVOw3OuWLzloDJ1PVU/debits/WD3Ieu87Il7UYiy1r9jZPYUy" 
    } 
 

Refund a Debit
--------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/debits/:debit_id/refunds 
 

Request
~~~~~~~

``amount`` 
    *optional* **integer**. Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original 
    ``debit``. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 

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
        "account": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA/cards",  
            "created_at": "2012-12-18T22:08:18.174458Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA/holds",  
            "id": "AC3Lelbg1emokHlQwv9MIlvA",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-18T22:08:18.267049Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-19T06:08:18.217882Z",  
            "created_at": "2012-12-18T22:08:18.223751Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/holds/HL3LhRN7CSdze5Yx12wLzXuO",  
            "id": "WD3LhHbAv2joYVOcK2d4TeLU",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/debits/WD3LhHbAv2joYVOcK2d4TeLU/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/accounts/AC3Lelbg1emokHlQwv9MIlvA/cards/CC3LepXHimYmSBMoBQ12EvqO",  
            "transaction_number": "W626-761-4705",  
            "uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/debits/WD3LhHbAv2joYVOcK2d4TeLU" 
        },  
        "description": "abc123",  
        "fee": 0,  
        "id": "RF3LkMulFgF0XHGvkaWT3B4m",  
        "meta": {},  
        "transaction_number": "RF071-837-8402",  
        "uri": "/v1/marketplaces/TEST-MP3LbUHFw4QshM5xLfLQD6rM/refunds/RF3LkMulFgF0XHGvkaWT3B4m" 
    } 
 

