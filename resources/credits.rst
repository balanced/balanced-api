Credits
=======

- `Credit a New Bank Account`_
- `Credit an Existing Bank Account`_
- `Credit a Merchant`_
- `Retrieve a Credit`_
- `List All Credits`_
- `List All Credits for a Bank Account`_
- `List All Credits for a Merchant`_

Fields
------

``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**.  
 
``amount`` 
    **integer**. Amount of the credit. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    credit was created. 
 
``description`` 
    **string**. A description of the credit, used for display purposes. 
 
``account`` 
    **object**. The account to which the credit is associated. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``bank_account`` 
    **object**. The bank account for this credit. 
 
``status`` 
    **string**. One of ``pending``, ``paid``, ``failed``. 
 

Deprecated
~~~~~~~~~~

``destination`` 
    **object**. The funding destination for this credit (i.e., a bank account). 
 
``state`` 
    **string**. One of ``pending``, ``cleared``, ``rejected``. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``available_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    credit will be available to the merchant. 
 
``fee`` 
    **integer**. The fee charged by Balanced for this credit. 
 

Credit a New Bank Account
-------------------------

.. code:: 
 
    POST /v1/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. You must have ``amount`` funds transferred to cover the 
    credit. 
 
``bank_account`` 
    *required* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 
``description`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 1234,  
        "description": "Something descriptive",  
        "bank_account": { 
            "account_type": "checking",  
            "account_number": "12341234",  
            "name": "Fit Finlay",  
            "bank_code": "325182797" 
        } 
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
        "status": "paid",  
        "account": null,  
        "description": "Something descriptive",  
        "created_at": "2012-11-07T01:10:39.046415Z",  
        "uri": "/v1/credits/CR7M9J1sNgqsCwzYZ2TEx7eH",  
        "amount": 1234,  
        "meta": {},  
        "id": "CR7M9J1sNgqsCwzYZ2TEx7eH",  
        "bank_account": { 
            "routing_number": "325182797",  
            "bank_name": "Banko De Ismus",  
            "account": null,  
            "name": "Fit Finlay",  
            "created_at": "2012-11-07T01:10:39.038464Z",  
            "uri": "/v1/bank_accounts/BA7M99bQ5HlW4L35yphAUzp9",  
            "meta": {},  
            "fingerprint": "brown",  
            "type": "bank_account",  
            "id": "BA7M99bQ5HlW4L35yphAUzp9",  
            "credits_uri": "/v1/bank_accounts/BA7M99bQ5HlW4L35yphAUzp9/credits" 
        } 
    } 
 

Credit an Existing Bank Account
-------------------------------

.. code:: 
 
    POST /v1/bank_accounts/:bank_account_id/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. You must have ``amount`` funds transferred to cover the 
    credit. 
 
``description`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 1234,  
        "description": "A description" 
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
        "status": "paid",  
        "account": null,  
        "description": "A description",  
        "created_at": "2012-11-07T01:10:41.418118Z",  
        "uri": "/v1/credits/CR1L3cLpcOWQcgm68BcGwNl",  
        "amount": 1234,  
        "meta": {},  
        "id": "CR1L3cLpcOWQcgm68BcGwNl",  
        "bank_account": { 
            "routing_number": "325182797",  
            "bank_name": null,  
            "account": null,  
            "name": "Fit Finlay",  
            "created_at": "2012-11-07T01:10:41.370961Z",  
            "uri": "/v1/bank_accounts/BA1HMDp2rsC9bvng9uB5Wb9",  
            "meta": {},  
            "fingerprint": "12341234",  
            "type": "bank_account",  
            "id": "BA1HMDp2rsC9bvng9uB5Wb9",  
            "credits_uri": "/v1/bank_accounts/BA1HMDp2rsC9bvng9uB5Wb9/credits" 
        } 
    } 
 

Credit a Merchant
-----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
    POST /v1/marketplaces/:marketplace_id/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. Must be **>=** your minimum credit amount but **<=** your maximum credit amount. 
 
``description`` 
    *optional* **string**.  
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``appears_on_statement_as`` 
    *optional* **string**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``destination_uri`` 
    *optional* **string**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 1234,  
        "description": "Something descriptive",  
        "bank_account": { 
            "account_type": "checking",  
            "account_number": "12341234",  
            "name": "Fit Finlay",  
            "bank_code": "325182797" 
        } 
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
        "status": "paid",  
        "account": null,  
        "description": "Something descriptive",  
        "created_at": "2012-11-07T01:10:43.697839Z",  
        "uri": "/v1/credits/CR4k1j2IiuU4D6tPBldulc7",  
        "amount": 1234,  
        "meta": {},  
        "id": "CR4k1j2IiuU4D6tPBldulc7",  
        "bank_account": { 
            "routing_number": "325182797",  
            "bank_name": "Banko De Ismus",  
            "account": null,  
            "name": "Fit Finlay",  
            "created_at": "2012-11-07T01:10:43.686419Z",  
            "uri": "/v1/bank_accounts/BA4jcymPvi9SczF4HRs31Ll",  
            "meta": {},  
            "fingerprint": "brown",  
            "type": "bank_account",  
            "id": "BA4jcymPvi9SczF4HRs31Ll",  
            "credits_uri": "/v1/bank_accounts/BA4jcymPvi9SczF4HRs31Ll/credits" 
        } 
    } 
 

Retrieve a Credit
-----------------

.. code:: 
 
    GET /v1/credits/:credit_id 
 

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
        "status": "paid",  
        "account": { 
            "holds_uri": "/v1/marketplaces/TEST-MP5yDpfz8ZxgnsIo80KifYL/accounts/AC5CUHwDJu022qf7oozpa4X/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T01:10:44.857308Z",  
            "uri": "/v1/marketplaces/TEST-MP5yDpfz8ZxgnsIo80KifYL/accounts/AC5CUHwDJu022qf7oozpa4X",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5yDpfz8ZxgnsIo80KifYL/accounts/AC5CUHwDJu022qf7oozpa4X/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5yDpfz8ZxgnsIo80KifYL/accounts/AC5CUHwDJu022qf7oozpa4X/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5yDpfz8ZxgnsIo80KifYL/accounts/AC5CUHwDJu022qf7oozpa4X/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5yDpfz8ZxgnsIo80KifYL/accounts/AC5CUHwDJu022qf7oozpa4X/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC5CUHwDJu022qf7oozpa4X",  
            "credits_uri": "/v1/marketplaces/TEST-MP5yDpfz8ZxgnsIo80KifYL/accounts/AC5CUHwDJu022qf7oozpa4X/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5yDpfz8ZxgnsIo80KifYL/accounts/AC5CUHwDJu022qf7oozpa4X/cards" 
        },  
        "description": "hiya",  
        "created_at": "2012-11-07T01:10:44.936921Z",  
        "uri": "/v1/credits/CR5Il1E5dj6UwbQghIvhcAP",  
        "amount": 1254,  
        "meta": {},  
        "id": "CR5Il1E5dj6UwbQghIvhcAP",  
        "bank_account": { 
            "routing_number": "325182797",  
            "bank_name": null,  
            "name": "Fit Finlay",  
            "created_at": "2012-11-07T01:10:44.860268Z",  
            "uri": "/v1/bank_accounts/BA5D45t7QwuGvLTKh9cAWrh",  
            "meta": {},  
            "fingerprint": "12341234",  
            "type": "bank_account",  
            "id": "BA5D45t7QwuGvLTKh9cAWrh",  
            "credits_uri": "/v1/bank_accounts/BA5D45t7QwuGvLTKh9cAWrh/credits" 
        } 
    } 
 

List All Credits
----------------

.. code:: 
 
    GET /v1/credits 
 

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
        "first_uri": "/v1/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "status": "paid",  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T01:10:46.121609Z",  
                    "uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC735exXGHO3NuQMPsg7TCH",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/cards" 
                },  
                "description": "hiya",  
                "created_at": "2012-11-07T01:10:46.189807Z",  
                "uri": "/v1/credits/CR77HMztUDSCOkRWoFtpqsH",  
                "amount": 1254,  
                "meta": {},  
                "id": "CR77HMztUDSCOkRWoFtpqsH",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T01:10:46.124098Z",  
                    "uri": "/v1/bank_accounts/BA73d8y1Uw1LgVancccR74n",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA73d8y1Uw1LgVancccR74n",  
                    "credits_uri": "/v1/bank_accounts/BA73d8y1Uw1LgVancccR74n/credits" 
                } 
            },  
            { 
                "status": "paid",  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T01:10:46.121609Z",  
                    "uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC735exXGHO3NuQMPsg7TCH",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6Yx6cJXX86FnSYumRRkY3/accounts/AC735exXGHO3NuQMPsg7TCH/cards" 
                },  
                "description": "hiya",  
                "created_at": "2012-11-07T01:10:46.207207Z",  
                "uri": "/v1/credits/CR790QPQK58ungNjIBl1ELp",  
                "amount": 431,  
                "meta": {},  
                "id": "CR790QPQK58ungNjIBl1ELp",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T01:10:46.124098Z",  
                    "uri": "/v1/bank_accounts/BA73d8y1Uw1LgVancccR74n",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA73d8y1Uw1LgVancccR74n",  
                    "credits_uri": "/v1/bank_accounts/BA73d8y1Uw1LgVancccR74n/credits" 
                } 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/credits?limit=10&offset=0" 
    } 
 

List All Credits for a Bank Account
-----------------------------------

.. code:: 
 
    GET /v1/bank_accounts/:bank_account_id/credits 
 

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
        "first_uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "status": "paid",  
                "account": null,  
                "description": "A description",  
                "created_at": "2012-11-07T01:10:47.484664Z",  
                "uri": "/v1/credits/CR8A4Z1hC1SnolTKdZSlFu3",  
                "amount": 1254,  
                "meta": {},  
                "id": "CR8A4Z1hC1SnolTKdZSlFu3",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "account": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T01:10:47.472894Z",  
                    "uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA8zgPBtT86Uz1PEETT1AK7",  
                    "credits_uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7/credits" 
                } 
            },  
            { 
                "status": "paid",  
                "account": null,  
                "description": "Another description",  
                "created_at": "2012-11-07T01:10:47.496532Z",  
                "uri": "/v1/credits/CR8AUK9sIuPb0oNzILDIa9Z",  
                "amount": 431,  
                "meta": {},  
                "id": "CR8AUK9sIuPb0oNzILDIa9Z",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "account": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T01:10:47.472894Z",  
                    "uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA8zgPBtT86Uz1PEETT1AK7",  
                    "credits_uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7/credits" 
                } 
            },  
            { 
                "status": "paid",  
                "account": null,  
                "description": "Yet another description",  
                "created_at": "2012-11-07T01:10:47.505647Z",  
                "uri": "/v1/credits/CR8Byj6CbK8w9XHHKlrBZ9V",  
                "amount": 5452,  
                "meta": {},  
                "id": "CR8Byj6CbK8w9XHHKlrBZ9V",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "account": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T01:10:47.472894Z",  
                    "uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA8zgPBtT86Uz1PEETT1AK7",  
                    "credits_uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7/credits" 
                } 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 3,  
        "next_uri": null,  
        "last_uri": "/v1/bank_accounts/BA8zgPBtT86Uz1PEETT1AK7/credits?limit=10&offset=0" 
    } 
 

List All Credits for a Merchant
-------------------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
    GET /v1/marketplaces/:marketplace_id/credits 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "status": "paid",  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T01:10:48.634414Z",  
                    "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC9Si9XOjRVhLL6BnH75tUn",  
                    "credits_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "created_at": "2012-11-07T01:10:48.703637Z",  
                "destination": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-11-07T01:10:48.638047Z",  
                    "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/bank_accounts/BA9StDnpN0B9JmYpoPu9oWv",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA9StDnpN0B9JmYpoPu9oWv",  
                    "credits_uri": "/v1/bank_accounts/BA9StDnpN0B9JmYpoPu9oWv/credits" 
                },  
                "state": "cleared",  
                "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/credits/CR9X3OvyUeb1sqWFYpPkHzJ",  
                "transaction_number": "CR985-173-7273",  
                "amount": 1254,  
                "meta": {},  
                "id": "CR9X3OvyUeb1sqWFYpPkHzJ",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-11-07T01:10:48.638047Z",  
                    "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/bank_accounts/BA9StDnpN0B9JmYpoPu9oWv",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA9StDnpN0B9JmYpoPu9oWv",  
                    "credits_uri": "/v1/bank_accounts/BA9StDnpN0B9JmYpoPu9oWv/credits" 
                },  
                "available_at": "2012-11-07T09:10:48.691764Z" 
            },  
            { 
                "status": "paid",  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T01:10:48.634414Z",  
                    "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC9Si9XOjRVhLL6BnH75tUn",  
                    "credits_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "created_at": "2012-11-07T01:10:48.717394Z",  
                "destination": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-11-07T01:10:48.638047Z",  
                    "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/bank_accounts/BA9StDnpN0B9JmYpoPu9oWv",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA9StDnpN0B9JmYpoPu9oWv",  
                    "credits_uri": "/v1/bank_accounts/BA9StDnpN0B9JmYpoPu9oWv/credits" 
                },  
                "state": "cleared",  
                "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/credits/CR9Y42kqM0FyXrvLB2GxAYj",  
                "transaction_number": "CR587-303-7800",  
                "amount": 431,  
                "meta": {},  
                "id": "CR9Y42kqM0FyXrvLB2GxAYj",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-11-07T01:10:48.638047Z",  
                    "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/accounts/AC9Si9XOjRVhLL6BnH75tUn/bank_accounts/BA9StDnpN0B9JmYpoPu9oWv",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA9StDnpN0B9JmYpoPu9oWv",  
                    "credits_uri": "/v1/bank_accounts/BA9StDnpN0B9JmYpoPu9oWv/credits" 
                },  
                "available_at": "2012-11-07T09:10:48.696648Z" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP9Mk0koHNUte6pLbnhyeQj/credits?limit=10&offset=0" 
    } 
 

