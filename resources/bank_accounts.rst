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
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    bank account was tokenized. 
 
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
 
``routing_number`` 
    *required* **string**. Bank account code. Length must be **=** ``9``. 
 
 
``account_type`` 
    *optional* **string**. ``checking`` or ``savings``. 
 
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
        "created_at": "2012-11-07T14:48:51.727100Z",  
        "credits_uri": "/v1/bank_accounts/BA2lmE4AX4lmnlSy6ZmBZXms/credits",  
        "fingerprint": "brown",  
        "id": "BA2lmE4AX4lmnlSy6ZmBZXms",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA2lmE4AX4lmnlSy6ZmBZXms" 
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
        "created_at": "2012-11-07T14:48:52.754358Z",  
        "credits_uri": "/v1/bank_accounts/BA2mwkPydu0i2MUTtZLzLvBW/credits",  
        "fingerprint": "12341234",  
        "id": "BA2mwkPydu0i2MUTtZLzLvBW",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA2mwkPydu0i2MUTtZLzLvBW" 
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
                "created_at": "2012-11-07T14:48:53.706388Z",  
                "credits_uri": "/v1/bank_accounts/BA2nAAovyMBBcXlOIa2nds6o/credits",  
                "fingerprint": "12341234",  
                "id": "BA2nAAovyMBBcXlOIa2nds6o",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2nAAovyMBBcXlOIa2nds6o" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:48:53.747420Z",  
                "credits_uri": "/v1/bank_accounts/BA2nDjVFUjnLzwjSMe0pzmZK/credits",  
                "fingerprint": "12341234",  
                "id": "BA2nDjVFUjnLzwjSMe0pzmZK",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2nDjVFUjnLzwjSMe0pzmZK" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:48:53.809716Z",  
                "credits_uri": "/v1/bank_accounts/BA2nHTyuMIuzxqCqzF52TaHG/credits",  
                "fingerprint": "12341234",  
                "id": "BA2nHTyuMIuzxqCqzF52TaHG",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2nHTyuMIuzxqCqzF52TaHG" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:48:53.810251Z",  
                "credits_uri": "/v1/bank_accounts/BA2nHUgZAu0BB2mqZP9lZAhe/credits",  
                "fingerprint": "12341234",  
                "id": "BA2nHUgZAu0BB2mqZP9lZAhe",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2nHUgZAu0BB2mqZP9lZAhe" 
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
        "first_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/cards",  
                    "created_at": "2012-11-07T14:48:54.816564Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/holds",  
                    "id": "AC2oQ8Q5M7yo6FCc0HVWmEkY",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:48:54.822714Z",  
                "credits_uri": "/v1/bank_accounts/BA2oQjsqL99kWzichhn4Rhze/credits",  
                "fingerprint": "12341234",  
                "id": "BA2oQjsqL99kWzichhn4Rhze",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts/BA2oQjsqL99kWzichhn4Rhze" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/cards",  
                    "created_at": "2012-11-07T14:48:54.816564Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/holds",  
                    "id": "AC2oQ8Q5M7yo6FCc0HVWmEkY",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:48:54.888473Z",  
                "credits_uri": "/v1/bank_accounts/BA2oV7j96ZGY9Yvglgbvn8Es/credits",  
                "fingerprint": "12341234",  
                "id": "BA2oV7j96ZGY9Yvglgbvn8Es",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts/BA2oV7j96ZGY9Yvglgbvn8Es" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/cards",  
                    "created_at": "2012-11-07T14:48:54.816564Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/holds",  
                    "id": "AC2oQ8Q5M7yo6FCc0HVWmEkY",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:48:54.889074Z",  
                "credits_uri": "/v1/bank_accounts/BA2oV83MRVIqsHiexKa2QgMA/credits",  
                "fingerprint": "12341234",  
                "id": "BA2oV83MRVIqsHiexKa2QgMA",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts/BA2oV83MRVIqsHiexKa2QgMA" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP2oLwLhL51smA3jlLs8ka68/accounts/AC2oQ8Q5M7yo6FCc0HVWmEkY/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP2q5Fs1ptDK5jgBOMwiI0ao/accounts/AC2qatCzADS2ywaAQetn70pu" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q/cards",  
            "created_at": "2012-11-07T14:48:57.173245Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q/holds",  
            "id": "AC2rutAUKkLEQDyroW5mWG4Q",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q/transactions",  
            "uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-11-07T14:48:57.239481Z",  
        "credits_uri": "/v1/bank_accounts/BA2rz4OnwxbW1M3l38SF7xru/credits",  
        "fingerprint": "12341234",  
        "id": "BA2rz4OnwxbW1M3l38SF7xru",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MP2rowYayY87OSgpNrEi7JGY/accounts/AC2rutAUKkLEQDyroW5mWG4Q/bank_accounts/BA2rz4OnwxbW1M3l38SF7xru" 
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
 

