Bank Accounts
=============

- `Create a Bank Account`_
- `Retrieve a Bank Account`_
- `List All Bank Accounts`_
- `List All Bank Accounts for an Account`_
- `Associate a Bank Account with an Account`_
- `Delete a Bank Account`_

Fields
------

``id`` 
    **string**.  
 
``account_number`` 
    **string**.  
 
``name`` 
    **string**. Name of the account holder. 
 
``routing_number`` 
    **string**. Meets `MICR <http://en.wikipedia.org/wiki/Routing_transit_number#MICR_Routing_number_format>`_ 
    routing number format. Specified in FedACH database defined by the 
    `US Federal Reserve <http://www.fedwiredirectory.frb.org/>`_. 
 
``bank_name`` 
    **string**. The name of the bank. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    bank account was tokenized. 
 
``type`` 
    **string**. ``checking`` or ``savings``. 
 
``fingerprint`` 
    **string**. Uniquely identifies the bank account (``account_number`` and 
    ``routing_number``). 
 
``uri`` 
    **string**.  
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``credits_uri`` 
    **string**.  
 

Deprecated
~~~~~~~~~~

``last_four`` 
    **string**. Last four digits are now returned in the ``acount_number``. 
 
``bank_code`` 
    **string**. Use ``routing_number`` instead. 
 
``is_valid`` 
    **boolean**. Use `Delete a Bank Account`_ instead. 
 

Create a Bank Account
---------------------

.. code:: 
 
    POST /v1/bank_accounts 
 

Request
~~~~~~~

``name`` 
    *required* **string**. Name on the bank account. Length must be **>=** ``2``. 
 
``account_number`` 
    *required* **string**. Bank account number. Length must be **>=** ``1``. 
 
``routing_number`` 
    *required* **string**. Bank account code. This is commonly referred to as the routing number in 
    the ``USA``. Length must be **=** ``9``. 
 
 
``type`` 
    *required* **string**. ``checking`` or ``savings``. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "account_number": "12341234",  
        "name": "Fit Finlay",  
        "bank_code": "325182797",  
        "type": "checking" 
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
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-11-07T11:54:59.174893Z",  
        "credits_uri": "/v1/bank_accounts/BA5bMvOizkPmICnVzGs3V76/credits",  
        "fingerprint": "brown",  
        "id": "BA5bMvOizkPmICnVzGs3V76",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA5bMvOizkPmICnVzGs3V76" 
    } 
 

Retrieve a Bank Account
-----------------------

.. code:: 
 
    GET /v1/bank_accounts/:bank_account_id 
 

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
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-11-07T11:55:00.220035Z",  
        "credits_uri": "/v1/bank_accounts/BA6mJ5sdSNdYVfkm0v0KP3e/credits",  
        "fingerprint": "12341234",  
        "id": "BA6mJ5sdSNdYVfkm0v0KP3e",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA6mJ5sdSNdYVfkm0v0KP3e" 
    } 
 

List All Bank Accounts
----------------------

.. code:: 
 
    GET /v1/bank_accounts 
 

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
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T11:55:01.179937Z",  
                "credits_uri": "/v1/bank_accounts/BA7rzbsAVJnCYrnasLuOYEQ/credits",  
                "fingerprint": "12341234",  
                "id": "BA7rzbsAVJnCYrnasLuOYEQ",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA7rzbsAVJnCYrnasLuOYEQ" 
            },  
            { 
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T11:55:01.214404Z",  
                "credits_uri": "/v1/bank_accounts/BA7u03aPJWPpVR1jIWXTuvi/credits",  
                "fingerprint": "12341234",  
                "id": "BA7u03aPJWPpVR1jIWXTuvi",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA7u03aPJWPpVR1jIWXTuvi" 
            },  
            { 
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T11:55:01.281618Z",  
                "credits_uri": "/v1/bank_accounts/BA7yIpc42t5p9ATVWxPrpYw/credits",  
                "fingerprint": "12341234",  
                "id": "BA7yIpc42t5p9ATVWxPrpYw",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA7yIpc42t5p9ATVWxPrpYw" 
            },  
            { 
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T11:55:01.282273Z",  
                "credits_uri": "/v1/bank_accounts/BA7yJ8e6B6YwxB9iGAH8vGI/credits",  
                "fingerprint": "12341234",  
                "id": "BA7yJ8e6B6YwxB9iGAH8vGI",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA7yJ8e6B6YwxB9iGAH8vGI" 
            } 
        ],  
        "limit": 10,  
        "offset": 0,  
        "total": 4 
    } 
 

List All Bank Accounts for an Account
-------------------------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/bank_accounts 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/cards",  
                    "created_at": "2012-11-07T11:55:02.305291Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/holds",  
                    "id": "AC8I8ugInh42TkM4yJE4LlO",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO" 
                },  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T11:55:02.308948Z",  
                "credits_uri": "/v1/bank_accounts/BA8IjUcgH5G1if4JO1oigtK/credits",  
                "fingerprint": "12341234",  
                "id": "BA8IjUcgH5G1if4JO1oigtK",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts/BA8IjUcgH5G1if4JO1oigtK" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/cards",  
                    "created_at": "2012-11-07T11:55:02.305291Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/holds",  
                    "id": "AC8I8ugInh42TkM4yJE4LlO",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO" 
                },  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T11:55:02.368486Z",  
                "credits_uri": "/v1/bank_accounts/BA8MxaUMr6fV6goDXev0MFC/credits",  
                "fingerprint": "12341234",  
                "id": "BA8MxaUMr6fV6goDXev0MFC",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts/BA8MxaUMr6fV6goDXev0MFC" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/cards",  
                    "created_at": "2012-11-07T11:55:02.305291Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/holds",  
                    "id": "AC8I8ugInh42TkM4yJE4LlO",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO" 
                },  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T11:55:02.368879Z",  
                "credits_uri": "/v1/bank_accounts/BA8MxEFwpDfNNNM59WsQvpq/credits",  
                "fingerprint": "12341234",  
                "id": "BA8MxEFwpDfNNNM59WsQvpq",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts/BA8MxEFwpDfNNNM59WsQvpq" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP8C63NrkCh7Oh0tHUchLp2/accounts/AC8I8ugInh42TkM4yJE4LlO/bank_accounts?limit=10&offset=0" 
    } 
 

Associate a Bank Account with an Account
----------------------------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/bank_accounts/:bank_account_id 
 

Request
~~~~~~~

``account_uri`` 
    *optional* **string**. URI of an account with which to associate the bank account. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "account_uri": "/v1/marketplaces/TEST-MP9VB9amGUTJlKK63y15jHC/accounts/ACa0zOybMYabyFm9XgpHrdW" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy/cards",  
            "created_at": "2012-11-07T11:55:04.572006Z",  
            "credits_uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy/holds",  
            "id": "ACbgcD8vFt4od5YoGPNjcPy",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy/transactions",  
            "uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy" 
        },  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-11-07T11:55:04.632312Z",  
        "credits_uri": "/v1/bank_accounts/BAbkmM3gYaLL7q9K4sda1Cc/credits",  
        "fingerprint": "12341234",  
        "id": "BAbkmM3gYaLL7q9K4sda1Cc",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MPbal1BkgSQeORSh2TAUOoc/accounts/ACbgcD8vFt4od5YoGPNjcPy/bank_accounts/BAbkmM3gYaLL7q9K4sda1Cc" 
    } 
 

Delete a Bank Account
---------------------

.. code:: 
 
    DELETE /v1/bank_accounts/:bank_account_id 
 

Response 
~~~~~~~~ 
 
Headers 
^^^^^^^ 
 
.. code::  
 
    Status: 204 NO CONTENT 
 

