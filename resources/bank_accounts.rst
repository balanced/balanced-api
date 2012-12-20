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
        "type": "checking",  
        "routing_number": "325182797" 
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
        "created_at": "2012-12-19T23:37:03.672186Z",  
        "credits_uri": "/v1/bank_accounts/BAn80Ej9BPQj7qVdwPB9UKe/credits",  
        "fingerprint": "brown",  
        "id": "BAn80Ej9BPQj7qVdwPB9UKe",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BAn80Ej9BPQj7qVdwPB9UKe" 
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
        "created_at": "2012-12-19T23:37:05.048494Z",  
        "credits_uri": "/v1/bank_accounts/BAoG0GFXqiUqx5S7EGpeeHU/credits",  
        "fingerprint": "12341234",  
        "id": "BAoG0GFXqiUqx5S7EGpeeHU",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BAoG0GFXqiUqx5S7EGpeeHU" 
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
                "created_at": "2012-12-19T23:37:06.439653Z",  
                "credits_uri": "/v1/bank_accounts/BAqeVeETAxwITt5qKlSb21c/credits",  
                "fingerprint": "12341234",  
                "id": "BAqeVeETAxwITt5qKlSb21c",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BAqeVeETAxwITt5qKlSb21c" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-19T23:37:06.439301Z",  
                "credits_uri": "/v1/bank_accounts/BAqeUR7INSslyUxogZ2cRhE/credits",  
                "fingerprint": "12341234",  
                "id": "BAqeUR7INSslyUxogZ2cRhE",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BAqeUR7INSslyUxogZ2cRhE" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-19T23:37:06.393523Z",  
                "credits_uri": "/v1/bank_accounts/BAqbNgsiPGO8rMDe9eUKiGS/credits",  
                "fingerprint": "12341234",  
                "id": "BAqbNgsiPGO8rMDe9eUKiGS",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BAqbNgsiPGO8rMDe9eUKiGS" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-19T23:37:06.375764Z",  
                "credits_uri": "/v1/bank_accounts/BAqarX6bqkg6UwDFzy0Zec2/credits",  
                "fingerprint": "12341234",  
                "id": "BAqarX6bqkg6UwDFzy0Zec2",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BAqarX6bqkg6UwDFzy0Zec2" 
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
        "first_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/cards",  
                    "created_at": "2012-12-19T23:37:07.723616Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/holds",  
                    "id": "ACrGAC9cCevLRx8J4cqFqPw",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-19T23:37:07.725356Z",  
                "credits_uri": "/v1/bank_accounts/BArGF6WVGzPCae4wXjeQWYG/credits",  
                "fingerprint": "12341234",  
                "id": "BArGF6WVGzPCae4wXjeQWYG",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts/BArGF6WVGzPCae4wXjeQWYG" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/cards",  
                    "created_at": "2012-12-19T23:37:07.723616Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/holds",  
                    "id": "ACrGAC9cCevLRx8J4cqFqPw",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-19T23:37:07.760972Z",  
                "credits_uri": "/v1/bank_accounts/BArJ6WpBNXUxUk7CyJzPqqe/credits",  
                "fingerprint": "12341234",  
                "id": "BArJ6WpBNXUxUk7CyJzPqqe",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts/BArJ6WpBNXUxUk7CyJzPqqe" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/cards",  
                    "created_at": "2012-12-19T23:37:07.723616Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/holds",  
                    "id": "ACrGAC9cCevLRx8J4cqFqPw",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-19T23:37:07.761210Z",  
                "credits_uri": "/v1/bank_accounts/BArJ7bIzqx5W6J6uskwy4Qy/credits",  
                "fingerprint": "12341234",  
                "id": "BArJ7bIzqx5W6J6uskwy4Qy",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts/BArJ7bIzqx5W6J6uskwy4Qy" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MPrEdFSBCsbXh5RxGPr097k/accounts/ACrGAC9cCevLRx8J4cqFqPw/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MPtanzisGsBEd2P2OasDGwa/accounts/ACtcLF8psEG6hLOXUb3WXMK" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO/cards",  
            "created_at": "2012-12-19T23:37:10.358128Z",  
            "credits_uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO/holds",  
            "id": "ACuEiVuiQVYshgrXqk4ydKO",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO/transactions",  
            "uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-12-19T23:37:10.394237Z",  
        "credits_uri": "/v1/bank_accounts/BAuGNeRMsBgbqKoFB52EDj4/credits",  
        "fingerprint": "12341234",  
        "id": "BAuGNeRMsBgbqKoFB52EDj4",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MPuBMiffC7hk1yxIBJV7MmK/accounts/ACuEiVuiQVYshgrXqk4ydKO/bank_accounts/BAuGNeRMsBgbqKoFB52EDj4" 
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
 

