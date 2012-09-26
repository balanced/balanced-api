Bank Accounts
=============

-  `Store a Bank Account`_
-  `Retrieve a Bank Account`_
-  `List All Bank Accounts`_
-  `Unstore a Bank Account`_


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
        "created_at": "2012-09-26T01:05:30.947813Z",
        "credits_uri": "/a0/bank_accounts/BA7kiJsfPlIPmrQVEVywWnrA/credits/",
        "debits_uri": "/a0/bank_accounts/BA7kiJsfPlIPmrQVEVywWnrA/debits/",
        "id": "BA7kiJsfPlIPmrQVEVywWnrA",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA7kiJsfPlIPmrQVEVywWnrA"
    }



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
        "created_at": "2012-09-26T01:05:31.341699Z",
        "credits_uri": "/a0/bank_accounts/BA7kKcHTHOQqy16jsk9OWI1s/credits/",
        "debits_uri": "/a0/bank_accounts/BA7kKcHTHOQqy16jsk9OWI1s/debits/",
        "id": "BA7kKcHTHOQqy16jsk9OWI1s",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA7kKcHTHOQqy16jsk9OWI1s"
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
                "created_at": "2012-09-26T01:05:31.758885Z",
                "credits_uri": "/a0/bank_accounts/BA7ldjj06fZtF59Pp87JaBv4/credits/",
                "debits_uri": "/a0/bank_accounts/BA7ldjj06fZtF59Pp87JaBv4/debits/",
                "id": "BA7ldjj06fZtF59Pp87JaBv4",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA7ldjj06fZtF59Pp87JaBv4"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-26T01:05:31.767321Z",
                "credits_uri": "/a0/bank_accounts/BA7lekSH95E75pJRGnQG54H8/credits/",
                "debits_uri": "/a0/bank_accounts/BA7lekSH95E75pJRGnQG54H8/debits/",
                "id": "BA7lekSH95E75pJRGnQG54H8",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA7lekSH95E75pJRGnQG54H8"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-26T01:05:31.773202Z",
                "credits_uri": "/a0/bank_accounts/BA7leLc7ul7XQ9xFLsSWu4jw/credits/",
                "debits_uri": "/a0/bank_accounts/BA7leLc7ul7XQ9xFLsSWu4jw/debits/",
                "id": "BA7leLc7ul7XQ9xFLsSWu4jw",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA7leLc7ul7XQ9xFLsSWu4jw"
            }
        ]
    }



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




