Credits
=======

- `Credit an Account`_
- `Retrieve a Credit`_
- `List All Credits`_
- `Update a Credit`_

Fields
------

``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**. A URI for a Balanced entity 
 
``amount`` 
    **integer**. Amount of the credit. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    credit was created. 
 
``description`` 
    **string**. A description of the credit, used for display purposes. 
 
``account`` 
    **object**. The account to which the credit is associated. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``available_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    credit will be available to the merchant. 
 
``fee`` 
    **integer**. The fee charged by Balanced for this credit. 
 
``destination`` 
    **object**. The funding destination for this credit (i.e., a bank account).  
 
``state`` 
    **string**. One of ``pending``, ``cleared``, ``rejected``.  
 

Credit an Account
-----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
    POST /v1/marketplaces/:marketplace_id/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer** or **null**. USD cents. Must be **>=** your minimum credit amount but **<=** your maximum credit amount. 
 
``description`` 
    *optional* **string** or **null**.  
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``appears_on_statement_as`` 
    *optional* **string** or **null**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``destination_uri`` 
    *optional* **string** or **null**.  
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T16:40:12.279196Z",  
            "uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC2rwa8Bc4OYTFpJINYC3Izi",  
            "credits_uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi/cards" 
        },  
        "fee": 25,  
        "description": null,  
        "state": "cleared",  
        "created_at": "2012-10-31T16:40:12.425960Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "created_at": "2012-10-31T16:40:12.274947Z",  
            "uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/accounts/AC2rwa8Bc4OYTFpJINYC3Izi/bank_accounts/BA2rvRdkxZ1w1B8cVSSAkgpm",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA2rvRdkxZ1w1B8cVSSAkgpm" 
        },  
        "uri": "/v1/marketplaces/TEST-MP2roQeM4oBkR8Kw4GVeNT2Q/credits/CR2rFsIqLsc63vwNkv2BKlmY",  
        "transaction_number": "CR560-489-3182",  
        "amount": 1234,  
        "meta": {},  
        "id": "CR2rFsIqLsc63vwNkv2BKlmY",  
        "available_at": "2012-10-31T23:40:12.411751Z" 
    } 
 

Retrieve a Credit
-----------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits/:credit_id 
    GET /v1/marketplaces/:marketplace_id/credits/:credit_id 
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T16:40:13.588531Z",  
            "uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC2sZthuLqgQ1nAoL1DPwbJy",  
            "credits_uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy/cards" 
        },  
        "fee": 25,  
        "description": "hiya",  
        "state": "cleared",  
        "created_at": "2012-10-31T16:40:13.671120Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "created_at": "2012-10-31T16:40:13.585029Z",  
            "uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/accounts/AC2sZthuLqgQ1nAoL1DPwbJy/bank_accounts/BA2sZdHqPzWEcFy29nyrrqsY",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA2sZdHqPzWEcFy29nyrrqsY" 
        },  
        "uri": "/v1/marketplaces/TEST-MP2sU58K40Wk1WXFbErM1LqA/credits/CR2t4t0OVYUmYkIF2iuQTUpe",  
        "transaction_number": "CR368-217-8448",  
        "amount": 1254,  
        "meta": {},  
        "id": "CR2t4t0OVYUmYkIF2iuQTUpe",  
        "available_at": "2012-10-31T23:40:13.651189Z" 
    } 
 

List All Credits
----------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
    GET /v1/marketplaces/:marketplace_id/credits 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T16:40:14.869474Z",  
                    "uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC2uqMvILLrQjzscPjczfSJe",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "state": "cleared",  
                "created_at": "2012-10-31T16:40:14.940398Z",  
                "destination": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "created_at": "2012-10-31T16:40:14.864863Z",  
                    "uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/bank_accounts/BA2uqsqC9uFHhc4nqDdMflSQ",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BA2uqsqC9uFHhc4nqDdMflSQ" 
                },  
                "uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/credits/CR2uuOXLOfWMYzLYJxvHS8u0",  
                "transaction_number": "CR880-658-4710",  
                "amount": 1254,  
                "meta": {},  
                "id": "CR2uuOXLOfWMYzLYJxvHS8u0",  
                "available_at": "2012-10-31T23:40:14.920711Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T16:40:14.869474Z",  
                    "uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC2uqMvILLrQjzscPjczfSJe",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "state": "cleared",  
                "created_at": "2012-10-31T16:40:14.940996Z",  
                "destination": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "created_at": "2012-10-31T16:40:14.864863Z",  
                    "uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC2uqMvILLrQjzscPjczfSJe/bank_accounts/BA2uqsqC9uFHhc4nqDdMflSQ",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BA2uqsqC9uFHhc4nqDdMflSQ" 
                },  
                "uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/credits/CR2uuUeg6O6Z5DiM8Vlua3oU",  
                "transaction_number": "CR832-710-5499",  
                "amount": 431,  
                "meta": {},  
                "id": "CR2uuUeg6O6Z5DiM8Vlua3oU",  
                "available_at": "2012-10-31T23:40:14.927695Z" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/credits?limit=10&offset=0" 
    } 
 

Update a Credit
---------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/credits/:credit_id 
    PUT /v1/marketplaces/:marketplace_id/credits/:credit_id 
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T16:40:17.536250Z",  
            "uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC2xqKqeemgCnyIcPgjwnx1q",  
            "credits_uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q/cards" 
        },  
        "fee": 25,  
        "description": "my new description",  
        "state": "cleared",  
        "created_at": "2012-10-31T16:40:17.633158Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "created_at": "2012-10-31T16:40:17.531909Z",  
            "uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/accounts/AC2xqKqeemgCnyIcPgjwnx1q/bank_accounts/BA2xqrl2FBCOSAAdyBEaHvhy",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA2xqrl2FBCOSAAdyBEaHvhy" 
        },  
        "uri": "/v1/marketplaces/TEST-MP2xjr6RkyFatXRnqBG5lUYQ/credits/CR2xw5Y9m3Ao5sKCWyuco3uQ",  
        "transaction_number": "CR393-913-3063",  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "id": "CR2xw5Y9m3Ao5sKCWyuco3uQ",  
        "available_at": "2012-10-31T23:40:17.603869Z" 
    } 
 

