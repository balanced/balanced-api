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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC/cards",  
            "created_at": "2012-12-15T19:56:18.867473Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC/holds",  
            "id": "AC4gl3UTpvtzRZV7qWBQ5MiC",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC" 
        },  
        "amount": 3421,  
        "created_at": "2012-12-15T19:56:18.908468Z",  
        "debit": null,  
        "description": "Something tasty",  
        "expires_at": "2012-12-23T03:56:18.906276Z",  
        "fee": 30,  
        "id": "HL4gnUlBwWNLkQzrHhm671NM",  
        "is_void": false,  
        "meta": { 
            "id": "#12312123123" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T19:56:18.882596Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CC8c180bbd473411e2a82c68a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/accounts/AC4gl3UTpvtzRZV7qWBQ5MiC/cards/CC8c180bbd473411e2a82c68a86d3cb93a" 
        },  
        "transaction_number": "HL567-220-6631",  
        "uri": "/v1/marketplaces/TEST-MP4ghsE9bTGZArAGqwDRGtUm/holds/HL4gnUlBwWNLkQzrHhm671NM" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS/cards",  
            "created_at": "2012-12-15T19:56:20.183397Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS/holds",  
            "id": "AC4hOP1NwINNsyXUwGAgeDkS",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-15T19:56:20.203085Z",  
        "debit": null,  
        "description": "Something sour",  
        "expires_at": "2012-12-17T03:56:20.199626Z",  
        "fee": 30,  
        "id": "HL4hQcaEfSi1ugvCw6OMNHfQ",  
        "is_void": false,  
        "meta": {},  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T19:56:20.198797Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CC8ce0e233473411e288bc68a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/accounts/AC4hOP1NwINNsyXUwGAgeDkS/cards/CC8ce0e233473411e288bc68a86d3cb93a" 
        },  
        "transaction_number": "HL836-197-8312",  
        "uri": "/v1/marketplaces/TEST-MP4hLdUHBniCh2E0OjouUV1U/holds/HL4hQcaEfSi1ugvCw6OMNHfQ" 
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
        "first_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/holds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/cards",  
                    "created_at": "2012-12-15T19:56:21.488451Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/holds",  
                    "id": "AC4jhPxaEcy11UXawijtVLGG",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG" 
                },  
                "amount": 1233,  
                "created_at": "2012-12-15T19:56:21.507927Z",  
                "debit": null,  
                "description": "Something sweet",  
                "expires_at": "2012-12-17T03:56:21.504559Z",  
                "fee": 30,  
                "id": "HL4jjbAVzbPnYQTOuZu93uQO",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T19:56:21.503762Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC8da7f91c473411e2bf9668a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/cards/CC8da7f91c473411e2bf9668a86d3cb93a" 
                },  
                "transaction_number": "HL224-605-4812",  
                "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/holds/HL4jjbAVzbPnYQTOuZu93uQO" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/cards",  
                    "created_at": "2012-12-15T19:56:21.488451Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/holds",  
                    "id": "AC4jhPxaEcy11UXawijtVLGG",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG" 
                },  
                "amount": 3344,  
                "created_at": "2012-12-15T19:56:21.512906Z",  
                "debit": null,  
                "description": "Something sour",  
                "expires_at": "2012-12-17T03:56:21.506444Z",  
                "fee": 30,  
                "id": "HL4jjwX1Tdqo36eMWiBEngue",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T19:56:21.503762Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC8da7f91c473411e2bf9668a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/cards/CC8da7f91c473411e2bf9668a86d3cb93a" 
                },  
                "transaction_number": "HL968-986-2078",  
                "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/holds/HL4jjwX1Tdqo36eMWiBEngue" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/cards",  
                    "created_at": "2012-12-15T19:56:21.488451Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/holds",  
                    "id": "AC4jhPxaEcy11UXawijtVLGG",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG" 
                },  
                "amount": 6754,  
                "created_at": "2012-12-15T19:56:21.517925Z",  
                "debit": null,  
                "description": "Something spicy",  
                "expires_at": "2012-12-17T03:56:21.511441Z",  
                "fee": 30,  
                "id": "HL4jjSHog60mCJFB3iAvh2Cm",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T19:56:21.503762Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC8da7f91c473411e2bf9668a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/cards/CC8da7f91c473411e2bf9668a86d3cb93a" 
                },  
                "transaction_number": "HL944-647-0993",  
                "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/holds/HL4jjSHog60mCJFB3iAvh2Cm" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/cards",  
                    "created_at": "2012-12-15T19:56:21.488451Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/holds",  
                    "id": "AC4jhPxaEcy11UXawijtVLGG",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG" 
                },  
                "amount": 1322,  
                "created_at": "2012-12-15T19:56:21.522947Z",  
                "debit": null,  
                "description": "Something tangy",  
                "expires_at": "2012-12-17T03:56:21.516378Z",  
                "fee": 30,  
                "id": "HL4jkeiSwRxqxFxfBhg6spn4",  
                "is_void": false,  
                "meta": {},  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T19:56:21.503762Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC8da7f91c473411e2bf9668a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/cards/CC8da7f91c473411e2bf9668a86d3cb93a" 
                },  
                "transaction_number": "HL877-639-6431",  
                "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/holds/HL4jkeiSwRxqxFxfBhg6spn4" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/holds?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 4,  
        "uri": "/v1/marketplaces/TEST-MP4jebPsrsGqMLTOjF8oGeBs/accounts/AC4jhPxaEcy11UXawijtVLGG/holds?limit=10&offset=0" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ/cards",  
            "created_at": "2012-12-15T19:56:24.310318Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ/holds",  
            "id": "AC4msBbMPwrsnp7UBKzjOlDQ",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-15T19:56:24.330561Z",  
        "debit": null,  
        "description": "Something really tasty",  
        "expires_at": "2012-12-17T03:56:24.327169Z",  
        "fee": 30,  
        "id": "HL4mu1mZW4B7RFsWDYaihQzo",  
        "is_void": false,  
        "meta": { 
            "the-address": "123 Fake Street" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T19:56:24.326239Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CC8f569c3d473411e2bb0468a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/accounts/AC4msBbMPwrsnp7UBKzjOlDQ/cards/CC8f569c3d473411e2bb0468a86d3cb93a" 
        },  
        "transaction_number": "HL884-786-8014",  
        "uri": "/v1/marketplaces/TEST-MP4mp2KyVkK4fhlfsR32ID46/holds/HL4mu1mZW4B7RFsWDYaihQzo" 
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
        "hold_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/holds/HL4nXiNXyQBS9dpnIyXEB3fk" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/cards",  
            "created_at": "2012-12-15T19:56:25.620232Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/holds",  
            "id": "AC4nVX4j5zA5YZ7p9p1tBDdM",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM" 
        },  
        "amount": 1233,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2012-12-16T03:56:25.669363Z",  
        "created_at": "2012-12-15T19:56:25.675327Z",  
        "description": null,  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM",  
            "amount": 1233,  
            "created_at": "2012-12-15T19:56:25.639682Z",  
            "description": "Something sour",  
            "expires_at": "2012-12-17T03:56:25.636438Z",  
            "fee": 30,  
            "id": "HL4nXiNXyQBS9dpnIyXEB3fk",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/cards/CC901e796e473411e2aa6968a86d3cb93a",  
            "transaction_number": "HL298-859-3080",  
            "uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/holds/HL4nXiNXyQBS9dpnIyXEB3fk" 
        },  
        "id": "WD4nZLidHgxA187G5XmRPg38",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/debits/WD4nZLidHgxA187G5XmRPg38/refunds",  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T19:56:25.635664Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CC901e796e473411e2aa6968a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/accounts/AC4nVX4j5zA5YZ7p9p1tBDdM/cards/CC901e796e473411e2aa6968a86d3cb93a" 
        },  
        "transaction_number": "W645-720-7572",  
        "uri": "/v1/marketplaces/TEST-MP4nSleGHq6AAkFkZSxdaXNg/debits/WD4nZLidHgxA187G5XmRPg38" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM/cards",  
            "created_at": "2012-12-15T19:56:28.252743Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM/holds",  
            "id": "AC4qTwwuf9l9bPArFtN9QSfM",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM/refunds",  
            "roles": [ 
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM" 
        },  
        "amount": 1233,  
        "created_at": "2012-12-15T19:56:28.272446Z",  
        "debit": null,  
        "description": "Something sour",  
        "expires_at": "2012-12-17T03:56:28.268974Z",  
        "fee": 30,  
        "id": "HL4qUTiGDPdXTkJqTtzexgIq",  
        "is_void": true,  
        "meta": { 
            "reason": "Customer request" 
        },  
        "source": { 
            "brand": "Visa",  
            "card_type": "visa",  
            "country_code": "USA",  
            "created_at": "2012-12-15T19:56:28.268170Z",  
            "expiration_month": 1,  
            "expiration_year": 2015,  
            "hash": null,  
            "id": "CC91b03042473411e2919168a86d3cb93a",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": "Jet Li",  
            "postal_code": "94110",  
            "street_address": "Somewhere over the rainbow",  
            "uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/accounts/AC4qTwwuf9l9bPArFtN9QSfM/cards/CC91b03042473411e2919168a86d3cb93a" 
        },  
        "transaction_number": "HL791-636-8078",  
        "uri": "/v1/marketplaces/TEST-MP4qPVovtuMiXaGPFViQa9aW/holds/HL4qUTiGDPdXTkJqTtzexgIq" 
    } 
 

