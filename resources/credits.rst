Credits
=======

-  `Credit a New Bank Account`_
-  `Credit an Existing Bank Account`_
-  `Retrieve a Credit`_
-  `Retrieve a Credit (Unstored Bank Account)`_
-  `List All Credits`_
-  `List All Credits for a Bank Account`_


List all credits for a bank account
-----------------------------------

.. code::

    GET /a0/bank_accounts/:bank_account_id/credits


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
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:15:25.979996Z",
                    "credits_uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo/debits/",
                    "id": "BA4nvXw7kDBLDbUyJ4dWa9Vo",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo"
                },
                "created_at": "2012-09-25T23:15:25.996696Z",
                "fee": 0,
                "id": "CR4nxv8AUWnMKTysxAwtFXu2",
                "state": "pending",
                "uri": "/a0/credits/CR4nxv8AUWnMKTysxAwtFXu2"
            },
            {
                "amount": 1400,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:15:25.979996Z",
                    "credits_uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo/debits/",
                    "id": "BA4nvXw7kDBLDbUyJ4dWa9Vo",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo"
                },
                "created_at": "2012-09-25T23:15:26.007797Z",
                "fee": 0,
                "id": "CR4nykJObo0oVxm4QqG4vgD0",
                "state": "pending",
                "uri": "/a0/credits/CR4nykJObo0oVxm4QqG4vgD0"
            },
            {
                "amount": 1300,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:15:25.979996Z",
                    "credits_uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo/debits/",
                    "id": "BA4nvXw7kDBLDbUyJ4dWa9Vo",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4nvXw7kDBLDbUyJ4dWa9Vo"
                },
                "created_at": "2012-09-25T23:15:26.017567Z",
                "fee": 0,
                "id": "CR4nz0XDRyaFF3TOPeTFRD2q",
                "state": "pending",
                "uri": "/a0/credits/CR4nz0XDRyaFF3TOPeTFRD2q"
            }
        ]
    }



List all credits
----------------

.. code::

    GET /a0/credits


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
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:15:26.427084Z",
                    "credits_uri": "/a0/bank_accounts/BA4o1ydG9AsYHMLS7C1C2vmW/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4o1ydG9AsYHMLS7C1C2vmW/debits/",
                    "id": "BA4o1ydG9AsYHMLS7C1C2vmW",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4o1ydG9AsYHMLS7C1C2vmW"
                },
                "created_at": "2012-09-25T23:15:26.428542Z",
                "fee": 0,
                "id": "CR4o100wmvJPMu0PFserlGs2",
                "state": "pending",
                "uri": "/a0/credits/CR4o100wmvJPMu0PFserlGs2"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:15:26.438250Z",
                    "credits_uri": "/a0/bank_accounts/BA4o2ol3JzGWxbStGNjpVjdw/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4o2ol3JzGWxbStGNjpVjdw/debits/",
                    "id": "BA4o2ol3JzGWxbStGNjpVjdw",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4o2ol3JzGWxbStGNjpVjdw"
                },
                "created_at": "2012-09-25T23:15:26.438688Z",
                "fee": 0,
                "id": "CR4o2lrYnSUO1GU5QBw0YOxk",
                "state": "pending",
                "uri": "/a0/credits/CR4o2lrYnSUO1GU5QBw0YOxk"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:15:26.445389Z",
                    "credits_uri": "/a0/bank_accounts/BA4o2SZywvRPzDbP23y0FxLs/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4o2SZywvRPzDbP23y0FxLs/debits/",
                    "id": "BA4o2SZywvRPzDbP23y0FxLs",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4o2SZywvRPzDbP23y0FxLs"
                },
                "created_at": "2012-09-25T23:15:26.445866Z",
                "fee": 0,
                "id": "CR4o2QpwNZxRSNWup7V41Pxo",
                "state": "pending",
                "uri": "/a0/credits/CR4o2QpwNZxRSNWup7V41Pxo"
            }
        ]
    }



Retrieve a credit
-----------------

.. code::

    GET /a0/credits/:credit_id


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
        "amount": 1716,
        "bank_account": {
            "account_number": "xxxxxx2930",
            "created_at": "2012-09-25T23:15:26.844067Z",
            "credits_uri": "/a0/bank_accounts/BA4ouDbqNecZ9fNmCUc4g6Vk/credits/",
            "debits_uri": "/a0/bank_accounts/BA4ouDbqNecZ9fNmCUc4g6Vk/debits/",
            "id": "BA4ouDbqNecZ9fNmCUc4g6Vk",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA4ouDbqNecZ9fNmCUc4g6Vk"
        },
        "created_at": "2012-09-25T23:15:26.845593Z",
        "fee": 0,
        "id": "CR4ou4xN10Cz0SQlar9FLQQq",
        "state": "pending",
        "uri": "/a0/credits/CR4ou4xN10Cz0SQlar9FLQQq"
    }

Retrieve a Credit (Unstored Bank Account)
-----------------------------------------

.. code::

    GET /a0/credits

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
        "amount": 1716,
        "bank_account": {
            "account_number": "xxxxxx2930",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking"
        },
        "created_at": "2012-09-25T23:15:27.254916Z",
        "fee": 0,
        "id": "CR4oWFR2UlGUpIdBZzX2Eh50",
        "state": "pending",
        "uri": "/a0/credits/CR4oWFR2UlGUpIdBZzX2Eh50"
    }



Credit an existing bank account
-------------------------------

.. code::

    POST /a0/bank_accounts/:bank_account_id/credits


Request
~~~~~~~

``amount``
: *required* **integer**

.. code:: javascript

    {
        "amount": 1716
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
        "amount": 1716,
        "bank_account": {
            "account_number": "xxxxxx2930",
            "created_at": "2012-09-25T23:15:27.703264Z",
            "credits_uri": "/a0/bank_accounts/BA4ps6QNKPmFqwon0teMtfGW/credits/",
            "debits_uri": "/a0/bank_accounts/BA4ps6QNKPmFqwon0teMtfGW/debits/",
            "id": "BA4ps6QNKPmFqwon0teMtfGW",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA4ps6QNKPmFqwon0teMtfGW"
        },
        "created_at": "2012-09-25T23:15:27.719128Z",
        "fee": 0,
        "id": "CR4ptBWzHwp1PWDSIYsQ4l5g",
        "state": "pending",
        "uri": "/a0/credits/CR4ptBWzHwp1PWDSIYsQ4l5g"
    }



Credit a new bank account
-------------------------

.. code::

    POST /a0/credits


Request
~~~~~~~

``amount``
: *required* **integer**

``bank_account``
: *required* **object**
: 
: 
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
        "amount": 1716,
        "bank_account": {
            "name": "Gottfried Leibniz",
            "account_number": "3819372930",
            "routing_number": "121042882",
            "type": "checking"
        }
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
        "amount": 1716,
        "bank_account": {
            "account_number": "xxxxxx2930",
            "created_at": "2012-09-25T23:15:28.111089Z",
            "credits_uri": "/a0/bank_accounts/BA4pUZ5Y5Wb3nqPA4MNEAoUa/credits/",
            "debits_uri": "/a0/bank_accounts/BA4pUZ5Y5Wb3nqPA4MNEAoUa/debits/",
            "id": "BA4pUZ5Y5Wb3nqPA4MNEAoUa",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA4pUZ5Y5Wb3nqPA4MNEAoUa"
        },
        "created_at": "2012-09-25T23:15:28.112541Z",
        "fee": 0,
        "id": "CR4pUukP9aPynCtBEz1dvAhk",
        "state": "pending",
        "uri": "/a0/credits/CR4pUukP9aPynCtBEz1dvAhk"
    }




