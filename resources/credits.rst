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

``fee`` 
    **null**. The fee charged by Balanced. 
 
``destination`` 
    **object**. The funding destination for this credit (i.e., a bank account). 
 
``state`` 
    **string**. Use ``status`` instead. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``available_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    credit will be available to the merchant. 
 

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
    .. cssclass:: nested1 
 
    *required* **object**. `BankAccount <./bank_accounts.rst>`_. 
 
``description`` 
    *optional* **string** or **null**. Sequence of characters. 
 

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
        "amount": 1234,  
        "bank_account": { 
            "account_number": "xxxx1234",  
            "bank_name": "Banko De Ismus",  
            "fingerprint": "brown",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking" 
        },  
        "created_at": "2012-12-20T03:06:28.574158Z",  
        "description": "Something descriptive",  
        "id": "CR1VBxjzGaOZ9ahYXobWsU6f",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR1VBxjzGaOZ9ahYXobWsU6f" 
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
    *optional* **string** or **null**. Sequence of characters. 
 

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
        "amount": 1234,  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-12-20T03:06:33.510123Z",  
            "credits_uri": "/v1/bank_accounts/BA219FnxKKTyUBEaqkVeEmCT/credits",  
            "fingerprint": "12341234",  
            "id": "BA219FnxKKTyUBEaqkVeEmCT",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA219FnxKKTyUBEaqkVeEmCT" 
        },  
        "created_at": "2012-12-20T03:06:33.561301Z",  
        "description": "A description",  
        "id": "CR21diuNJC8X0QrFWnnDRbPl",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR21diuNJC8X0QrFWnnDRbPl" 
    } 
 

Credit a Merchant
-----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. Must be **>=** your minimum credit amount but **<=** your maximum credit amount. 
 
``description`` 
    *optional* **string** or **null**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``appears_on_statement_as`` 
    *optional* **string**. Text that will appear on the merchant's statement. Characters that can be 
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
        "amount": 1234 
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
        "account": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/cards",  
            "created_at": "2012-12-20T03:06:38.290180Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/holds",  
            "id": "AC26x5G7Ax0M2m2NNtb7nu2T",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/transactions",  
            "uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T" 
        },  
        "amount": 1234,  
        "available_at": "2012-12-20T03:06:38.418759Z",  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "account_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T",  
            "bank_code": "325182797",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-12-20T03:06:38.295463Z",  
            "credits_uri": "/v1/bank_accounts/BA26xjxv2H7EJ9XcnDTtIZz5/credits",  
            "fingerprint": "12341234",  
            "id": "BA26xjxv2H7EJ9XcnDTtIZz5",  
            "is_valid": true,  
            "last_four": "1234",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/bank_accounts/BA26xjxv2H7EJ9XcnDTtIZz5" 
        },  
        "created_at": "2012-12-20T03:06:38.430297Z",  
        "description": null,  
        "destination": { 
            "account_number": "xxxxx1234",  
            "account_uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T",  
            "bank_code": "325182797",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-12-20T03:06:38.295463Z",  
            "credits_uri": "/v1/bank_accounts/BA26xjxv2H7EJ9XcnDTtIZz5/credits",  
            "fingerprint": "12341234",  
            "id": "BA26xjxv2H7EJ9XcnDTtIZz5",  
            "is_valid": true,  
            "last_four": "1234",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/bank_accounts/BA26xjxv2H7EJ9XcnDTtIZz5" 
        },  
        "fee": null,  
        "id": "CR26GLXq7MGHeQazdGuoF52X",  
        "meta": {},  
        "state": "cleared",  
        "status": "paid",  
        "transaction_number": "CR136-510-5571",  
        "uri": "/v1/marketplaces/TEST-MP26qGIPaYIDPBsZpIWZ9BN9/accounts/AC26x5G7Ax0M2m2NNtb7nu2T/credits/CR26GLXq7MGHeQazdGuoF52X" 
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
        "amount": 1254,  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-12-20T03:06:40.761304Z",  
            "credits_uri": "/v1/bank_accounts/BA29jhCf0f8Ko0BDSJQO495F/credits",  
            "fingerprint": "12341234",  
            "id": "BA29jhCf0f8Ko0BDSJQO495F",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA29jhCf0f8Ko0BDSJQO495F" 
        },  
        "created_at": "2012-12-20T03:06:40.848798Z",  
        "description": "hiya",  
        "id": "CR29poAYot0CTqAjW6r0kZs7",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR29poAYot0CTqAjW6r0kZs7" 
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
                "amount": 1254,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:43.237360Z",  
                    "credits_uri": "/v1/bank_accounts/BA2c5WSPHF3FrXT5dykJzzer/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2c5WSPHF3FrXT5dykJzzer",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA2c5WSPHF3FrXT5dykJzzer" 
                },  
                "created_at": "2012-12-20T03:06:43.321758Z",  
                "description": "hiya",  
                "id": "CR2cbPn3dSzbOKPLInTQjhTB",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR2cbPn3dSzbOKPLInTQjhTB" 
            },  
            { 
                "amount": 431,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:43.237360Z",  
                    "credits_uri": "/v1/bank_accounts/BA2c5WSPHF3FrXT5dykJzzer/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2c5WSPHF3FrXT5dykJzzer",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA2c5WSPHF3FrXT5dykJzzer" 
                },  
                "created_at": "2012-12-20T03:06:43.340315Z",  
                "description": "hiya",  
                "id": "CR2cdevF4WXesLEUn3vneE5d",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR2cdevF4WXesLEUn3vneE5d" 
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
                "amount": 1254,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:45.713810Z",  
                    "credits_uri": "/v1/bank_accounts/BA2eSIA1icGokfmCIzwCwPGH/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2eSIA1icGokfmCIzwCwPGH",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA2eSIA1icGokfmCIzwCwPGH" 
                },  
                "created_at": "2012-12-20T03:06:45.721321Z",  
                "description": "A description",  
                "id": "CR2eTgu5N4v4hqtLrOkgdOqn",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR2eTgu5N4v4hqtLrOkgdOqn" 
            },  
            { 
                "amount": 431,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:45.713810Z",  
                    "credits_uri": "/v1/bank_accounts/BA2eSIA1icGokfmCIzwCwPGH/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2eSIA1icGokfmCIzwCwPGH",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA2eSIA1icGokfmCIzwCwPGH" 
                },  
                "created_at": "2012-12-20T03:06:45.731902Z",  
                "description": "Another description",  
                "id": "CR2eTZOD53gdgMLrMSocIYqD",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR2eTZOD53gdgMLrMSocIYqD" 
            },  
            { 
                "amount": 5452,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:45.713810Z",  
                    "credits_uri": "/v1/bank_accounts/BA2eSIA1icGokfmCIzwCwPGH/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2eSIA1icGokfmCIzwCwPGH",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA2eSIA1icGokfmCIzwCwPGH" 
                },  
                "created_at": "2012-12-20T03:06:45.743901Z",  
                "description": "Yet another description",  
                "id": "CR2eUPoeD7vggabaiTEYmR6H",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR2eUPoeD7vggabaiTEYmR6H" 
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
        "first_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/cards",  
                    "created_at": "2012-12-20T03:06:47.955701Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/holds",  
                    "id": "AC2hp6rIlXm7eOhpvq21qEaT",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT" 
                },  
                "amount": 1254,  
                "available_at": "2012-12-20T03:06:48.025478Z",  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "account_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:47.960253Z",  
                    "credits_uri": "/v1/bank_accounts/BA2hpiolsBTVVHapO3TNJBOb/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2hpiolsBTVVHapO3TNJBOb",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/bank_accounts/BA2hpiolsBTVVHapO3TNJBOb" 
                },  
                "created_at": "2012-12-20T03:06:48.042296Z",  
                "description": "hiya",  
                "destination": { 
                    "account_number": "xxxxx1234",  
                    "account_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:47.960253Z",  
                    "credits_uri": "/v1/bank_accounts/BA2hpiolsBTVVHapO3TNJBOb/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2hpiolsBTVVHapO3TNJBOb",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/bank_accounts/BA2hpiolsBTVVHapO3TNJBOb" 
                },  
                "fee": null,  
                "id": "CR2hv0LjPLa8ZJD4PYG8i7kv",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR485-996-8883",  
                "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/credits/CR2hv0LjPLa8ZJD4PYG8i7kv" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/cards",  
                    "created_at": "2012-12-20T03:06:47.955701Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/holds",  
                    "id": "AC2hp6rIlXm7eOhpvq21qEaT",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT" 
                },  
                "amount": 431,  
                "available_at": "2012-12-20T03:06:48.031407Z",  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "account_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:47.960253Z",  
                    "credits_uri": "/v1/bank_accounts/BA2hpiolsBTVVHapO3TNJBOb/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2hpiolsBTVVHapO3TNJBOb",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/bank_accounts/BA2hpiolsBTVVHapO3TNJBOb" 
                },  
                "created_at": "2012-12-20T03:06:48.062421Z",  
                "description": "hiya",  
                "destination": { 
                    "account_number": "xxxxx1234",  
                    "account_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-20T03:06:47.960253Z",  
                    "credits_uri": "/v1/bank_accounts/BA2hpiolsBTVVHapO3TNJBOb/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA2hpiolsBTVVHapO3TNJBOb",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/bank_accounts/BA2hpiolsBTVVHapO3TNJBOb" 
                },  
                "fee": null,  
                "id": "CR2hwwOxWklURASVTzGJcRZV",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR389-978-4632",  
                "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/credits/CR2hwwOxWklURASVTzGJcRZV" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/credits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP2hj0C14IM8j20FDWmKxRhV/accounts/AC2hp6rIlXm7eOhpvq21qEaT/credits?limit=10&offset=0" 
    } 
 

