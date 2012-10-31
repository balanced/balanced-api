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
            "holds_uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:41.256145Z",  
            "uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS/transactions",  
            "email_address": "email.9@y.com",  
            "id": "ACblgw0sqdkz4bPmaUqgCRS",  
            "credits_uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS/cards" 
        },  
        "fee": 30,  
        "description": "Something tasty",  
        "transaction_number": "HL969-813-8804",  
        "created_at": "2012-10-30T18:26:41.335562Z",  
        "uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/holds/HLbqLpbSgWjCygHnrWWvx0o",  
        "expires_at": "2012-11-07T01:26:41.330892Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-30T18:26:41.272199Z",  
            "uri": "/v1/marketplaces/TEST-MPbb0XF6I8AfwqIrKu4wk1S/accounts/ACblgw0sqdkz4bPmaUqgCRS/cards/CC0604fb7622fa11e2b39080ee7316ae44",  
            "id": "CC0604fb7622fa11e2b39080ee7316ae44",  
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
        "id": "HLbqLpbSgWjCygHnrWWvx0o" 
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
            "holds_uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:42.866720Z",  
            "uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK/transactions",  
            "email_address": "email.9@y.com",  
            "id": "ACd9z5Is1b32QluUXi0D0VK",  
            "credits_uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK/cards" 
        },  
        "fee": 30,  
        "description": "Something sour",  
        "transaction_number": "HL387-844-8151",  
        "created_at": "2012-10-30T18:26:42.908237Z",  
        "uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/holds/HLdcrHNjwZPoKmF4iPSaAew",  
        "expires_at": "2012-11-01T01:26:42.892763Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-30T18:26:42.890455Z",  
            "uri": "/v1/marketplaces/TEST-MPd0iIAIH7aqv1UfeihNHGA/accounts/ACd9z5Is1b32QluUXi0D0VK/cards/CC06fbb1dc22fa11e2bbe880ee7316ae44",  
            "id": "CC06fbb1dc22fa11e2bbe880ee7316ae44",  
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
        "id": "HLdcrHNjwZPoKmF4iPSaAew" 
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
        "first_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/holds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:44.541322Z",  
                    "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/transactions",  
                    "email_address": "email.9@y.com",  
                    "id": "ACf2lmtEsktGtDTJzNBUsO8",  
                    "credits_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/cards" 
                },  
                "fee": 30,  
                "description": "Something tangy",  
                "transaction_number": "HL580-149-9165",  
                "created_at": "2012-10-30T18:26:44.586541Z",  
                "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/holds/HLf5va4cNtHEZi8Ld7mgSfa",  
                "expires_at": "2012-11-01T01:26:44.579276Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-30T18:26:44.565695Z",  
                    "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/cards/CC07fb694222fa11e29bf680ee7316ae44",  
                    "id": "CC07fb694222fa11e29bf680ee7316ae44",  
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
                "id": "HLf5va4cNtHEZi8Ld7mgSfa" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:44.541322Z",  
                    "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/transactions",  
                    "email_address": "email.9@y.com",  
                    "id": "ACf2lmtEsktGtDTJzNBUsO8",  
                    "credits_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/cards" 
                },  
                "fee": 30,  
                "description": "Something spicy",  
                "transaction_number": "HL208-210-3783",  
                "created_at": "2012-10-30T18:26:44.585343Z",  
                "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/holds/HLf5qjQB4wrx4B9Eg8UYg9S",  
                "expires_at": "2012-11-01T01:26:44.579016Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-30T18:26:44.565695Z",  
                    "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/cards/CC07fb694222fa11e29bf680ee7316ae44",  
                    "id": "CC07fb694222fa11e29bf680ee7316ae44",  
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
                "id": "HLf5qjQB4wrx4B9Eg8UYg9S" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:44.541322Z",  
                    "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/transactions",  
                    "email_address": "email.9@y.com",  
                    "id": "ACf2lmtEsktGtDTJzNBUsO8",  
                    "credits_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/cards" 
                },  
                "fee": 30,  
                "description": "Something sour",  
                "transaction_number": "HL236-390-7707",  
                "created_at": "2012-10-30T18:26:44.584379Z",  
                "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/holds/HLf5m4lPCKj4YQGg3zHccCM",  
                "expires_at": "2012-11-01T01:26:44.578839Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-30T18:26:44.565695Z",  
                    "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/cards/CC07fb694222fa11e29bf680ee7316ae44",  
                    "id": "CC07fb694222fa11e29bf680ee7316ae44",  
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
                "id": "HLf5m4lPCKj4YQGg3zHccCM" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:44.541322Z",  
                    "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/transactions",  
                    "email_address": "email.9@y.com",  
                    "id": "ACf2lmtEsktGtDTJzNBUsO8",  
                    "credits_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/cards" 
                },  
                "fee": 30,  
                "description": "Something sweet",  
                "transaction_number": "HL869-283-4799",  
                "created_at": "2012-10-30T18:26:44.583246Z",  
                "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/holds/HLf5fFmESq4s3SbBmNy6Un2",  
                "expires_at": "2012-11-01T01:26:44.568162Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-30T18:26:44.565695Z",  
                    "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/cards/CC07fb694222fa11e29bf680ee7316ae44",  
                    "id": "CC07fb694222fa11e29bf680ee7316ae44",  
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
                "id": "HLf5fFmESq4s3SbBmNy6Un2" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/holds?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 4,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MPeSbDJJcdtYtzn7xGAcB1i/accounts/ACf2lmtEsktGtDTJzNBUsO8/holds?limit=10&offset=0" 
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
            "holds_uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:47.973709Z",  
            "uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW/transactions",  
            "email_address": "email.9@y.com",  
            "id": "ACiTH11N5TsXn7B9ED2fcnW",  
            "credits_uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW/cards" 
        },  
        "fee": 30,  
        "description": "Something really tasty",  
        "transaction_number": "HL635-972-5036",  
        "created_at": "2012-10-30T18:26:48.007177Z",  
        "uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/holds/HLiW0XRa0KfZAYpqHqa1YGg",  
        "expires_at": "2012-11-01T01:26:47.993691Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-30T18:26:47.991507Z",  
            "uri": "/v1/marketplaces/TEST-MPiKZEktFiSyXjSG9t5xwEI/accounts/ACiTH11N5TsXn7B9ED2fcnW/cards/CC0a062bdc22fa11e2b64080ee7316ae44",  
            "id": "CC0a062bdc22fa11e2b64080ee7316ae44",  
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
        "id": "HLiW0XRa0KfZAYpqHqa1YGg" 
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
        "hold_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/holds/HLkNDSoVrKwcOZtt5zl2V7e" 
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
            "holds_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:49.635562Z",  
            "uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/transactions",  
            "email_address": "email.9@y.com",  
            "id": "ACkLzPcHilEIdJPhS0XVIb2",  
            "credits_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/cards" 
        },  
        "fee": 43,  
        "description": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/debits/WDkR1hyozLSzFP0cMhZiMXq/refunds",  
        "created_at": "2012-10-30T18:26:49.722616Z",  
        "transaction_number": "W278-285-1780",  
        "uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/debits/WDkR1hyozLSzFP0cMhZiMXq",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-30T18:26:49.653954Z",  
            "uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/cards/CC0b03ebf022fa11e2904680ee7316ae44",  
            "id": "CC0b03ebf022fa11e2904680ee7316ae44",  
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
            "created_at": "2012-10-30T18:26:49.665127Z",  
            "uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/holds/HLkNDSoVrKwcOZtt5zl2V7e",  
            "expires_at": "2012-11-01T01:26:49.655460Z",  
            "transaction_number": "HL957-287-2487",  
            "amount": 1233,  
            "meta": {},  
            "is_void": false,  
            "account_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2",  
            "source_uri": "/v1/marketplaces/TEST-MPkBYDFGKiOpdU2nr0j6riY/accounts/ACkLzPcHilEIdJPhS0XVIb2/cards/CC0b03ebf022fa11e2904680ee7316ae44",  
            "id": "HLkNDSoVrKwcOZtt5zl2V7e" 
        },  
        "id": "WDkR1hyozLSzFP0cMhZiMXq",  
        "available_at": "2012-10-31T01:26:49.712535Z" 
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
            "holds_uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:52.859873Z",  
            "uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy/transactions",  
            "email_address": "email.9@y.com",  
            "id": "ACoope7Sj5u6ArrwMPwlUXy",  
            "credits_uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy/cards" 
        },  
        "fee": 30,  
        "description": "Something sour",  
        "transaction_number": "HL035-566-7624",  
        "created_at": "2012-10-30T18:26:52.902913Z",  
        "uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/holds/HLoroZz36H1Rf5X418N9zzS",  
        "expires_at": "2012-11-01T01:26:52.886395Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-10-30T18:26:52.883561Z",  
            "uri": "/v1/marketplaces/TEST-MPoe8Vpo3yd1d1tTapUqP3K/accounts/ACoope7Sj5u6ArrwMPwlUXy/cards/CC0cf0852222fa11e291c080ee7316ae44",  
            "id": "CC0cf0852222fa11e291c080ee7316ae44",  
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
        "id": "HLoroZz36H1Rf5X418N9zzS" 
    } 
 

