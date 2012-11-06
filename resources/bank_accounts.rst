Bank Accounts
=============

-  `Create a Bank Account`_
-  `Retrieve a Bank Account`_
-  `List All Bank Accounts`_
-  `List All Bank Accounts for an Account`_
-  `Associate a Bank Account with an Account`_
-  `Delete a Bank Account`_


Fields
------

``id``
: **string**

``uri``
: **string**

``created_at``
: **string**
: `iso8601 <http://en.wikipedia.org/wiki/Iso8601>`_

``credits_uri``
: **string**

``name``
: **string**
: Name of account holder

``account_number``
: **string**

``routing_number``
: **string**
: 9 digits
: Meets `MICR routing number format <http://en.wikipedia.org/wiki/Routing_transit_number#MICR_Routing_number_format>`_
: Specified in FedACH database defined by the
`US Federal Reserve <http://www.fedwiredirectory.frb.org/>`_

``bank_name`` 
: **string**
: The name of the bank


``fingerprint``
: **string**
: Uniquely identifies a bank account (account number and routing number)

``type``
: **string**
: ``checking`` or ``savings``

``meta``
: **object**
: A single-level dictionary of string-type key/value pairs


Deprecated
~~~~~~~~~~

``bank_code``
: **string**
: Use ``routing_number`` instead

``is_valid`` 
: **boolean**
: Use `Delete a Bank Account`_ instead

``last_four``
: **string**
: Last four digits are now returned in the ``acount_number``



Create a Bank Account
---------------------

.. code::

    POST /v1/bank_accounts


Request
~~~~~~~

``name``
: *required* **string**

``account_number``
: *required* **string**

``routing_number``
: *required* **string**

``type``
: *required* **string**
: ``checking`` or ``savings``

.. code:: javascript

    {
        "name": "Gottfried Leibniz",
        "account_number": "3819372930",
        "routing_number": "121042882",
        "type": "checking"
    }

Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 201 Created

Body
^^^^

.. code:: javascript


    {
        "account_number": "xxxxxx2930",
        "bank_name": "Bank of America",
        "created_at": "2012-09-26T01:05:30.947813Z",
        "credits_uri": "/v1/bank_accounts/BA7kiJsfPlIPmrQVEVywWnrA/credits",
        "id": "BA7kiJsfPlIPmrQVEVywWnrA",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "fingerprint": "xyz",
        "type": "checking",
        "uri": "/v1/bank_accounts/BA7kiJsfPlIPmrQVEVywWnrA"
    }


Retrieve a Bank Account
-----------------------

.. code::

    GET /v1/bank_accounts/:bank_account_id


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 200 Ok

Body
^^^^

.. code:: javascript


    {
        "account_number": "xxxxxx2930",
        "bank_name": "Bank of America",
        "created_at": "2012-09-26T01:05:31.341699Z",
        "credits_uri": "/v1/bank_accounts/BA7kKcHTHOQqy16jsk9OWI1s/credits",
        "id": "BA7kKcHTHOQqy16jsk9OWI1s",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "fingerprint": "xyz",
        "type": "checking",
        "uri": "/v1/bank_accounts/BA7kKcHTHOQqy16jsk9OWI1s"
    }



List All Bank Accounts
----------------------

``limit``
: *optional* **integer**, *default is 10*

``offset``
: *optional* **integer**, *default is 0*

.. code::

    GET /v1/bank_accounts


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 200 Ok

Body
^^^^

.. code:: javascript


    {
        "items": [
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-26T01:05:31.758885Z",
                "credits_uri": "/v1/bank_accounts/BA7ldjj06fZtF59Pp87JaBv4/credits",
                "id": "BA7ldjj06fZtF59Pp87JaBv4",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/v1/bank_accounts/BA7ldjj06fZtF59Pp87JaBv4"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-26T01:05:31.767321Z",
                "credits_uri": "/v1/bank_accounts/BA7lekSH95E75pJRGnQG54H8/credits",
                "id": "BA7lekSH95E75pJRGnQG54H8",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/v1/bank_accounts/BA7lekSH95E75pJRGnQG54H8"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-26T01:05:31.773202Z",
                "credits_uri": "/v1/bank_accounts/BA7leLc7ul7XQ9xFLsSWu4jw/credits",
                "id": "BA7leLc7ul7XQ9xFLsSWu4jw",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/v1/bank_accounts/BA7leLc7ul7XQ9xFLsSWu4jw"
            }
        ],
        "limit": 10,
        "offset": 0,
        "total": 3
    }


List All Bank Accounts for an Account
-------------------------------------

``limit``
: *optional* **integer**, *default is 10*

``offset``
: *optional* **integer**, *default is 0*

.. code::

    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/bank_accounts


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 200 Ok

Body
^^^^

.. code:: javascript


    {
        "first_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/credits?limit=10&offset=0",
        "items": [
            {
                "account_number": "xxxxxx2930",
                "bank_code": "121042882",
                "created_at": "2012-09-26T01:05:31.758885Z",
                "credits_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/credits",
                "id": "BA7ldjj06fZtF59Pp87JaBv4",
                "is_valid": true,
                "last_four": "2930",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/v1/bank_accounts/BA7ldjj06fZtF59Pp87JaBv4"
            },
            {
                "account_number": "xxxxxx2930",
                "bank_code": "121042882",
                "created_at": "2012-09-26T01:05:31.767321Z",
                "credits_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/credits",
                "id": "BA7lekSH95E75pJRGnQG54H8",
                "is_valid": true,
                "last_four": "2930",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/v1/bank_accounts/BA7lekSH95E75pJRGnQG54H8"
            },
            {
                "account_number": "xxxxxx2930",
                "bank_code": "121042882",
                "created_at": "2012-09-26T01:05:31.773202Z",
                "credits_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/credits",
                "id": "BA7leLc7ul7XQ9xFLsSWu4jw",
                "is_valid": true,
                "last_four": "2930",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/v1/bank_accounts/BA7leLc7ul7XQ9xFLsSWu4jw"
            }
        ],
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/credits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 3,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP2ujo21OwDxvn5lSWsLKana/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/credits?limit=10&offset=0" 
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
: *required* **string**
: URI of an account with which to associate the bank account
 

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
        "routing_number": "325182797",  
        "created_at": "2012-10-31T09:54:43.018154Z",  
        "uri": "/v1/marketplaces/TEST-MP5ckR3JiX6395sM8fEUM1XS/accounts/AC5csgKKhwd619DuP986peUA/bank_accounts/BA5cxd8RJPnlUKwAV8Yu8gGU",  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1234",  
        "account_number": "xxxxxx1234",  
        "id": "BA5cxd8RJPnlUKwAV8Yu8gGU" 
    } 
 

Delete a Bank Account
---------------------

.. code::

    DELETE /v1/bank_accounts/:bank_account_id


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 204 No Content