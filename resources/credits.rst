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
            "holds_uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:15.969857Z",  
            "uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC7vY0XQUwyZ5mc6b5V6QdE0",  
            "credits_uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0/cards" 
        },  
        "fee": 25,  
        "description": null,  
        "state": "cleared",  
        "created_at": "2012-10-30T18:26:16.109988Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-30T18:26:15.965379Z",  
            "uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/accounts/AC7vY0XQUwyZ5mc6b5V6QdE0/bank_accounts/BA7vXHl9WfvcheH2RaHTbIbO",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA7vXHl9WfvcheH2RaHTbIbO" 
        },  
        "uri": "/v1/marketplaces/TEST-MP7vQCHiiHm9gJf9nWBYP9HK/credits/CR7w6YPaPolye6FBWsIj2mlS",  
        "transaction_number": "CR377-328-2337",  
        "amount": 1234,  
        "meta": {},  
        "id": "CR7w6YPaPolye6FBWsIj2mlS",  
        "available_at": "2012-10-31T01:26:16.097680Z" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:17.664350Z",  
            "uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC7xSaGpP7PDXlm1UR4TCtQU",  
            "credits_uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU/cards" 
        },  
        "fee": 25,  
        "description": "hiya",  
        "state": "cleared",  
        "created_at": "2012-10-30T18:26:17.734690Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-30T18:26:17.659921Z",  
            "uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/accounts/AC7xSaGpP7PDXlm1UR4TCtQU/bank_accounts/BA7xRRh7OEWfFGp0drhCKXSQ",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA7xRRh7OEWfFGp0drhCKXSQ" 
        },  
        "uri": "/v1/marketplaces/TEST-MP7xKLT9EXTBqeqnujbJvXpi/credits/CR7xWrze44NXkwS6LyzdD6ks",  
        "transaction_number": "CR851-436-5872",  
        "amount": 1254,  
        "meta": {},  
        "id": "CR7xWrze44NXkwS6LyzdD6ks",  
        "available_at": "2012-10-31T01:26:17.718555Z" 
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
        "first_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:19.245010Z",  
                    "uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC7zEp8n3POIVrOxHwZ3YgfO",  
                    "credits_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "state": "cleared",  
                "created_at": "2012-10-30T18:26:19.328880Z",  
                "destination": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-10-30T18:26:19.241484Z",  
                    "uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/bank_accounts/BA7zE9qgy6AHc3QyVbfj1iTy",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BA7zE9qgy6AHc3QyVbfj1iTy" 
                },  
                "uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/credits/CR7zJ4Ockv3G1mlHpRMY7uv2",  
                "transaction_number": "CR691-710-8705",  
                "amount": 431,  
                "meta": {},  
                "id": "CR7zJ4Ockv3G1mlHpRMY7uv2",  
                "available_at": "2012-10-31T01:26:19.311163Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:19.245010Z",  
                    "uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC7zEp8n3POIVrOxHwZ3YgfO",  
                    "credits_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "state": "cleared",  
                "created_at": "2012-10-30T18:26:19.328063Z",  
                "destination": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-10-30T18:26:19.241484Z",  
                    "uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/accounts/AC7zEp8n3POIVrOxHwZ3YgfO/bank_accounts/BA7zE9qgy6AHc3QyVbfj1iTy",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BA7zE9qgy6AHc3QyVbfj1iTy" 
                },  
                "uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/credits/CR7zIW37DPHJhOZwi3lMOZfu",  
                "transaction_number": "CR615-993-8059",  
                "amount": 1254,  
                "meta": {},  
                "id": "CR7zIW37DPHJhOZwi3lMOZfu",  
                "available_at": "2012-10-31T01:26:19.301807Z" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP7zy7ynaaBBHGGlgKUQo8Wo/credits?limit=10&offset=0" 
    } 
 

Update a Credit
---------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
    GET /v1/marketplaces/:marketplace_id/credits 
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:22.394707Z",  
            "uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC7Dc2JPCxBdP60gTQIt4vJO",  
            "credits_uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO/cards" 
        },  
        "fee": 25,  
        "description": "my new description",  
        "state": "cleared",  
        "created_at": "2012-10-30T18:26:22.488998Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-30T18:26:22.391154Z",  
            "uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/accounts/AC7Dc2JPCxBdP60gTQIt4vJO/bank_accounts/BA7DbMi9PsBrUxLNOaXhPMwI",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA7DbMi9PsBrUxLNOaXhPMwI" 
        },  
        "uri": "/v1/marketplaces/TEST-MP7D5oWzNhSv2zUPamoVEkcY/credits/CR7DhbWsF8xO2j6BfO5HyOag",  
        "transaction_number": "CR927-679-4800",  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "id": "CR7DhbWsF8xO2j6BfO5HyOag",  
        "available_at": "2012-10-31T01:26:22.459791Z" 
    } 
 

