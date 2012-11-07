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
 
``trace_number`` 
    **string**. Used by the ACH network to track transactions. 
 
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
        "created_at": "2012-11-07T00:52:42.407049Z",  
        "uri": "/v1/credits/CR3PmDe27nArsspdijSMqyv9",  
        "amount": 1234,  
        "meta": {},  
        "trace_number": null,  
        "id": "CR3PmDe27nArsspdijSMqyv9",  
        "bank_account": { 
            "routing_number": "325182797",  
            "bank_name": "Banko De Ismus",  
            "account": null,  
            "name": "Fit Finlay",  
            "created_at": "2012-11-07T00:52:42.397227Z",  
            "uri": "/v1/bank_accounts/BA3PlW0zF8j2RVasY88fzzAD",  
            "meta": {},  
            "fingerprint": "brown",  
            "type": "bank_account",  
            "id": "BA3PlW0zF8j2RVasY88fzzAD",  
            "credits_uri": "/v1/bank_accounts/BA3PlW0zF8j2RVasY88fzzAD/credits" 
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
        "created_at": "2012-11-07T00:52:44.666777Z",  
        "uri": "/v1/credits/CR3RUcKOHiFUxo90tkgrPXQD",  
        "amount": 1234,  
        "meta": {},  
        "trace_number": null,  
        "id": "CR3RUcKOHiFUxo90tkgrPXQD",  
        "bank_account": { 
            "routing_number": "325182797",  
            "bank_name": null,  
            "account": null,  
            "name": "Fit Finlay",  
            "created_at": "2012-11-07T00:52:44.619084Z",  
            "uri": "/v1/bank_accounts/BA3RQTz12rVgnw0ZlwcMZqYX",  
            "meta": {},  
            "fingerprint": "12341234",  
            "type": "bank_account",  
            "id": "BA3RQTz12rVgnw0ZlwcMZqYX",  
            "credits_uri": "/v1/bank_accounts/BA3RQTz12rVgnw0ZlwcMZqYX/credits" 
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
        "created_at": "2012-11-07T00:52:46.867797Z",  
        "uri": "/v1/credits/CR3UnHSVyrKSfa09TEtj93mr",  
        "amount": 1234,  
        "meta": {},  
        "trace_number": null,  
        "id": "CR3UnHSVyrKSfa09TEtj93mr",  
        "bank_account": { 
            "routing_number": "325182797",  
            "bank_name": "Banko De Ismus",  
            "account": null,  
            "name": "Fit Finlay",  
            "created_at": "2012-11-07T00:52:46.859039Z",  
            "uri": "/v1/bank_accounts/BA3Un5bjDOCdsXveMmA16ReH",  
            "meta": {},  
            "fingerprint": "brown",  
            "type": "bank_account",  
            "id": "BA3Un5bjDOCdsXveMmA16ReH",  
            "credits_uri": "/v1/bank_accounts/BA3Un5bjDOCdsXveMmA16ReH/credits" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP3Vr5Ad7HxlgECBzmZnVe03/accounts/AC3VwKUtvWciSGSq11Xkeurh/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:52:47.886450Z",  
            "uri": "/v1/marketplaces/TEST-MP3Vr5Ad7HxlgECBzmZnVe03/accounts/AC3VwKUtvWciSGSq11Xkeurh",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3Vr5Ad7HxlgECBzmZnVe03/accounts/AC3VwKUtvWciSGSq11Xkeurh/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP3Vr5Ad7HxlgECBzmZnVe03/accounts/AC3VwKUtvWciSGSq11Xkeurh/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP3Vr5Ad7HxlgECBzmZnVe03/accounts/AC3VwKUtvWciSGSq11Xkeurh/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP3Vr5Ad7HxlgECBzmZnVe03/accounts/AC3VwKUtvWciSGSq11Xkeurh/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC3VwKUtvWciSGSq11Xkeurh",  
            "credits_uri": "/v1/marketplaces/TEST-MP3Vr5Ad7HxlgECBzmZnVe03/accounts/AC3VwKUtvWciSGSq11Xkeurh/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP3Vr5Ad7HxlgECBzmZnVe03/accounts/AC3VwKUtvWciSGSq11Xkeurh/cards" 
        },  
        "description": "hiya",  
        "created_at": "2012-11-07T00:52:47.968209Z",  
        "uri": "/v1/credits/CR3VCnxtsXkftRp1FEbbXHnd",  
        "amount": 1254,  
        "meta": {},  
        "trace_number": null,  
        "id": "CR3VCnxtsXkftRp1FEbbXHnd",  
        "bank_account": { 
            "routing_number": "325182797",  
            "bank_name": null,  
            "name": "Fit Finlay",  
            "created_at": "2012-11-07T00:52:47.890857Z",  
            "uri": "/v1/bank_accounts/BA3VwWq24zQoZLxfBmZVF81Z",  
            "meta": {},  
            "fingerprint": "12341234",  
            "type": "bank_account",  
            "id": "BA3VwWq24zQoZLxfBmZVF81Z",  
            "credits_uri": "/v1/bank_accounts/BA3VwWq24zQoZLxfBmZVF81Z/credits" 
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
                    "holds_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:52:48.994593Z",  
                    "uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC3WM1KxY1aDHuVPwJzQ54Ov",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/cards" 
                },  
                "description": "hiya",  
                "created_at": "2012-11-07T00:52:49.074603Z",  
                "uri": "/v1/credits/CR3WRxY1vuQuBYdHA5308jm3",  
                "amount": 1254,  
                "meta": {},  
                "trace_number": null,  
                "id": "CR3WRxY1vuQuBYdHA5308jm3",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T00:52:48.998294Z",  
                    "uri": "/v1/bank_accounts/BA3WMdJRgDlJHh82yhkplr91",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3WMdJRgDlJHh82yhkplr91",  
                    "credits_uri": "/v1/bank_accounts/BA3WMdJRgDlJHh82yhkplr91/credits" 
                } 
            },  
            { 
                "status": "paid",  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:52:48.994593Z",  
                    "uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC3WM1KxY1aDHuVPwJzQ54Ov",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3WG3OA8BPWWiXhMkFeDaiT/accounts/AC3WM1KxY1aDHuVPwJzQ54Ov/cards" 
                },  
                "description": "hiya",  
                "created_at": "2012-11-07T00:52:49.086652Z",  
                "uri": "/v1/credits/CR3WSrhe7RPfVCNygMgNlOgP",  
                "amount": 431,  
                "meta": {},  
                "trace_number": null,  
                "id": "CR3WSrhe7RPfVCNygMgNlOgP",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T00:52:48.998294Z",  
                    "uri": "/v1/bank_accounts/BA3WMdJRgDlJHh82yhkplr91",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3WMdJRgDlJHh82yhkplr91",  
                    "credits_uri": "/v1/bank_accounts/BA3WMdJRgDlJHh82yhkplr91/credits" 
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
        "first_uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "status": "paid",  
                "account": null,  
                "description": "A description",  
                "created_at": "2012-11-07T00:52:50.225384Z",  
                "uri": "/v1/credits/CR3Y9MLugLWvrL0FfeHmlChR",  
                "amount": 1254,  
                "meta": {},  
                "trace_number": null,  
                "id": "CR3Y9MLugLWvrL0FfeHmlChR",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "account": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T00:52:50.213614Z",  
                    "uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3Y90WOSZfOr6pGglk0L3c7",  
                    "credits_uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7/credits" 
                } 
            },  
            { 
                "status": "paid",  
                "account": null,  
                "description": "Another description",  
                "created_at": "2012-11-07T00:52:50.237004Z",  
                "uri": "/v1/credits/CR3YaDpiMHkKsLM9rV623rbB",  
                "amount": 431,  
                "meta": {},  
                "trace_number": null,  
                "id": "CR3YaDpiMHkKsLM9rV623rbB",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "account": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T00:52:50.213614Z",  
                    "uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3Y90WOSZfOr6pGglk0L3c7",  
                    "credits_uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7/credits" 
                } 
            },  
            { 
                "status": "paid",  
                "account": null,  
                "description": "Yet another description",  
                "created_at": "2012-11-07T00:52:50.245921Z",  
                "uri": "/v1/credits/CR3YbghDtb0wsxvTsOwtVe6f",  
                "amount": 5452,  
                "meta": {},  
                "trace_number": null,  
                "id": "CR3YbghDtb0wsxvTsOwtVe6f",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "account": null,  
                    "name": "Fit Finlay",  
                    "created_at": "2012-11-07T00:52:50.213614Z",  
                    "uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7",  
                    "meta": {},  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3Y90WOSZfOr6pGglk0L3c7",  
                    "credits_uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7/credits" 
                } 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 3,  
        "next_uri": null,  
        "last_uri": "/v1/bank_accounts/BA3Y90WOSZfOr6pGglk0L3c7/credits?limit=10&offset=0" 
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
        "first_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "status": "paid",  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:52:51.295149Z",  
                    "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC3ZmsglW5H497yctVAHMNW3",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "created_at": "2012-11-07T00:52:51.380220Z",  
                "destination": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-11-07T00:52:51.298866Z",  
                    "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/bank_accounts/BA3ZmE0VaUT7XZxMwvYVMtqP",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3ZmE0VaUT7XZxMwvYVMtqP",  
                    "credits_uri": "/v1/bank_accounts/BA3ZmE0VaUT7XZxMwvYVMtqP/credits" 
                },  
                "state": "cleared",  
                "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/credits/CR3ZsgD7gKkhYuG1LgeXCF9N",  
                "transaction_number": "CR596-856-7339",  
                "amount": 1254,  
                "meta": {},  
                "trace_number": null,  
                "id": "CR3ZsgD7gKkhYuG1LgeXCF9N",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-11-07T00:52:51.298866Z",  
                    "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/bank_accounts/BA3ZmE0VaUT7XZxMwvYVMtqP",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3ZmE0VaUT7XZxMwvYVMtqP",  
                    "credits_uri": "/v1/bank_accounts/BA3ZmE0VaUT7XZxMwvYVMtqP/credits" 
                },  
                "available_at": "2012-11-07T08:52:51.362311Z" 
            },  
            { 
                "status": "paid",  
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-11-07T00:52:51.295149Z",  
                    "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/transactions",  
                    "email_address": "email.3@y.com",  
                    "id": "AC3ZmsglW5H497yctVAHMNW3",  
                    "credits_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/cards" 
                },  
                "fee": 25,  
                "description": "hiya",  
                "created_at": "2012-11-07T00:52:51.397190Z",  
                "destination": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-11-07T00:52:51.298866Z",  
                    "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/bank_accounts/BA3ZmE0VaUT7XZxMwvYVMtqP",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3ZmE0VaUT7XZxMwvYVMtqP",  
                    "credits_uri": "/v1/bank_accounts/BA3ZmE0VaUT7XZxMwvYVMtqP/credits" 
                },  
                "state": "cleared",  
                "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/credits/CR3ZtxEAIbiDVsEWGlFSk9tV",  
                "transaction_number": "CR726-274-9938",  
                "amount": 431,  
                "meta": {},  
                "trace_number": null,  
                "id": "CR3ZtxEAIbiDVsEWGlFSk9tV",  
                "bank_account": { 
                    "routing_number": "325182797",  
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-11-07T00:52:51.298866Z",  
                    "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/accounts/AC3ZmsglW5H497yctVAHMNW3/bank_accounts/BA3ZmE0VaUT7XZxMwvYVMtqP",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "fingerprint": "12341234",  
                    "type": "bank_account",  
                    "id": "BA3ZmE0VaUT7XZxMwvYVMtqP",  
                    "credits_uri": "/v1/bank_accounts/BA3ZmE0VaUT7XZxMwvYVMtqP/credits" 
                },  
                "available_at": "2012-11-07T08:52:51.368917Z" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP3ZguLsEHg5XJNPrPvhddt1/credits?limit=10&offset=0" 
    } 
 

