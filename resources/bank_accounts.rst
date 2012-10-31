Bank Accounts
=============

- `Tokenize a Bank Account`_
- `Retrieve a Bank Account`_
- `Update a Bank Account`_
- `Associate a Bank Account with an Account`_


Fields
------

``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**. The URI of the bank account object  
 
``name`` 
    **string**. The name on the bank account. 
 
``last_four`` 
    **string**. The last four digits of the bank account number. 
 
``bank_code`` 
    **string**. The bank code (routing number in the USA) of the bank account. 
 
``bank_name`` 
    **string**. The name of the bank. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    bank account was tokenized. 
 
``account`` 
    **object**. The account to which this bank account is associated. See `Accounts <./accounts.rst>`_. 
 
``is_valid`` 
    **boolean**. Boolean flag indicating whether the bank account is currently valid. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 

Tokenize a Bank Account
-----------------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/bank_accounts 
 

Request
~~~~~~~

``name`` 
    *required* **string** or **null**. Name on the bank account. Length must be **>=** ``2``. 
 
``account_number`` 
    *required* **string** or **null**. Bank account number. Length must be **>=** ``1``. 
 
``bank_code`` 
    #. If not a *production* bank account then `bank_code` is a: 
 
       ``bank_code`` 
           *required* **string** or **null**. Length must be **>=** ``1``. 
 
 
``account_type`` 
    *optional* **string** or **null**. Bank account type. It should be one of: ``checking``, ``savings`` 
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 

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
        "bank_name": "Banko De Ismus",  
        "account": null,  
        "name": "Fit Finlay",  
        "bank_code": "325182797",  
        "created_at": "2012-10-31T09:54:36.417234Z",  
        "uri": "/v1/marketplaces/TEST-MP54UZAkFtiyRYfG2SLS1qIY/bank_accounts/BA556UUdFYq61qzsxQ4Em5Te",  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1234",  
        "id": "BA556UUdFYq61qzsxQ4Em5Te" 
    } 
 

Retrieve a Bank Account
-----------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/bank_accounts/:bank_account_id 
 

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
        "bank_name": null,  
        "account": null,  
        "name": "Fit Finlay",  
        "bank_code": "325182797",  
        "created_at": "2012-10-31T09:54:37.735401Z",  
        "uri": "/v1/marketplaces/TEST-MP56qXPUqEEp9JhFbh51LhpW/bank_accounts/BA56AQjnZxxXOFTqiXAgvy60",  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1234",  
        "id": "BA56AQjnZxxXOFTqiXAgvy60" 
    } 
 

Update a Bank Account
---------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/bank_accounts/:bank_account_id 
 

Request
~~~~~~~

``is_valid`` 
    *optional* **boolean** or **null**. Flag indicating whether the bank account is active (``true``) or not 
    (``false``). Setting this to ``false`` will deactivate the bank account. 
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "is_valid": "False",  
        "metadata": { 
            "my-own-field": "Customer request" 
        } 
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
        "bank_name": null,  
        "account": null,  
        "name": "Fit Finlay",  
        "bank_code": "325182797",  
        "created_at": "2012-10-31T09:54:40.334339Z",  
        "uri": "/v1/marketplaces/TEST-MP59kVo4DA5VRIEdy6GC6f2s/bank_accounts/BA59w4x2RpLKYIv0R5zTi8kc",  
        "is_valid": false,  
        "meta": {},  
        "last_four": "1234",  
        "id": "BA59w4x2RpLKYIv0R5zTi8kc" 
    } 
 

Associate a Bank Account with an Account
----------------------------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/bank_accounts/:bank_account_id 
 

Request
~~~~~~~

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "account_uri": "/v1/marketplaces/TEST-MP5aOTfLkzLMuVEggkpXm4dK/accounts/AC5aU9gzL9ZPcE2pGftyJBsg" 
    } 
 

``account_uri`` 
    *optional* **string** or **null**. URI of an account with which to associate the bank account. 
 

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
        "bank_name": null,  
        "account": { 
            "holds_uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-31T09:54:42.947169Z",  
            "uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC5csgKKhwd619DuP986peUA",  
            "credits_uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/cards" 
        },  
        "name": "Fit Finlay",  
        "bank_code": "325182797",  
        "created_at": "2012-10-31T09:54:43.018154Z",  
        "uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/bank_accounts/BA5cxd8RJPnlUKwAV8Yu8gGU",  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1234",  
        "id": "BA5cxd8RJPnlUKwAV8Yu8gGU" 
    } 
 

