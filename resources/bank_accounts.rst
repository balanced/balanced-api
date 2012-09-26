Bank Accounts
=============

-  `Store a Bank Account`_
-  `Retrieve a Bank Account`_
-  `List All Bank Accounts`_
-  `Unstore a Bank Account`_


Unstore a bank account
----------------------

.. code::

    DELETE /a0/bank_accounts/:bank_account_id


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 204 No Content



Retrieve a bank account
-----------------------

.. code::

    GET /a0/bank_accounts/:bank_account_id


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
        "created_at": "2012-09-25T22:43:04.281214Z",
        "credits_uri": "/a0/bank_accounts/BAjTQ4LDFhN6rLq9fczZhkm/credits/",
        "debits_uri": "/a0/bank_accounts/BAjTQ4LDFhN6rLq9fczZhkm/debits/",
        "id": "BAjTQ4LDFhN6rLq9fczZhkm",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BAjTQ4LDFhN6rLq9fczZhkm"
    }



Store a bank account
--------------------

.. code::

    POST /a0/bank_accounts


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
        "created_at": "2012-09-25T22:43:05.251604Z",
        "credits_uri": "/a0/bank_accounts/BAkZx5Z7lMd5L92vMTge2Js/credits/",
        "debits_uri": "/a0/bank_accounts/BAkZx5Z7lMd5L92vMTge2Js/debits/",
        "id": "BAkZx5Z7lMd5L92vMTge2Js",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BAkZx5Z7lMd5L92vMTge2Js"
    }



List all bank accounts
----------------------

.. code::

    GET /a0/bank_accounts


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
                "created_at": "2012-09-25T22:43:05.654589Z",
                "credits_uri": "/a0/bank_accounts/BAlrEVzGoxbhxRcKOeMxOMq/credits/",
                "debits_uri": "/a0/bank_accounts/BAlrEVzGoxbhxRcKOeMxOMq/debits/",
                "id": "BAlrEVzGoxbhxRcKOeMxOMq",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BAlrEVzGoxbhxRcKOeMxOMq"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T22:43:05.662835Z",
                "credits_uri": "/a0/bank_accounts/BAlsHULgxFufI3ctc23wnXA/credits/",
                "debits_uri": "/a0/bank_accounts/BAlsHULgxFufI3ctc23wnXA/debits/",
                "id": "BAlsHULgxFufI3ctc23wnXA",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BAlsHULgxFufI3ctc23wnXA"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T22:43:05.669355Z",
                "credits_uri": "/a0/bank_accounts/BAlt9WN6lZLFQkdiZ39Rips/credits/",
                "debits_uri": "/a0/bank_accounts/BAlt9WN6lZLFQkdiZ39Rips/debits/",
                "id": "BAlt9WN6lZLFQkdiZ39Rips",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BAlt9WN6lZLFQkdiZ39Rips"
            }
        ]
    }




