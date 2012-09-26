Debits
======

-  `Debit a New Bank Account`_
-  `Debit an Existing Bank Account`_
-  `Retrieve a Debit`_
-  `Retrieve a Debit (Unstored Bank Account)`_
-  `List All Debits`_
-  `List All Debits for a Bank Account`_


Debit a new bank account
------------------------

.. code::

    POST /a0/debits


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
            "created_at": "2012-09-25T23:52:13.824132Z",
            "credits_uri": "/a0/bank_accounts/BA5tpusw8xwOoB2tDbEd8sRA/credits/",
            "debits_uri": "/a0/bank_accounts/BA5tpusw8xwOoB2tDbEd8sRA/debits/",
            "id": "BA5tpusw8xwOoB2tDbEd8sRA",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA5tpusw8xwOoB2tDbEd8sRA"
        },
        "created_at": "2012-09-25T23:52:13.825534Z",
        "fee": 0,
        "id": "WD5toYso7ZApQDyEh56vXpA6",
        "state": "pending",
        "uri": "/a0/debits/WD5toYso7ZApQDyEh56vXpA6"
    }



List all debits
---------------

.. code::

    GET /a0/debits


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
                    "created_at": "2012-09-25T23:52:14.226812Z",
                    "credits_uri": "/a0/bank_accounts/BA5tRzePOQ6nV3rrqDDXTngC/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5tRzePOQ6nV3rrqDDXTngC/debits/",
                    "id": "BA5tRzePOQ6nV3rrqDDXTngC",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5tRzePOQ6nV3rrqDDXTngC"
                },
                "created_at": "2012-09-25T23:52:14.228267Z",
                "fee": 0,
                "id": "WD5tR5068YsRXrTACnYkuXfs",
                "state": "pending",
                "uri": "/a0/debits/WD5tR5068YsRXrTACnYkuXfs"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:14.238257Z",
                    "credits_uri": "/a0/bank_accounts/BA5tSq3oLEu2j6TIWmpwTKEG/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5tSq3oLEu2j6TIWmpwTKEG/debits/",
                    "id": "BA5tSq3oLEu2j6TIWmpwTKEG",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5tSq3oLEu2j6TIWmpwTKEG"
                },
                "created_at": "2012-09-25T23:52:14.238751Z",
                "fee": 0,
                "id": "WD5tSnkNes8nDQIBZ6OV76kO",
                "state": "pending",
                "uri": "/a0/debits/WD5tSnkNes8nDQIBZ6OV76kO"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:14.245235Z",
                    "credits_uri": "/a0/bank_accounts/BA5tSTGF48aejhURmnl2dGYO/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5tSTGF48aejhURmnl2dGYO/debits/",
                    "id": "BA5tSTGF48aejhURmnl2dGYO",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5tSTGF48aejhURmnl2dGYO"
                },
                "created_at": "2012-09-25T23:52:14.245771Z",
                "fee": 0,
                "id": "WD5tSR7Ga9DGArXjEqMXRE8y",
                "state": "pending",
                "uri": "/a0/debits/WD5tSR7Ga9DGArXjEqMXRE8y"
            }
        ]
    }



Debit an existing bank account
------------------------------

.. code::

    POST /a0/bank_accounts/:bank_account_id/debits


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
            "created_at": "2012-09-25T23:52:14.650248Z",
            "credits_uri": "/a0/bank_accounts/BA5ukGYupyk3QYAGLbaSSObo/credits/",
            "debits_uri": "/a0/bank_accounts/BA5ukGYupyk3QYAGLbaSSObo/debits/",
            "id": "BA5ukGYupyk3QYAGLbaSSObo",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA5ukGYupyk3QYAGLbaSSObo"
        },
        "created_at": "2012-09-25T23:52:14.666590Z",
        "fee": 0,
        "id": "WD5umco1crGd3JWzo57DnaB4",
        "state": "pending",
        "uri": "/a0/debits/WD5umco1crGd3JWzo57DnaB4"
    }



List all debits for a bank account
----------------------------------

.. code::

    GET /a0/bank_accounts/:bank_account_id/debits


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
                    "created_at": "2012-09-25T23:52:15.077159Z",
                    "credits_uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU/debits/",
                    "id": "BA5uOlNtt8wa1y5zqVy49dRU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU"
                },
                "created_at": "2012-09-25T23:52:15.092960Z",
                "fee": 0,
                "id": "WD5uPVLi2fxGY8fQuhps1dlo",
                "state": "pending",
                "uri": "/a0/debits/WD5uPVLi2fxGY8fQuhps1dlo"
            },
            {
                "amount": 4281906,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:15.077159Z",
                    "credits_uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU/debits/",
                    "id": "BA5uOlNtt8wa1y5zqVy49dRU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU"
                },
                "created_at": "2012-09-25T23:52:15.103950Z",
                "fee": 0,
                "id": "WD5uQKC8a9HMn1HX2F3H2hei",
                "state": "pending",
                "uri": "/a0/debits/WD5uQKC8a9HMn1HX2F3H2hei"
            },
            {
                "amount": 1300,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:52:15.077159Z",
                    "credits_uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU/credits/",
                    "debits_uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU/debits/",
                    "id": "BA5uOlNtt8wa1y5zqVy49dRU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA5uOlNtt8wa1y5zqVy49dRU"
                },
                "created_at": "2012-09-25T23:52:15.113495Z",
                "fee": 0,
                "id": "WD5uRq67WzxnosCyRIYx5oAW",
                "state": "pending",
                "uri": "/a0/debits/WD5uRq67WzxnosCyRIYx5oAW"
            }
        ]
    }



Retrieve a debit
----------------

.. code::

    GET /a0/debits/:debit_id


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
            "created_at": "2012-09-25T23:52:15.536763Z",
            "credits_uri": "/a0/bank_accounts/BA5vkUCmT5IyBvYgMsaxL9Im/credits/",
            "debits_uri": "/a0/bank_accounts/BA5vkUCmT5IyBvYgMsaxL9Im/debits/",
            "id": "BA5vkUCmT5IyBvYgMsaxL9Im",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA5vkUCmT5IyBvYgMsaxL9Im"
        },
        "created_at": "2012-09-25T23:52:15.538247Z",
        "fee": 0,
        "id": "WD5vkpnaUUOQ2GaJenk70f9w",
        "state": "pending",
        "uri": "/a0/debits/WD5vkpnaUUOQ2GaJenk70f9w"
    }

Retrieve a Debit (Unstored Bank Account)
----------------------------------------

.. code::

    GET /a0/debits/:debit_id

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
        "created_at": "2012-09-25T23:52:15.946748Z",
        "fee": 0,
        "id": "WD5vMHYfbuMBg5kZrK0sgCqm",
        "state": "pending",
        "uri": "/a0/debits/WD5vMHYfbuMBg5kZrK0sgCqm"
    }




