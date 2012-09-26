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
                "amount": 221970,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:16.359924Z",
                    "credits_uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi/debits/",
                    "id": "BA5wfMQmOOH7yQADgYnNRlqi",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi"
                },
                "created_at": "2012-09-25T23:52:16.376112Z",
                "fee": 0,
                "id": "CR5whoYvjspPqpyL6bxs61x8",
                "state": "pending",
                "uri": "/a0/credits/CR5whoYvjspPqpyL6bxs61x8"
            },
            {
                "amount": 4281906,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:16.359924Z",
                    "credits_uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi/debits/",
                    "id": "BA5wfMQmOOH7yQADgYnNRlqi",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi"
                },
                "created_at": "2012-09-25T23:52:16.387568Z",
                "fee": 0,
                "id": "CR5wifUfET5WPuyj9i9DUa26",
                "state": "pending",
                "uri": "/a0/credits/CR5wifUfET5WPuyj9i9DUa26"
            },
            {
                "amount": 1300,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:16.359924Z",
                    "credits_uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi/debits/",
                    "id": "BA5wfMQmOOH7yQADgYnNRlqi",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5wfMQmOOH7yQADgYnNRlqi"
                },
                "created_at": "2012-09-25T23:52:16.397199Z",
                "fee": 0,
                "id": "CR5wiVWvnW7JrNocxpXeh5yO",
                "state": "pending",
                "uri": "/a0/credits/CR5wiVWvnW7JrNocxpXeh5yO"
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
                    "created_at": "2012-09-25T23:52:16.810378Z",
                    "credits_uri": "/a0/bank_accounts/BA5wLICeru8V4Ziv7rNN1ob8/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5wLICeru8V4Ziv7rNN1ob8/debits/",
                    "id": "BA5wLICeru8V4Ziv7rNN1ob8",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5wLICeru8V4Ziv7rNN1ob8"
                },
                "created_at": "2012-09-25T23:52:16.811902Z",
                "fee": 0,
                "id": "CR5wLd21wftEwRbWaZpI2HvY",
                "state": "pending",
                "uri": "/a0/credits/CR5wLd21wftEwRbWaZpI2HvY"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:16.821669Z",
                    "credits_uri": "/a0/bank_accounts/BA5wMzi8Av8028OQ0HCzsFpU/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5wMzi8Av8028OQ0HCzsFpU/debits/",
                    "id": "BA5wMzi8Av8028OQ0HCzsFpU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5wMzi8Av8028OQ0HCzsFpU"
                },
                "created_at": "2012-09-25T23:52:16.822229Z",
                "fee": 0,
                "id": "CR5wMwtl99mI0RpWDKVUfkNA",
                "state": "pending",
                "uri": "/a0/credits/CR5wMwtl99mI0RpWDKVUfkNA"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:16.828839Z",
                    "credits_uri": "/a0/bank_accounts/BA5wN45s9trdqw2mGDai6SVA/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5wN45s9trdqw2mGDai6SVA/debits/",
                    "id": "BA5wN45s9trdqw2mGDai6SVA",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5wN45s9trdqw2mGDai6SVA"
                },
                "created_at": "2012-09-25T23:52:16.829362Z",
                "fee": 0,
                "id": "CR5wN1xh6GBsimN0ewIdewk2",
                "state": "pending",
                "uri": "/a0/credits/CR5wN1xh6GBsimN0ewIdewk2"
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
            "created_at": "2012-09-25T23:52:17.231377Z",
            "credits_uri": "/a0/bank_accounts/BA5xf5b7zPthssKO2TP8dHgS/credits/",
            "debits_uri": "/a0/bank_accounts/BA5xf5b7zPthssKO2TP8dHgS/debits/",
            "id": "BA5xf5b7zPthssKO2TP8dHgS",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA5xf5b7zPthssKO2TP8dHgS"
        },
        "created_at": "2012-09-25T23:52:17.232853Z",
        "fee": 0,
        "id": "CR5xeyXCgvOMxz07VwKOGQfU",
        "state": "pending",
        "uri": "/a0/credits/CR5xeyXCgvOMxz07VwKOGQfU"
    }

Retrieve a Credit (Unstored Bank Account)
-----------------------------------------

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
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking"
        },
        "created_at": "2012-09-25T23:52:17.646801Z",
        "fee": 0,
        "id": "CR5xHt0R8gzknCubsMsRH0jE",
        "state": "pending",
        "uri": "/a0/credits/CR5xHt0R8gzknCubsMsRH0jE"
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
            "created_at": "2012-09-25T23:52:18.066448Z",
            "credits_uri": "/a0/bank_accounts/BA5yaUQXrenN0mQL4CV206M2/credits/",
            "debits_uri": "/a0/bank_accounts/BA5yaUQXrenN0mQL4CV206M2/debits/",
            "id": "BA5yaUQXrenN0mQL4CV206M2",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA5yaUQXrenN0mQL4CV206M2"
        },
        "created_at": "2012-09-25T23:52:18.083155Z",
        "fee": 0,
        "id": "CR5ycr3Ob1oFOK24R1fN4AVc",
        "state": "pending",
        "uri": "/a0/credits/CR5ycr3Ob1oFOK24R1fN4AVc"
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
: `Bank Account <./bank_account.rst>`_

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
            "created_at": "2012-09-25T23:52:18.489879Z",
            "credits_uri": "/a0/bank_accounts/BA5yEPQc28XlBEKuBjK0ZQAq/credits/",
            "debits_uri": "/a0/bank_accounts/BA5yEPQc28XlBEKuBjK0ZQAq/debits/",
            "id": "BA5yEPQc28XlBEKuBjK0ZQAq",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA5yEPQc28XlBEKuBjK0ZQAq"
        },
        "created_at": "2012-09-25T23:52:18.491382Z",
        "fee": 0,
        "id": "CR5yEkItK1njKhXTbvOc83I6",
        "state": "pending",
        "uri": "/a0/credits/CR5yEkItK1njKhXTbvOc83I6"
    }




