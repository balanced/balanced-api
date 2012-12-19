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
        "created_at": "2012-12-18T22:07:27.435829Z",  
        "credits_uri": "/v1/bank_accounts/BA2Qa7TU0QDVWBz3lItTmLAC/credits",  
        "fingerprint": "brown",  
        "id": "BA2Qa7TU0QDVWBz3lItTmLAC",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA2Qa7TU0QDVWBz3lItTmLAC" 
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
        "created_at": "2012-12-18T22:07:28.682378Z",  
        "credits_uri": "/v1/bank_accounts/BA2Rz49owy3GldXVKRG3T1rQ/credits",  
        "fingerprint": "12341234",  
        "id": "BA2Rz49owy3GldXVKRG3T1rQ",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA2Rz49owy3GldXVKRG3T1rQ" 
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
                "created_at": "2012-12-18T22:07:29.934890Z",  
                "credits_uri": "/v1/bank_accounts/BA2SYn8TQfCPjWJcxyfV9IFQ/credits",  
                "fingerprint": "12341234",  
                "id": "BA2SYn8TQfCPjWJcxyfV9IFQ",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2SYn8TQfCPjWJcxyfV9IFQ" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-18T22:07:29.934664Z",  
                "credits_uri": "/v1/bank_accounts/BA2SYmP0GR1zLb9PjgfoNWnE/credits",  
                "fingerprint": "12341234",  
                "id": "BA2SYmP0GR1zLb9PjgfoNWnE",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2SYmP0GR1zLb9PjgfoNWnE" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-18T22:07:29.895867Z",  
                "credits_uri": "/v1/bank_accounts/BA2SVGuLwkId9Wtxg56p6r3Q/credits",  
                "fingerprint": "12341234",  
                "id": "BA2SVGuLwkId9Wtxg56p6r3Q",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2SVGuLwkId9Wtxg56p6r3Q" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-18T22:07:29.878836Z",  
                "credits_uri": "/v1/bank_accounts/BA2SUr79prOsMTwyvZunfx7c/credits",  
                "fingerprint": "12341234",  
                "id": "BA2SUr79prOsMTwyvZunfx7c",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2SUr79prOsMTwyvZunfx7c" 
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
        "first_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/cards",  
                    "created_at": "2012-12-18T22:07:31.162614Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/holds",  
                    "id": "AC2Um48tdr6RgOkSmpl2J7w6",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-18T22:07:31.164263Z",  
                "credits_uri": "/v1/bank_accounts/BA2Um8yXn7Z2toTgHp5cdu5k/credits",  
                "fingerprint": "12341234",  
                "id": "BA2Um8yXn7Z2toTgHp5cdu5k",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts/BA2Um8yXn7Z2toTgHp5cdu5k" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/cards",  
                    "created_at": "2012-12-18T22:07:31.162614Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/holds",  
                    "id": "AC2Um48tdr6RgOkSmpl2J7w6",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-18T22:07:31.200955Z",  
                "credits_uri": "/v1/bank_accounts/BA2UoEU6CCM6ixj3939B7WcO/credits",  
                "fingerprint": "12341234",  
                "id": "BA2UoEU6CCM6ixj3939B7WcO",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts/BA2UoEU6CCM6ixj3939B7WcO" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/cards",  
                    "created_at": "2012-12-18T22:07:31.162614Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/holds",  
                    "id": "AC2Um48tdr6RgOkSmpl2J7w6",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-18T22:07:31.201254Z",  
                "credits_uri": "/v1/bank_accounts/BA2UoFaZDAgyIx9apZxBwg4i/credits",  
                "fingerprint": "12341234",  
                "id": "BA2UoFaZDAgyIx9apZxBwg4i",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts/BA2UoFaZDAgyIx9apZxBwg4i" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP2UjHsg7aFV85dldnneS2aS/accounts/AC2Um48tdr6RgOkSmpl2J7w6/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP2VPmkGP3DNnk4Lnv4ify9s/accounts/AC2VRQj8kIUpzBtEbeMEoHwe" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A/cards",  
            "created_at": "2012-12-18T22:07:33.781608Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A/holds",  
            "id": "AC2XiHisMeIAYTqdFPcMyc5A",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A/transactions",  
            "uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-12-18T22:07:33.817962Z",  
        "credits_uri": "/v1/bank_accounts/BA2XlbN1hmFYwUUtAduwUDk6/credits",  
        "fingerprint": "12341234",  
        "id": "BA2XlbN1hmFYwUUtAduwUDk6",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MP2XggSRTZchJRNlFFl6InrQ/accounts/AC2XiHisMeIAYTqdFPcMyc5A/bank_accounts/BA2XlbN1hmFYwUUtAduwUDk6" 
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
 

