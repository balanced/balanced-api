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
    **string**. The resource identifier. 
 
``name`` 
    **string**. The name on the bank account. 
 
``routing_number`` 
    **string**. The routing number of the bank. 
 
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
    **string**. The URI of the bank account object 
 
``account`` 
    **object**. See `Accounts <./accounts.rst>`_. 
 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``credits_uri`` 
    **string**. A URI for a Balanced entity 
 

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
 
 
``account_type`` 
    *optional* **string**. Bank account type. It should be one of: ``checking``, ``savings`` 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "account_type": "checking",  
        "account_number": "12341234",  
        "name": "Fit Finlay",  
        "bank_code": "325182797" 
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
        "routing_number": "325182797",  
        "bank_name": "Banko De Ismus",  
        "account": null,  
        "name": "Fit Finlay",  
        "created_at": "2012-11-07T00:58:21.586207Z",  
        "uri": "/v1/bank_accounts/BA2bMwe0FToyrE5JcdrGrE8b",  
        "meta": {},  
        "fingerprint": "brown",  
        "type": "bank_account",  
        "id": "BA2bMwe0FToyrE5JcdrGrE8b",  
        "credits_uri": "/v1/bank_accounts/BA2bMwe0FToyrE5JcdrGrE8b/credits" 
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
        "routing_number": "325182797",  
        "bank_name": null,  
        "account": null,  
        "name": "Fit Finlay",  
        "created_at": "2012-11-07T00:58:22.649034Z",  
        "uri": "/v1/bank_accounts/BA2cYEExmO3wzn5O0QRQARVx",  
        "meta": {},  
        "fingerprint": "12341234",  
        "type": "bank_account",  
        "id": "BA2cYEExmO3wzn5O0QRQARVx",  
        "credits_uri": "/v1/bank_accounts/BA2cYEExmO3wzn5O0QRQARVx/credits" 
    } 
 

List All Bank Accounts
----------------------

.. code:: 
 
    GET /v1/bank_accounts 
 

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
        "first_uri": "/v1/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "routing_number": "325182797",  
                "bank_name": null,  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e5x7cruGEP9DGgGacFIVd/holds",  
                    "name": "Merchants, Inc.",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:58:23.637045Z",  
                    "uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e5x7cruGEP9DGgGacFIVd",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e5x7cruGEP9DGgGacFIVd/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e5x7cruGEP9DGgGacFIVd/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e5x7cruGEP9DGgGacFIVd/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e5x7cruGEP9DGgGacFIVd/transactions",  
                    "email_address": "email.1@y.com",  
                    "id": "AC2e5x7cruGEP9DGgGacFIVd",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e5x7cruGEP9DGgGacFIVd/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e5x7cruGEP9DGgGacFIVd/cards" 
                },  
                "name": "Fit Finlay",  
                "created_at": "2012-11-07T00:58:23.646544Z",  
                "uri": "/v1/bank_accounts/BA2e5Y8gpf5aJP6PqJus9lB1",  
                "meta": {},  
                "fingerprint": "12341234",  
                "type": "bank_account",  
                "id": "BA2e5Y8gpf5aJP6PqJus9lB1",  
                "credits_uri": "/v1/bank_accounts/BA2e5Y8gpf5aJP6PqJus9lB1/credits" 
            },  
            { 
                "routing_number": "325182797",  
                "bank_name": null,  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e8pqvXh4u2OuplIwxvvlp/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:58:23.677760Z",  
                    "uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e8pqvXh4u2OuplIwxvvlp",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e8pqvXh4u2OuplIwxvvlp/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e8pqvXh4u2OuplIwxvvlp/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e8pqvXh4u2OuplIwxvvlp/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e8pqvXh4u2OuplIwxvvlp/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC2e8pqvXh4u2OuplIwxvvlp",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e8pqvXh4u2OuplIwxvvlp/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2e2SdVdsX4bBl3AdHM0MUj/accounts/AC2e8pqvXh4u2OuplIwxvvlp/cards" 
                },  
                "name": "Fit Finlay",  
                "created_at": "2012-11-07T00:58:23.682176Z",  
                "uri": "/v1/bank_accounts/BA2e8Ayu138VtDCDmwAAUeNJ",  
                "meta": {},  
                "fingerprint": "12341234",  
                "type": "bank_account",  
                "id": "BA2e8Ayu138VtDCDmwAAUeNJ",  
                "credits_uri": "/v1/bank_accounts/BA2e8Ayu138VtDCDmwAAUeNJ/credits" 
            },  
            { 
                "routing_number": "325182797",  
                "bank_name": null,  
                "account": null,  
                "name": "Fit Finlay",  
                "created_at": "2012-11-07T00:58:23.739406Z",  
                "uri": "/v1/bank_accounts/BA2ecC4mFzow1GwfKNqckKqv",  
                "meta": {},  
                "fingerprint": "12341234",  
                "type": "bank_account",  
                "id": "BA2ecC4mFzow1GwfKNqckKqv",  
                "credits_uri": "/v1/bank_accounts/BA2ecC4mFzow1GwfKNqckKqv/credits" 
            },  
            { 
                "routing_number": "325182797",  
                "bank_name": null,  
                "account": null,  
                "name": "Fit Finlay",  
                "created_at": "2012-11-07T00:58:23.739785Z",  
                "uri": "/v1/bank_accounts/BA2ecCBkQiGEh3D4RtZvIy0b",  
                "meta": {},  
                "fingerprint": "12341234",  
                "type": "bank_account",  
                "id": "BA2ecCBkQiGEh3D4RtZvIy0b",  
                "credits_uri": "/v1/bank_accounts/BA2ecCBkQiGEh3D4RtZvIy0b/credits" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 4,  
        "next_uri": null,  
        "last_uri": "/v1/bank_accounts?limit=10&offset=0" 
    } 
 

List All Bank Accounts for an Account
-------------------------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/bank_accounts 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "routing_number": "325182797",  
                "bank_name": null,  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:58:24.774169Z",  
                    "uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC2fmSwmOS6hgn23KOWafi6v",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/cards" 
                },  
                "name": "Fit Finlay",  
                "bank_code": "325182797",  
                "created_at": "2012-11-07T00:58:24.776701Z",  
                "uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts/BA2fn0uENqVls4yiTPuzHWFl",  
                "is_valid": true,  
                "meta": {},  
                "last_four": "1234",  
                "fingerprint": "12341234",  
                "type": "bank_account",  
                "id": "BA2fn0uENqVls4yiTPuzHWFl",  
                "credits_uri": "/v1/bank_accounts/BA2fn0uENqVls4yiTPuzHWFl/credits" 
            },  
            { 
                "routing_number": "325182797",  
                "bank_name": null,  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:58:24.774169Z",  
                    "uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC2fmSwmOS6hgn23KOWafi6v",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/cards" 
                },  
                "name": "Fit Finlay",  
                "bank_code": "325182797",  
                "created_at": "2012-11-07T00:58:24.831011Z",  
                "uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts/BA2fqNyHLUrRanJ8stbSyJi3",  
                "is_valid": true,  
                "meta": {},  
                "last_four": "1234",  
                "fingerprint": "12341234",  
                "type": "bank_account",  
                "id": "BA2fqNyHLUrRanJ8stbSyJi3",  
                "credits_uri": "/v1/bank_accounts/BA2fqNyHLUrRanJ8stbSyJi3/credits" 
            },  
            { 
                "routing_number": "325182797",  
                "bank_name": null,  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:58:24.774169Z",  
                    "uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC2fmSwmOS6hgn23KOWafi6v",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/cards" 
                },  
                "name": "Fit Finlay",  
                "bank_code": "325182797",  
                "created_at": "2012-11-07T00:58:24.831541Z",  
                "uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts/BA2fqOi0qREFOERvive1ya4z",  
                "is_valid": true,  
                "meta": {},  
                "last_four": "1234",  
                "fingerprint": "12341234",  
                "type": "bank_account",  
                "id": "BA2fqOi0qREFOERvive1ya4z",  
                "credits_uri": "/v1/bank_accounts/BA2fqOi0qREFOERvive1ya4z/credits" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 3,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP2fhUXkUNHD4Uwb9UfU3Pmr/accounts/AC2fmSwmOS6hgn23KOWafi6v/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP2gDDlgJKpUR9HxfQFz8tTJ/accounts/AC2gI2ZXwyqXyxY9EeyUkCPN" 
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
        "routing_number": "325182797",  
        "bank_name": null,  
        "account": { 
            "holds_uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:58:27.086026Z",  
            "uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC2hY5nxJ42Br8XVli4fW4zp",  
            "credits_uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp/cards" 
        },  
        "name": "Fit Finlay",  
        "bank_code": "325182797",  
        "created_at": "2012-11-07T00:58:27.144365Z",  
        "uri": "/v1/marketplaces/TEST-MP2hTB7nok3kMKcWOUyOI0nN/accounts/AC2hY5nxJ42Br8XVli4fW4zp/bank_accounts/BA2i2556TAfoIBZ2MZLYqbZ1",  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1234",  
        "fingerprint": "12341234",  
        "type": "bank_account",  
        "id": "BA2i2556TAfoIBZ2MZLYqbZ1",  
        "credits_uri": "/v1/bank_accounts/BA2i2556TAfoIBZ2MZLYqbZ1/credits" 
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
 

