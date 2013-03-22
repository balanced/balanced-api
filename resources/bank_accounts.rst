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
 
``can_debit`` 
    **boolean**. Flag indicating whether this funding instrument can be debited (true) 
    or not (false). 
 
``verifications_uri`` 
    **string**.  
 
``verification_uri`` 
    **string**. Most recent verification for this bank account. 
 

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
        "can_debit": false,  
        "created_at": "2013-02-21T00:51:54.340398Z",  
        "credits_uri": "/v1/bank_accounts/BA6TWP0XBiqKt1iVKMoI1vJF/credits",  
        "fingerprint": "brown",  
        "id": "BA6TWP0XBiqKt1iVKMoI1vJF",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA6TWP0XBiqKt1iVKMoI1vJF",  
        "verification_uri": null,  
        "verifications_uri": "/v1/bank_accounts/BA6TWP0XBiqKt1iVKMoI1vJF/verifications" 
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
        "can_debit": false,  
        "created_at": "2013-02-21T00:51:56.892095Z",  
        "credits_uri": "/v1/bank_accounts/BA6WOMicQkQpjAqisZje7bDt/credits",  
        "fingerprint": "12341234",  
        "id": "BA6WOMicQkQpjAqisZje7bDt",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA6WOMicQkQpjAqisZje7bDt",  
        "verification_uri": null,  
        "verifications_uri": "/v1/bank_accounts/BA6WOMicQkQpjAqisZje7bDt/verifications" 
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
                "can_debit": false,  
                "created_at": "2013-02-21T00:51:59.444398Z",  
                "credits_uri": "/v1/bank_accounts/BA6ZGIvZECT4qaRuRBjFN2sb/credits",  
                "fingerprint": "12341234",  
                "id": "BA6ZGIvZECT4qaRuRBjFN2sb",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6ZGIvZECT4qaRuRBjFN2sb",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA6ZGIvZECT4qaRuRBjFN2sb/verifications" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-21T00:51:59.443853Z",  
                "credits_uri": "/v1/bank_accounts/BA6ZGIdhCYmHAUOmNkHwOKsP/credits",  
                "fingerprint": "12341234",  
                "id": "BA6ZGIdhCYmHAUOmNkHwOKsP",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6ZGIdhCYmHAUOmNkHwOKsP",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA6ZGIdhCYmHAUOmNkHwOKsP/verifications" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-21T00:51:59.398175Z",  
                "credits_uri": "/v1/bank_accounts/BA6ZDvIbG3zPe5WNNunuyKaL/credits",  
                "fingerprint": "12341234",  
                "id": "BA6ZDvIbG3zPe5WNNunuyKaL",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6ZDvIbG3zPe5WNNunuyKaL",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA6ZDvIbG3zPe5WNNunuyKaL/verifications" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-21T00:51:59.380533Z",  
                "credits_uri": "/v1/bank_accounts/BA6ZCj37Mi79dm6EtER4OJx1/credits",  
                "fingerprint": "12341234",  
                "id": "BA6ZCj37Mi79dm6EtER4OJx1",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6ZCj37Mi79dm6EtER4OJx1",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA6ZCj37Mi79dm6EtER4OJx1/verifications" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "can_debit": true,  
                "created_at": "2013-02-21T00:51:59.356478Z",  
                "credits_uri": "/v1/bank_accounts/BA6ZAzmZEXeBiIWKMKwHdGfN/credits",  
                "fingerprint": "12341234",  
                "id": "BA6ZAzmZEXeBiIWKMKwHdGfN",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA6ZAzmZEXeBiIWKMKwHdGfN",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA6ZAzmZEXeBiIWKMKwHdGfN/verifications" 
            } 
        ],  
        "limit": 10,  
        "offset": 0,  
        "total": 5 
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
        "first_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/cards",  
                    "created_at": "2013-02-21T00:52:01.972511Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/holds",  
                    "id": "AC72x3JrDrvsclQWFFwax1N9",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-21T00:52:01.973554Z",  
                "credits_uri": "/v1/bank_accounts/BA72x7LRnyAHXOZsanECK1TZ/credits",  
                "fingerprint": "12341234",  
                "id": "BA72x7LRnyAHXOZsanECK1TZ",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts/BA72x7LRnyAHXOZsanECK1TZ",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA72x7LRnyAHXOZsanECK1TZ/verifications" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/cards",  
                    "created_at": "2013-02-21T00:52:01.972511Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/holds",  
                    "id": "AC72x3JrDrvsclQWFFwax1N9",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-21T00:52:02.033199Z",  
                "credits_uri": "/v1/bank_accounts/BA72Bh0p6xCFtvHoLobe9QUH/credits",  
                "fingerprint": "12341234",  
                "id": "BA72Bh0p6xCFtvHoLobe9QUH",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts/BA72Bh0p6xCFtvHoLobe9QUH",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA72Bh0p6xCFtvHoLobe9QUH/verifications" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/cards",  
                    "created_at": "2013-02-21T00:52:01.972511Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/holds",  
                    "id": "AC72x3JrDrvsclQWFFwax1N9",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-21T00:52:02.033742Z",  
                "credits_uri": "/v1/bank_accounts/BA72BhiVuUWZeqo1iTPIshQD/credits",  
                "fingerprint": "12341234",  
                "id": "BA72BhiVuUWZeqo1iTPIshQD",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts/BA72BhiVuUWZeqo1iTPIshQD",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA72BhiVuUWZeqo1iTPIshQD/verifications" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP72tVTORmGqAqtsgLWmKmaf/accounts/AC72x3JrDrvsclQWFFwax1N9/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP75umJ49Dd4rr3ADJDwF5U7/accounts/AC75xIOdMziMDGdB3VBTdqnx" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP/cards",  
            "created_at": "2013-02-21T00:52:07.331593Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP/holds",  
            "id": "AC78yLprQhQAdPs2Vc6x3ugP",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP/transactions",  
            "uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "can_debit": false,  
        "created_at": "2013-02-21T00:52:07.386381Z",  
        "credits_uri": "/v1/bank_accounts/BA78CzIDQMHKpc19gCLDeXjt/credits",  
        "fingerprint": "12341234",  
        "id": "BA78CzIDQMHKpc19gCLDeXjt",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MP78vE29J5n2nH5XCniShStd/accounts/AC78yLprQhQAdPs2Vc6x3ugP/bank_accounts/BA78CzIDQMHKpc19gCLDeXjt",  
        "verification_uri": null,  
        "verifications_uri": "/v1/bank_accounts/BA78CzIDQMHKpc19gCLDeXjt/verifications" 
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
 

