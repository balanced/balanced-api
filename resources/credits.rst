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
    **object**. Present if the credit went to a merchant instead of directly to a 
    bank account. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``bank_account`` 
    **object**.  
 
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
    *required* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 
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
        "account": null,  
        "amount": 1234,  
        "bank_account": { 
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T11:23:42.075554Z",  
            "credits_uri": "/v1/bank_accounts/BA4ZiuCAiW6jS9WkyDi793LK/credits",  
            "fingerprint": "brown",  
            "id": "BA4ZiuCAiW6jS9WkyDi793LK",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA4ZiuCAiW6jS9WkyDi793LK" 
        },  
        "created_at": "2012-11-07T11:23:42.083878Z",  
        "description": "Something descriptive",  
        "id": "CR4Zj51AKNxkriL8lzmZOsNS",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR4Zj51AKNxkriL8lzmZOsNS" 
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
        "account": null,  
        "amount": 1234,  
        "bank_account": { 
            "bank_name": null,  
            "created_at": "2012-11-07T11:23:44.426812Z",  
            "credits_uri": "/v1/bank_accounts/BA51WsGVQnoQesyUYC9g9Cn2/credits",  
            "fingerprint": "12341234",  
            "id": "BA51WsGVQnoQesyUYC9g9Cn2",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA51WsGVQnoQesyUYC9g9Cn2" 
        },  
        "created_at": "2012-11-07T11:23:44.463261Z",  
        "description": "A description",  
        "id": "CR51Z0DrRJPhp3nRtPiosrly",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR51Z0DrRJPhp3nRtPiosrly" 
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
    *optional* **string**.  
 
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
        "account": null,  
        "amount": 1234,  
        "bank_account": { 
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T11:23:46.775872Z",  
            "credits_uri": "/v1/bank_accounts/BA54Ag9KfYNclw3qhVXy25jC/credits",  
            "fingerprint": "brown",  
            "id": "BA54Ag9KfYNclw3qhVXy25jC",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA54Ag9KfYNclw3qhVXy25jC" 
        },  
        "created_at": "2012-11-07T11:23:46.783476Z",  
        "description": "Something descriptive",  
        "id": "CR54ANSi7OnYusxnHHgc0s3q",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR54ANSi7OnYusxnHHgc0s3q" 
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
        "account": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP55MaCJfCnWA29IyewY0ewc/accounts/AC55QFNISlNVGWGfe7zxWluc/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP55MaCJfCnWA29IyewY0ewc/accounts/AC55QFNISlNVGWGfe7zxWluc/cards",  
            "created_at": "2012-11-07T11:23:47.899849Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP55MaCJfCnWA29IyewY0ewc/accounts/AC55QFNISlNVGWGfe7zxWluc/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP55MaCJfCnWA29IyewY0ewc/accounts/AC55QFNISlNVGWGfe7zxWluc/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP55MaCJfCnWA29IyewY0ewc/accounts/AC55QFNISlNVGWGfe7zxWluc/holds",  
            "id": "AC55QFNISlNVGWGfe7zxWluc",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP55MaCJfCnWA29IyewY0ewc/accounts/AC55QFNISlNVGWGfe7zxWluc/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP55MaCJfCnWA29IyewY0ewc/accounts/AC55QFNISlNVGWGfe7zxWluc/transactions",  
            "uri": "/v1/marketplaces/TEST-MP55MaCJfCnWA29IyewY0ewc/accounts/AC55QFNISlNVGWGfe7zxWluc" 
        },  
        "amount": 1254,  
        "bank_account": { 
            "bank_name": null,  
            "created_at": "2012-11-07T11:23:47.902769Z",  
            "credits_uri": "/v1/bank_accounts/BA55QNUk3c5Lkdge17LBzxd2/credits",  
            "fingerprint": "12341234",  
            "id": "BA55QNUk3c5Lkdge17LBzxd2",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA55QNUk3c5Lkdge17LBzxd2" 
        },  
        "created_at": "2012-11-07T11:23:47.958924Z",  
        "description": "hiya",  
        "id": "CR55UIO5bypEfLLrBuooq6ag",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR55UIO5bypEfLLrBuooq6ag" 
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
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/cards",  
                    "created_at": "2012-11-07T11:23:49.146075Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/holds",  
                    "id": "AC57fyVGg0tJ5rRtcdi1oUNS",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS" 
                },  
                "amount": 1254,  
                "bank_account": { 
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:49.150875Z",  
                    "credits_uri": "/v1/bank_accounts/BA57fLtzrJkwvVXeabxzP780/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA57fLtzrJkwvVXeabxzP780",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA57fLtzrJkwvVXeabxzP780" 
                },  
                "created_at": "2012-11-07T11:23:49.232567Z",  
                "description": "hiya",  
                "id": "CR57lt9EJusgHHsBBGbh3fuI",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR57lt9EJusgHHsBBGbh3fuI" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/cards",  
                    "created_at": "2012-11-07T11:23:49.146075Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/holds",  
                    "id": "AC57fyVGg0tJ5rRtcdi1oUNS",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP579t4UvbE2274frzFDkLDC/accounts/AC57fyVGg0tJ5rRtcdi1oUNS" 
                },  
                "amount": 431,  
                "bank_account": { 
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:49.150875Z",  
                    "credits_uri": "/v1/bank_accounts/BA57fLtzrJkwvVXeabxzP780/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA57fLtzrJkwvVXeabxzP780",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA57fLtzrJkwvVXeabxzP780" 
                },  
                "created_at": "2012-11-07T11:23:49.249487Z",  
                "description": "hiya",  
                "id": "CR57mKxUOBjuKfzLGqCTTCKg",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR57mKxUOBjuKfzLGqCTTCKg" 
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
                "account": null,  
                "amount": 1254,  
                "bank_account": { 
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:50.546778Z",  
                    "credits_uri": "/v1/bank_accounts/BA58PeAXzR3iLpSoyXrET748/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA58PeAXzR3iLpSoyXrET748",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA58PeAXzR3iLpSoyXrET748" 
                },  
                "created_at": "2012-11-07T11:23:50.557106Z",  
                "description": "A description",  
                "id": "CR58PTX9JK5HfANjKocexXZW",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR58PTX9JK5HfANjKocexXZW" 
            },  
            { 
                "account": null,  
                "amount": 431,  
                "bank_account": { 
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:50.546778Z",  
                    "credits_uri": "/v1/bank_accounts/BA58PeAXzR3iLpSoyXrET748/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA58PeAXzR3iLpSoyXrET748",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA58PeAXzR3iLpSoyXrET748" 
                },  
                "created_at": "2012-11-07T11:23:50.567243Z",  
                "description": "Another description",  
                "id": "CR58QDY2SjRs3rM2JiqfMP1a",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR58QDY2SjRs3rM2JiqfMP1a" 
            },  
            { 
                "account": null,  
                "amount": 5452,  
                "bank_account": { 
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:50.546778Z",  
                    "credits_uri": "/v1/bank_accounts/BA58PeAXzR3iLpSoyXrET748/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA58PeAXzR3iLpSoyXrET748",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA58PeAXzR3iLpSoyXrET748" 
                },  
                "created_at": "2012-11-07T11:23:50.575386Z",  
                "description": "Yet another description",  
                "id": "CR58RdotmDYKJCZBKF85Bqio",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR58RdotmDYKJCZBKF85Bqio" 
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
        "first_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/cards",  
                    "created_at": "2012-11-07T11:23:51.892830Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/holds",  
                    "id": "AC5al7h14mf4gWlBGuAhg8PW",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW" 
                },  
                "amount": 1254,  
                "available_at": "2012-11-07T19:23:51.937303Z",  
                "bank_account": { 
                    "bank_code": "325182797",  
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:51.895729Z",  
                    "credits_uri": "/v1/bank_accounts/BA5alf0yZ856hJFdQxMls6z2/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA5alf0yZ856hJFdQxMls6z2",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/bank_accounts/BA5alf0yZ856hJFdQxMls6z2" 
                },  
                "created_at": "2012-11-07T11:23:51.949807Z",  
                "description": "hiya",  
                "destination": { 
                    "bank_code": "325182797",  
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:51.895729Z",  
                    "credits_uri": "/v1/bank_accounts/BA5alf0yZ856hJFdQxMls6z2/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA5alf0yZ856hJFdQxMls6z2",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/bank_accounts/BA5alf0yZ856hJFdQxMls6z2" 
                },  
                "fee": 25,  
                "id": "CR5ap19fqP32tKOgj5XX0agI",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR066-961-8430",  
                "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/credits/CR5ap19fqP32tKOgj5XX0agI" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/cards",  
                    "created_at": "2012-11-07T11:23:51.892830Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/holds",  
                    "id": "AC5al7h14mf4gWlBGuAhg8PW",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW" 
                },  
                "amount": 431,  
                "available_at": "2012-11-07T19:23:51.942136Z",  
                "bank_account": { 
                    "bank_code": "325182797",  
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:51.895729Z",  
                    "credits_uri": "/v1/bank_accounts/BA5alf0yZ856hJFdQxMls6z2/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA5alf0yZ856hJFdQxMls6z2",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/bank_accounts/BA5alf0yZ856hJFdQxMls6z2" 
                },  
                "created_at": "2012-11-07T11:23:51.961977Z",  
                "description": "hiya",  
                "destination": { 
                    "bank_code": "325182797",  
                    "bank_name": null,  
                    "created_at": "2012-11-07T11:23:51.895729Z",  
                    "credits_uri": "/v1/bank_accounts/BA5alf0yZ856hJFdQxMls6z2/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA5alf0yZ856hJFdQxMls6z2",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/accounts/AC5al7h14mf4gWlBGuAhg8PW/bank_accounts/BA5alf0yZ856hJFdQxMls6z2" 
                },  
                "fee": 25,  
                "id": "CR5apUTNdBurU6Kpbo0cokio",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR747-480-0659",  
                "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/credits/CR5apUTNdBurU6Kpbo0cokio" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/credits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP5afPK7gIhkn6Z9rJBL3k8c/credits?limit=10&offset=0" 
    } 
 

