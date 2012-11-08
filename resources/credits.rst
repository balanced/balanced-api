Credits
=======

- `Credit a New Bank Account`_
- `Credit an Existing Bank Account`_
- `Credit a Merchant`_
- `Retrieve a Credit`_
- `List All Credits`_
- `List All Credits for a Bank Account`_
- `List All Credits for a Merchant`_

Fields
------

``id`` 
    **string**.  
 
``uri`` 
    **string**.  
 
``amount`` 
    **integer**. Amount of the credit. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_. 
 
``description`` 
    **string**.  
 
``account`` 
    **object**. `Accounts <./accounts.rst>`_. Present if the credit went to a merchant instead of directly to a bank account. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``bank_account`` 
    **object**. `Bank Account <./bank_accounts.rst>`_. 
 
``status`` 
    **string**. One of ``pending``, ``paid``, ``failed``. 
 

Deprecated
~~~~~~~~~~

``destination`` 
    **object**. The funding destination for this credit (i.e., a bank account). 
 
``state`` 
    **string**. Use ``status`` instead. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``available_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    credit will be available to the merchant. 
 
``fee`` 
    **integer**. The fee charged by Balanced for this credit. 
 

Credit a New Bank Account
-------------------------

.. code:: 
 
    POST /v1/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. You must have ``amount`` funds transferred to cover the 
    credit. 
 
``bank_account`` 
    *required* **object**. `BankAccount <./bank_accounts.rst>`_. 
 
``description`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 1234,  
        "description": "Something descriptive",  
        "bank_account": { 
            "account_number": "12341234",  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "type": "checking" 
        } 
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
        "amount": 1234,  
        "bank_account": { 
            "account_number": "xxxx1234",  
            "bank_name": "Banko De Ismus",  
            "fingerprint": "brown",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking" 
        },  
        "created_at": "2012-11-07T15:26:27.826671Z",  
        "description": "Something descriptive",  
        "id": "CR4jwM2ct3yTl31sMdwCV7hO",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR4jwM2ct3yTl31sMdwCV7hO" 
    } 
 

Credit an Existing Bank Account
-------------------------------

.. code:: 
 
    POST /v1/bank_accounts/:bank_account_id/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. You must have ``amount`` funds transferred to cover the 
    credit. 
 
``description`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 1234,  
        "description": "A description" 
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
        "amount": 1234,  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T15:26:30.002468Z",  
            "credits_uri": "/v1/bank_accounts/BA4lYtCgWhyPmkKLUUPAIKNK/credits",  
            "fingerprint": "12341234",  
            "id": "BA4lYtCgWhyPmkKLUUPAIKNK",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA4lYtCgWhyPmkKLUUPAIKNK" 
        },  
        "created_at": "2012-11-07T15:26:30.038007Z",  
        "description": "A description",  
        "id": "CR4m0ZoLjyjjik5sd3Nf7EUY",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR4m0ZoLjyjjik5sd3Nf7EUY" 
    } 
 

Credit a Merchant
-----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
    POST /v1/marketplaces/:marketplace_id/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. Must be **>=** your minimum credit amount but **<=** your maximum credit amount. 
 
``description`` 
    *optional* **string** or **null**.  
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``appears_on_statement_as`` 
    *optional* **string**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``destination_uri`` 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/cards",  
            "created_at": "2012-11-07T15:26:32.151246Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/holds",  
            "id": "AC4oomyullWYu808BgYHTlcg",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg" 
        },  
        "amount": 1234,  
        "available_at": "2012-11-07T23:26:32.239085Z",  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "bank_code": "325182797",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T15:26:32.156251Z",  
            "credits_uri": "/v1/bank_accounts/BA4oozz3Nt53FL6N7hZ6XTYU/credits",  
            "fingerprint": "12341234",  
            "id": "BA4oozz3Nt53FL6N7hZ6XTYU",  
            "is_valid": true,  
            "last_four": "1234",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/bank_accounts/BA4oozz3Nt53FL6N7hZ6XTYU" 
        },  
        "created_at": "2012-11-07T15:26:32.248023Z",  
        "description": null,  
        "destination": { 
            "account_number": "xxxxx1234",  
            "bank_code": "325182797",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T15:26:32.156251Z",  
            "credits_uri": "/v1/bank_accounts/BA4oozz3Nt53FL6N7hZ6XTYU/credits",  
            "fingerprint": "12341234",  
            "id": "BA4oozz3Nt53FL6N7hZ6XTYU",  
            "is_valid": true,  
            "last_four": "1234",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/accounts/AC4oomyullWYu808BgYHTlcg/bank_accounts/BA4oozz3Nt53FL6N7hZ6XTYU" 
        },  
        "fee": 25,  
        "id": "CR4ov3zYMyuQwSVCeuBDhnO4",  
        "meta": {},  
        "state": "cleared",  
        "status": "paid",  
        "transaction_number": "CR931-958-3911",  
        "uri": "/v1/marketplaces/TEST-MP4oiYLIqqOxZC7hLGPwEMBK/credits/CR4ov3zYMyuQwSVCeuBDhnO4" 
    } 
 

Retrieve a Credit
-----------------

.. code:: 
 
    GET /v1/credits/:credit_id 
 

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
        "amount": 1254,  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T15:26:33.257724Z",  
            "credits_uri": "/v1/bank_accounts/BA4pDoDXLELhkYIyqZ6A2my0/credits",  
            "fingerprint": "12341234",  
            "id": "BA4pDoDXLELhkYIyqZ6A2my0",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA4pDoDXLELhkYIyqZ6A2my0" 
        },  
        "created_at": "2012-11-07T15:26:33.322461Z",  
        "description": "hiya",  
        "id": "CR4pHW3xzdqZHBXolS8nUayM",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR4pHW3xzdqZHBXolS8nUayM" 
    } 
 

List All Credits
----------------

.. code:: 
 
    GET /v1/credits 
 

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.

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
        "items": [ 
            { 
                "amount": 1254,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:34.342758Z",  
                    "credits_uri": "/v1/bank_accounts/BA4qR4hhUV1LXXTTIwE3WnqY/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4qR4hhUV1LXXTTIwE3WnqY",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA4qR4hhUV1LXXTTIwE3WnqY" 
                },  
                "created_at": "2012-11-07T15:26:34.416206Z",  
                "description": "hiya",  
                "id": "CR4qWeQm2jqEhhgbSSmaBIP2",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR4qWeQm2jqEhhgbSSmaBIP2" 
            },  
            { 
                "amount": 431,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:34.342758Z",  
                    "credits_uri": "/v1/bank_accounts/BA4qR4hhUV1LXXTTIwE3WnqY/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4qR4hhUV1LXXTTIwE3WnqY",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA4qR4hhUV1LXXTTIwE3WnqY" 
                },  
                "created_at": "2012-11-07T15:26:34.428438Z",  
                "description": "hiya",  
                "id": "CR4qX9odLZwNjfivGyfKqpG4",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR4qX9odLZwNjfivGyfKqpG4" 
            } 
        ],  
        "limit": 10,  
        "offset": 0,  
        "total": 2 
    } 
 

List All Credits for a Bank Account
-----------------------------------

.. code:: 
 
    GET /v1/bank_accounts/:bank_account_id/credits 
 

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.
   
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
        "items": [ 
            { 
                "amount": 1254,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:35.478177Z",  
                    "credits_uri": "/v1/bank_accounts/BA4s8iQFbVMmJoKQskgr7oa0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4s8iQFbVMmJoKQskgr7oa0",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA4s8iQFbVMmJoKQskgr7oa0" 
                },  
                "created_at": "2012-11-07T15:26:35.487242Z",  
                "description": "A description",  
                "id": "CR4s8WBGdenqWzdaQpjNkvis",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR4s8WBGdenqWzdaQpjNkvis" 
            },  
            { 
                "amount": 431,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:35.478177Z",  
                    "credits_uri": "/v1/bank_accounts/BA4s8iQFbVMmJoKQskgr7oa0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4s8iQFbVMmJoKQskgr7oa0",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA4s8iQFbVMmJoKQskgr7oa0" 
                },  
                "created_at": "2012-11-07T15:26:35.495687Z",  
                "description": "Another description",  
                "id": "CR4s9zxuWRngPTEu04AS2I7i",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR4s9zxuWRngPTEu04AS2I7i" 
            },  
            { 
                "amount": 5452,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:35.478177Z",  
                    "credits_uri": "/v1/bank_accounts/BA4s8iQFbVMmJoKQskgr7oa0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4s8iQFbVMmJoKQskgr7oa0",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA4s8iQFbVMmJoKQskgr7oa0" 
                },  
                "created_at": "2012-11-07T15:26:35.502146Z",  
                "description": "Yet another description",  
                "id": "CR4sa1NuEjs5ZLIdKoAbpRNG",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR4sa1NuEjs5ZLIdKoAbpRNG" 
            } 
        ],  
        "limit": 10,  
        "offset": 0,  
        "total": 3 
    } 
 

List All Credits for a Merchant
-------------------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
    GET /v1/marketplaces/:marketplace_id/credits 
 

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.

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
        "first_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/cards",  
                    "created_at": "2012-11-07T15:26:36.511840Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/holds",  
                    "id": "AC4tirNARR4cBgKsRI787c4Q",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q" 
                },  
                "amount": 1254,  
                "available_at": "2012-11-07T23:26:36.555969Z",  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:36.515134Z",  
                    "credits_uri": "/v1/bank_accounts/BA4tiBnRQc1nEE7FdWkAUBE0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4tiBnRQc1nEE7FdWkAUBE0",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/bank_accounts/BA4tiBnRQc1nEE7FdWkAUBE0" 
                },  
                "created_at": "2012-11-07T15:26:36.569851Z",  
                "description": "hiya",  
                "destination": { 
                    "account_number": "xxxxx1234",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:36.515134Z",  
                    "credits_uri": "/v1/bank_accounts/BA4tiBnRQc1nEE7FdWkAUBE0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4tiBnRQc1nEE7FdWkAUBE0",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/bank_accounts/BA4tiBnRQc1nEE7FdWkAUBE0" 
                },  
                "fee": 25,  
                "id": "CR4tmoFAoShdqiYDSnr7QIPa",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR387-832-3551",  
                "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/credits/CR4tmoFAoShdqiYDSnr7QIPa" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/cards",  
                    "created_at": "2012-11-07T15:26:36.511840Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/holds",  
                    "id": "AC4tirNARR4cBgKsRI787c4Q",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q" 
                },  
                "amount": 431,  
                "available_at": "2012-11-07T23:26:36.561017Z",  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:36.515134Z",  
                    "credits_uri": "/v1/bank_accounts/BA4tiBnRQc1nEE7FdWkAUBE0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4tiBnRQc1nEE7FdWkAUBE0",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/bank_accounts/BA4tiBnRQc1nEE7FdWkAUBE0" 
                },  
                "created_at": "2012-11-07T15:26:36.583851Z",  
                "description": "hiya",  
                "destination": { 
                    "account_number": "xxxxx1234",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T15:26:36.515134Z",  
                    "credits_uri": "/v1/bank_accounts/BA4tiBnRQc1nEE7FdWkAUBE0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA4tiBnRQc1nEE7FdWkAUBE0",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/accounts/AC4tirNARR4cBgKsRI787c4Q/bank_accounts/BA4tiBnRQc1nEE7FdWkAUBE0" 
                },  
                "fee": 25,  
                "id": "CR4tnrzRQLTWo0k3laQdKEw4",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR632-955-9386",  
                "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/credits/CR4tnrzRQLTWo0k3laQdKEw4" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/credits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP4te2YDBvMfhuL6EjYD0DB2/credits?limit=10&offset=0" 
    } 
 

