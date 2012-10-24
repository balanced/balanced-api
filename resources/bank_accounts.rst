Bank Accounts
=============

-  `Create a Bank Account`_
-  `Retrieve a Bank Account`_
-  `List All Bank Accounts`_
-  `Delete a Bank Account`_


Create a bank account
--------------------

.. code::

    POST /a1/bank_accounts


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
        "credits_uri": "/a1/bank_accounts/BA7kiJsfPlIPmrQVEVywWnrA/credits/",
        "id": "BA7kiJsfPlIPmrQVEVywWnrA",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "fingerprint": "xyz",
        "type": "checking",
        "uri": "/a1/bank_accounts/BA7kiJsfPlIPmrQVEVywWnrA"
    }



Retrieve a bank account
-----------------------

.. code::

    GET /a1/bank_accounts/:bank_account_id


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
        "credits_uri": "/a1/bank_accounts/BA7kKcHTHOQqy16jsk9OWI1s/credits/",
        "id": "BA7kKcHTHOQqy16jsk9OWI1s",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "fingerprint": "xyz",
        "type": "checking",
        "uri": "/a1/bank_accounts/BA7kKcHTHOQqy16jsk9OWI1s"
    }



List all bank accounts
----------------------

.. code::

    GET /a1/bank_accounts


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
                "credits_uri": "/a1/bank_accounts/BA7ldjj06fZtF59Pp87JaBv4/credits/",
                "id": "BA7ldjj06fZtF59Pp87JaBv4",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/a1/bank_accounts/BA7ldjj06fZtF59Pp87JaBv4"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-26T01:05:31.767321Z",
                "credits_uri": "/a1/bank_accounts/BA7lekSH95E75pJRGnQG54H8/credits/",
                "id": "BA7lekSH95E75pJRGnQG54H8",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/a1/bank_accounts/BA7lekSH95E75pJRGnQG54H8"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-26T01:05:31.773202Z",
                "credits_uri": "/a1/bank_accounts/BA7leLc7ul7XQ9xFLsSWu4jw/credits/",
                "id": "BA7leLc7ul7XQ9xFLsSWu4jw",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "fingerprint": "xyz",
                "type": "checking",
                "uri": "/a1/bank_accounts/BA7leLc7ul7XQ9xFLsSWu4jw"
            }
        ]
    }



Delete a bank account
----------------------

.. code::

    DELETE /a1/bank_accounts/:bank_account_id


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 204 No Content




