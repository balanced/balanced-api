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
            "holds_uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:54:58.648843Z",  
            "uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC5u7ccq5TckhtbUmL4g82C8",  
            "credits_uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8/cards" 
        },  
        "fee": 25,  
        "description": null,  
        "state": "cleared",  
        "created_at": "2012-10-31T09:54:58.760321Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-31T09:54:58.645223Z",  
            "uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/accounts/AC5u7ccq5TckhtbUmL4g82C8/bank_accounts/BA5u6WnC6fT6hQWUM9CwMAvO",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA5u6WnC6fT6hQWUM9CwMAvO" 
        },  
        "uri": "/v1/marketplaces/TEST-MP5u1fTf7rGwYCsGfrMxTUjO/credits/CR5ueqUA49otKWGv6I4Sq4tu",  
        "transaction_number": "CR794-368-3816",  
        "amount": 1234,  
        "meta": {},  
        "id": "CR5ueqUA49otKWGv6I4Sq4tu",  
        "available_at": "2012-10-31T16:54:58.751944Z" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:00.000280Z",  
            "uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC5vDqmHtqfOep7fPJ1tYyBS",  
            "credits_uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS/cards" 
        },  
        "fee": 25,  
        "description": "hiya",  
        "state": "cleared",  
        "created_at": "2012-10-31T09:55:00.065202Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-31T09:54:59.996274Z",  
            "uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/accounts/AC5vDqmHtqfOep7fPJ1tYyBS/bank_accounts/BA5vD9qt5b2fQtX2SYAv15s0",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA5vD9qt5b2fQtX2SYAv15s0" 
        },  
        "uri": "/v1/marketplaces/TEST-MP5vx8mqSVPL1v9f6w5Vp8sQ/credits/CR5vHq4gDWsBvS8nhqJcsG1u",  
        "transaction_number": "CR978-830-2113",  
        "amount": 1254,  
        "meta": {},  
        "id": "CR5vHq4gDWsBvS8nhqJcsG1u",  
        "available_at": "2012-10-31T16:55:00.050811Z" 
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
        "first_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:01.336178Z",  
                    "uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC5x8AkOQZO38DTPc9q6Wmm8",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "state": "cleared",  
                "created_at": "2012-10-31T09:55:01.430123Z",  
                "destination": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-10-31T09:55:01.331133Z",  
                    "uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/bank_accounts/BA5x8eihHfPyNsboN2HWVSVC",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BA5x8eihHfPyNsboN2HWVSVC" 
                },  
                "uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/credits/CR5xdWr3fpeAKmHFMA6uOnKQ",  
                "transaction_number": "CR129-846-8849",  
                "amount": 1254,  
                "meta": {},  
                "id": "CR5xdWr3fpeAKmHFMA6uOnKQ",  
                "available_at": "2012-10-31T16:55:01.404633Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-31T09:55:01.336178Z",  
                    "uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "AC5x8AkOQZO38DTPc9q6Wmm8",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "state": "cleared",  
                "created_at": "2012-10-31T09:55:01.430874Z",  
                "destination": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-10-31T09:55:01.331133Z",  
                    "uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/accounts/AC5x8AkOQZO38DTPc9q6Wmm8/bank_accounts/BA5x8eihHfPyNsboN2HWVSVC",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BA5x8eihHfPyNsboN2HWVSVC" 
                },  
                "uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/credits/CR5xe3QuIsP1YtcfvSaDORfK",  
                "transaction_number": "CR045-370-2160",  
                "amount": 431,  
                "meta": {},  
                "id": "CR5xe3QuIsP1YtcfvSaDORfK",  
                "available_at": "2012-10-31T16:55:01.413752Z" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP5x1amnCG4GMMdgNoHN53Ss/credits?limit=10&offset=0" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:55:04.445304Z",  
            "uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC5ADoE4asqp5h9zs6Ksit3C",  
            "credits_uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C/cards" 
        },  
        "fee": 25,  
        "description": "my new description",  
        "state": "cleared",  
        "created_at": "2012-10-31T09:55:04.541136Z",  
        "destination": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-31T09:55:04.441173Z",  
            "uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/accounts/AC5ADoE4asqp5h9zs6Ksit3C/bank_accounts/BA5AD6k3BqVUWO4Nkw2cGfAw",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA5AD6k3BqVUWO4Nkw2cGfAw" 
        },  
        "uri": "/v1/marketplaces/TEST-MP5Aw4ZMXKSzOk5lcP1gclzS/credits/CR5AIHIor8WtPF8VS9AhOgAc",  
        "transaction_number": "CR066-500-1315",  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "id": "CR5AIHIor8WtPF8VS9AhOgAc",  
        "available_at": "2012-10-31T16:55:04.513159Z" 
    } 
 

