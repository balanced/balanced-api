Debits
======

-  `Debit a New Bank Account`_
-  `Debit an Existing Bank Account`_
-  `Retrieve a Debit`_
-  `Retrieve a Debit (Unstored Bank Account)`_
-  `List All Debits`_
-  `List All Debits for a Bank Account`_


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
                    "created_at": "2012-09-25T23:15:23.405707Z",
                    "credits_uri": "/a0/bank_accounts/BA4kCRRXucGynnfFY8avsrRE/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4kCRRXucGynnfFY8avsrRE/debits/",
                    "id": "BA4kCRRXucGynnfFY8avsrRE",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4kCRRXucGynnfFY8avsrRE"
                },
                "created_at": "2012-09-25T23:15:23.407202Z",
                "fee": 0,
                "id": "WD4kCn8XuBQtCLD5gQjHWmqm",
                "state": "pending",
                "uri": "/a0/debits/WD4kCn8XuBQtCLD5gQjHWmqm"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:15:23.416974Z",
                    "credits_uri": "/a0/bank_accounts/BA4kDHL9UevDfa4bD9zgff4u/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4kDHL9UevDfa4bD9zgff4u/debits/",
                    "id": "BA4kDHL9UevDfa4bD9zgff4u",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4kDHL9UevDfa4bD9zgff4u"
                },
                "created_at": "2012-09-25T23:15:23.417544Z",
                "fee": 0,
                "id": "WD4kDFeSRg4EYM9FdtqRLOtk",
                "state": "pending",
                "uri": "/a0/debits/WD4kDFeSRg4EYM9FdtqRLOtk"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:15:23.424457Z",
                    "credits_uri": "/a0/bank_accounts/BA4kEdTm9HO9RjNybFVI4d7k/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4kEdTm9HO9RjNybFVI4d7k/debits/",
                    "id": "BA4kEdTm9HO9RjNybFVI4d7k",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4kEdTm9HO9RjNybFVI4d7k"
                },
                "created_at": "2012-09-25T23:15:23.424917Z",
                "fee": 0,
                "id": "WD4kEbk6DkIGBDivKQyCpoLw",
                "state": "pending",
                "uri": "/a0/debits/WD4kEbk6DkIGBDivKQyCpoLw"
            }
        ]
    }




