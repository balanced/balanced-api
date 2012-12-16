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
        "debit_uri": "/v1/marketplaces/TEST-MP7f32CZkcvXTmYS1NuDyORY/debits/WD7f8IkwgPh4lLtWHxBM3sbo",  
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C/cards",  
            "created_at": "2012-12-15T22:50:52.470299Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C/holds",  
            "id": "AC7gGv4xLg3VOq9xaxN6CN0C",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C/transactions",  
            "uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-15T22:50:52.571016Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-16T06:50:52.518343Z",  
            "created_at": "2012-12-15T22:50:52.524664Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/holds/HL7gKnlRBwZvh4dtXsY42MlQ",  
            "id": "WD7gKczDmT0vXMw57ZjaLZrQ",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/debits/WD7gKczDmT0vXMw57ZjaLZrQ/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/accounts/AC7gGv4xLg3VOq9xaxN6CN0C/cards/CC7gGzN14x8zHXxVYevX8LLc",  
            "transaction_number": "W119-778-1635",  
            "uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/debits/WD7gKczDmT0vXMw57ZjaLZrQ" 
        },  
        "description": "abc123",  
        "fee": 0,  
        "id": "RF7gNvPZytkW8N35EwcSF4HE",  
        "meta": {},  
        "transaction_number": "RF571-650-1218",  
        "uri": "/v1/marketplaces/TEST-MP7gDZ4nNMA7P0xrOQxu3RUK/refunds/RF7gNvPZytkW8N35EwcSF4HE" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE/cards",  
            "created_at": "2012-12-15T22:50:53.850026Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE/holds",  
            "id": "AC7ieI0ufQyFaMs2xISA1dJE",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE/transactions",  
            "uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-15T22:50:53.908389Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-16T06:50:53.891783Z",  
            "created_at": "2012-12-15T22:50:53.897538Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/holds/HL7ii6ouiUsEXxc1s4DXVc4a",  
            "id": "WD7ihY2ld5v0yE27udsdgbx0",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/debits/WD7ihY2ld5v0yE27udsdgbx0/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/accounts/AC7ieI0ufQyFaMs2xISA1dJE/cards/CC7ieNcomCGN7etcOTuReKro",  
            "transaction_number": "W788-282-8695",  
            "uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/debits/WD7ihY2ld5v0yE27udsdgbx0" 
        },  
        "description": "abc123",  
        "fee": 0,  
        "id": "RF7iiLYB0ml0SrUVpv1Yq7JE",  
        "meta": {},  
        "transaction_number": "RF111-222-3333",  
        "uri": "/v1/marketplaces/TEST-MP7icanxrpfXJ5BeJWDOrhvc/refunds/RF7iiLYB0ml0SrUVpv1Yq7JE" 
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
        "first_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/refunds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/cards",  
                    "created_at": "2012-12-15T22:50:55.188229Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/holds",  
                    "id": "AC7jK1IwU1luer4bJLZEhzp8",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "created_at": "2012-12-15T22:50:55.257093Z",  
                "debit": { 
                    "account_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8",  
                    "amount": 1254,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2012-12-16T06:50:55.240082Z",  
                    "created_at": "2012-12-15T22:50:55.246102Z",  
                    "description": "abc123",  
                    "fee": 43,  
                    "hold_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/holds/HL7jO9jeXuL8jLUjvQ7bwWJs",  
                    "id": "WD7jO0lCuhQ9Xnz33KKONX62",  
                    "meta": {},  
                    "refunds_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/debits/WD7jO0lCuhQ9Xnz33KKONX62/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/cards/CC7jK6MGIlAZWEoI09YYuABA",  
                    "transaction_number": "W697-034-9865",  
                    "uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/debits/WD7jO0lCuhQ9Xnz33KKONX62" 
                },  
                "description": "abc123",  
                "fee": 0,  
                "id": "RF7jOORzYkwa8r3EZ9bNohKy",  
                "meta": {},  
                "transaction_number": "RF111-222-3333",  
                "uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/refunds/RF7jOORzYkwa8r3EZ9bNohKy" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/cards",  
                    "created_at": "2012-12-15T22:50:55.188229Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/holds",  
                    "id": "AC7jK1IwU1luer4bJLZEhzp8",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "created_at": "2012-12-15T22:50:55.286139Z",  
                "debit": { 
                    "account_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8",  
                    "amount": 431,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2012-12-16T06:50:55.269869Z",  
                    "created_at": "2012-12-15T22:50:55.275155Z",  
                    "description": "abc123",  
                    "fee": 15,  
                    "hold_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/holds/HL7jQaI9dPhtMLjUu8XwaByq",  
                    "id": "WD7jQ4WPHIkzFtBXNfe3yGsG",  
                    "meta": {},  
                    "refunds_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/debits/WD7jQ4WPHIkzFtBXNfe3yGsG/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/accounts/AC7jK1IwU1luer4bJLZEhzp8/cards/CC7jK6MGIlAZWEoI09YYuABA",  
                    "transaction_number": "W182-085-1155",  
                    "uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/debits/WD7jQ4WPHIkzFtBXNfe3yGsG" 
                },  
                "description": "abc123",  
                "fee": 0,  
                "id": "RF7jQQxPvihWCL0l2fYKftFM",  
                "meta": {},  
                "transaction_number": "RF111-222-3333",  
                "uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/refunds/RF7jQQxPvihWCL0l2fYKftFM" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/refunds?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP7jHoU9Tw7VB6SUaYiAkjay/refunds?limit=10&offset=0" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG/cards",  
            "created_at": "2012-12-15T22:50:58.019339Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG/holds",  
            "id": "AC7mVs29Sp7DvrsAV2LyMfSG",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG/transactions",  
            "uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-15T22:50:58.085174Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-16T06:50:58.066903Z",  
            "created_at": "2012-12-15T22:50:58.073153Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/holds/HL7mZikcvtmF6xH5jCJq9uBk",  
            "id": "WD7mZ8RpdbJaKzP51xBDDKps",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/debits/WD7mZ8RpdbJaKzP51xBDDKps/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/accounts/AC7mVs29Sp7DvrsAV2LyMfSG/cards/CC7mVwEJyXNRJvgTjPhIWOL0",  
            "transaction_number": "W380-319-4930",  
            "uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/debits/WD7mZ8RpdbJaKzP51xBDDKps" 
        },  
        "description": "my new description",  
        "fee": 0,  
        "id": "RF7n01CkdT3sjVZsBJURocbg",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "transaction_number": "RF111-222-3333",  
        "uri": "/v1/marketplaces/TEST-MP7mT0vbVCBAb3gTG6xj4R3Y/refunds/RF7n01CkdT3sjVZsBJURocbg" 
    } 
 

