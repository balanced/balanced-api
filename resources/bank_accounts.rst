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
        "created_at": "2012-09-25T23:33:31.637432Z",
        "credits_uri": "/a0/bank_accounts/BAHnPxkc13ogb0LScnYhX3Y/credits/",
        "debits_uri": "/a0/bank_accounts/BAHnPxkc13ogb0LScnYhX3Y/debits/",
        "id": "BAHnPxkc13ogb0LScnYhX3Y",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BAHnPxkc13ogb0LScnYhX3Y"
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
        "created_at": "2012-09-25T23:33:32.599405Z",
        "credits_uri": "/a0/bank_accounts/BAIsVCxo4mnhs7uw695pHjc/credits/",
        "debits_uri": "/a0/bank_accounts/BAIsVCxo4mnhs7uw695pHjc/debits/",
        "id": "BAIsVCxo4mnhs7uw695pHjc",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BAIsVCxo4mnhs7uw695pHjc"
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
                "created_at": "2012-09-25T23:33:32.992406Z",
                "credits_uri": "/a0/bank_accounts/BAIUlgsNSUl8y74dEKR3f06/credits/",
                "debits_uri": "/a0/bank_accounts/BAIUlgsNSUl8y74dEKR3f06/debits/",
                "id": "BAIUlgsNSUl8y74dEKR3f06",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BAIUlgsNSUl8y74dEKR3f06"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T23:33:33.000255Z",
                "credits_uri": "/a0/bank_accounts/BAIVm6RbLm9UFlvxT5rEwYy/credits/",
                "debits_uri": "/a0/bank_accounts/BAIVm6RbLm9UFlvxT5rEwYy/debits/",
                "id": "BAIVm6RbLm9UFlvxT5rEwYy",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BAIVm6RbLm9UFlvxT5rEwYy"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T23:33:33.005746Z",
                "credits_uri": "/a0/bank_accounts/BAIVJRxAoq6jTYND823qy8y/credits/",
                "debits_uri": "/a0/bank_accounts/BAIVJRxAoq6jTYND823qy8y/debits/",
                "id": "BAIVJRxAoq6jTYND823qy8y",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BAIVJRxAoq6jTYND823qy8y"
            }
        ]
    }




