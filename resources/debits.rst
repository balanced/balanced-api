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
                    "created_at": "2012-09-25T23:18:37.591151Z",
                    "credits_uri": "/a0/bank_accounts/BA3XVWe8nH4c8JMmGpYWpLA/credits/",
                    "debits_uri": "/a0/bank_accounts/BA3XVWe8nH4c8JMmGpYWpLA/debits/",
                    "id": "BA3XVWe8nH4c8JMmGpYWpLA",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA3XVWe8nH4c8JMmGpYWpLA"
                },
                "created_at": "2012-09-25T23:18:37.592559Z",
                "fee": 0,
                "id": "WD3XpAmiHFdwG6xolI0jh3k",
                "state": "pending",
                "uri": "/a0/debits/WD3XpAmiHFdwG6xolI0jh3k"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:18:37.602413Z",
                    "credits_uri": "/a0/bank_accounts/BA3YLUe2vcysqaiR47e5bQu/credits/",
                    "debits_uri": "/a0/bank_accounts/BA3YLUe2vcysqaiR47e5bQu/debits/",
                    "id": "BA3YLUe2vcysqaiR47e5bQu",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA3YLUe2vcysqaiR47e5bQu"
                },
                "created_at": "2012-09-25T23:18:37.603096Z",
                "fee": 0,
                "id": "WD3YJem1loLoXPAz1XEt8JY",
                "state": "pending",
                "uri": "/a0/debits/WD3YJem1loLoXPAz1XEt8JY"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:18:37.610064Z",
                    "credits_uri": "/a0/bank_accounts/BA3ZjgfT3to2Dj6HUPTvsdc/credits/",
                    "debits_uri": "/a0/bank_accounts/BA3ZjgfT3to2Dj6HUPTvsdc/debits/",
                    "id": "BA3ZjgfT3to2Dj6HUPTvsdc",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA3ZjgfT3to2Dj6HUPTvsdc"
                },
                "created_at": "2012-09-25T23:18:37.610542Z",
                "fee": 0,
                "id": "WD3ZgyKutPJEmX6G9q6HuQy",
                "state": "pending",
                "uri": "/a0/debits/WD3ZgyKutPJEmX6G9q6HuQy"
            }
        ]
    }




