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
        "created_at": "2012-11-07T15:22:44.948028Z",  
        "credits_uri": "/v1/bank_accounts/BAgQLCJsTd6YUmYpZKEFbww/credits",  
        "fingerprint": "brown",  
        "id": "BAgQLCJsTd6YUmYpZKEFbww",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BAgQLCJsTd6YUmYpZKEFbww" 
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
        "created_at": "2012-11-07T15:22:46.062085Z",  
        "credits_uri": "/v1/bank_accounts/BAi6rMfSCCmI1RHATluWeMY/credits",  
        "fingerprint": "12341234",  
        "id": "BAi6rMfSCCmI1RHATluWeMY",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BAi6rMfSCCmI1RHATluWeMY" 
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
                "created_at": "2012-11-07T15:22:47.146479Z",  
                "credits_uri": "/v1/bank_accounts/BAjjVBwJUmJCFhIDrzeGF0M/credits",  
                "fingerprint": "12341234",  
                "id": "BAjjVBwJUmJCFhIDrzeGF0M",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BAjjVBwJUmJCFhIDrzeGF0M" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T15:22:47.170445Z",  
                "credits_uri": "/v1/bank_accounts/BAjlKiRRdiApGrofoq0p7nu/credits",  
                "fingerprint": "12341234",  
                "id": "BAjlKiRRdiApGrofoq0p7nu",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BAjlKiRRdiApGrofoq0p7nu" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T15:22:47.222370Z",  
                "credits_uri": "/v1/bank_accounts/BAjpkOdMMhw6Q86qbTUWGt6/credits",  
                "fingerprint": "12341234",  
                "id": "BAjpkOdMMhw6Q86qbTUWGt6",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BAjpkOdMMhw6Q86qbTUWGt6" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T15:22:47.222749Z",  
                "credits_uri": "/v1/bank_accounts/BAjpllszU8zT6n30asvCP76/credits",  
                "fingerprint": "12341234",  
                "id": "BAjpllszU8zT6n30asvCP76",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BAjpllszU8zT6n30asvCP76" 
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
        "first_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/cards",  
                    "created_at": "2012-11-07T15:22:48.405204Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/holds",  
                    "id": "ACkJUNb2hlHHbXP8gLAjfKs",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T15:22:48.408716Z",  
                "credits_uri": "/v1/bank_accounts/BAkK56KFzvHoQtokx1c6668/credits",  
                "fingerprint": "12341234",  
                "id": "BAkK56KFzvHoQtokx1c6668",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts/BAkK56KFzvHoQtokx1c6668" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/cards",  
                    "created_at": "2012-11-07T15:22:48.405204Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/holds",  
                    "id": "ACkJUNb2hlHHbXP8gLAjfKs",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T15:22:48.458163Z",  
                "credits_uri": "/v1/bank_accounts/BAkNtrNUhdulLAX6Te6fn00/credits",  
                "fingerprint": "12341234",  
                "id": "BAkNtrNUhdulLAX6Te6fn00",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts/BAkNtrNUhdulLAX6Te6fn00" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/cards",  
                    "created_at": "2012-11-07T15:22:48.405204Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/holds",  
                    "id": "ACkJUNb2hlHHbXP8gLAjfKs",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-11-07T15:22:48.458764Z",  
                "credits_uri": "/v1/bank_accounts/BAkNu1sgY8TU20YWtGcAzgU/credits",  
                "fingerprint": "12341234",  
                "id": "BAkNu1sgY8TU20YWtGcAzgU",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts/BAkNu1sgY8TU20YWtGcAzgU" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MPkElvnNvH29nGnEVymeJHS/accounts/ACkJUNb2hlHHbXP8gLAjfKs/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MPmbC1TYCPoH7cpU80pS4T2/accounts/ACmgrIgUsesPxWAh7T7O1x2" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk/cards",  
            "created_at": "2012-11-07T15:22:51.014144Z",  
            "credits_uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk/holds",  
            "id": "ACnFQe1K0hXUSYEkHee8fmk",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk/transactions",  
            "uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-11-07T15:22:51.065856Z",  
        "credits_uri": "/v1/bank_accounts/BAnJoaH31LzzD80PJAZyDaY/credits",  
        "fingerprint": "12341234",  
        "id": "BAnJoaH31LzzD80PJAZyDaY",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MPnB2KTT1jZnJibQfolEipu/accounts/ACnFQe1K0hXUSYEkHee8fmk/bank_accounts/BAnJoaH31LzzD80PJAZyDaY" 
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
 

