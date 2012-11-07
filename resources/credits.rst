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
    **string**.  
 
``uri`` 
    **string**.  
 
``amount`` 
    **integer**. Amount of the credit. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_. 
 
``description`` 
    **string**.  
 
``account`` 
    **object**. `Accounts <./accounts.rst>`_. Present if the credit went to a merchant instead of directly to a bank account. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``bank_account`` 
    **object**. `Bank Account <./bank_accounts.rst>`_. 
 
``status`` 
    **string**. One of ``pending``, ``paid``, ``failed``. 
 

Deprecated
~~~~~~~~~~

``destination`` 
    **object**. The funding destination for this credit (i.e., a bank account). 
 
``state`` 
    **string**. Use ``status`` instead. 
 
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
    *required* **object**. `BankAccount <./bank_accounts.rst>`_. 
 
``description`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 1234,  
        "description": "Something descriptive",  
        "bank_account": { 
            "account_number": "12341234",  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "type": "checking" 
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
        "account": null,  
        "amount": 1234,  
        "bank_account": { 
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T11:55:09.702836Z",  
            "credits_uri": "/v1/bank_accounts/BAh1VRD14pBdWfeh0VeBeAY/credits",  
            "fingerprint": "brown",  
            "id": "BAh1VRD14pBdWfeh0VeBeAY",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BAh1VRD14pBdWfeh0VeBeAY" 
        },  
        "created_at": "2012-11-07T11:55:09.714080Z",  
        "description": "Something descriptive",  
        "id": "CRh2JXyLDZiNcRJdOaB4TqI",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CRh2JXyLDZiNcRJdOaB4TqI" 
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
        "account": null,  
        "amount": 1234,  
        "bank_account": { 
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T11:55:11.917959Z",  
            "credits_uri": "/v1/bank_accounts/BAjwrgMaQ2bPNui6ALIm9ko/credits",  
            "fingerprint": "12341234",  
            "id": "BAjwrgMaQ2bPNui6ALIm9ko",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BAjwrgMaQ2bPNui6ALIm9ko" 
        },  
        "created_at": "2012-11-07T11:55:11.966073Z",  
        "description": "A description",  
        "id": "CRjzMyAbQ0SgW8Lm7bFFv0w",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CRjzMyAbQ0SgW8Lm7bFFv0w" 
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
            "account_number": "12341234",  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "type": "checking" 
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
        "account": null,  
        "amount": 1234,  
        "bank_account": { 
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T11:55:14.138702Z",  
            "credits_uri": "/v1/bank_accounts/BAm1fyfalg2u3xQ8gF7fpkM/credits",  
            "fingerprint": "brown",  
            "id": "BAm1fyfalg2u3xQ8gF7fpkM",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BAm1fyfalg2u3xQ8gF7fpkM" 
        },  
        "created_at": "2012-11-07T11:55:14.146830Z",  
        "description": "Something descriptive",  
        "id": "CRm1ScDEdDyTAtjA4H3JwCE",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CRm1ScDEdDyTAtjA4H3JwCE" 
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
        "account": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPn5OaMm17zXPrGXclSDkNe/accounts/ACnacF5VR25r8lLNfnTXIUc/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MPn5OaMm17zXPrGXclSDkNe/accounts/ACnacF5VR25r8lLNfnTXIUc/cards",  
            "created_at": "2012-11-07T11:55:15.155132Z",  
            "credits_uri": "/v1/marketplaces/TEST-MPn5OaMm17zXPrGXclSDkNe/accounts/ACnacF5VR25r8lLNfnTXIUc/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MPn5OaMm17zXPrGXclSDkNe/accounts/ACnacF5VR25r8lLNfnTXIUc/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MPn5OaMm17zXPrGXclSDkNe/accounts/ACnacF5VR25r8lLNfnTXIUc/holds",  
            "id": "ACnacF5VR25r8lLNfnTXIUc",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MPn5OaMm17zXPrGXclSDkNe/accounts/ACnacF5VR25r8lLNfnTXIUc/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MPn5OaMm17zXPrGXclSDkNe/accounts/ACnacF5VR25r8lLNfnTXIUc/transactions",  
            "uri": "/v1/marketplaces/TEST-MPn5OaMm17zXPrGXclSDkNe/accounts/ACnacF5VR25r8lLNfnTXIUc" 
        },  
        "amount": 1254,  
        "bank_account": { 
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-11-07T11:55:15.157974Z",  
            "credits_uri": "/v1/bank_accounts/BAnalCv6KiIzzJuEphURRmA/credits",  
            "fingerprint": "12341234",  
            "id": "BAnalCv6KiIzzJuEphURRmA",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BAnalCv6KiIzzJuEphURRmA" 
        },  
        "created_at": "2012-11-07T11:55:15.236028Z",  
        "description": "hiya",  
        "id": "CRnfIycpdTq21GtWxJRx89e",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CRnfIycpdTq21GtWxJRx89e" 
    } 
 

List All Credits
----------------

.. code:: 
 
    GET /v1/credits 
 

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
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/cards",  
                    "created_at": "2012-11-07T11:55:16.281910Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/holds",  
                    "id": "ACoqMm1MXhhB5a9hevCXPIE",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE" 
                },  
                "amount": 1254,  
                "bank_account": { 
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:16.284724Z",  
                    "credits_uri": "/v1/bank_accounts/BAoqUW75nxbAa9o29qn8p6Y/credits",  
                    "fingerprint": "12341234",  
                    "id": "BAoqUW75nxbAa9o29qn8p6Y",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BAoqUW75nxbAa9o29qn8p6Y" 
                },  
                "created_at": "2012-11-07T11:55:16.358288Z",  
                "description": "hiya",  
                "id": "CRovXzzqaKh0FiDMosRiuDq",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CRovXzzqaKh0FiDMosRiuDq" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/cards",  
                    "created_at": "2012-11-07T11:55:16.281910Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/holds",  
                    "id": "ACoqMm1MXhhB5a9hevCXPIE",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPom8AGfp2sYcwgn8z1yOi0/accounts/ACoqMm1MXhhB5a9hevCXPIE" 
                },  
                "amount": 431,  
                "bank_account": { 
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:16.284724Z",  
                    "credits_uri": "/v1/bank_accounts/BAoqUW75nxbAa9o29qn8p6Y/credits",  
                    "fingerprint": "12341234",  
                    "id": "BAoqUW75nxbAa9o29qn8p6Y",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BAoqUW75nxbAa9o29qn8p6Y" 
                },  
                "created_at": "2012-11-07T11:55:16.375373Z",  
                "description": "hiya",  
                "id": "CRoxfZCTzGliQAuic8SxKtK",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CRoxfZCTzGliQAuic8SxKtK" 
            } 
        ],  
        "limit": 10,  
        "offset": 0,  
        "total": 2 
    } 
 

List All Credits for a Bank Account
-----------------------------------

.. code:: 
 
    GET /v1/bank_accounts/:bank_account_id/credits 
 

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
                "account": null,  
                "amount": 1254,  
                "bank_account": { 
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:17.479929Z",  
                    "credits_uri": "/v1/bank_accounts/BApMiuPLUzJ54RjyyKyAPA0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BApMiuPLUzJ54RjyyKyAPA0",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BApMiuPLUzJ54RjyyKyAPA0" 
                },  
                "created_at": "2012-11-07T11:55:17.487971Z",  
                "description": "A description",  
                "id": "CRpMPRFtExlfZJvHOZBBFFG",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CRpMPRFtExlfZJvHOZBBFFG" 
            },  
            { 
                "account": null,  
                "amount": 431,  
                "bank_account": { 
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:17.479929Z",  
                    "credits_uri": "/v1/bank_accounts/BApMiuPLUzJ54RjyyKyAPA0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BApMiuPLUzJ54RjyyKyAPA0",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BApMiuPLUzJ54RjyyKyAPA0" 
                },  
                "created_at": "2012-11-07T11:55:17.495652Z",  
                "description": "Another description",  
                "id": "CRpNoNNZcZMZH9slp0UZS4s",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CRpNoNNZcZMZH9slp0UZS4s" 
            },  
            { 
                "account": null,  
                "amount": 5452,  
                "bank_account": { 
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:17.479929Z",  
                    "credits_uri": "/v1/bank_accounts/BApMiuPLUzJ54RjyyKyAPA0/credits",  
                    "fingerprint": "12341234",  
                    "id": "BApMiuPLUzJ54RjyyKyAPA0",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BApMiuPLUzJ54RjyyKyAPA0" 
                },  
                "created_at": "2012-11-07T11:55:17.502714Z",  
                "description": "Yet another description",  
                "id": "CRpNSnPbTsytFi4EvrAT15y",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CRpNSnPbTsytFi4EvrAT15y" 
            } 
        ],  
        "limit": 10,  
        "offset": 0,  
        "total": 3 
    } 
 

List All Credits for a Merchant
-------------------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
    GET /v1/marketplaces/:marketplace_id/credits 
 

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
        "first_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/cards",  
                    "created_at": "2012-11-07T11:55:18.602465Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/holds",  
                    "id": "ACr2AoZR7buSLp6PtQSKn76",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76" 
                },  
                "amount": 1254,  
                "available_at": "2012-11-07T19:55:18.659018Z",  
                "bank_account": { 
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:18.606052Z",  
                    "credits_uri": "/v1/bank_accounts/BAr2LK6giRpj9XeZvlBDKZe/credits",  
                    "fingerprint": "12341234",  
                    "id": "BAr2LK6giRpj9XeZvlBDKZe",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/bank_accounts/BAr2LK6giRpj9XeZvlBDKZe" 
                },  
                "created_at": "2012-11-07T11:55:18.672163Z",  
                "description": "hiya",  
                "destination": { 
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:18.606052Z",  
                    "credits_uri": "/v1/bank_accounts/BAr2LK6giRpj9XeZvlBDKZe/credits",  
                    "fingerprint": "12341234",  
                    "id": "BAr2LK6giRpj9XeZvlBDKZe",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/bank_accounts/BAr2LK6giRpj9XeZvlBDKZe" 
                },  
                "fee": 25,  
                "id": "CRr7mWdWwt2PQNxhgcvkV0g",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR480-504-9537",  
                "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/credits/CRr7mWdWwt2PQNxhgcvkV0g" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/cards",  
                    "created_at": "2012-11-07T11:55:18.602465Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/holds",  
                    "id": "ACr2AoZR7buSLp6PtQSKn76",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/transactions",  
                    "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76" 
                },  
                "amount": 431,  
                "available_at": "2012-11-07T19:55:18.664217Z",  
                "bank_account": { 
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:18.606052Z",  
                    "credits_uri": "/v1/bank_accounts/BAr2LK6giRpj9XeZvlBDKZe/credits",  
                    "fingerprint": "12341234",  
                    "id": "BAr2LK6giRpj9XeZvlBDKZe",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/bank_accounts/BAr2LK6giRpj9XeZvlBDKZe" 
                },  
                "created_at": "2012-11-07T11:55:18.686234Z",  
                "description": "hiya",  
                "destination": { 
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-11-07T11:55:18.606052Z",  
                    "credits_uri": "/v1/bank_accounts/BAr2LK6giRpj9XeZvlBDKZe/credits",  
                    "fingerprint": "12341234",  
                    "id": "BAr2LK6giRpj9XeZvlBDKZe",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/accounts/ACr2AoZR7buSLp6PtQSKn76/bank_accounts/BAr2LK6giRpj9XeZvlBDKZe" 
                },  
                "fee": 25,  
                "id": "CRr8pwoWHQb0RjUjitG3msY",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR338-780-0224",  
                "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/credits/CRr8pwoWHQb0RjUjitG3msY" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/credits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MPqWJafjou8OXjfRuVouRBa/credits?limit=10&offset=0" 
    } 
 

