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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/cards",  
            "created_at": "2012-12-15T22:50:28.710848Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/holds",  
            "id": "AC6PXG3LtJY2js3T8vmfdvpE",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/transactions",  
            "uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2012-12-16T06:50:28.767281Z",  
        "created_at": "2012-12-15T22:50:28.773480Z",  
        "description": null,  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE",  
            "amount": 1234,  
            "created_at": "2012-12-15T22:50:28.775066Z",  
            "description": null,  
            "expires_at": "2012-12-23T06:50:28.766983Z",  
            "fee": 30,  
            "id": "HL6Q29GwMf8TZ4tjapGhzQqC",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/cards/CC6PXLYc3k4usXljgT177A3o",  
            "transaction_number": "HL203-620-6650",  
            "uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/holds/HL6Q29GwMf8TZ4tjapGhzQqC" 
        },  
        "id": "WD6Q20EvKxnUwymbgjaGnW3M",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/debits/WD6Q20EvKxnUwymbgjaGnW3M/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-15T22:50:28.713011Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC6PXLYc3k4usXljgT177A3o",  
            "is_valid": true,  
            "last_four": "5100",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/accounts/AC6PXG3LtJY2js3T8vmfdvpE/cards/CC6PXLYc3k4usXljgT177A3o" 
        },  
        "transaction_number": "W536-652-7499",  
        "uri": "/v1/marketplaces/TEST-MP6PVfhmiM6yPhOQkaUdPZvc/debits/WD6Q20EvKxnUwymbgjaGnW3M" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/cards",  
            "created_at": "2012-12-15T22:50:30.035873Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/holds",  
            "id": "AC6Rs4rGUVfGR5LOsDV9tsTM",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/transactions",  
            "uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2012-12-16T06:50:30.078504Z",  
        "created_at": "2012-12-15T22:50:30.084209Z",  
        "description": "abc123",  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM",  
            "amount": 1254,  
            "created_at": "2012-12-15T22:50:30.085376Z",  
            "description": null,  
            "expires_at": "2012-12-17T06:50:30.075885Z",  
            "fee": 30,  
            "id": "HL6Rvx4nSff2v8OYZirKPN2i",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/cards/CC6Rs9XKNuxZT8whO0LVu9ui",  
            "transaction_number": "HL204-371-1600",  
            "uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/holds/HL6Rvx4nSff2v8OYZirKPN2i" 
        },  
        "id": "WD6Rvn7ASCXUT9pGxpL1uq7w",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/debits/WD6Rvn7ASCXUT9pGxpL1uq7w/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-15T22:50:30.037867Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC6Rs9XKNuxZT8whO0LVu9ui",  
            "is_valid": true,  
            "last_four": "5100",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/accounts/AC6Rs4rGUVfGR5LOsDV9tsTM/cards/CC6Rs9XKNuxZT8whO0LVu9ui" 
        },  
        "transaction_number": "W186-546-3221",  
        "uri": "/v1/marketplaces/TEST-MP6RpDXgTxAG3VDoXBJq1VQ6/debits/WD6Rvn7ASCXUT9pGxpL1uq7w" 
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
        "first_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/cards",  
                    "created_at": "2012-12-15T22:50:31.356141Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/debits",  
                    "email_address": "email.4@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/holds",  
                    "id": "AC6SW8S14VxbdcpFmWWip4Ya",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya" 
                },  
                "amount": 9999999,  
                "appears_on_statement_as": "hiya.bom",  
                "available_at": "2012-12-16T06:50:31.368043Z",  
                "created_at": "2012-12-15T22:50:31.377891Z",  
                "description": null,  
                "fee": 349999,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya",  
                    "amount": 9999999,  
                    "created_at": "2012-12-15T22:50:31.381511Z",  
                    "description": null,  
                    "expires_at": "2012-12-23T06:50:31.367710Z",  
                    "fee": 30,  
                    "id": "HL6SXS0FrMs1YbjxMe2P1IO6",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/cards/CCe24221e1474c11e2a78968a86d3cb93a",  
                    "transaction_number": "HL363-198-1951",  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/holds/HL6SXS0FrMs1YbjxMe2P1IO6" 
                },  
                "id": "WD6SXz5W2tMq9VsRWAydlZma",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits/WD6SXz5W2tMq9VsRWAydlZma/refunds",  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-15T22:50:31.362505Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CCe24221e1474c11e2a78968a86d3cb93a",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW8S14VxbdcpFmWWip4Ya/cards/CCe24221e1474c11e2a78968a86d3cb93a" 
                },  
                "transaction_number": "W715-718-3856",  
                "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits/WD6SXz5W2tMq9VsRWAydlZma" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/cards",  
                    "created_at": "2012-12-15T22:50:31.355460Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/holds",  
                    "id": "AC6SW6sYKEjggNS6j4IOul74",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2012-12-16T06:50:31.397543Z",  
                "created_at": "2012-12-15T22:50:31.403614Z",  
                "description": "abc123",  
                "fee": 43,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74",  
                    "amount": 1254,  
                    "created_at": "2012-12-15T22:50:31.404817Z",  
                    "description": null,  
                    "expires_at": "2012-12-17T06:50:31.394862Z",  
                    "fee": 30,  
                    "id": "HL6SZxsRbY1qj7xjLWgHwt8C",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/cards/CC6SWc4lH3XxBKEffN1daqjo",  
                    "transaction_number": "HL710-157-0766",  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/holds/HL6SZxsRbY1qj7xjLWgHwt8C" 
                },  
                "id": "WD6SZp3cnXhpRfQTwJTUXhge",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits/WD6SZp3cnXhpRfQTwJTUXhge/refunds",  
                "source": { 
                    "brand": "American Express",  
                    "card_type": "amex",  
                    "created_at": "2012-12-15T22:50:31.357677Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC6SWc4lH3XxBKEffN1daqjo",  
                    "is_valid": true,  
                    "last_four": "1117",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/cards/CC6SWc4lH3XxBKEffN1daqjo" 
                },  
                "transaction_number": "W920-022-6803",  
                "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits/WD6SZp3cnXhpRfQTwJTUXhge" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/cards",  
                    "created_at": "2012-12-15T22:50:31.355460Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/holds",  
                    "id": "AC6SW6sYKEjggNS6j4IOul74",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2012-12-16T06:50:31.415449Z",  
                "created_at": "2012-12-15T22:50:31.420373Z",  
                "description": "abc123",  
                "fee": 15,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74",  
                    "amount": 431,  
                    "created_at": "2012-12-15T22:50:31.421452Z",  
                    "description": null,  
                    "expires_at": "2012-12-17T06:50:31.412843Z",  
                    "fee": 30,  
                    "id": "HL6T0HDt3s52sFjEpLl903RE",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/cards/CC6SWc4lH3XxBKEffN1daqjo",  
                    "transaction_number": "HL943-458-7061",  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/holds/HL6T0HDt3s52sFjEpLl903RE" 
                },  
                "id": "WD6T0CqsO3eUfdNBySbNqVce",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits/WD6T0CqsO3eUfdNBySbNqVce/refunds",  
                "source": { 
                    "brand": "American Express",  
                    "card_type": "amex",  
                    "created_at": "2012-12-15T22:50:31.357677Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC6SWc4lH3XxBKEffN1daqjo",  
                    "is_valid": true,  
                    "last_four": "1117",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/accounts/AC6SW6sYKEjggNS6j4IOul74/cards/CC6SWc4lH3XxBKEffN1daqjo" 
                },  
                "transaction_number": "W757-848-2207",  
                "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits/WD6T0CqsO3eUfdNBySbNqVce" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP6STJ392XbZDYuBnOs6r9cC/debits?limit=10&offset=0" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/cards",  
            "created_at": "2012-12-15T22:50:34.216499Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/holds",  
            "id": "AC6W9BNU00AIaxkIn17Y2G4a",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/transactions",  
            "uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2012-12-16T06:50:34.259223Z",  
        "created_at": "2012-12-15T22:50:34.264827Z",  
        "description": "my new description",  
        "fee": 43,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a",  
            "amount": 1254,  
            "created_at": "2012-12-15T22:50:34.266220Z",  
            "description": null,  
            "expires_at": "2012-12-17T06:50:34.256407Z",  
            "fee": 30,  
            "id": "HL6Wd4GnPFmvXE2EVogsFYlY",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/cards/CC6W9GqFjQsZt1CWAEng6PTI",  
            "transaction_number": "HL639-104-6525",  
            "uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/holds/HL6Wd4GnPFmvXE2EVogsFYlY" 
        },  
        "id": "WD6WcUxwYdJDtzPj1J4V4xt0",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "refunds_uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/debits/WD6WcUxwYdJDtzPj1J4V4xt0/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-15T22:50:34.218473Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC6W9GqFjQsZt1CWAEng6PTI",  
            "is_valid": true,  
            "last_four": "5100",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/accounts/AC6W9BNU00AIaxkIn17Y2G4a/cards/CC6W9GqFjQsZt1CWAEng6PTI" 
        },  
        "transaction_number": "W096-280-1399",  
        "uri": "/v1/marketplaces/TEST-MP6W7bUXm0T1kYWtK02pvF9g/debits/WD6WcUxwYdJDtzPj1J4V4xt0" 
    } 
 

