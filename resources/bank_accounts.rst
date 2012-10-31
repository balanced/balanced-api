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
        "created_at": "2012-10-30T18:25:48.881529Z",  
        "uri": "/v1/marketplaces/TEST-MP71hr4joOFdxgDU4XVac21u/bank_accounts/BA71v3N49RMi2L1UK7HOVvRW",  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1234",  
        "id": "BA71v3N49RMi2L1UK7HOVvRW" 
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
        "created_at": "2012-10-30T18:25:50.407526Z",  
        "uri": "/v1/marketplaces/TEST-MP731TYkZ2oTqxGQXtWmpAvq/bank_accounts/BA73dtkMBkfzjHMv1Qjhmezi",  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1234",  
        "id": "BA73dtkMBkfzjHMv1Qjhmezi" 
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
        "created_at": "2012-10-30T18:25:53.735019Z",  
        "uri": "/v1/marketplaces/TEST-MP76M1IQXv7fqgaI8TOSWxMg/bank_accounts/BA76XvZx35kQpVYnHtTbqRI8",  
        "is_valid": false,  
        "meta": {},  
        "last_four": "1234",  
        "id": "BA76XvZx35kQpVYnHtTbqRI8" 
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
        "account_uri": "/v1/marketplaces/TEST-MP78t7JCLJRZ4taD7vMbRxek/accounts/AC78z5REsYyqHG2B7YalCJSs" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:25:56.795677Z",  
            "uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC7aoWjHUkruUz2JOddCLrCs",  
            "credits_uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs/cards" 
        },  
        "name": "Fit Finlay",  
        "bank_code": "325182797",  
        "created_at": "2012-10-30T18:25:56.867243Z",  
        "uri": "/v1/marketplaces/TEST-MP7aiMYlLoq3eKq8l8ZPGI7y/accounts/AC7aoWjHUkruUz2JOddCLrCs/bank_accounts/BA7atVLlcJTMQPx2UkQeCJGQ",  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1234",  
        "id": "BA7atVLlcJTMQPx2UkQeCJGQ" 
    } 
 

