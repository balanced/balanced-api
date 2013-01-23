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
 
``on_behalf_of_uri`` 
    **string**. The merchant account, for a seller or service provider, that this debit 
    was acquired on behalf of 
 
``source`` 
    **object**. The funding source (card or bank account) for this debit. 
 

Deprecated
~~~~~~~~~~

``fee`` 
    **null**. The fee charged by Balanced. 
 

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
 
``on_behalf_of_uri`` 
    *optional* **string**. The account of a merchant, usually a seller or service provider, that 
    is associated with this card charge or bank account debit. 
 
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
        "amount": 1234,  
        "on_behalf_of_uri": "/v1/marketplaces/TEST-MP4L384ywBQNi3B9sniCRYNQ/accounts/AC4L6rwrlep7hleR9tnuESka" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/cards",  
            "created_at": "2013-01-23T05:56:22.350776Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/holds",  
            "id": "AC4MZXiJdTpJEMFVeZQ8a4pI",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2013-01-23T05:56:22.424643Z",  
        "created_at": "2013-01-23T05:56:22.432319Z",  
        "description": null,  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI",  
            "amount": 1234,  
            "created_at": "2013-01-23T05:56:22.434900Z",  
            "debit_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/debits/WD4N5BJgsLlZ5lOMXqQSWBeO",  
            "description": null,  
            "expires_at": "2013-01-30T05:56:22.424324Z",  
            "fee": null,  
            "id": "HL4N5Oe9w35Zn6lEvCOkokI2",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/cards/CC4N0L6pcue308VtcT4FJa2K",  
            "transaction_number": "HL892-581-6081",  
            "uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/holds/HL4N5Oe9w35Zn6lEvCOkokI2" 
        },  
        "id": "WD4N5BJgsLlZ5lOMXqQSWBeO",  
        "meta": {},  
        "on_behalf_of_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/WD4N5BJgsLlZ5lOMXqQSWBeO",  
        "refunds_uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/debits/WD4N5BJgsLlZ5lOMXqQSWBeO/refunds",  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "created_at": "2013-01-23T05:56:22.364709Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC4N0L6pcue308VtcT4FJa2K",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/accounts/AC4MZXiJdTpJEMFVeZQ8a4pI/cards/CC4N0L6pcue308VtcT4FJa2K" 
        },  
        "transaction_number": "W093-311-5722",  
        "uri": "/v1/marketplaces/TEST-MP4MXf6pTPaAmvql7xmyTtCG/debits/WD4N5BJgsLlZ5lOMXqQSWBeO" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/cards",  
            "created_at": "2013-01-23T05:56:24.050955Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/holds",  
            "id": "AC4OUwgsbO6sWWYws6mP9Hke",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2013-01-23T05:56:24.106386Z",  
        "created_at": "2013-01-23T05:56:24.112220Z",  
        "description": "abc123",  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke",  
            "amount": 1254,  
            "created_at": "2013-01-23T05:56:24.113626Z",  
            "debit_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/debits/WD4OYI1TbG48fi0eRB1rkktQ",  
            "description": null,  
            "expires_at": "2013-01-24T05:56:24.103619Z",  
            "fee": null,  
            "id": "HL4OYSqAfxo3biA1VoU4TYlI",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/cards/CC4OVhDgPqEWWyO0CVKyQKz8",  
            "transaction_number": "HL943-280-9133",  
            "uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/holds/HL4OYSqAfxo3biA1VoU4TYlI" 
        },  
        "id": "WD4OYI1TbG48fi0eRB1rkktQ",  
        "meta": {},  
        "on_behalf_of_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/WD4OYI1TbG48fi0eRB1rkktQ",  
        "refunds_uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/debits/WD4OYI1TbG48fi0eRB1rkktQ/refunds",  
        "source": { 
            "brand": "Discover",  
            "card_type": "discover",  
            "created_at": "2013-01-23T05:56:24.064415Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC4OVhDgPqEWWyO0CVKyQKz8",  
            "is_valid": true,  
            "last_four": "1117",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/accounts/AC4OUwgsbO6sWWYws6mP9Hke/cards/CC4OVhDgPqEWWyO0CVKyQKz8" 
        },  
        "transaction_number": "W552-398-0872",  
        "uri": "/v1/marketplaces/TEST-MP4ORRHMZfi20iQyd9A50X7c/debits/WD4OYI1TbG48fi0eRB1rkktQ" 
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
        "first_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/cards",  
                    "created_at": "2013-01-23T05:56:25.728566Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/debits",  
                    "email_address": "email.6@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/holds",  
                    "id": "AC4QNvlWgQGz8a3XaNw4Flfc",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc" 
                },  
                "amount": 9999999,  
                "appears_on_statement_as": "hiya.bom",  
                "available_at": "2013-01-23T05:56:25.740656Z",  
                "created_at": "2013-01-23T05:56:25.752870Z",  
                "description": null,  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc",  
                    "amount": 9999999,  
                    "created_at": "2013-01-23T05:56:25.756547Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QP5zkpYQcZOvh4iOXByEW",  
                    "description": null,  
                    "expires_at": "2013-01-30T05:56:25.740333Z",  
                    "fee": null,  
                    "id": "HL4QPoGYSnsWzJbwHbWWTz3c",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/cards/CC9f69366b652111e2b3f768a86d3cb93a",  
                    "transaction_number": "HL604-246-6984",  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/holds/HL4QPoGYSnsWzJbwHbWWTz3c" 
                },  
                "id": "WD4QP5zkpYQcZOvh4iOXByEW",  
                "meta": {},  
                "on_behalf_of_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/WD4QP5zkpYQcZOvh4iOXByEW",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QP5zkpYQcZOvh4iOXByEW/refunds",  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2013-01-23T05:56:25.736087Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC9f69366b652111e2b3f768a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QNvlWgQGz8a3XaNw4Flfc/cards/CC9f69366b652111e2b3f768a86d3cb93a" 
                },  
                "transaction_number": "W348-595-2203",  
                "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QP5zkpYQcZOvh4iOXByEW" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/cards",  
                    "created_at": "2013-01-23T05:56:25.718306Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/holds",  
                    "id": "AC4QMMBCfoqYUj250iLia9M6",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2013-01-23T05:56:25.772021Z",  
                "created_at": "2013-01-23T05:56:25.777885Z",  
                "description": "abc123",  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6",  
                    "amount": 1254,  
                    "created_at": "2013-01-23T05:56:25.779075Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QQSUtpQqp44nuc7upag78",  
                    "description": null,  
                    "expires_at": "2013-01-24T05:56:25.769282Z",  
                    "fee": null,  
                    "id": "HL4QR1fBma2VEmWGO5z2TQJY",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/cards/CC4QNxRHK4rYufWG54Qo9VJU",  
                    "transaction_number": "HL339-996-0408",  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/holds/HL4QR1fBma2VEmWGO5z2TQJY" 
                },  
                "id": "WD4QQSUtpQqp44nuc7upag78",  
                "meta": {},  
                "on_behalf_of_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/WD4QQSUtpQqp44nuc7upag78",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QQSUtpQqp44nuc7upag78/refunds",  
                "source": { 
                    "brand": "Discover",  
                    "card_type": "discover",  
                    "created_at": "2013-01-23T05:56:25.731598Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC4QNxRHK4rYufWG54Qo9VJU",  
                    "is_valid": true,  
                    "last_four": "1117",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/cards/CC4QNxRHK4rYufWG54Qo9VJU" 
                },  
                "transaction_number": "W775-361-2871",  
                "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QQSUtpQqp44nuc7upag78" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/cards",  
                    "created_at": "2013-01-23T05:56:25.718306Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/holds",  
                    "id": "AC4QMMBCfoqYUj250iLia9M6",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2013-01-23T05:56:25.790294Z",  
                "created_at": "2013-01-23T05:56:25.794956Z",  
                "description": "abc123",  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6",  
                    "amount": 431,  
                    "created_at": "2013-01-23T05:56:25.796070Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QS7qKhTduSbzZqwG08Dto",  
                    "description": null,  
                    "expires_at": "2013-01-24T05:56:25.787690Z",  
                    "fee": null,  
                    "id": "HL4QScXQZ0jdSmy1QuTOJXce",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/cards/CC4QNxRHK4rYufWG54Qo9VJU",  
                    "transaction_number": "HL845-564-8250",  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/holds/HL4QScXQZ0jdSmy1QuTOJXce" 
                },  
                "id": "WD4QS7qKhTduSbzZqwG08Dto",  
                "meta": {},  
                "on_behalf_of_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/WD4QS7qKhTduSbzZqwG08Dto",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QS7qKhTduSbzZqwG08Dto/refunds",  
                "source": { 
                    "brand": "Discover",  
                    "card_type": "discover",  
                    "created_at": "2013-01-23T05:56:25.731598Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC4QNxRHK4rYufWG54Qo9VJU",  
                    "is_valid": true,  
                    "last_four": "1117",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/accounts/AC4QMMBCfoqYUj250iLia9M6/cards/CC4QNxRHK4rYufWG54Qo9VJU" 
                },  
                "transaction_number": "W415-746-5614",  
                "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits/WD4QS7qKhTduSbzZqwG08Dto" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP4QK530f01sh5AyEwkmjumC/debits?limit=10&offset=0" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/cards",  
            "created_at": "2013-01-23T05:56:29.231647Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/holds",  
            "id": "AC4UJMBAckMinl265l5B70oO",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2013-01-23T05:56:29.289231Z",  
        "created_at": "2013-01-23T05:56:29.295071Z",  
        "description": "my new description",  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO",  
            "amount": 1254,  
            "created_at": "2013-01-23T05:56:29.296664Z",  
            "debit_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/debits/WD4UO7Hd0LTsTJ2TBmnHYCrE",  
            "description": null,  
            "expires_at": "2013-01-24T05:56:29.286483Z",  
            "fee": null,  
            "id": "HL4UOjt90CmswuKlCP5pvb1o",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/cards/CC4UKGfFszf8USvevWWTczk6",  
            "transaction_number": "HL752-748-5567",  
            "uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/holds/HL4UOjt90CmswuKlCP5pvb1o" 
        },  
        "id": "WD4UO7Hd0LTsTJ2TBmnHYCrE",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "on_behalf_of_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/WD4UO7Hd0LTsTJ2TBmnHYCrE",  
        "refunds_uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/debits/WD4UO7Hd0LTsTJ2TBmnHYCrE/refunds",  
        "source": { 
            "brand": "MasterCard",  
            "card_type": "mastercard",  
            "created_at": "2013-01-23T05:56:29.247046Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC4UKGfFszf8USvevWWTczk6",  
            "is_valid": true,  
            "last_four": "5100",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/accounts/AC4UJMBAckMinl265l5B70oO/cards/CC4UKGfFszf8USvevWWTczk6" 
        },  
        "transaction_number": "W087-153-0457",  
        "uri": "/v1/marketplaces/TEST-MP4UH6g3fUySqyXteMmhW3Uu/debits/WD4UO7Hd0LTsTJ2TBmnHYCrE" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka/cards",  
            "created_at": "2013-01-23T05:56:32.697745Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka/holds",  
            "id": "AC4YDu3tt8ESv53RHKHyxEka",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2013-01-23T05:56:32.807626Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2013-01-23T05:56:32.758367Z",  
            "created_at": "2013-01-23T05:56:32.764400Z",  
            "description": "abc123",  
            "fee": null,  
            "hold_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/holds/HL4YIde9KjEvKpzX5aKfIoFs",  
            "id": "WD4YI2ZFSyc97BAVzhw6YD5E",  
            "meta": {},  
            "on_behalf_of_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/WD4YI2ZFSyc97BAVzhw6YD5E",  
            "refunds_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/debits/WD4YI2ZFSyc97BAVzhw6YD5E/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/accounts/AC4YDu3tt8ESv53RHKHyxEka/cards/CC4YEhu2RA6NUVvrJC2PfhqO",  
            "transaction_number": "W850-916-7753",  
            "uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/debits/WD4YI2ZFSyc97BAVzhw6YD5E" 
        },  
        "description": "abc123",  
        "fee": null,  
        "id": "RF4YL7FOcGXQyPdwM3XSBYfg",  
        "meta": {},  
        "transaction_number": "RF116-083-6066",  
        "uri": "/v1/marketplaces/TEST-MP4YAOSZhFXjBCgSLCdWJVUK/refunds/RF4YL7FOcGXQyPdwM3XSBYfg" 
    } 
 

