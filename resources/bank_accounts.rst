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
 
``account`` 
    **object**. See `Accounts <./accounts.rst>`_. 
 
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
        "created_at": "2012-11-07T11:23:31.620671Z",  
        "credits_uri": "/v1/bank_accounts/BA4Nxl7RItZZlHaEyAzEpATa/credits",  
        "fingerprint": "brown",  
        "id": "BA4Nxl7RItZZlHaEyAzEpATa",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA4Nxl7RItZZlHaEyAzEpATa" 
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
        "bank_name": null,  
        "created_at": "2012-11-07T11:23:32.689724Z",  
        "credits_uri": "/v1/bank_accounts/BA4OJZirgaNGc1MonaCyaNyQ/credits",  
        "fingerprint": "12341234",  
        "id": "BA4OJZirgaNGc1MonaCyaNyQ",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA4OJZirgaNGc1MonaCyaNyQ" 
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
                "bank_name": null,  
                "created_at": "2012-11-07T11:23:33.663178Z",  
                "credits_uri": "/v1/bank_accounts/BA4PPOeukjfoCX53InztcpRW/credits",  
                "fingerprint": "12341234",  
                "id": "BA4PPOeukjfoCX53InztcpRW",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA4PPOeukjfoCX53InztcpRW" 
            },  
            { 
                "bank_name": null,  
                "created_at": "2012-11-07T11:23:33.689152Z",  
                "credits_uri": "/v1/bank_accounts/BA4PRFPXBQKNTwfINiBHHf5q/credits",  
                "fingerprint": "12341234",  
                "id": "BA4PRFPXBQKNTwfINiBHHf5q",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA4PRFPXBQKNTwfINiBHHf5q" 
            },  
            { 
                "bank_name": null,  
                "created_at": "2012-11-07T11:23:33.733866Z",  
                "credits_uri": "/v1/bank_accounts/BA4PUOKRPmYJEDbnrKixIkiE/credits",  
                "fingerprint": "12341234",  
                "id": "BA4PUOKRPmYJEDbnrKixIkiE",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA4PUOKRPmYJEDbnrKixIkiE" 
            },  
            { 
                "bank_name": null,  
                "created_at": "2012-11-07T11:23:33.734228Z",  
                "credits_uri": "/v1/bank_accounts/BA4PUPdy5Lg1pMcgZN3omGLa/credits",  
                "fingerprint": "12341234",  
                "id": "BA4PUPdy5Lg1pMcgZN3omGLa",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA4PUPdy5Lg1pMcgZN3omGLa" 
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
        "first_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/cards",  
                    "created_at": "2012-11-07T11:23:34.719892Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/holds",  
                    "id": "AC4R1AMW0VU46dXDvCkZcpJa",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa" 
                },  
                "bank_code": "325182797",  
                "bank_name": null,  
                "created_at": "2012-11-07T11:23:34.770306Z",  
                "credits_uri": "/v1/bank_accounts/BA4R50GKOEYPy9mHPIlB8mNu/credits",  
                "fingerprint": "12341234",  
                "id": "BA4R50GKOEYPy9mHPIlB8mNu",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts/BA4R50GKOEYPy9mHPIlB8mNu" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/cards",  
                    "created_at": "2012-11-07T11:23:34.719892Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/holds",  
                    "id": "AC4R1AMW0VU46dXDvCkZcpJa",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa" 
                },  
                "bank_code": "325182797",  
                "bank_name": null,  
                "created_at": "2012-11-07T11:23:34.770660Z",  
                "credits_uri": "/v1/bank_accounts/BA4R518TQg8gfw7mrb7Tc37m/credits",  
                "fingerprint": "12341234",  
                "id": "BA4R518TQg8gfw7mrb7Tc37m",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts/BA4R518TQg8gfw7mrb7Tc37m" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/cards",  
                    "created_at": "2012-11-07T11:23:34.719892Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/holds",  
                    "id": "AC4R1AMW0VU46dXDvCkZcpJa",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa" 
                },  
                "bank_code": "325182797",  
                "bank_name": null,  
                "created_at": "2012-11-07T11:23:34.722949Z",  
                "credits_uri": "/v1/bank_accounts/BA4R1JHEZRxpVM29DSmd99uk/credits",  
                "fingerprint": "12341234",  
                "id": "BA4R1JHEZRxpVM29DSmd99uk",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts/BA4R1JHEZRxpVM29DSmd99uk" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP4QX1bZtiJKQxzW1dbiWZvu/accounts/AC4R1AMW0VU46dXDvCkZcpJa/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP4SeJuLCRFAF13chAB85Dec/accounts/AC4SiXlp7HavDYCFuCfCrGLi" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco/cards",  
            "created_at": "2012-11-07T11:23:36.930231Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco/holds",  
            "id": "AC4TvJklJhWW38AHhGZ22Rco",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco" 
        },  
        "bank_code": "325182797",  
        "bank_name": null,  
        "created_at": "2012-11-07T11:23:36.984164Z",  
        "credits_uri": "/v1/bank_accounts/BA4TzsSJQ41Z1ppFeK7OHHda/credits",  
        "fingerprint": "12341234",  
        "id": "BA4TzsSJQ41Z1ppFeK7OHHda",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MP4TrDnrGhHjeLjqbK5d7G2E/accounts/AC4TvJklJhWW38AHhGZ22Rco/bank_accounts/BA4TzsSJQ41Z1ppFeK7OHHda" 
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
 

