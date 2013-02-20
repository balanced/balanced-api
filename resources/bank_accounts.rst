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
    **object**.  
 

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
        "created_at": "2013-02-20T19:54:09.206636Z",  
        "credits_uri": "/v1/bank_accounts/BA2ghoq2BU2pa8druXxMpX6b/credits",  
        "fingerprint": "brown",  
        "id": "BA2ghoq2BU2pa8druXxMpX6b",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA2ghoq2BU2pa8druXxMpX6b",  
        "verification_uri": null,  
        "verifications_uri": "/v1/bank_accounts/BA2ghoq2BU2pa8druXxMpX6b/verifications" 
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
        "created_at": "2013-02-20T19:54:11.896235Z",  
        "credits_uri": "/v1/bank_accounts/BA2jiYgB2gLQ4cHpxmrakJkn/credits",  
        "fingerprint": "12341234",  
        "id": "BA2jiYgB2gLQ4cHpxmrakJkn",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/bank_accounts/BA2jiYgB2gLQ4cHpxmrakJkn",  
        "verification_uri": null,  
        "verifications_uri": "/v1/bank_accounts/BA2jiYgB2gLQ4cHpxmrakJkn/verifications" 
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
                "created_at": "2013-02-20T19:54:14.471102Z",  
                "credits_uri": "/v1/bank_accounts/BA2mcuf7ol99qNp4w71lASHN/credits",  
                "fingerprint": "12341234",  
                "id": "BA2mcuf7ol99qNp4w71lASHN",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2mcuf7ol99qNp4w71lASHN",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA2mcuf7ol99qNp4w71lASHN/verifications" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-20T19:54:14.470659Z",  
                "credits_uri": "/v1/bank_accounts/BA2mctW75fByVa9XIDnqWidB/credits",  
                "fingerprint": "12341234",  
                "id": "BA2mctW75fByVa9XIDnqWidB",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2mctW75fByVa9XIDnqWidB",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA2mctW75fByVa9XIDnqWidB/verifications" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-20T19:54:14.425262Z",  
                "credits_uri": "/v1/bank_accounts/BA2m9iHwVnqgPpC42UQc8BrB/credits",  
                "fingerprint": "12341234",  
                "id": "BA2m9iHwVnqgPpC42UQc8BrB",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2m9iHwVnqgPpC42UQc8BrB",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA2m9iHwVnqgPpC42UQc8BrB/verifications" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-20T19:54:14.411148Z",  
                "credits_uri": "/v1/bank_accounts/BA2m8lvjTNx1sV48R1HWoxHl/credits",  
                "fingerprint": "12341234",  
                "id": "BA2m8lvjTNx1sV48R1HWoxHl",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2m8lvjTNx1sV48R1HWoxHl",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA2m8lvjTNx1sV48R1HWoxHl/verifications" 
            },  
            { 
                "account_number": "xxxxx1234",  
                "bank_name": "Banko De Ismus",  
                "can_debit": true,  
                "created_at": "2013-02-20T19:54:14.386118Z",  
                "credits_uri": "/v1/bank_accounts/BA2m6x8z8V42doqoOvpi0uoX/credits",  
                "fingerprint": "12341234",  
                "id": "BA2m6x8z8V42doqoOvpi0uoX",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/bank_accounts/BA2m6x8z8V42doqoOvpi0uoX",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA2m6x8z8V42doqoOvpi0uoX/verifications" 
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
        "first_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/cards",  
                    "created_at": "2013-02-20T19:54:17.021329Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/holds",  
                    "id": "AC2p4mQiTFyw9KTRyQ2norib",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-20T19:54:17.022247Z",  
                "credits_uri": "/v1/bank_accounts/BA2p4qkpn4x01oCWfhVsHxjt/credits",  
                "fingerprint": "12341234",  
                "id": "BA2p4qkpn4x01oCWfhVsHxjt",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts/BA2p4qkpn4x01oCWfhVsHxjt",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA2p4qkpn4x01oCWfhVsHxjt/verifications" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/cards",  
                    "created_at": "2013-02-20T19:54:17.021329Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/holds",  
                    "id": "AC2p4mQiTFyw9KTRyQ2norib",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-20T19:54:17.078474Z",  
                "credits_uri": "/v1/bank_accounts/BA2p8kOm4hoVzbepOceEzV75/credits",  
                "fingerprint": "12341234",  
                "id": "BA2p8kOm4hoVzbepOceEzV75",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts/BA2p8kOm4hoVzbepOceEzV75",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA2p8kOm4hoVzbepOceEzV75/verifications" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/cards",  
                    "created_at": "2013-02-20T19:54:17.021329Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/holds",  
                    "id": "AC2p4mQiTFyw9KTRyQ2norib",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib" 
                },  
                "account_number": "xxxxx1234",  
                "bank_code": "325182797",  
                "bank_name": "Banko De Ismus",  
                "can_debit": false,  
                "created_at": "2013-02-20T19:54:17.079001Z",  
                "credits_uri": "/v1/bank_accounts/BA2p8l6SsEJfk2j4Pa9gwRvd/credits",  
                "fingerprint": "12341234",  
                "id": "BA2p8l6SsEJfk2j4Pa9gwRvd",  
                "is_valid": true,  
                "last_four": "1234",  
                "meta": {},  
                "name": "Fit Finlay",  
                "routing_number": "325182797",  
                "type": "checking",  
                "uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts/BA2p8l6SsEJfk2j4Pa9gwRvd",  
                "verification_uri": null,  
                "verifications_uri": "/v1/bank_accounts/BA2p8l6SsEJfk2j4Pa9gwRvd/verifications" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP2oZCETHMJKMmrnTruzqOrh/accounts/AC2p4mQiTFyw9KTRyQ2norib/bank_accounts?limit=10&offset=0" 
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
        "account_uri": "/v1/marketplaces/TEST-MP2s9072KY2drhKGeTJXDTQT/accounts/AC2sc8YuAnonslR8DVnkp7ID" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ/cards",  
            "created_at": "2013-02-20T19:54:22.662252Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ/holds",  
            "id": "AC2vpITSeaiVurTUJkzAA2VJ",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ/transactions",  
            "uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ" 
        },  
        "account_number": "xxxxx1234",  
        "bank_code": "325182797",  
        "bank_name": "Banko De Ismus",  
        "can_debit": false,  
        "created_at": "2013-02-20T19:54:22.719769Z",  
        "credits_uri": "/v1/bank_accounts/BA2vtJqQYFLijHTgnx7kpcvV/credits",  
        "fingerprint": "12341234",  
        "id": "BA2vtJqQYFLijHTgnx7kpcvV",  
        "is_valid": true,  
        "last_four": "1234",  
        "meta": {},  
        "name": "Fit Finlay",  
        "routing_number": "325182797",  
        "type": "checking",  
        "uri": "/v1/marketplaces/TEST-MP2vmp2fXvFwzVqyKnM7fcCD/accounts/AC2vpITSeaiVurTUJkzAA2VJ/bank_accounts/BA2vtJqQYFLijHTgnx7kpcvV",  
        "verification_uri": null,  
        "verifications_uri": "/v1/bank_accounts/BA2vtJqQYFLijHTgnx7kpcvV/verifications" 
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
 

