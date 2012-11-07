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
    *optional* **string**.  
 
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
            "holds_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:30.418819Z",  
            "uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC1BAZbiKeDkQwS1kXmtFcv9",  
            "credits_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/cards" 
        },  
        "fee": 43,  
        "description": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/debits/WD1BJJ96fLNB3moaJPx5978f/refunds",  
        "created_at": "2012-11-07T00:43:30.545505Z",  
        "transaction_number": "W881-120-3478",  
        "uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/debits/WD1BJJ96fLNB3moaJPx5978f",  
        "source": { 
            "expiration_month": 10,  
            "hash": "handcock",  
            "name": null,  
            "expiration_year": 2016,  
            "created_at": "2012-11-07T00:43:30.423461Z",  
            "uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/cards/CC1BB9V94m0gxkdoPEtqrlGr",  
            "id": "CC1BB9V94m0gxkdoPEtqrlGr",  
            "card_type": "amex",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "5100",  
            "brand": "American Express" 
        },  
        "amount": 1234,  
        "meta": {},  
        "appears_on_statement_as": "hiya.bom",  
        "hold": { 
            "fee": 30,  
            "description": null,  
            "created_at": "2012-11-07T00:43:30.548876Z",  
            "uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/holds/HL1BK23iqhllNS9dDAFZHd0T",  
            "expires_at": "2012-11-14T08:43:30.531872Z",  
            "transaction_number": "HL078-995-3298",  
            "amount": 1234,  
            "meta": {},  
            "is_void": false,  
            "account_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9",  
            "instrument_uri": "/v1/marketplaces/TEST-MP1BvS75DlZ8GAtemkf3iMw3/accounts/AC1BAZbiKeDkQwS1kXmtFcv9/cards/CC1BB9V94m0gxkdoPEtqrlGr",  
            "id": "HL1BK23iqhllNS9dDAFZHd0T" 
        },  
        "id": "WD1BJJ96fLNB3moaJPx5978f",  
        "available_at": "2012-11-07T08:43:30.532653Z" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:31.747461Z",  
            "uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC1D5DjtEjErmFdgJLnSGVVx",  
            "credits_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/cards" 
        },  
        "fee": 43,  
        "description": "abc123",  
        "refunds_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/debits/WD1Dax3y6a2OC3WBIclxnZ2r/refunds",  
        "created_at": "2012-11-07T00:43:31.819060Z",  
        "transaction_number": "W997-895-2876",  
        "uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/debits/WD1Dax3y6a2OC3WBIclxnZ2r",  
        "source": { 
            "expiration_month": 10,  
            "hash": "handcock",  
            "name": null,  
            "expiration_year": 2016,  
            "created_at": "2012-11-07T00:43:31.750633Z",  
            "uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/cards/CC1D5MPsIjALVOuxxlMSKUnx",  
            "id": "CC1D5MPsIjALVOuxxlMSKUnx",  
            "card_type": "amex",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1111",  
            "brand": "American Express" 
        },  
        "amount": 1254,  
        "meta": {},  
        "appears_on_statement_as": "PND*TESTS",  
        "hold": { 
            "fee": 30,  
            "description": null,  
            "created_at": "2012-11-07T00:43:31.820899Z",  
            "uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/holds/HL1DaKYWQgBCgcOOnIT5aABt",  
            "expires_at": "2012-11-08T08:43:31.804224Z",  
            "transaction_number": "HL584-851-2929",  
            "amount": 1254,  
            "meta": {},  
            "is_void": false,  
            "account_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx",  
            "instrument_uri": "/v1/marketplaces/TEST-MP1D0ioXyR94Dtqz47vdamHx/accounts/AC1D5DjtEjErmFdgJLnSGVVx/cards/CC1D5MPsIjALVOuxxlMSKUnx",  
            "id": "HL1DaKYWQgBCgcOOnIT5aABt" 
        },  
        "id": "WD1Dax3y6a2OC3WBIclxnZ2r",  
        "available_at": "2012-11-07T08:43:31.808191Z" 
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
        "first_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:43:33.062432Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/transactions",  
                    "email_address": "email.4@y.com",  
                    "id": "AC1EzkTpsTaQIgT3HklLejrd",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/cards" 
                },  
                "fee": 349999,  
                "description": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits/WD1ECbk7Akv2b7Lmh9LKogx5/refunds",  
                "created_at": "2012-11-07T00:43:33.106722Z",  
                "transaction_number": "W637-295-6813",  
                "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits/WD1ECbk7Akv2b7Lmh9LKogx5",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-11-07T00:43:33.074759Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/cards/CC365ccb8828b711e2a66d80ee7316ae43",  
                    "id": "CC365ccb8828b711e2a66d80ee7316ae43",  
                    "card_type": "visa",  
                    "is_valid": true,  
                    "meta": {},  
                    "country_code": "USA",  
                    "postal_code": "94110",  
                    "brand": "Visa",  
                    "street_address": "Somewhere over the rainbow",  
                    "name": "Jet Li" 
                },  
                "amount": 9999999,  
                "meta": {},  
                "appears_on_statement_as": "hiya.bom",  
                "hold": { 
                    "fee": 30,  
                    "description": null,  
                    "created_at": "2012-11-07T00:43:33.113500Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/holds/HL1ECNxI8AxLxJAMtWXNioQH",  
                    "expires_at": "2012-11-14T08:43:33.085070Z",  
                    "transaction_number": "HL228-763-9692",  
                    "amount": 9999999,  
                    "meta": {},  
                    "is_void": false,  
                    "account_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd",  
                    "instrument_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzkTpsTaQIgT3HklLejrd/cards/CC365ccb8828b711e2a66d80ee7316ae43",  
                    "id": "HL1ECNxI8AxLxJAMtWXNioQH" 
                },  
                "id": "WD1ECbk7Akv2b7Lmh9LKogx5",  
                "available_at": "2012-11-07T08:43:33.085852Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:43:33.061321Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC1EzfUlq5CY50S5ZNL7au3h",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/cards" 
                },  
                "fee": 43,  
                "description": "abc123",  
                "refunds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits/WD1EFplRO8BKXhvtkxIk329B/refunds",  
                "created_at": "2012-11-07T00:43:33.151166Z",  
                "transaction_number": "W325-220-0873",  
                "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits/WD1EFplRO8BKXhvtkxIk329B",  
                "source": { 
                    "expiration_month": 10,  
                    "hash": "handcock",  
                    "name": null,  
                    "expiration_year": 2016,  
                    "created_at": "2012-11-07T00:43:33.065119Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/cards/CC1EzqJ0Tl8BjOzDZIF5gKun",  
                    "id": "CC1EzqJ0Tl8BjOzDZIF5gKun",  
                    "card_type": "amex",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1111",  
                    "brand": "American Express" 
                },  
                "amount": 1254,  
                "meta": {},  
                "appears_on_statement_as": "PND*TESTS",  
                "hold": { 
                    "fee": 30,  
                    "description": null,  
                    "created_at": "2012-11-07T00:43:33.153620Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/holds/HL1EFGpS9SadIZtaYHOoAmkP",  
                    "expires_at": "2012-11-08T08:43:33.135921Z",  
                    "transaction_number": "HL827-595-5607",  
                    "amount": 1254,  
                    "meta": {},  
                    "is_void": false,  
                    "account_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h",  
                    "instrument_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/cards/CC1EzqJ0Tl8BjOzDZIF5gKun",  
                    "id": "HL1EFGpS9SadIZtaYHOoAmkP" 
                },  
                "id": "WD1EFplRO8BKXhvtkxIk329B",  
                "available_at": "2012-11-07T08:43:33.140707Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:43:33.061321Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC1EzfUlq5CY50S5ZNL7au3h",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/cards" 
                },  
                "fee": 15,  
                "description": "abc123",  
                "refunds_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits/WD1EHt624a0JMKsyYa5Ta78T/refunds",  
                "created_at": "2012-11-07T00:43:33.179566Z",  
                "transaction_number": "W381-197-2893",  
                "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits/WD1EHt624a0JMKsyYa5Ta78T",  
                "source": { 
                    "expiration_month": 10,  
                    "hash": "handcock",  
                    "name": null,  
                    "expiration_year": 2016,  
                    "created_at": "2012-11-07T00:43:33.065119Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/cards/CC1EzqJ0Tl8BjOzDZIF5gKun",  
                    "id": "CC1EzqJ0Tl8BjOzDZIF5gKun",  
                    "card_type": "amex",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1111",  
                    "brand": "American Express" 
                },  
                "amount": 431,  
                "meta": {},  
                "appears_on_statement_as": "PND*TESTS",  
                "hold": { 
                    "fee": 30,  
                    "description": null,  
                    "created_at": "2012-11-07T00:43:33.182467Z",  
                    "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/holds/HL1EHGnuxeDhooOOfsmRS5jR",  
                    "expires_at": "2012-11-08T08:43:33.165425Z",  
                    "transaction_number": "HL985-428-2397",  
                    "amount": 431,  
                    "meta": {},  
                    "is_void": false,  
                    "account_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h",  
                    "instrument_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/accounts/AC1EzfUlq5CY50S5ZNL7au3h/cards/CC1EzqJ0Tl8BjOzDZIF5gKun",  
                    "id": "HL1EHGnuxeDhooOOfsmRS5jR" 
                },  
                "id": "WD1EHt624a0JMKsyYa5Ta78T",  
                "available_at": "2012-11-07T08:43:33.170122Z" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 3,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP1EtKQreomRNXyp4Vbr5Z7R/debits?limit=10&offset=0" 
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
    *optional* **string**.  
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:36.116872Z",  
            "uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC1I0k1NAxlS4HjlmpVN0Aev",  
            "credits_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/cards" 
        },  
        "fee": 43,  
        "description": "my new description",  
        "refunds_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/debits/WD1I6RiPwlxiUhT2GnMEmiCT/refunds",  
        "created_at": "2012-11-07T00:43:36.212322Z",  
        "transaction_number": "W253-182-7996",  
        "uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/debits/WD1I6RiPwlxiUhT2GnMEmiCT",  
        "source": { 
            "expiration_month": 10,  
            "hash": "handcock",  
            "name": null,  
            "expiration_year": 2016,  
            "created_at": "2012-11-07T00:43:36.121057Z",  
            "uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/cards/CC1I0vKuuABrblo55Yp3VSf1",  
            "id": "CC1I0vKuuABrblo55Yp3VSf1",  
            "card_type": "amex",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "5100",  
            "brand": "American Express" 
        },  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "hold": { 
            "fee": 30,  
            "description": null,  
            "created_at": "2012-11-07T00:43:36.215455Z",  
            "uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/holds/HL1I7bfTyJpC1ZlfUm74uDnB",  
            "expires_at": "2012-11-08T08:43:36.194913Z",  
            "transaction_number": "HL434-064-3239",  
            "amount": 1254,  
            "meta": {},  
            "is_void": false,  
            "account_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev",  
            "instrument_uri": "/v1/marketplaces/TEST-MP1HU7gGcChnkpdwG8TCfnEL/accounts/AC1I0k1NAxlS4HjlmpVN0Aev/cards/CC1I0vKuuABrblo55Yp3VSf1",  
            "id": "HL1I7bfTyJpC1ZlfUm74uDnB" 
        },  
        "id": "WD1I6RiPwlxiUhT2GnMEmiCT",  
        "available_at": "2012-11-07T08:43:36.200388Z" 
    } 
 

