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
    **object**. See `Debit <./debits.rst>`_. 
 
 
 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``account`` 
    **object**. See `Account <./accounts.rst>`_. 
 
 
``uri`` 
    **string**. A URI for a Balanced entity 
 
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
    *optional* **string**.  
 
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
            "holds_uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:41.643202Z",  
            "uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9/transactions",  
            "email_address": "email.5@y.com",  
            "id": "AC1OdHcjUpVa2HEyHte791p9",  
            "credits_uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9/cards" 
        },  
        "fee": 30,  
        "description": "Something tasty",  
        "transaction_number": "HL276-876-7948",  
        "created_at": "2012-11-07T00:43:41.713951Z",  
        "uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/holds/HL1OiAy00d361bsVGvfnV9aH",  
        "expires_at": "2012-11-14T08:43:41.709250Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-11-07T00:43:41.665199Z",  
            "uri": "/v1/marketplaces/TEST-MP1O66r5xCCFagbiBPwMfPYD/accounts/AC1OdHcjUpVa2HEyHte791p9/cards/CC3b7ba80a28b711e2b06d80ee7316ae43",  
            "id": "CC3b7ba80a28b711e2b06d80ee7316ae43",  
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
        "id": "HL1OiAy00d361bsVGvfnV9aH" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:43.071621Z",  
            "uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD/transactions",  
            "email_address": "email.5@y.com",  
            "id": "AC1PPhW3bxOkqgrsbmAeflgD",  
            "credits_uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD/cards" 
        },  
        "fee": 30,  
        "description": "Something sour",  
        "transaction_number": "HL229-150-6071",  
        "created_at": "2012-11-07T00:43:43.108048Z",  
        "uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/holds/HL1PROWW3J7gxG6u7cenX6fN",  
        "expires_at": "2012-11-08T08:43:43.100053Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-11-07T00:43:43.098198Z",  
            "uri": "/v1/marketplaces/TEST-MP1PH73vf2g3ZmNltW2qdbph/accounts/AC1PPhW3bxOkqgrsbmAeflgD/cards/CC3c5641cc28b711e2931b80ee7316ae43",  
            "id": "CC3c5641cc28b711e2931b80ee7316ae43",  
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
        "id": "HL1PROWW3J7gxG6u7cenX6fN" 
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
        "first_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/holds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:43:44.698829Z",  
                    "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/transactions",  
                    "email_address": "email.5@y.com",  
                    "id": "AC1REKY3UM0U4jrhOQ6Do4WT",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/cards" 
                },  
                "fee": 30,  
                "description": "Something sweet",  
                "transaction_number": "HL138-205-5206",  
                "created_at": "2012-11-07T00:43:44.731087Z",  
                "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/holds/HL1RGZP7KZeCd307A6B8Ix7d",  
                "expires_at": "2012-11-08T08:43:44.723952Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-11-07T00:43:44.722525Z",  
                    "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/cards/CC3d4e33fa28b711e2a4e780ee7316ae43",  
                    "id": "CC3d4e33fa28b711e2a4e780ee7316ae43",  
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
                "id": "HL1RGZP7KZeCd307A6B8Ix7d" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:43:44.698829Z",  
                    "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/transactions",  
                    "email_address": "email.5@y.com",  
                    "id": "AC1REKY3UM0U4jrhOQ6Do4WT",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/cards" 
                },  
                "fee": 30,  
                "description": "Something sour",  
                "transaction_number": "HL963-084-2283",  
                "created_at": "2012-11-07T00:43:44.739460Z",  
                "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/holds/HL1RHAz2vKC09y2kdFLMsrAv",  
                "expires_at": "2012-11-08T08:43:44.727963Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-11-07T00:43:44.722525Z",  
                    "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/cards/CC3d4e33fa28b711e2a4e780ee7316ae43",  
                    "id": "CC3d4e33fa28b711e2a4e780ee7316ae43",  
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
                "id": "HL1RHAz2vKC09y2kdFLMsrAv" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:43:44.698829Z",  
                    "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/transactions",  
                    "email_address": "email.5@y.com",  
                    "id": "AC1REKY3UM0U4jrhOQ6Do4WT",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/cards" 
                },  
                "fee": 30,  
                "description": "Something spicy",  
                "transaction_number": "HL130-992-4448",  
                "created_at": "2012-11-07T00:43:44.747118Z",  
                "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/holds/HL1RI7wG0fCosSBbXF6BFl7R",  
                "expires_at": "2012-11-08T08:43:44.736343Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-11-07T00:43:44.722525Z",  
                    "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/cards/CC3d4e33fa28b711e2a4e780ee7316ae43",  
                    "id": "CC3d4e33fa28b711e2a4e780ee7316ae43",  
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
                "id": "HL1RI7wG0fCosSBbXF6BFl7R" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:43:44.698829Z",  
                    "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/transactions",  
                    "email_address": "email.5@y.com",  
                    "id": "AC1REKY3UM0U4jrhOQ6Do4WT",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/cards" 
                },  
                "fee": 30,  
                "description": "Something tangy",  
                "transaction_number": "HL346-980-0933",  
                "created_at": "2012-11-07T00:43:44.753929Z",  
                "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/holds/HL1RIBrkTrsBNjP5E6DLkEvN",  
                "expires_at": "2012-11-08T08:43:44.743926Z",  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-11-07T00:43:44.722525Z",  
                    "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/cards/CC3d4e33fa28b711e2a4e780ee7316ae43",  
                    "id": "CC3d4e33fa28b711e2a4e780ee7316ae43",  
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
                "id": "HL1RIBrkTrsBNjP5E6DLkEvN" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/holds?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 4,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP1Rw4HbhzX4SRM3RK0gwnRh/accounts/AC1REKY3UM0U4jrhOQ6Do4WT/holds?limit=10&offset=0" 
    } 
 

Update a Hold
-------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id 
    PUT /v1/marketplaces/:marketplace_id/holds/:hold_id 
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:48.226007Z",  
            "uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf/transactions",  
            "email_address": "email.5@y.com",  
            "id": "AC1VCIJAYy9ELMYZkPRRmqWf",  
            "credits_uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf/cards" 
        },  
        "fee": 30,  
        "description": "Something really tasty",  
        "transaction_number": "HL474-034-2809",  
        "created_at": "2012-11-07T00:43:48.260801Z",  
        "uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/holds/HL1VF8cbWBhx9KPsWNPFiv7R",  
        "expires_at": "2012-11-08T08:43:48.254001Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-11-07T00:43:48.251562Z",  
            "uri": "/v1/marketplaces/TEST-MP1VuEeXJcFUQfMToW95ed3l/accounts/AC1VCIJAYy9ELMYZkPRRmqWf/cards/CC3f689f6828b711e2a70a80ee7316ae43",  
            "id": "CC3f689f6828b711e2a70a80ee7316ae43",  
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
        "id": "HL1VF8cbWBhx9KPsWNPFiv7R" 
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
        "hold_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/holds/HL1XlxU3YbCF92TODKq0LXNN" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:49.728284Z",  
            "uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/transactions",  
            "email_address": "email.5@y.com",  
            "id": "AC1XjtsK0nwhUpRjWpUx2aAz",  
            "credits_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/cards" 
        },  
        "fee": 43,  
        "description": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/debits/WD1XpwzivCCL76u0HOUMgwtZ/refunds",  
        "created_at": "2012-11-07T00:43:49.815941Z",  
        "transaction_number": "W305-996-1344",  
        "uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/debits/WD1XpwzivCCL76u0HOUMgwtZ",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-11-07T00:43:49.749729Z",  
            "uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/cards/CC404d28d628b711e2971780ee7316ae43",  
            "id": "CC404d28d628b711e2971780ee7316ae43",  
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
            "created_at": "2012-11-07T00:43:49.757943Z",  
            "uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/holds/HL1XlxU3YbCF92TODKq0LXNN",  
            "expires_at": "2012-11-08T08:43:49.751748Z",  
            "transaction_number": "HL516-277-5003",  
            "amount": 1233,  
            "meta": {},  
            "is_void": false,  
            "account_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz",  
            "instrument_uri": "/v1/marketplaces/TEST-MP1XbfEZq38KSpFJSRe92hB9/accounts/AC1XjtsK0nwhUpRjWpUx2aAz/cards/CC404d28d628b711e2971780ee7316ae43",  
            "id": "HL1XlxU3YbCF92TODKq0LXNN" 
        },  
        "id": "WD1XpwzivCCL76u0HOUMgwtZ",  
        "available_at": "2012-11-07T08:43:49.807295Z" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD/holds",  
            "name": null,  
            "roles": [ 
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:52.655156Z",  
            "uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD/transactions",  
            "email_address": "email.5@y.com",  
            "id": "AC20BzJpuKAtP5AhOlNEbjYD",  
            "credits_uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD/cards" 
        },  
        "fee": 30,  
        "description": "Something sour",  
        "transaction_number": "HL232-759-1356",  
        "created_at": "2012-11-07T00:43:52.687214Z",  
        "uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/holds/HL20DOZFycLpPpsrYTcnjIHh",  
        "expires_at": "2012-11-08T08:43:52.682552Z",  
        "source": { 
            "expiration_month": 1,  
            "hash": null,  
            "last_four": "1111",  
            "expiration_year": 2015,  
            "created_at": "2012-11-07T00:43:52.681356Z",  
            "uri": "/v1/marketplaces/TEST-MP20t2jLNkPWzDi0QJRSpWJZ/accounts/AC20BzJpuKAtP5AhOlNEbjYD/cards/CC420c889c28b711e291e880ee7316ae43",  
            "id": "CC420c889c28b711e291e880ee7316ae43",  
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
        "id": "HL20DOZFycLpPpsrYTcnjIHh" 
    } 
 

