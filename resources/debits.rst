Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/cards",  
            "created_at": "2012-12-15T19:56:08.942724Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/holds",  
            "id": "AC45aZhp6A6hBpGhALw76Fzs",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/transactions",  
            "uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2012-12-16T03:56:09.005895Z",  
        "created_at": "2012-12-15T19:56:09.012145Z",  
        "description": null,  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs",  
            "amount": 1234,  
            "created_at": "2012-12-15T19:56:09.013803Z",  
            "description": null,  
            "expires_at": "2012-12-23T03:56:09.005592Z",  
            "fee": 30,  
            "id": "HL45fW9iXUfPx8Kgd4drf88i",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/cards/CC45b41ZHZe3ACUy3fwFBrd0",  
            "transaction_number": "HL087-251-4062",  
            "uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/holds/HL45fW9iXUfPx8Kgd4drf88i" 
        },  
        "id": "WD45fMQIRItTutzxiVp6Mubo",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/debits/WD45fMQIRItTutzxiVp6Mubo/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-15T19:56:08.944627Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC45b41ZHZe3ACUy3fwFBrd0",  
            "is_valid": true,  
            "last_four": "5100",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/accounts/AC45aZhp6A6hBpGhALw76Fzs/cards/CC45b41ZHZe3ACUy3fwFBrd0" 
        },  
        "transaction_number": "W329-075-9037",  
        "uri": "/v1/marketplaces/TEST-MP458E1nKF0CZegqtpCrFAhA/debits/WD45fMQIRItTutzxiVp6Mubo" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/cards",  
            "created_at": "2012-12-15T19:56:10.259779Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/holds",  
            "id": "AC46EPnUvo6eSWxnBQ9o3XXY",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/transactions",  
            "uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2012-12-16T03:56:10.301408Z",  
        "created_at": "2012-12-15T19:56:10.307273Z",  
        "description": "abc123",  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY",  
            "amount": 1254,  
            "created_at": "2012-12-15T19:56:10.308436Z",  
            "description": null,  
            "expires_at": "2012-12-17T03:56:10.298794Z",  
            "fee": 30,  
            "id": "HL46Idr0fy3RiiXNxpvloUZA",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/cards/CC46EU3ZU8yPa6oi3Y0NsSzU",  
            "transaction_number": "HL297-593-3662",  
            "uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/holds/HL46Idr0fy3RiiXNxpvloUZA" 
        },  
        "id": "WD46I4iBGpHbpsFrFoj0j8PU",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/debits/WD46I4iBGpHbpsFrFoj0j8PU/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-15T19:56:10.261646Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC46EU3ZU8yPa6oi3Y0NsSzU",  
            "is_valid": true,  
            "last_four": "1117",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/accounts/AC46EPnUvo6eSWxnBQ9o3XXY/cards/CC46EU3ZU8yPa6oi3Y0NsSzU" 
        },  
        "transaction_number": "W428-972-6137",  
        "uri": "/v1/marketplaces/TEST-MP46Ct2mKFv2KbOfBQwP7hPA/debits/WD46I4iBGpHbpsFrFoj0j8PU" 
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
        "first_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/cards",  
                    "created_at": "2012-12-15T19:56:11.560709Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/debits",  
                    "email_address": "email.4@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/holds",  
                    "id": "AC487y01FnMb3PAGKVo4BXJg",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg" 
                },  
                "amount": 9999999,  
                "appears_on_statement_as": "hiya.bom",  
                "available_at": "2012-12-16T03:56:11.572263Z",  
                "created_at": "2012-12-15T19:56:11.581808Z",  
                "description": null,  
                "fee": 349999,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg",  
                    "amount": 9999999,  
                    "created_at": "2012-12-15T19:56:11.585239Z",  
                    "description": null,  
                    "expires_at": "2012-12-23T03:56:11.571940Z",  
                    "fee": 30,  
                    "id": "HL489d9d6tNYT3tRym0CZfRM",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/cards/CC87bc000c473411e2bb6b68a86d3cb93a",  
                    "transaction_number": "HL519-500-5695",  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/holds/HL489d9d6tNYT3tRym0CZfRM" 
                },  
                "id": "WD488V1SDc9Z8UiEB5KNOvdo",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits/WD488V1SDc9Z8UiEB5KNOvdo/refunds",  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T19:56:11.566995Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC87bc000c473411e2bb6b68a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487y01FnMb3PAGKVo4BXJg/cards/CC87bc000c473411e2bb6b68a86d3cb93a" 
                },  
                "transaction_number": "W439-468-0285",  
                "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits/WD488V1SDc9Z8UiEB5KNOvdo" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/cards",  
                    "created_at": "2012-12-15T19:56:11.560218Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/holds",  
                    "id": "AC487vOmDSgmunx3kUNN7o8O",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2012-12-16T03:56:11.601019Z",  
                "created_at": "2012-12-15T19:56:11.606994Z",  
                "description": "abc123",  
                "fee": 43,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O",  
                    "amount": 1254,  
                    "created_at": "2012-12-15T19:56:11.608663Z",  
                    "description": null,  
                    "expires_at": "2012-12-17T03:56:11.598329Z",  
                    "fee": 30,  
                    "id": "HL48aT5geNJxICrX2R8FA51U",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/cards/CC487AvfTOpJmaBxSMNRWUJk",  
                    "transaction_number": "HL276-952-0566",  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/holds/HL48aT5geNJxICrX2R8FA51U" 
                },  
                "id": "WD48aIcztBLZwuGcazKTn8L0",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits/WD48aIcztBLZwuGcazKTn8L0/refunds",  
                "source": { 
                    "brand": "American Express",  
                    "card_type": "amex",  
                    "created_at": "2012-12-15T19:56:11.562176Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC487AvfTOpJmaBxSMNRWUJk",  
                    "is_valid": true,  
                    "last_four": "1117",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/cards/CC487AvfTOpJmaBxSMNRWUJk" 
                },  
                "transaction_number": "W138-181-6503",  
                "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits/WD48aIcztBLZwuGcazKTn8L0" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/cards",  
                    "created_at": "2012-12-15T19:56:11.560218Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/holds",  
                    "id": "AC487vOmDSgmunx3kUNN7o8O",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2012-12-16T03:56:11.619245Z",  
                "created_at": "2012-12-15T19:56:11.624090Z",  
                "description": "abc123",  
                "fee": 15,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O",  
                    "amount": 431,  
                    "created_at": "2012-12-15T19:56:11.625181Z",  
                    "description": null,  
                    "expires_at": "2012-12-17T03:56:11.616884Z",  
                    "fee": 30,  
                    "id": "HL48c2yb9HXUpf1FrORqtlZ8",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/cards/CC487AvfTOpJmaBxSMNRWUJk",  
                    "transaction_number": "HL277-187-6694",  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/holds/HL48c2yb9HXUpf1FrORqtlZ8" 
                },  
                "id": "WD48bXnPreiLlbaVGf4mnR22",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits/WD48bXnPreiLlbaVGf4mnR22/refunds",  
                "source": { 
                    "brand": "American Express",  
                    "card_type": "amex",  
                    "created_at": "2012-12-15T19:56:11.562176Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC487AvfTOpJmaBxSMNRWUJk",  
                    "is_valid": true,  
                    "last_four": "1117",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/accounts/AC487vOmDSgmunx3kUNN7o8O/cards/CC487AvfTOpJmaBxSMNRWUJk" 
                },  
                "transaction_number": "W181-784-6074",  
                "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits/WD48bXnPreiLlbaVGf4mnR22" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP4859tzqgrmDjnSB8CZ2o1s/debits?limit=10&offset=0" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/cards",  
            "created_at": "2012-12-15T19:56:14.462506Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/holds",  
            "id": "AC4bnTcMRDGTjg3vsziT6zRo",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2012-12-16T03:56:14.532200Z",  
        "created_at": "2012-12-15T19:56:14.539486Z",  
        "description": "my new description",  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo",  
            "amount": 1254,  
            "created_at": "2012-12-15T19:56:14.541532Z",  
            "description": null,  
            "expires_at": "2012-12-17T03:56:14.528821Z",  
            "fee": 30,  
            "id": "HL4btoiRFxUHYYGlFZsCUMvo",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/cards/CC4bnZhbFXygoKMlKpSwQVuO",  
            "transaction_number": "HL164-602-7610",  
            "uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/holds/HL4btoiRFxUHYYGlFZsCUMvo" 
        },  
        "id": "WD4btaq97oZbDJJzcHpeZiGK",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "refunds_uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/debits/WD4btaq97oZbDJJzcHpeZiGK/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-15T19:56:14.464785Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC4bnZhbFXygoKMlKpSwQVuO",  
            "is_valid": true,  
            "last_four": "1111",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/accounts/AC4bnTcMRDGTjg3vsziT6zRo/cards/CC4bnZhbFXygoKMlKpSwQVuO" 
        },  
        "transaction_number": "W719-896-7876",  
        "uri": "/v1/marketplaces/TEST-MP4bkL0UGG6QFxjs3scOPMwO/debits/WD4btaq97oZbDJJzcHpeZiGK" 
    } 
 

