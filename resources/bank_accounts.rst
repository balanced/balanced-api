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
        "created_at": "2012-09-25T23:15:24.228437Z",
        "credits_uri": "/a0/bank_accounts/BA4lxPJg1catGQKQc148HDUC/credits/",
        "debits_uri": "/a0/bank_accounts/BA4lxPJg1catGQKQc148HDUC/debits/",
        "id": "BA4lxPJg1catGQKQc148HDUC",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA4lxPJg1catGQKQc148HDUC"
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
        "created_at": "2012-09-25T23:15:25.180508Z",
        "credits_uri": "/a0/bank_accounts/BA4mCcWZsdnHCPQPuxBy8WAq/credits/",
        "debits_uri": "/a0/bank_accounts/BA4mCcWZsdnHCPQPuxBy8WAq/debits/",
        "id": "BA4mCcWZsdnHCPQPuxBy8WAq",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA4mCcWZsdnHCPQPuxBy8WAq"
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
                "created_at": "2012-09-25T23:15:25.568803Z",
                "credits_uri": "/a0/bank_accounts/BA4n3i4D3AqDfNATd1w3A8SS/credits/",
                "debits_uri": "/a0/bank_accounts/BA4n3i4D3AqDfNATd1w3A8SS/debits/",
                "id": "BA4n3i4D3AqDfNATd1w3A8SS",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA4n3i4D3AqDfNATd1w3A8SS"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T23:15:25.577037Z",
                "credits_uri": "/a0/bank_accounts/BA4n4kCDryQ32a9tb9b9OaMi/credits/",
                "debits_uri": "/a0/bank_accounts/BA4n4kCDryQ32a9tb9b9OaMi/debits/",
                "id": "BA4n4kCDryQ32a9tb9b9OaMi",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA4n4kCDryQ32a9tb9b9OaMi"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T23:15:25.582875Z",
                "credits_uri": "/a0/bank_accounts/BA4n4JLmDmJQIUCn5MH2gIEq/credits/",
                "debits_uri": "/a0/bank_accounts/BA4n4JLmDmJQIUCn5MH2gIEq/debits/",
                "id": "BA4n4JLmDmJQIUCn5MH2gIEq",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA4n4JLmDmJQIUCn5MH2gIEq"
            }
        ]
    }




