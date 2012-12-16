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
 
``type`` 
    **string**. ``checking`` or ``savings``. 
 
``fingerprint`` 
    **string**. Uniquely identifies the bank account (``account_number`` and 
    ``routing_number``). 
 
``id`` 
    **string**.  
 
``uri`` 
    **string**.  
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``credits_uri`` 
    **string**.  
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    bank account was tokenized. 
 

Deprecated
~~~~~~~~~~

``last_four`` 
    **string**. Last four digits are now returned in the ``account_number``. 
 
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
 
``bank_code`` 
    *required* **string**. Bank account code. Length must be **=** ``9``. 
 
``routing_number`` 
    *required* **string**. Bank account code. Length must be **=** ``9``. 
 
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
        "account_number": "xxxx1234",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-12-15T19:43:48.972832Z",  
        "credits_uri": "/v1/bank_accounts/BA6f2MZmTIJwG48JLNnm4h7A/credits",  
        "fingerprint": "brown",  
        "id": "BA6f2MZmTIJwG48JLNnm4h7A",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA6f2MZmTIJwG48JLNnm4h7A" 
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
        "account_number": "xxxxx1234",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-12-15T19:43:50.271286Z",  
        "credits_uri": "/v1/bank_accounts/BA6gvlUtWqUNnJvsr943PUam/credits",  
        "fingerprint": "12341234",  
        "id": "BA6gvlUtWqUNnJvsr943PUam",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA6gvlUtWqUNnJvsr943PUam" 
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
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T19:43:51.607217Z",  
                "credits_uri": "/v1/bank_accounts/BA6i0t5ciIqYecqqzIKGSnKa/credits",  
                "fingerprint": "12341234",  
                "id": "BA6i0t5ciIqYecqqzIKGSnKa",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6i0t5ciIqYecqqzIKGSnKa" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T19:43:51.606993Z",  
                "credits_uri": "/v1/bank_accounts/BA6i0sOSbAwF1rOI0iB4CW5I/credits",  
                "fingerprint": "12341234",  
                "id": "BA6i0sOSbAwF1rOI0iB4CW5I",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6i0sOSbAwF1rOI0iB4CW5I" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T19:43:51.571190Z",  
                "credits_uri": "/v1/bank_accounts/BA6hXYXIIHnGs8esEUHmAfJU/credits",  
                "fingerprint": "12341234",  
                "id": "BA6hXYXIIHnGs8esEUHmAfJU",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6hXYXIIHnGs8esEUHmAfJU" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T19:43:51.553888Z",  
                "credits_uri": "/v1/bank_accounts/BA6hWHRot5OkNFrv03hdwxGq/credits",  
                "fingerprint": "12341234",  
                "id": "BA6hWHRot5OkNFrv03hdwxGq",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6hWHRot5OkNFrv03hdwxGq" 
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
        "first_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/cards",  
                    "created_at": "2012-12-15T19:43:52.911123Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/holds",  
                    "id": "AC6jtsZwDrwyhS2aAdbni2H8",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T19:43:52.913685Z",  
                "credits_uri": "/v1/bank_accounts/BA6jtyBHr2RCds98fyfLs8EW/credits",  
                "fingerprint": "12341234",  
                "id": "BA6jtyBHr2RCds98fyfLs8EW",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts/BA6jtyBHr2RCds98fyfLs8EW" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/cards",  
                    "created_at": "2012-12-15T19:43:52.911123Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/holds",  
                    "id": "AC6jtsZwDrwyhS2aAdbni2H8",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T19:43:52.951692Z",  
                "credits_uri": "/v1/bank_accounts/BA6jwdzlywYVNG8xBSPw0WYG/credits",  
                "fingerprint": "12341234",  
                "id": "BA6jwdzlywYVNG8xBSPw0WYG",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts/BA6jwdzlywYVNG8xBSPw0WYG" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/cards",  
                    "created_at": "2012-12-15T19:43:52.911123Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/holds",  
                    "id": "AC6jtsZwDrwyhS2aAdbni2H8",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T19:43:52.951933Z",  
                "credits_uri": "/v1/bank_accounts/BA6jwdQLOhBfhvTxEDDoysHg/credits",  
                "fingerprint": "12341234",  
                "id": "BA6jwdQLOhBfhvTxEDDoysHg",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts/BA6jwdQLOhBfhvTxEDDoysHg" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP6jqwue4p8WFccp3b7gMzs6/accounts/AC6jtsZwDrwyhS2aAdbni2H8/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP6l2QUb8yY7QHskXj5TMplM/accounts/AC6l5uZWMpQVOcBRf0HW8WQW" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw/cards",  
            "created_at": "2012-12-15T19:43:55.712903Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw/holds",  
            "id": "AC6mCQ4p8eIS6nKu0Fq5QzNw",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw/transactions",  
            "uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-12-15T19:43:55.749107Z",  
        "credits_uri": "/v1/bank_accounts/BA6mFkI4GPPNGFacxLkyozTY/credits",  
        "fingerprint": "12341234",  
        "id": "BA6mFkI4GPPNGFacxLkyozTY",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MP6mAnZjy1i5WzYATzCaLPrY/accounts/AC6mCQ4p8eIS6nKu0Fq5QzNw/bank_accounts/BA6mFkI4GPPNGFacxLkyozTY" 
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
 

