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
        "created_at": "2012-12-15T22:49:49.594730Z",  
        "credits_uri": "/v1/bank_accounts/BA67XW8olk52zG51IwuDvERc/credits",  
        "fingerprint": "brown",  
        "id": "BA67XW8olk52zG51IwuDvERc",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA67XW8olk52zG51IwuDvERc" 
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
        "created_at": "2012-12-15T22:49:50.919335Z",  
        "credits_uri": "/v1/bank_accounts/BA69skU9eJ2ZaY00Kd4xNsTM/credits",  
        "fingerprint": "12341234",  
        "id": "BA69skU9eJ2ZaY00Kd4xNsTM",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA69skU9eJ2ZaY00Kd4xNsTM" 
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
                "created_at": "2012-12-15T22:49:52.243752Z",  
                "credits_uri": "/v1/bank_accounts/BA6aWCQqYePpWdqAhLTTS2cG/credits",  
                "fingerprint": "12341234",  
                "id": "BA6aWCQqYePpWdqAhLTTS2cG",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6aWCQqYePpWdqAhLTTS2cG" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T22:49:52.243428Z",  
                "credits_uri": "/v1/bank_accounts/BA6aWCzOzFTT37ZOb722EnB8/credits",  
                "fingerprint": "12341234",  
                "id": "BA6aWCzOzFTT37ZOb722EnB8",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6aWCzOzFTT37ZOb722EnB8" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T22:49:52.207376Z",  
                "credits_uri": "/v1/bank_accounts/BA6aU8USWQQqgMe3N5N6E7KW/credits",  
                "fingerprint": "12341234",  
                "id": "BA6aU8USWQQqgMe3N5N6E7KW",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6aU8USWQQqgMe3N5N6E7KW" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T22:49:52.189193Z",  
                "credits_uri": "/v1/bank_accounts/BA6aSNDUJY5VRGNcRTWMEQjg/credits",  
                "fingerprint": "12341234",  
                "id": "BA6aSNDUJY5VRGNcRTWMEQjg",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6aSNDUJY5VRGNcRTWMEQjg" 
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
        "first_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/cards",  
                    "created_at": "2012-12-15T22:49:53.516023Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/holds",  
                    "id": "AC6cns438ARcVrzYKO71cw9Y",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T22:49:53.517656Z",  
                "credits_uri": "/v1/bank_accounts/BA6cnw6rdFuaxsF4BBcCK8sy/credits",  
                "fingerprint": "12341234",  
                "id": "BA6cnw6rdFuaxsF4BBcCK8sy",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts/BA6cnw6rdFuaxsF4BBcCK8sy" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/cards",  
                    "created_at": "2012-12-15T22:49:53.516023Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/holds",  
                    "id": "AC6cns438ARcVrzYKO71cw9Y",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T22:49:53.552912Z",  
                "credits_uri": "/v1/bank_accounts/BA6cpWOZ4VDtZaBTOyBwCIoa/credits",  
                "fingerprint": "12341234",  
                "id": "BA6cpWOZ4VDtZaBTOyBwCIoa",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts/BA6cpWOZ4VDtZaBTOyBwCIoa" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/cards",  
                    "created_at": "2012-12-15T22:49:53.516023Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/holds",  
                    "id": "AC6cns438ARcVrzYKO71cw9Y",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-15T22:49:53.553149Z",  
                "credits_uri": "/v1/bank_accounts/BA6cpX6dHp3Koxhk7ANDXH2q/credits",  
                "fingerprint": "12341234",  
                "id": "BA6cpX6dHp3Koxhk7ANDXH2q",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts/BA6cpX6dHp3Koxhk7ANDXH2q" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP6cl1VoBnJWpjxzJspa6h4K/accounts/AC6cns438ARcVrzYKO71cw9Y/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP6dZ511uzbsUjF94eR6ej0u/accounts/AC6e1TtcVUBiNjPCX0HLDHvQ" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW/cards",  
            "created_at": "2012-12-15T22:49:56.358874Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW/holds",  
            "id": "AC6fzGJKloVjTWQeyycfk2IW",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW/transactions",  
            "uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-12-15T22:49:56.396323Z",  
        "credits_uri": "/v1/bank_accounts/BA6fCgcSYCdjktCYzDcv8eHE/credits",  
        "fingerprint": "12341234",  
        "id": "BA6fCgcSYCdjktCYzDcv8eHE",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MP6fxd04yz6225Rs7RjKmodA/accounts/AC6fzGJKloVjTWQeyycfk2IW/bank_accounts/BA6fCgcSYCdjktCYzDcv8eHE" 
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
 

