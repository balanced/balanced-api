Credits
=======

-  `Credit a New Bank Account`_
-  `Credit an Existing Bank Account`_
-  `Retrieve a Credit`_
-  `Retrieve a Credit (Unstored Bank Account)`_
-  `List All Credits`_
-  `List All Credits for a Bank Account`_


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
            "created_at": "2012-09-25T21:49:59.238793Z",
            "credits_uri": "/a0/bank_accounts/BA4S8tpHq54sm2nwob1Xm0vo/credits",
            "debits_uri": "/a0/bank_accounts/BA4S8tpHq54sm2nwob1Xm0vo/debits",
            "id": "BA4S8tpHq54sm2nwob1Xm0vo",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA4S8tpHq54sm2nwob1Xm0vo"
        },
        "created_at": "2012-09-25T21:49:59.240370Z",
        "fee": 0,
        "id": "CR4S7YQMjnOt9f3DysziF3YK",
        "state": "pending",
        "uri": "/a0/credits/CR4S7YQMjnOt9f3DysziF3YK"
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
                    "created_at": "2012-09-25T21:49:59.640924Z",
                    "credits_uri": "/a0/bank_accounts/BA4SAvZBxLm11p6n2tVvsPhw/credits",
                    "debits_uri": "/a0/bank_accounts/BA4SAvZBxLm11p6n2tVvsPhw/debits",
                    "id": "BA4SAvZBxLm11p6n2tVvsPhw",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4SAvZBxLm11p6n2tVvsPhw"
                },
                "created_at": "2012-09-25T21:49:59.642415Z",
                "fee": 0,
                "id": "CR4SA1vihSAo8G03ydAjTkvM",
                "state": "pending",
                "uri": "/a0/credits/CR4SA1vihSAo8G03ydAjTkvM"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T21:49:59.652369Z",
                    "credits_uri": "/a0/bank_accounts/BA4SBn09nhIxP3r5Lh9tIuvM/credits",
                    "debits_uri": "/a0/bank_accounts/BA4SBn09nhIxP3r5Lh9tIuvM/debits",
                    "id": "BA4SBn09nhIxP3r5Lh9tIuvM",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4SBn09nhIxP3r5Lh9tIuvM"
                },
                "created_at": "2012-09-25T21:49:59.652893Z",
                "fee": 0,
                "id": "CR4SBk1dIXszWVpmAUgcqo3M",
                "state": "pending",
                "uri": "/a0/credits/CR4SBk1dIXszWVpmAUgcqo3M"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T21:49:59.659748Z",
                    "credits_uri": "/a0/bank_accounts/BA4SBSOgQ5dLNUIJsMfRiTDc/credits",
                    "debits_uri": "/a0/bank_accounts/BA4SBSOgQ5dLNUIJsMfRiTDc/debits",
                    "id": "BA4SBSOgQ5dLNUIJsMfRiTDc",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4SBSOgQ5dLNUIJsMfRiTDc"
                },
                "created_at": "2012-09-25T21:49:59.660302Z",
                "fee": 0,
                "id": "CR4SBQ1576Q2XY0ZqUQBHRge",
                "state": "pending",
                "uri": "/a0/credits/CR4SBQ1576Q2XY0ZqUQBHRge"
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
            "created_at": "2012-09-25T21:50:00.129228Z",
            "credits_uri": "/a0/bank_accounts/BA4T8z33YLLAdkrYz7qAJ7lM/credits",
            "debits_uri": "/a0/bank_accounts/BA4T8z33YLLAdkrYz7qAJ7lM/debits",
            "id": "BA4T8z33YLLAdkrYz7qAJ7lM",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA4T8z33YLLAdkrYz7qAJ7lM"
        },
        "created_at": "2012-09-25T21:50:00.130766Z",
        "fee": 0,
        "id": "CR4T82OKOgqiHLrI3pRB1h2i",
        "state": "pending",
        "uri": "/a0/credits/CR4T82OKOgqiHLrI3pRB1h2i"
    }




