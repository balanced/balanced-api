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
        "created_at": "2012-11-07T14:53:56.576432Z",  
        "credits_uri": "/v1/bank_accounts/BA5aCLt7WVf2ch2nuOscqjy/credits",  
        "fingerprint": "brown",  
        "id": "BA5aCLt7WVf2ch2nuOscqjy",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA5aCLt7WVf2ch2nuOscqjy" 
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
        "created_at": "2012-11-07T14:53:57.624211Z",  
        "credits_uri": "/v1/bank_accounts/BA6lJ25vvq0Y5meLMceZTms/credits",  
        "fingerprint": "12341234",  
        "id": "BA6lJ25vvq0Y5meLMceZTms",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA6lJ25vvq0Y5meLMceZTms" 
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
                "created_at": "2012-11-07T14:53:58.579434Z",  
                "credits_uri": "/v1/bank_accounts/BA7qf99voxmMbTNsXr6fiIc/credits",  
                "fingerprint": "12341234",  
                "id": "BA7qf99voxmMbTNsXr6fiIc",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA7qf99voxmMbTNsXr6fiIc" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:53:58.617600Z",  
                "credits_uri": "/v1/bank_accounts/BA7sKUiMGtd3JzSoEsmavtO/credits",  
                "fingerprint": "12341234",  
                "id": "BA7sKUiMGtd3JzSoEsmavtO",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA7sKUiMGtd3JzSoEsmavtO" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:53:58.680019Z",  
                "credits_uri": "/v1/bank_accounts/BA7xkZ04iawc7uXkgk0fEri/credits",  
                "fingerprint": "12341234",  
                "id": "BA7xkZ04iawc7uXkgk0fEri",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA7xkZ04iawc7uXkgk0fEri" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:53:58.680586Z",  
                "credits_uri": "/v1/bank_accounts/BA7xlGH0RZLF3QBkyqtt2NS/credits",  
                "fingerprint": "12341234",  
                "id": "BA7xlGH0RZLF3QBkyqtt2NS",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA7xlGH0RZLF3QBkyqtt2NS" 
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
        "first_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/cards",  
                    "created_at": "2012-11-07T14:53:59.675775Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/holds",  
                    "id": "AC8EOv96FiM7m9qtI6mduxm",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:53:59.681534Z",  
                "credits_uri": "/v1/bank_accounts/BA8EYroRus2FEgvzJmHgLOY/credits",  
                "fingerprint": "12341234",  
                "id": "BA8EYroRus2FEgvzJmHgLOY",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts/BA8EYroRus2FEgvzJmHgLOY" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/cards",  
                    "created_at": "2012-11-07T14:53:59.675775Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/holds",  
                    "id": "AC8EOv96FiM7m9qtI6mduxm",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:53:59.745463Z",  
                "credits_uri": "/v1/bank_accounts/BA8JDpNNYqFPvA8L43puWLW/credits",  
                "fingerprint": "12341234",  
                "id": "BA8JDpNNYqFPvA8L43puWLW",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts/BA8JDpNNYqFPvA8L43puWLW" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/cards",  
                    "created_at": "2012-11-07T14:53:59.675775Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/holds",  
                    "id": "AC8EOv96FiM7m9qtI6mduxm",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T14:53:59.746062Z",  
                "credits_uri": "/v1/bank_accounts/BA8JE9Uk7kh4s6S0Y3onoLq/credits",  
                "fingerprint": "12341234",  
                "id": "BA8JE9Uk7kh4s6S0Y3onoLq",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts/BA8JE9Uk7kh4s6S0Y3onoLq" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP8Amx2ZTTiCeOkl6qLLxiI/accounts/AC8EOv96FiM7m9qtI6mduxm/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP9UXG6PYv5TJHyNMcUz5UU/accounts/ACa0ZBKTsnaOyHt4gnhl0QA" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg/cards",  
            "created_at": "2012-11-07T14:54:02.010653Z",  
            "credits_uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg/holds",  
            "id": "ACbhCQLbP8buyOyBErtDcqg",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg/transactions",  
            "uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-11-07T14:54:02.076365Z",  
        "credits_uri": "/v1/bank_accounts/BAbmbJKatUjKpIuCtvpmTd2/credits",  
        "fingerprint": "12341234",  
        "id": "BAbmbJKatUjKpIuCtvpmTd2",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MPbcAXFZznCPTk9ABofDTXC/accounts/ACbhCQLbP8buyOyBErtDcqg/bank_accounts/BAbmbJKatUjKpIuCtvpmTd2" 
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
 

