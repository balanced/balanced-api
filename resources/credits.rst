Credits
=======

-  `Credit a New Bank Account`_
-  `Credit an Existing Bank Account`_
-  `Credit a Merchant`_
-  `Retrieve a Credit`_
-  `List All Credits`_
-  `List All Credits for a Bank Account`_
-  `List All Credits for a Merchant`_


Fields
------

``id``
: **string**

``uri``
: **string**

``created_at``
: **string**
: `iso8601 <http://en.wikipedia.org/wiki/Iso8601>`_

``amount``
: **integer**
: ``>= 0``
: USD cents

``description``
: **string** or **null**

``status``
: **string**
: ``pending``, ``paid`` or ``failed``

``trace_number``
: **string** or **null**
: Used by the ACH network to track transactions

``bank_account``
: **object**
: `Bank Account <./resources/bank_accounts.rst>`_

``account`` 
: **object**
: `Account <./resources/accounts.rst>`_
: Present if the credit went to a merchant instead of directly to a bank account
 
``meta`` 
: **object**
: A single-level dictionary of string-type key/value pairs


Deprecated
~~~~~~~~~~
 
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
 


Credit a New Bank Account
-------------------------

.. code::

    POST /v1/credits


Request
~~~~~~~

``amount``
: *required* **integer**

``description``
: *optional* **string** or **null**

``bank_account``
: *required* **object**
: `Bank Account <./bank_accounts.rst>`_

.. code:: javascript

    {
        "amount": 1716,
        "description": "Math lesson",
        "bank_account": {
            "name": "Gottfried Leibniz",
            "account_number": "3819372930",
            "routing_number": "121042882",
            "type": "checking"
        }
    }

Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 201 Created

Body
^^^^

.. code:: javascript


    {
        "amount": 1716,
        "bank_account": {
            "account_number": "xxxxxx2930",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "fingerprint": "xyz",
            "type": "checking"
        },
        "created_at": "2012-09-26T01:05:39.048250Z",
        "description": "Math lesson",
        "id": "CR7tpfpJezp2McGX43WFqoaK",
        "status": "pending",
        "trace_number": null,
        "uri": "/v1/credits/CR7tpfpJezp2McGX43WFqoaK"
    }



Credit an Existing Bank Account
-------------------------------

.. code::

    POST /v1/bank_accounts/:bank_account_id/credits


Request
~~~~~~~

``amount``
: *required* **integer**

``description``
: *optional* **string** or **null**

.. code:: javascript

    {
        "amount": 1716,
        "description": "Math lesson"
    }

Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 201 Created

Body
^^^^

.. code:: javascript


    {
        "amount": 1716,
        "bank_account": {
            "account_number": "xxxxxx2930",
            "created_at": "2012-09-26T01:05:39.455444Z",
            "credits_uri": "/v1/bank_accounts/BA7tRY8SQDOO0tCutsZ8C442/credits/",
            "id": "BA7tRY8SQDOO0tCutsZ8C442",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "fingerprint": "xyz",
            "type": "checking",
            "uri": "/v1/bank_accounts/BA7tRY8SQDOO0tCutsZ8C442"
        },
        "created_at": "2012-09-26T01:05:39.471760Z",
        "description": "Math lesson",
        "id": "CR7tTvC259MVS1cOHn28cy2m",
        "status": "pending",
        "trace_number": null,
        "uri": "/v1/credits/CR7tTvC259MVS1cOHn28cy2m"
    }



Credit a Merchant
-----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
 

Request
~~~~~~~

``amount`` 
: *required* **integer**
: ``>= 0``
: USD cents
 
``description`` 
: *optional* **string** or **null**
 
``meta`` 
: *optional* **object** or **null**
: Single level mapping from string keys to string values
 
``appears_on_statement_as`` 
: *optional* **string** or **null**
: Text that will appear on the buyer's statement. Characters that can be
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``destination_uri`` 
: *optional* **string** or **null**
 

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
            "bank_code": "325182797",  
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
 

Retrieve a credit
-----------------

.. code::

    GET /v1/credits/:credit_id


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 200 Ok

Body
^^^^

.. code:: javascript


    {
        "amount": 1716,
        "bank_account": {
            "account_number": "xxxxxx2930",
            "created_at": "2012-09-26T01:05:39.874292Z",
            "credits_uri": "/v1/bank_accounts/BA7ulC6zZsOPV51ezmsgHGCS/credits/",
            "id": "BA7ulC6zZsOPV51ezmsgHGCS",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "fingerprint": "xyz",
            "type": "checking",
            "uri": "/v1/bank_accounts/BA7ulC6zZsOPV51ezmsgHGCS"
        },
        "created_at": "2012-09-26T01:05:39.875901Z",
        "description": null,
        "id": "CR7ul6RkHd0x3gHxKfSn3ivo",
        "status": "pending",
        "trace_number": null,
        "uri": "/v1/credits/CR7ul6RkHd0x3gHxKfSn3ivo"
    }


List all credits
----------------

``limit``
: *optional* **integer**, *default is 10*

``offset``
: *optional* **integer**, *default is 0*

.. code::

    GET /v1/credits


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 200 Ok

Body
^^^^

.. code:: javascript


    {
        "items": [
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:40.694863Z",
                    "credits_uri": "/v1/bank_accounts/BA7vgPFGKKvzhxFx8xcFiwJk/credits/",
                    "id": "BA7vgPFGKKvzhxFx8xcFiwJk",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "fingerprint": "xyz",
                    "type": "checking",
                    "uri": "/v1/bank_accounts/BA7vgPFGKKvzhxFx8xcFiwJk"
                },
                "created_at": "2012-09-26T01:05:40.696339Z",
                "description": null,
                "id": "CR7vglingcQmlsru3ydzKcAO",
                "status": "pending",
                "trace_number": null,
                "uri": "/v1/credits/CR7vglingcQmlsru3ydzKcAO"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:40.706645Z",
                    "credits_uri": "/v1/bank_accounts/BA7vhIcSRabWuw67ZQt34n7Y/credits/",
                    "id": "BA7vhIcSRabWuw67ZQt34n7Y",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "fingerprint": "xyz",
                    "type": "checking",
                    "uri": "/v1/bank_accounts/BA7vhIcSRabWuw67ZQt34n7Y"
                },
                "created_at": "2012-09-26T01:05:40.707124Z",
                "description": null,
                "id": "CR7vhF70LzK8YRfGXraqXuoG",
                "status": "pending",
                "trace_number": null,
                "uri": "/v1/credits/CR7vhF70LzK8YRfGXraqXuoG"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:40.713831Z",
                    "credits_uri": "/v1/bank_accounts/BA7vid5DNb8AX9rD2Jehni0q/credits/",
                    "id": "BA7vid5DNb8AX9rD2Jehni0q",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "fingerprint": "xyz",
                    "type": "checking",
                    "uri": "/v1/bank_accounts/BA7vid5DNb8AX9rD2Jehni0q"
                },
                "created_at": "2012-09-26T01:05:40.714570Z",
                "description": null,
                "id": "CR7viaeJ3HkaQg9cUNjiLW7o",
                "status": "pending",
                "trace_number": null,
                "uri": "/v1/credits/CR7viaeJ3HkaQg9cUNjiLW7o"
            }
        ],
        "limit": 10,
        "offset": 0,
        "total": 3
    }



List all credits for a bank account
-----------------------------------

``limit``
: *optional* **integer**, *default is 10*

``offset``
: *optional* **integer**, *default is 0*

.. code::

    GET /v1/bank_accounts/:bank_account_id/credits


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 200 Ok

Body
^^^^

.. code:: javascript


    {
        "items": [
            {
                "amount": 221970,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:41.115769Z",
                    "credits_uri": "/v1/bank_accounts/BA7vJLojGjlpqpAtrTsZPeVY/credits/",
                    "id": "BA7vJLojGjlpqpAtrTsZPeVY",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "fingerprint": "xyz",
                    "type": "checking",
                    "uri": "/v1/bank_accounts/BA7vJLojGjlpqpAtrTsZPeVY"
                },
                "created_at": "2012-09-26T01:05:41.132034Z",
                "description": null,
                "id": "CR7vLhh8XvtzUuMJBW53DXce",
                "status": "pending",
                "trace_number": null,
                "uri": "/v1/credits/CR7vLhh8XvtzUuMJBW53DXce"
            },
            {
                "amount": 4281906,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:41.115769Z",
                    "credits_uri": "/v1/bank_accounts/BA7vJLojGjlpqpAtrTsZPeVY/credits/",
                    "id": "BA7vJLojGjlpqpAtrTsZPeVY",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "fingerprint": "xyz",
                    "type": "checking",
                    "uri": "/v1/bank_accounts/BA7vJLojGjlpqpAtrTsZPeVY"
                },
                "created_at": "2012-09-26T01:05:41.142644Z",
                "description": null,
                "id": "CR7vM5mxthVqq1HKl3hFT90u",
                "status": "pending",
                "trace_number": null,
                "uri": "/v1/credits/CR7vM5mxthVqq1HKl3hFT90u"
            },
            {
                "amount": 1300,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:41.115769Z",
                    "credits_uri": "/v1/bank_accounts/BA7vJLojGjlpqpAtrTsZPeVY/credits/",
                    "id": "BA7vJLojGjlpqpAtrTsZPeVY",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "fingerprint": "xyz",
                    "type": "checking",
                    "uri": "/v1/bank_accounts/BA7vJLojGjlpqpAtrTsZPeVY"
                },
                "created_at": "2012-09-26T01:05:41.151774Z",
                "description": null,
                "id": "CR7vMIyVhoWcTwAsQRKZdwjU",
                "status": "pending",
                "trace_number": null,
                "uri": "/v1/credits/CR7vMIyVhoWcTwAsQRKZdwjU"
            }
        ],
        "limit": 10,
        "offset": 0,
        "total": 3
    }


List All Credits for a Merchant
-------------------------------

``limit``
: *optional* **integer**, *default is 10*

``offset``
: *optional* **integer**, *default is 0*

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
 

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
                    "bank_code": "325182797",  
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
                    "bank_code": "325182797",  
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