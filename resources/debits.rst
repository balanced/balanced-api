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
: `Bank Account <./bank_accounts.rst>`_

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
            "created_at": "2012-09-26T01:05:13.616987Z",
            "credits_uri": "/a0/bank_accounts/BA70OC6iDZwbuOKr2XHmcPJE/credits/",
            "debits_uri": "/a0/bank_accounts/BA70OC6iDZwbuOKr2XHmcPJE/debits/",
            "id": "BA70OC6iDZwbuOKr2XHmcPJE",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA70OC6iDZwbuOKr2XHmcPJE"
        },
        "created_at": "2012-09-26T01:05:13.618436Z",
        "fee": 0,
        "id": "WD70O5Y9IB8fbHuzPJQ9btq2",
        "state": "pending",
        "uri": "/a0/debits/WD70O5Y9IB8fbHuzPJQ9btq2"
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
            "created_at": "2012-09-26T01:05:14.047764Z",
            "credits_uri": "/a0/bank_accounts/BA71i7fUXI3txasGzqjHr8ng/credits/",
            "debits_uri": "/a0/bank_accounts/BA71i7fUXI3txasGzqjHr8ng/debits/",
            "id": "BA71i7fUXI3txasGzqjHr8ng",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA71i7fUXI3txasGzqjHr8ng"
        },
        "created_at": "2012-09-26T01:05:14.064276Z",
        "fee": 0,
        "id": "WD71jLB5eSyVM3bedL6Moptg",
        "state": "pending",
        "uri": "/a0/debits/WD71jLB5eSyVM3bedL6Moptg"
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
            "created_at": "2012-09-26T01:05:14.462578Z",
            "credits_uri": "/a0/bank_accounts/BA71LA2XQNlMHY5zUD45ncG6/credits/",
            "debits_uri": "/a0/bank_accounts/BA71LA2XQNlMHY5zUD45ncG6/debits/",
            "id": "BA71LA2XQNlMHY5zUD45ncG6",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA71LA2XQNlMHY5zUD45ncG6"
        },
        "created_at": "2012-09-26T01:05:14.464047Z",
        "fee": 0,
        "id": "WD71L59bLh40qOMmtCDaeIGe",
        "state": "pending",
        "uri": "/a0/debits/WD71L59bLh40qOMmtCDaeIGe"
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
        "created_at": "2012-09-26T01:05:14.875357Z",
        "fee": 0,
        "id": "WD72dIIQQ8pZuBcX7MINDx3A",
        "state": "pending",
        "uri": "/a0/debits/WD72dIIQQ8pZuBcX7MINDx3A"
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
                    "created_at": "2012-09-26T01:05:15.288446Z",
                    "credits_uri": "/a0/bank_accounts/BA72HaF2p5OURm0dbp1rpkuu/credits/",
                    "debits_uri": "/a0/bank_accounts/BA72HaF2p5OURm0dbp1rpkuu/debits/",
                    "id": "BA72HaF2p5OURm0dbp1rpkuu",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA72HaF2p5OURm0dbp1rpkuu"
                },
                "created_at": "2012-09-26T01:05:15.290030Z",
                "fee": 0,
                "id": "WD72GAr4FyoxlD2ngZGocVKi",
                "state": "pending",
                "uri": "/a0/debits/WD72GAr4FyoxlD2ngZGocVKi"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:15.299981Z",
                    "credits_uri": "/a0/bank_accounts/BA72I1XnKVbRhAn6CdFYvtsm/credits/",
                    "debits_uri": "/a0/bank_accounts/BA72I1XnKVbRhAn6CdFYvtsm/debits/",
                    "id": "BA72I1XnKVbRhAn6CdFYvtsm",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA72I1XnKVbRhAn6CdFYvtsm"
                },
                "created_at": "2012-09-26T01:05:15.300666Z",
                "fee": 0,
                "id": "WD72HZnUWes2O0DLjKgOb2qu",
                "state": "pending",
                "uri": "/a0/debits/WD72HZnUWes2O0DLjKgOb2qu"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:15.307099Z",
                    "credits_uri": "/a0/bank_accounts/BA72IwzJAGRk4XBYSHExUvYC/credits/",
                    "debits_uri": "/a0/bank_accounts/BA72IwzJAGRk4XBYSHExUvYC/debits/",
                    "id": "BA72IwzJAGRk4XBYSHExUvYC",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA72IwzJAGRk4XBYSHExUvYC"
                },
                "created_at": "2012-09-26T01:05:15.307844Z",
                "fee": 0,
                "id": "WD72IufuKvjOx6XIKtOndAj8",
                "state": "pending",
                "uri": "/a0/debits/WD72IufuKvjOx6XIKtOndAj8"
            }
        ]
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
                    "created_at": "2012-09-26T01:05:15.707052Z",
                    "credits_uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ/credits/",
                    "debits_uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ/debits/",
                    "id": "BA739N1qMHMKafXmxx6JeQRQ",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ"
                },
                "created_at": "2012-09-26T01:05:15.723546Z",
                "fee": 0,
                "id": "WD73bty6794g3JpZU8ZMksRQ",
                "state": "pending",
                "uri": "/a0/debits/WD73bty6794g3JpZU8ZMksRQ"
            },
            {
                "amount": 4281906,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:15.707052Z",
                    "credits_uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ/credits/",
                    "debits_uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ/debits/",
                    "id": "BA739N1qMHMKafXmxx6JeQRQ",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ"
                },
                "created_at": "2012-09-26T01:05:15.734380Z",
                "fee": 0,
                "id": "WD73chBWeD37GPI6IXVVWXNg",
                "state": "pending",
                "uri": "/a0/debits/WD73chBWeD37GPI6IXVVWXNg"
            },
            {
                "amount": 1300,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-26T01:05:15.707052Z",
                    "credits_uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ/credits/",
                    "debits_uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ/debits/",
                    "id": "BA739N1qMHMKafXmxx6JeQRQ",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA739N1qMHMKafXmxx6JeQRQ"
                },
                "created_at": "2012-09-26T01:05:15.743603Z",
                "fee": 0,
                "id": "WD73cWegPJiyjuufYgCeZnUm",
                "state": "pending",
                "uri": "/a0/debits/WD73cWegPJiyjuufYgCeZnUm"
            }
        ]
    }




