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
    *optional* **integer**. Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original 
    ``debit``. 
 
``description`` 
    *optional* **string**.  
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``debit_uri`` 
    *optional* **string**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "debit_uri": "/v1/marketplaces/TEST-MP24KIb4D0osXfYdPGSMENDd/debits/WD24VY0bEWrUE5be1VO3RJDl",  
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
            "holds_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:58.076540Z",  
            "uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC26HCTWrPYMy83Lx9MdxFth",  
            "credits_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth/cards" 
        },  
        "fee": -43,  
        "description": "abc123",  
        "created_at": "2012-11-07T00:43:58.261604Z",  
        "uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/refunds/RF26Uvu26OZbRYFyvZFLsrh9",  
        "transaction_number": "RF211-525-6531",  
        "amount": 1234,  
        "meta": {},  
        "debit": { 
            "hold_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/holds/HL26Ou2G26LXTDtgDibV6VdV",  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W433-006-9122",  
            "source_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/accounts/AC26HCTWrPYMy83Lx9MdxFth/cards/CC26HQmVxWPdY13c7VybYfE7",  
            "created_at": "2012-11-07T00:43:58.172140Z",  
            "uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/debits/WD26Oa6X5HIiqnFELLNTshOP",  
            "refunds_uri": "/v1/marketplaces/TEST-MP26Bd66EDgMn5OkyxPplbyj/debits/WD26Oa6X5HIiqnFELLNTshOP/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WD26Oa6X5HIiqnFELLNTshOP",  
            "available_at": "2012-11-07T08:43:58.159436Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RF26Uvu26OZbRYFyvZFLsrh9" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:59.706711Z",  
            "uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC28xiZcP8WIGFYETGXrNzVx",  
            "credits_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx/cards" 
        },  
        "fee": -43,  
        "description": "abc123",  
        "created_at": "2012-11-07T00:43:59.818438Z",  
        "uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/refunds/RF28F4yzqoCZK8Te2FAcclEv",  
        "transaction_number": "RF111-222-3333",  
        "amount": 1254,  
        "meta": {},  
        "debit": { 
            "hold_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/holds/HL28E5WsVUpGxqBuGYD71SbV",  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W705-935-7227",  
            "source_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/accounts/AC28xiZcP8WIGFYETGXrNzVx/cards/CC28xw7hClQMJcKGDPDF9EFd",  
            "created_at": "2012-11-07T00:43:59.801326Z",  
            "uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/debits/WD28DMEWSVRcDyrXGYuVKdfd",  
            "refunds_uri": "/v1/marketplaces/TEST-MP28reFAUY6qX0GdR3d5K4vN/debits/WD28DMEWSVRcDyrXGYuVKdfd/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WD28DMEWSVRcDyrXGYuVKdfd",  
            "available_at": "2012-11-07T08:43:59.788100Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RF28F4yzqoCZK8Te2FAcclEv" 
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
        "first_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/refunds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:44:01.242036Z",  
                    "uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC2agn1vzfMOm0sJWMopZDkD",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/cards" 
                },  
                "fee": -43,  
                "description": "abc123",  
                "created_at": "2012-11-07T00:44:01.355598Z",  
                "uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/refunds/RF2aog4BxU4n7NXOnGTM8jFF",  
                "transaction_number": "RF111-222-3333",  
                "amount": 1254,  
                "meta": {},  
                "debit": { 
                    "hold_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/holds/HL2anfQw3DIX3pP7OMhDD5cL",  
                    "fee": 43,  
                    "description": "abc123",  
                    "transaction_number": "W571-779-6988",  
                    "source_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/cards/CC2agz0hD4Q3i0oI1KaqFjwv",  
                    "created_at": "2012-11-07T00:44:01.337741Z",  
                    "uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/debits/WD2amViJaYFwfTqoS3xZYbTR",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/debits/WD2amViJaYFwfTqoS3xZYbTR/refunds",  
                    "amount": 1254,  
                    "meta": {},  
                    "appears_on_statement_as": "PND*TESTS",  
                    "id": "WD2amViJaYFwfTqoS3xZYbTR",  
                    "available_at": "2012-11-07T08:44:01.325473Z" 
                },  
                "appears_on_statement_as": "PND*TESTS",  
                "id": "RF2aog4BxU4n7NXOnGTM8jFF" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:44:01.242036Z",  
                    "uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC2agn1vzfMOm0sJWMopZDkD",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/cards" 
                },  
                "fee": -15,  
                "description": "abc123",  
                "created_at": "2012-11-07T00:44:01.407787Z",  
                "uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/refunds/RF2arTvqJGruWXk7nUvxVWXF",  
                "transaction_number": "RF111-222-3333",  
                "amount": 431,  
                "meta": {},  
                "debit": { 
                    "hold_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/holds/HL2aqNja0i6DiziZpjX9Vpdh",  
                    "fee": 15,  
                    "description": "abc123",  
                    "transaction_number": "W114-602-1327",  
                    "source_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/accounts/AC2agn1vzfMOm0sJWMopZDkD/cards/CC2agz0hD4Q3i0oI1KaqFjwv",  
                    "created_at": "2012-11-07T00:44:01.388836Z",  
                    "uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/debits/WD2aqzBadZIeaSYOmiPyVN8n",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/debits/WD2aqzBadZIeaSYOmiPyVN8n/refunds",  
                    "amount": 431,  
                    "meta": {},  
                    "appears_on_statement_as": "PND*TESTS",  
                    "id": "WD2aqzBadZIeaSYOmiPyVN8n",  
                    "available_at": "2012-11-07T08:44:01.377933Z" 
                },  
                "appears_on_statement_as": "PND*TESTS",  
                "id": "RF2arTvqJGruWXk7nUvxVWXF" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/refunds?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP2aaASNaDhsIzMYXRKPuN11/refunds?limit=10&offset=0" 
    } 
 

Update a Refund
--------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    GET /v1/marketplaces/:marketplace_id/refunds 
 

Request
~~~~~~~

``description`` 
    *optional* **string**.  
 
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
            "holds_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:44:04.544038Z",  
            "uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC2dYCWlrb8zXWLHsom2pn1h",  
            "credits_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h/cards" 
        },  
        "fee": -43,  
        "description": "my new description",  
        "created_at": "2012-11-07T00:44:04.650573Z",  
        "uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/refunds/RF2e62XsRsvdCHLsA2X9e4cb",  
        "transaction_number": "RF111-222-3333",  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "debit": { 
            "hold_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/holds/HL2e53YzJip2kplu4GZlUHOb",  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W372-400-2898",  
            "source_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/accounts/AC2dYCWlrb8zXWLHsom2pn1h/cards/CC2dYP5QgQIW7vWuqXFcUE03",  
            "created_at": "2012-11-07T00:44:04.633952Z",  
            "uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/debits/WD2e4PdI57G4Pxk8HsGfkQRd",  
            "refunds_uri": "/v1/marketplaces/TEST-MP2dSsQ4UUwKswe0jyaqzajV/debits/WD2e4PdI57G4Pxk8HsGfkQRd/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WD2e4PdI57G4Pxk8HsGfkQRd",  
            "available_at": "2012-11-07T08:44:04.625778Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RF2e62XsRsvdCHLsA2X9e4cb" 
    } 
 

