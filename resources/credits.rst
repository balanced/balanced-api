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
            "created_at": "2012-11-07T14:48:29.318280Z",  
            "fingerprint": "brown",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking" 
        },  
        "created_at": "2012-11-07T14:48:29.329368Z",  
        "description": "Something descriptive",  
        "id": "CR1WaOu9SIREfSfut638JHg0",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR1WaOu9SIREfSfut638JHg0" 
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
            "created_at": "2012-11-07T14:48:31.561153Z",  
            "credits_uri": "/v1/bank_accounts/BA1YGrA3qzbewUXD6js36J5q/credits",  
            "fingerprint": "12341234",  
            "id": "BA1YGrA3qzbewUXD6js36J5q",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA1YGrA3qzbewUXD6js36J5q" 
        },  
        "created_at": "2012-11-07T14:48:31.608510Z",  
        "description": "A description",  
        "id": "CR1YJK0ptidDNoUjBLzkB6C0",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR1YJK0ptidDNoUjBLzkB6C0" 
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
        "amount": 1234,  
        "bank_account": { 
            "account_number": "xxxx1234",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T14:48:33.853359Z",  
            "fingerprint": "brown",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking" 
        },  
        "created_at": "2012-11-07T14:48:33.864467Z",  
        "description": "Something descriptive",  
        "id": "CR21h3uItngyPlKJptICUf8U",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR21h3uItngyPlKJptICUf8U" 
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
            "created_at": "2012-11-07T14:48:34.856040Z",  
            "credits_uri": "/v1/bank_accounts/BA22o55M7cgmY1ptrvX9It7e/credits",  
            "fingerprint": "12341234",  
            "id": "BA22o55M7cgmY1ptrvX9It7e",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA22o55M7cgmY1ptrvX9It7e" 
        },  
        "created_at": "2012-11-07T14:48:34.905613Z",  
        "description": "hiya",  
        "id": "CR22rCBmScQg2XkFefuKgwTi",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR22rCBmScQg2XkFefuKgwTi" 
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
                    "created_at": "2012-11-07T14:48:35.914859Z",  
                    "credits_uri": "/v1/bank_accounts/BA23zO1APOPrUart6ygraLaY/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA23zO1APOPrUart6ygraLaY",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA23zO1APOPrUart6ygraLaY" 
                },  
                "created_at": "2012-11-07T14:48:35.989449Z",  
                "description": "hiya",  
                "id": "CR23F9yI6ksr1p5wNYthigrq",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR23F9yI6ksr1p5wNYthigrq" 
            },  
            { 
                "amount": 431,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T14:48:35.914859Z",  
                    "credits_uri": "/v1/bank_accounts/BA23zO1APOPrUart6ygraLaY/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA23zO1APOPrUart6ygraLaY",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA23zO1APOPrUart6ygraLaY" 
                },  
                "created_at": "2012-11-07T14:48:36.006145Z",  
                "description": "hiya",  
                "id": "CR23GppOkNkfKhHUaJ2S7ZWs",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR23GppOkNkfKhHUaJ2S7ZWs" 
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
                    "created_at": "2012-11-07T14:48:37.123161Z",  
                    "credits_uri": "/v1/bank_accounts/BA24Wjgg3eSctwXOwdj3ZEuU/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA24Wjgg3eSctwXOwdj3ZEuU",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA24Wjgg3eSctwXOwdj3ZEuU" 
                },  
                "created_at": "2012-11-07T14:48:37.134163Z",  
                "description": "A description",  
                "id": "CR24X40Z5yYCZrl9hJxMOCri",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR24X40Z5yYCZrl9hJxMOCri" 
            },  
            { 
                "amount": 431,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T14:48:37.123161Z",  
                    "credits_uri": "/v1/bank_accounts/BA24Wjgg3eSctwXOwdj3ZEuU/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA24Wjgg3eSctwXOwdj3ZEuU",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA24Wjgg3eSctwXOwdj3ZEuU" 
                },  
                "created_at": "2012-11-07T14:48:37.145720Z",  
                "description": "Another description",  
                "id": "CR24XS7bsx7g5B5LHOMqAClm",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR24XS7bsx7g5B5LHOMqAClm" 
            },  
            { 
                "amount": 5452,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T14:48:37.123161Z",  
                    "credits_uri": "/v1/bank_accounts/BA24Wjgg3eSctwXOwdj3ZEuU/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA24Wjgg3eSctwXOwdj3ZEuU",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA24Wjgg3eSctwXOwdj3ZEuU" 
                },  
                "created_at": "2012-11-07T14:48:37.154666Z",  
                "description": "Yet another description",  
                "id": "CR24YuS0NV13eta8uAx4aTiY",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR24YuS0NV13eta8uAx4aTiY" 
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
        "first_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/cards",  
                    "created_at": "2012-11-07T14:48:38.256168Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/holds",  
                    "id": "AC26dkNZoyeZVGkZVFgddVpG",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG" 
                },  
                "amount": 1254,  
                "available_at": "2012-11-07T22:48:38.319982Z",  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T14:48:38.262604Z",  
                    "credits_uri": "/v1/bank_accounts/BA26dvZI7ScqMXiUyxaaLpQw/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA26dvZI7ScqMXiUyxaaLpQw",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/bank_accounts/BA26dvZI7ScqMXiUyxaaLpQw" 
                },  
                "created_at": "2012-11-07T14:48:38.336971Z",  
                "description": "hiya",  
                "destination": { 
                    "account_number": "xxxxx1234",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T14:48:38.262604Z",  
                    "credits_uri": "/v1/bank_accounts/BA26dvZI7ScqMXiUyxaaLpQw/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA26dvZI7ScqMXiUyxaaLpQw",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/bank_accounts/BA26dvZI7ScqMXiUyxaaLpQw" 
                },  
                "fee": 25,  
                "id": "CR26iQRy1n4wdfMpvha3kAni",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR878-636-4734",  
                "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/credits/CR26iQRy1n4wdfMpvha3kAni" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/cards",  
                    "created_at": "2012-11-07T14:48:38.256168Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/holds",  
                    "id": "AC26dkNZoyeZVGkZVFgddVpG",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG" 
                },  
                "amount": 431,  
                "available_at": "2012-11-07T22:48:38.326329Z",  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T14:48:38.262604Z",  
                    "credits_uri": "/v1/bank_accounts/BA26dvZI7ScqMXiUyxaaLpQw/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA26dvZI7ScqMXiUyxaaLpQw",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/bank_accounts/BA26dvZI7ScqMXiUyxaaLpQw" 
                },  
                "created_at": "2012-11-07T14:48:38.353502Z",  
                "description": "hiya",  
                "destination": { 
                    "account_number": "xxxxx1234",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T14:48:38.262604Z",  
                    "credits_uri": "/v1/bank_accounts/BA26dvZI7ScqMXiUyxaaLpQw/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA26dvZI7ScqMXiUyxaaLpQw",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/accounts/AC26dkNZoyeZVGkZVFgddVpG/bank_accounts/BA26dvZI7ScqMXiUyxaaLpQw" 
                },  
                "fee": 25,  
                "id": "CR26k5Mdft83ihQvSMgPGeG0",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR970-572-6319",  
                "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/credits/CR26k5Mdft83ihQvSMgPGeG0" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/credits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP268sVbf45CMDVu5ZivJ0hu/credits?limit=10&offset=0" 
    } 
 

