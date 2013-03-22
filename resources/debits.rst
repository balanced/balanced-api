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
 
``on_behalf_of`` 
    **object**. The merchant account, for a seller or service provider, that this debit 
    was acquired on behalf of 
 
``source`` 
    **object**. The funding source (card or bank account) for this debit. 
 
``status`` 
    **string**. One of ``pending``, ``charged``, ``failed``. 
 

Deprecated
~~~~~~~~~~

``fee`` 
    **null**. The fee charged by Balanced. 
 

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
        "on_behalf_of_uri": "/v1/marketplaces/TEST-MP3J9AWZIzhXIWVOW8TU6Fpx/accounts/AC3JdYe0W7m1hWletpYpSiAz" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/cards",  
            "created_at": "2013-02-20T19:55:32.729477Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/holds",  
            "id": "AC3MdIn0Ue02bakxmCnpHZuP",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2013-02-20T19:55:32.824894Z",  
        "created_at": "2013-02-20T19:55:32.829197Z",  
        "description": null,  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP",  
            "amount": 1234,  
            "created_at": "2013-02-20T19:55:32.832702Z",  
            "debit_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/debits/WD3MkCNJLZvmdn5OWwDmqa9Z",  
            "description": null,  
            "expires_at": "2013-02-27T19:55:32.824544Z",  
            "fee": null,  
            "id": "HL3MkTITGEtctK1cuPGeubM7",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/cards/CC3MeOJLs6LnFM2vBGZ5XDQT",  
            "transaction_number": "HL213-687-1165",  
            "uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/holds/HL3MkTITGEtctK1cuPGeubM7" 
        },  
        "id": "WD3MkCNJLZvmdn5OWwDmqa9Z",  
        "meta": {},  
        "on_behalf_of": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MeBSj3sMQwjtnPB8x7nlV/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MeBSj3sMQwjtnPB8x7nlV/cards",  
            "created_at": "2013-02-20T19:55:32.742820Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MeBSj3sMQwjtnPB8x7nlV/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MeBSj3sMQwjtnPB8x7nlV/debits",  
            "email_address": "email.5@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MeBSj3sMQwjtnPB8x7nlV/holds",  
            "id": "AC3MeBSj3sMQwjtnPB8x7nlV",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MeBSj3sMQwjtnPB8x7nlV/refunds",  
            "roles": [ 
                "merchant" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MeBSj3sMQwjtnPB8x7nlV/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MeBSj3sMQwjtnPB8x7nlV" 
        },  
        "refunds_uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/debits/WD3MkCNJLZvmdn5OWwDmqa9Z/refunds",  
        "source": { 
            "brand": "Visa",  
            "can_debit": true,  
            "card_type": "visa",  
            "created_at": "2013-02-20T19:55:32.746279Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC3MeOJLs6LnFM2vBGZ5XDQT",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/accounts/AC3MdIn0Ue02bakxmCnpHZuP/cards/CC3MeOJLs6LnFM2vBGZ5XDQT" 
        },  
        "status": "succeeded",  
        "transaction_number": "W852-421-7418",  
        "uri": "/v1/marketplaces/TEST-MP3MapBNSFVPQlczg8vwjV7B/debits/WD3MkCNJLZvmdn5OWwDmqa9Z" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/cards",  
            "created_at": "2013-02-20T19:55:35.418768Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/holds",  
            "id": "AC3PfeXu2Uq7gkk4bC0Krzjl",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2013-02-20T19:55:35.481542Z",  
        "created_at": "2013-02-20T19:55:35.484368Z",  
        "description": "abc123",  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl",  
            "amount": 1254,  
            "created_at": "2013-02-20T19:55:35.486954Z",  
            "debit_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/debits/WD3PjKUqRwdUaRVXjU5v11ir",  
            "description": null,  
            "expires_at": "2013-02-21T19:55:35.478388Z",  
            "fee": null,  
            "id": "HL3PjZEOAYJAUYyIysMrc9An",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/cards/CC3PgjjyXwLGVWfyZDEWr7Wj",  
            "transaction_number": "HL673-021-7027",  
            "uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/holds/HL3PjZEOAYJAUYyIysMrc9An" 
        },  
        "id": "WD3PjKUqRwdUaRVXjU5v11ir",  
        "meta": {},  
        "on_behalf_of": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/debits/WD3PjKUqRwdUaRVXjU5v11ir/refunds",  
        "source": { 
            "brand": "MasterCard",  
            "can_debit": true,  
            "card_type": "mastercard",  
            "created_at": "2013-02-20T19:55:35.435145Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC3PgjjyXwLGVWfyZDEWr7Wj",  
            "is_valid": true,  
            "last_four": "5100",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/accounts/AC3PfeXu2Uq7gkk4bC0Krzjl/cards/CC3PgjjyXwLGVWfyZDEWr7Wj" 
        },  
        "status": "succeeded",  
        "transaction_number": "W053-399-4825",  
        "uri": "/v1/marketplaces/TEST-MP3PbXCnMAkjZzQJUCNAtMwb/debits/WD3PjKUqRwdUaRVXjU5v11ir" 
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
        "first_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/cards",  
                    "created_at": "2013-02-20T19:55:38.064015Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/debits",  
                    "email_address": "email.6@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/holds",  
                    "id": "AC3SdI0bqrX4EEWsgIpKare3",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3" 
                },  
                "amount": 9999999,  
                "appears_on_statement_as": "hiya.bom",  
                "available_at": "2013-02-20T19:55:38.080536Z",  
                "created_at": "2013-02-20T19:55:38.087137Z",  
                "description": null,  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3",  
                    "amount": 9999999,  
                    "created_at": "2013-02-20T19:55:38.091542Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3SfdaJccdyj3TSVdAsvMz1",  
                    "description": null,  
                    "expires_at": "2013-02-27T19:55:38.080188Z",  
                    "fee": null,  
                    "id": "HL3SfA58Pzqyh3o3Vbew9mIb",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/cards/CC7f4f2e977b9711e2b6e23c0754086543",  
                    "transaction_number": "HL944-725-8860",  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/holds/HL3SfA58Pzqyh3o3Vbew9mIb" 
                },  
                "id": "WD3SfdaJccdyj3TSVdAsvMz1",  
                "meta": {},  
                "on_behalf_of": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3SfdaJccdyj3TSVdAsvMz1/refunds",  
                "source": { 
                    "brand": "Visa",  
                    "can_debit": true,  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2013-02-20T19:55:38.072815Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC7f4f2e977b9711e2b6e23c0754086543",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3SdI0bqrX4EEWsgIpKare3/cards/CC7f4f2e977b9711e2b6e23c0754086543" 
                },  
                "status": "succeeded",  
                "transaction_number": "W406-882-0938",  
                "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3SfdaJccdyj3TSVdAsvMz1" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/cards",  
                    "created_at": "2013-02-20T19:55:38.050488Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/holds",  
                    "id": "AC3ScL7PTecMHnwqM5DTtubV",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2013-02-20T19:55:38.112643Z",  
                "created_at": "2013-02-20T19:55:38.118044Z",  
                "description": "abc123",  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV",  
                    "amount": 1254,  
                    "created_at": "2013-02-20T19:55:38.121777Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3ShlZCansc3XExQlcTA6pd",  
                    "description": null,  
                    "expires_at": "2013-02-21T19:55:38.109309Z",  
                    "fee": null,  
                    "id": "HL3ShIzGoGiXRQ7xkLT4388H",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/cards/CC3SdLMJj6SZOIrRuAwcf7EL",  
                    "transaction_number": "HL684-647-6893",  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/holds/HL3ShIzGoGiXRQ7xkLT4388H" 
                },  
                "id": "WD3ShlZCansc3XExQlcTA6pd",  
                "meta": {},  
                "on_behalf_of": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3ShlZCansc3XExQlcTA6pd/refunds",  
                "source": { 
                    "brand": "Visa",  
                    "can_debit": true,  
                    "card_type": "visa",  
                    "created_at": "2013-02-20T19:55:38.066004Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC3SdLMJj6SZOIrRuAwcf7EL",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/cards/CC3SdLMJj6SZOIrRuAwcf7EL" 
                },  
                "status": "succeeded",  
                "transaction_number": "W251-616-4947",  
                "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3ShlZCansc3XExQlcTA6pd" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/cards",  
                    "created_at": "2013-02-20T19:55:38.050488Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/holds",  
                    "id": "AC3ScL7PTecMHnwqM5DTtubV",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2013-02-20T19:55:38.135824Z",  
                "created_at": "2013-02-20T19:55:38.138096Z",  
                "description": "abc123",  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV",  
                    "amount": 431,  
                    "created_at": "2013-02-20T19:55:38.140514Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3SiQRmVlPqqIg5GP0qecBJ",  
                    "description": null,  
                    "expires_at": "2013-02-21T19:55:38.132114Z",  
                    "fee": null,  
                    "id": "HL3Sj2nr3K95s59ukf5C6u67",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/cards/CC3SdLMJj6SZOIrRuAwcf7EL",  
                    "transaction_number": "HL585-421-4171",  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/holds/HL3Sj2nr3K95s59ukf5C6u67" 
                },  
                "id": "WD3SiQRmVlPqqIg5GP0qecBJ",  
                "meta": {},  
                "on_behalf_of": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3SiQRmVlPqqIg5GP0qecBJ/refunds",  
                "source": { 
                    "brand": "Visa",  
                    "can_debit": true,  
                    "card_type": "visa",  
                    "created_at": "2013-02-20T19:55:38.066004Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC3SdLMJj6SZOIrRuAwcf7EL",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/accounts/AC3ScL7PTecMHnwqM5DTtubV/cards/CC3SdLMJj6SZOIrRuAwcf7EL" 
                },  
                "status": "succeeded",  
                "transaction_number": "W677-838-7014",  
                "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits/WD3SiQRmVlPqqIg5GP0qecBJ" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP3S9f0jAqV33oAMZfwhbWdZ/debits?limit=10&offset=0" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/cards",  
            "created_at": "2013-02-20T19:55:43.673770Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/holds",  
            "id": "AC3YwTkmoC0pBW3uiU23lo6D",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2013-02-20T19:55:43.734009Z",  
        "created_at": "2013-02-20T19:55:43.736807Z",  
        "description": "my new description",  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D",  
            "amount": 1254,  
            "created_at": "2013-02-20T19:55:43.739341Z",  
            "debit_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/debits/WD3YBdN94DTkmVTaWEujEkw3",  
            "description": null,  
            "expires_at": "2013-02-21T19:55:43.730880Z",  
            "fee": null,  
            "id": "HL3YBsCvVthtzSNu7hDVOtVx",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/cards/CC3YxSEFpqIxbSrnSgMn9fN1",  
            "transaction_number": "HL429-763-9531",  
            "uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/holds/HL3YBsCvVthtzSNu7hDVOtVx" 
        },  
        "id": "WD3YBdN94DTkmVTaWEujEkw3",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "on_behalf_of": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/debits/WD3YBdN94DTkmVTaWEujEkw3/refunds",  
        "source": { 
            "brand": "Discover",  
            "can_debit": true,  
            "card_type": "discover",  
            "created_at": "2013-02-20T19:55:43.689417Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC3YxSEFpqIxbSrnSgMn9fN1",  
            "is_valid": true,  
            "last_four": "1117",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/accounts/AC3YwTkmoC0pBW3uiU23lo6D/cards/CC3YxSEFpqIxbSrnSgMn9fN1" 
        },  
        "status": "succeeded",  
        "transaction_number": "W785-297-2285",  
        "uri": "/v1/marketplaces/TEST-MP3Ytnlofsi4MU9uUGrwIHwn/debits/WD3YBdN94DTkmVTaWEujEkw3" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23/cards",  
            "created_at": "2013-02-20T19:55:49.136137Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23/holds",  
            "id": "AC44FNBrJZ3WI2lkFAm4XD23",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23/transactions",  
            "uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2013-02-20T19:55:49.265096Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2013-02-20T19:55:49.199983Z",  
            "created_at": "2013-02-20T19:55:49.202999Z",  
            "description": "abc123",  
            "fee": null,  
            "hold_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/holds/HL44KDBRNrO1kbhvucV4u5sT",  
            "id": "WD44Ko1xfcUTYADPHmZOQkFB",  
            "meta": {},  
            "on_behalf_of_uri": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/debits/WD44Ko1xfcUTYADPHmZOQkFB/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/accounts/AC44FNBrJZ3WI2lkFAm4XD23/cards/CC44GSwiaZhgSMxP1purpmNB",  
            "status": "succeeded",  
            "transaction_number": "W902-091-0629",  
            "uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/debits/WD44Ko1xfcUTYADPHmZOQkFB" 
        },  
        "description": "abc123",  
        "fee": null,  
        "id": "RF44OM6Vecr77aQk73ZClmiT",  
        "meta": {},  
        "transaction_number": "RF932-410-7947",  
        "uri": "/v1/marketplaces/TEST-MP44CrPk5aY7aUAG4DbnbfmX/refunds/RF44OM6Vecr77aQk73ZClmiT" 
    } 
 

