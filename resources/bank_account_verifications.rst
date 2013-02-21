Bank Accounts Verification
==========================

- `Create a Bank Account Verification`_
- `Retrieve a Bank Account Verification for a Bank Account`_
- `List All Bank Account Verifications for a Bank Account`_
- `Confirm a Bank Account Verification`_

Fields
------

``id`` 
    **string**.  
 
``uri`` 
    **string**.  
 
``attempts`` 
    **integer**.  
 
``remaining_attempts`` 
    **integer**.  
 
``state`` 
    **string**. One of ``pending``, ``verified``, ``failed``. 
 

Create a Bank Account Verification
----------------------------------

Verifying a bank account will result in *two* micro deposits being sent to bank
account being verified. The amounts of these two deposits must be sent back as
the `amount_1` and `amount_2` params when subsequently updating this
verification. These deposits will appear on the bank accounts statement as
`Balanced verification`.

.. code:: 
 
    POST /v1/bank_accounts/:bank_account_id/verifications 
 

Request
~~~~~~~


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
        "attempts": 0,  
        "id": "BZ7GXxMZviS2MFFbmVq4jgun",  
        "remaining_attempts": 3,  
        "state": "pending",  
        "uri": "/v1/bank_accounts/BA7FVzoeHMjX23rKPCPuFZNV/verifications/BZ7GXxMZviS2MFFbmVq4jgun" 
    } 
 

Retrieve a Bank Account Verification for a Bank Account
-------------------------------------------------------

.. code:: 
 
    GET /v1/bank_accounts/:bank_account_id/verifications/:verification_id 
 

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
        "attempts": 0,  
        "id": "BZ7Knj5ugxISiR4Y9RZlTAZR",  
        "remaining_attempts": 3,  
        "state": "pending",  
        "uri": "/v1/bank_accounts/BA7Kn8eEb5fwFs5uIfTdtvoL/verifications/BZ7Knj5ugxISiR4Y9RZlTAZR" 
    } 
 

List All Bank Account Verifications for a Bank Account
------------------------------------------------------

.. code:: 
 
    GET /v1/bank_accounts/:bank_account_id/verifications 
 

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
        "first_uri": "/v1/bank_accounts/BA1CLqMSjsJXxYgWc6bH0Mb/verifications?limit=10&offset=0",  
        "items": [ 
            { 
                "attempts": 0,  
                "id": "BZ1D147yZsErREDeCnKpPMv",  
                "remaining_attempts": 3,  
                "state": "pending",  
                "uri": "/v1/bank_accounts/BA1CLqMSjsJXxYgWc6bH0Mb/verifications/BZ1D147yZsErREDeCnKpPMv" 
            } 
        ],  
        "last_uri": "/v1/bank_accounts/BA1CLqMSjsJXxYgWc6bH0Mb/verifications?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 1,  
        "uri": "/v1/bank_accounts/BA1CLqMSjsJXxYgWc6bH0Mb/verifications?limit=10&offset=0" 
    } 
 

Confirm a Bank Account Verification
-----------------------------------

When operating on a test bank account, the correct verification amounts are
always 1 and 1.

.. code:: 
 
    PUT /v1/bank_accounts/:bank_account_id/verifications/:verification_id 
 

Request
~~~~~~~

``amount_1`` 
    *required* **integer**.  
 
``amount_2`` 
    *required* **integer**.  
 

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
        "attempts": 1,  
        "id": "BZ5Cxv5444R6GBQtRJRsyBR",  
        "remaining_attempts": 2,  
        "state": "verified",  
        "uri": "/v1/bank_accounts/BA5CoXEiyZWh0wokMrdjqcr/verifications/BZ5Cxv5444R6GBQtRJRsyBR" 
    } 
 

