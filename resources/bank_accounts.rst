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
        "created_at": "2012-12-20T03:05:41.308394Z",  
        "credits_uri": "/v1/bank_accounts/BA14rsOGNbAMdrDZVHNouCFd/credits",  
        "fingerprint": "brown",  
        "id": "BA14rsOGNbAMdrDZVHNouCFd",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA14rsOGNbAMdrDZVHNouCFd" 
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
        "created_at": "2012-12-20T03:05:43.774362Z",  
        "credits_uri": "/v1/bank_accounts/BA17dsRF9ouZLN1p7Rr69JFF/credits",  
        "fingerprint": "12341234",  
        "id": "BA17dsRF9ouZLN1p7Rr69JFF",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA17dsRF9ouZLN1p7Rr69JFF" 
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
                "created_at": "2012-12-20T03:05:46.220501Z",  
                "credits_uri": "/v1/bank_accounts/BA19XXlHnNSioHaU5mVtsid5/credits",  
                "fingerprint": "12341234",  
                "id": "BA19XXlHnNSioHaU5mVtsid5",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA19XXlHnNSioHaU5mVtsid5" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-20T03:05:46.219930Z",  
                "credits_uri": "/v1/bank_accounts/BA19XWHdRYObiqoHKyGlMYGn/credits",  
                "fingerprint": "12341234",  
                "id": "BA19XWHdRYObiqoHKyGlMYGn",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA19XWHdRYObiqoHKyGlMYGn" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-20T03:05:46.143467Z",  
                "credits_uri": "/v1/bank_accounts/BA19SCdf5K4G5gzVQDEiy3mj/credits",  
                "fingerprint": "12341234",  
                "id": "BA19SCdf5K4G5gzVQDEiy3mj",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA19SCdf5K4G5gzVQDEiy3mj" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-20T03:05:46.093130Z",  
                "credits_uri": "/v1/bank_accounts/BA19OZcXdbtpM9byC8T923Yf/credits",  
                "fingerprint": "12341234",  
                "id": "BA19OZcXdbtpM9byC8T923Yf",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA19OZcXdbtpM9byC8T923Yf" 
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
        "first_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/cards",  
                    "created_at": "2012-12-20T03:05:48.398844Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/holds",  
                    "id": "AC1cq1ZixSeMq4xhwnIkTJrZ",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-20T03:05:48.402893Z",  
                "credits_uri": "/v1/bank_accounts/BA1cqcHgxdFdoDXOI2UkBv91/credits",  
                "fingerprint": "12341234",  
                "id": "BA1cqcHgxdFdoDXOI2UkBv91",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts/BA1cqcHgxdFdoDXOI2UkBv91" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/cards",  
                    "created_at": "2012-12-20T03:05:48.398844Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/holds",  
                    "id": "AC1cq1ZixSeMq4xhwnIkTJrZ",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-20T03:05:48.475955Z",  
                "credits_uri": "/v1/bank_accounts/BA1cvhQJiAKlyFldp9baVnfd/credits",  
                "fingerprint": "12341234",  
                "id": "BA1cvhQJiAKlyFldp9baVnfd",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts/BA1cvhQJiAKlyFldp9baVnfd" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/cards",  
                    "created_at": "2012-12-20T03:05:48.398844Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/holds",  
                    "id": "AC1cq1ZixSeMq4xhwnIkTJrZ",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "created_at": "2012-12-20T03:05:48.476457Z",  
                "credits_uri": "/v1/bank_accounts/BA1cviswCsbbm2Od13xvDi4H/credits",  
                "fingerprint": "12341234",  
                "id": "BA1cviswCsbbm2Od13xvDi4H",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts/BA1cviswCsbbm2Od13xvDi4H" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP1ck9wGK26PeCnjRi4TW3cL/accounts/AC1cq1ZixSeMq4xhwnIkTJrZ/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP1eHQhepkRMwk1IppoD4RKX/accounts/AC1eNR7koYM1L41fCMuHj97l" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ/cards",  
            "created_at": "2012-12-20T03:05:52.689801Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ/holds",  
            "id": "AC1hff2ikmDPcchcu2tDLcxZ",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ/transactions",  
            "uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "created_at": "2012-12-20T03:05:52.760016Z",  
        "credits_uri": "/v1/bank_accounts/BA1hk6g5JeBebbEh2kdF080P/credits",  
        "fingerprint": "12341234",  
        "id": "BA1hk6g5JeBebbEh2kdF080P",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MP1h9oAB792hd79oY9qcDSN5/accounts/AC1hff2ikmDPcchcu2tDLcxZ/bank_accounts/BA1hk6g5JeBebbEh2kdF080P" 
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
 

