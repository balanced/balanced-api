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
    **string**. The resource identifier. 
 
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
    **object**. The captured debit associated with this hold. See `Debit <./debits.rst>`_. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``account`` 
    **object**. The account against which this hold was created. See `Account <./accounts.rst>`_. 
 
``uri`` 
    **string**. A URI for a Balanced entity 
 
``is_void`` 
    **boolean**. A boolean flag indicating if the hold has been voided or not.  
 
``source`` 
    **object**. The funding source for this hold. See `Card <./cards.rst>`_. 
 

Create a Hold
-------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/holds 
    POST /v1/marketplaces/:marketplace_id/holds 
 

Request
~~~~~~~

``amount`` 
    *required* **integer** or **null**. Value must be >= to the minimum debit amount allowed for *your* 
    marketplace. Value must be <= to the maximum debit amount allowed for *your* 
    marketplace. 
 
``appears_on_statement_as`` 
    *optional* **string** or **null**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``description`` 
    *optional* **string** or **null**.  
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``source_uri`` 
    *optional* **string** or **null**.  
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:20.180004Z",  
            "uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM/transactions",  
            "email_address": "email.9@y.com",  
            "id": "AC5SkCc6UzIcS3DYIxiaIqaM",  
            "credits_uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM/cards" 
        },  
        "fee": 30,  
        "description": "Something tasty",  
        "transaction_number": "HL645-773-4828",  
        "created_at": "2012-10-31T09:55:20.274044Z",  
        "uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/holds/HL5Sr9d3GC5XSimrH5QijKnO",  
        "expires_at": "2012-11-07T16:55:20.269389Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-31T09:55:20.203831Z",  
            "uri": "/v1/marketplaces/TEST-MP5Sb1NmC8cf6TE7MUahIZZq/accounts/AC5SkCc6UzIcS3DYIxiaIqaM/cards/CCc1170428237b11e29ffa80ee7316ae44",  
            "id": "CCc1170428237b11e29ffa80ee7316ae44",  
            "card_type": "visa",  
            "is_valid": true,  
            "meta": {},  
            "country_code": "USA",  
            "postal_code": "94110",  
            "brand": "Visa",  
            "street_address": "Somewhere over the rainbow",  
            "name": "Jet Li" 
        },  
        "amount": 3421,  
        "meta": { 
            "id": "#12312123123" 
        },  
        "is_void": false,  
        "debit": null,  
        "id": "HL5Sr9d3GC5XSimrH5QijKnO" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:21.533061Z",  
            "uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi/transactions",  
            "email_address": "email.9@y.com",  
            "id": "AC5TQYI098Bua6CHf4xY9YHi",  
            "credits_uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi/cards" 
        },  
        "fee": 30,  
        "description": "Something sour",  
        "transaction_number": "HL470-675-0375",  
        "created_at": "2012-10-31T09:55:21.566430Z",  
        "uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/holds/HL5TThXFOgKSNao6spdbk2LG",  
        "expires_at": "2012-11-01T16:55:21.552616Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-31T09:55:21.550796Z",  
            "uri": "/v1/marketplaces/TEST-MP5THpNJvnrEpIOqixpkdNze/accounts/AC5TQYI098Bua6CHf4xY9YHi/cards/CCc1e4b8dc237b11e2b56580ee7316ae44",  
            "id": "CCc1e4b8dc237b11e2b56580ee7316ae44",  
            "card_type": "visa",  
            "is_valid": true,  
            "meta": {},  
            "country_code": "USA",  
            "postal_code": "94110",  
            "brand": "Visa",  
            "street_address": "Somewhere over the rainbow",  
            "name": "Jet Li" 
        },  
        "amount": 1233,  
        "meta": {},  
        "is_void": false,  
        "debit": null,  
        "id": "HL5TThXFOgKSNao6spdbk2LG" 
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
        "first_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/holds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:22.822385Z",  
                    "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/transactions",  
                    "email_address": "email.9@y.com",  
                    "id": "AC5ViSxz5z8bqfSvE9VqZfOk",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/cards" 
                },  
                "fee": 30,  
                "description": "Something tangy",  
                "transaction_number": "HL900-150-3137",  
                "created_at": "2012-10-31T09:55:22.870831Z",  
                "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/holds/HL5VmfXN2hpfUFewh0BcqtVO",  
                "expires_at": "2012-11-01T16:55:22.862295Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-31T09:55:22.847077Z",  
                    "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/cards/CCc2aa5600237b11e29ede80ee7316ae44",  
                    "id": "CCc2aa5600237b11e29ede80ee7316ae44",  
                    "card_type": "visa",  
                    "is_valid": true,  
                    "meta": {},  
                    "country_code": "USA",  
                    "postal_code": "94110",  
                    "brand": "Visa",  
                    "street_address": "Somewhere over the rainbow",  
                    "name": "Jet Li" 
                },  
                "amount": 1322,  
                "meta": {},  
                "is_void": false,  
                "debit": null,  
                "id": "HL5VmfXN2hpfUFewh0BcqtVO" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:22.822385Z",  
                    "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/transactions",  
                    "email_address": "email.9@y.com",  
                    "id": "AC5ViSxz5z8bqfSvE9VqZfOk",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/cards" 
                },  
                "fee": 30,  
                "description": "Something spicy",  
                "transaction_number": "HL471-710-6273",  
                "created_at": "2012-10-31T09:55:22.869468Z",  
                "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/holds/HL5Vm9NxVk43sEsEBhboBSvO",  
                "expires_at": "2012-11-01T16:55:22.861996Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-31T09:55:22.847077Z",  
                    "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/cards/CCc2aa5600237b11e29ede80ee7316ae44",  
                    "id": "CCc2aa5600237b11e29ede80ee7316ae44",  
                    "card_type": "visa",  
                    "is_valid": true,  
                    "meta": {},  
                    "country_code": "USA",  
                    "postal_code": "94110",  
                    "brand": "Visa",  
                    "street_address": "Somewhere over the rainbow",  
                    "name": "Jet Li" 
                },  
                "amount": 6754,  
                "meta": {},  
                "is_void": false,  
                "debit": null,  
                "id": "HL5Vm9NxVk43sEsEBhboBSvO" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:22.822385Z",  
                    "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/transactions",  
                    "email_address": "email.9@y.com",  
                    "id": "AC5ViSxz5z8bqfSvE9VqZfOk",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/cards" 
                },  
                "fee": 30,  
                "description": "Something sour",  
                "transaction_number": "HL130-944-7503",  
                "created_at": "2012-10-31T09:55:22.868017Z",  
                "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/holds/HL5Vm3xpbEkrl4O8xa1shNyI",  
                "expires_at": "2012-11-01T16:55:22.861682Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-31T09:55:22.847077Z",  
                    "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/cards/CCc2aa5600237b11e29ede80ee7316ae44",  
                    "id": "CCc2aa5600237b11e29ede80ee7316ae44",  
                    "card_type": "visa",  
                    "is_valid": true,  
                    "meta": {},  
                    "country_code": "USA",  
                    "postal_code": "94110",  
                    "brand": "Visa",  
                    "street_address": "Somewhere over the rainbow",  
                    "name": "Jet Li" 
                },  
                "amount": 3344,  
                "meta": {},  
                "is_void": false,  
                "debit": null,  
                "id": "HL5Vm3xpbEkrl4O8xa1shNyI" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:22.822385Z",  
                    "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/transactions",  
                    "email_address": "email.9@y.com",  
                    "id": "AC5ViSxz5z8bqfSvE9VqZfOk",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/cards" 
                },  
                "fee": 30,  
                "description": "Something sweet",  
                "transaction_number": "HL939-753-1172",  
                "created_at": "2012-10-31T09:55:22.866554Z",  
                "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/holds/HL5VlWBZ4XPVwyZ3ImEypnRW",  
                "expires_at": "2012-11-01T16:55:22.849348Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-31T09:55:22.847077Z",  
                    "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/cards/CCc2aa5600237b11e29ede80ee7316ae44",  
                    "id": "CCc2aa5600237b11e29ede80ee7316ae44",  
                    "card_type": "visa",  
                    "is_valid": true,  
                    "meta": {},  
                    "country_code": "USA",  
                    "postal_code": "94110",  
                    "brand": "Visa",  
                    "street_address": "Somewhere over the rainbow",  
                    "name": "Jet Li" 
                },  
                "amount": 1233,  
                "meta": {},  
                "is_void": false,  
                "debit": null,  
                "id": "HL5VlWBZ4XPVwyZ3ImEypnRW" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/holds?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 4,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP5V8Eeq5XiFSNQ6Ni9qqP3e/accounts/AC5ViSxz5z8bqfSvE9VqZfOk/holds?limit=10&offset=0" 
    } 
 

Update a Hold
-------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id 
    PUT /v1/marketplaces/:marketplace_id/holds/:hold_id 
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:25.723267Z",  
            "uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq/transactions",  
            "email_address": "email.9@y.com",  
            "id": "AC5YzadAWxlIO6UhN2oyeFRq",  
            "credits_uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq/cards" 
        },  
        "fee": 30,  
        "description": "Something really tasty",  
        "transaction_number": "HL904-079-7888",  
        "created_at": "2012-10-31T09:55:25.765168Z",  
        "uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/holds/HL5YC4G8fdIIFHQUFgYx5lVW",  
        "expires_at": "2012-11-01T16:55:25.749462Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-31T09:55:25.747227Z",  
            "uri": "/v1/marketplaces/TEST-MP5YoVLS8fuwicG1OSZCdmS0/accounts/AC5YzadAWxlIO6UhN2oyeFRq/cards/CCc464de02237b11e2848b80ee7316ae44",  
            "id": "CCc464de02237b11e2848b80ee7316ae44",  
            "card_type": "visa",  
            "is_valid": true,  
            "meta": {},  
            "country_code": "USA",  
            "postal_code": "94110",  
            "brand": "Visa",  
            "street_address": "Somewhere over the rainbow",  
            "name": "Jet Li" 
        },  
        "amount": 1233,  
        "meta": { 
            "the-address": "123 Fake Street" 
        },  
        "is_void": false,  
        "debit": null,  
        "id": "HL5YC4G8fdIIFHQUFgYx5lVW" 
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
        "hold_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/holds/HL60gCPKq1jzLa1twl9rfs20" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:27.198923Z",  
            "uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/transactions",  
            "email_address": "email.9@y.com",  
            "id": "AC60e3Ouc0C5v9AwnSTQi0Ha",  
            "credits_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/cards" 
        },  
        "fee": 43,  
        "description": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/debits/WD60kPlyyqJLPm7HKIoJcv1q/refunds",  
        "created_at": "2012-10-31T09:55:27.305771Z",  
        "transaction_number": "W849-326-8318",  
        "uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/debits/WD60kPlyyqJLPm7HKIoJcv1q",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-31T09:55:27.221069Z",  
            "uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/cards/CCc545e618237b11e29fb280ee7316ae44",  
            "id": "CCc545e618237b11e29fb280ee7316ae44",  
            "card_type": "visa",  
            "is_valid": true,  
            "meta": {},  
            "country_code": "USA",  
            "postal_code": "94110",  
            "brand": "Visa",  
            "street_address": "Somewhere over the rainbow",  
            "name": "Jet Li" 
        },  
        "amount": 1233,  
        "meta": {},  
        "appears_on_statement_as": "hiya.bom",  
        "hold": { 
            "fee": 30,  
            "description": "Something sour",  
            "created_at": "2012-10-31T09:55:27.235746Z",  
            "uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/holds/HL60gCPKq1jzLa1twl9rfs20",  
            "expires_at": "2012-11-01T16:55:27.223186Z",  
            "transaction_number": "HL240-921-6623",  
            "amount": 1233,  
            "meta": {},  
            "is_void": false,  
            "account_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha",  
            "source_uri": "/v1/marketplaces/TEST-MP605GZ2wrX4QtVhUwuYEy8c/accounts/AC60e3Ouc0C5v9AwnSTQi0Ha/cards/CCc545e618237b11e29fb280ee7316ae44",  
            "id": "HL60gCPKq1jzLa1twl9rfs20" 
        },  
        "id": "WD60kPlyyqJLPm7HKIoJcv1q",  
        "available_at": "2012-10-31T16:55:27.294767Z" 
    } 
 

Void a Hold
-----------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id 
    PUT /v1/marketplaces/:marketplace_id/holds/:hold_id 
 

Request
~~~~~~~

``is_void`` 
    *optional* **boolean** or **null**. Flag value, should be ``true`` or ``false``. 
 
``appears_on_statement_as`` 
    *optional* **string** or **null**. Text that will appear on the buyer's statement. Characters that can be 
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
            "holds_uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:30.091380Z",  
            "uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c/transactions",  
            "email_address": "email.9@y.com",  
            "id": "AC63tLIE0XE5LHmDQxY2eO0c",  
            "credits_uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c/cards" 
        },  
        "fee": 30,  
        "description": "Something sour",  
        "transaction_number": "HL283-234-8750",  
        "created_at": "2012-10-31T09:55:30.129519Z",  
        "uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/holds/HL63wpTXG0Zvpqbv3qkIo0Ac",  
        "expires_at": "2012-11-01T16:55:30.115648Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-31T09:55:30.113332Z",  
            "uri": "/v1/marketplaces/TEST-MP63lMokP3ncKLGzsmlCAGqM/accounts/AC63tLIE0XE5LHmDQxY2eO0c/cards/CCc6ff2780237b11e28a8c80ee7316ae44",  
            "id": "CCc6ff2780237b11e28a8c80ee7316ae44",  
            "card_type": "visa",  
            "is_valid": true,  
            "meta": {},  
            "country_code": "USA",  
            "postal_code": "94110",  
            "brand": "Visa",  
            "street_address": "Somewhere over the rainbow",  
            "name": "Jet Li" 
        },  
        "amount": 1233,  
        "meta": { 
            "reason": "Customer request" 
        },  
        "is_void": true,  
        "debit": null,  
        "id": "HL63wpTXG0Zvpqbv3qkIo0Ac" 
    } 
 

