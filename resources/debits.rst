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
                    "created_at": "2012-09-25T22:43:06.076002Z",
                    "credits_uri": "/a0/bank_accounts/BAlVsUnodhtrUr3vtz5zd5U/credits/",
                    "debits_uri": "/a0/bank_accounts/BAlVsUnodhtrUr3vtz5zd5U/debits/",
                    "id": "BAlVsUnodhtrUr3vtz5zd5U",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAlVsUnodhtrUr3vtz5zd5U"
                },
                "created_at": "2012-09-25T22:43:06.077420Z",
                "fee": 0,
                "id": "WDlUWgwoX3a5qy4iHJSSkBA",
                "state": "pending",
                "uri": "/a0/debits/WDlUWgwoX3a5qy4iHJSSkBA"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T22:43:06.087948Z",
                    "credits_uri": "/a0/bank_accounts/BAlWlN2HmunfvwDvVS3VEhk/credits/",
                    "debits_uri": "/a0/bank_accounts/BAlWlN2HmunfvwDvVS3VEhk/debits/",
                    "id": "BAlWlN2HmunfvwDvVS3VEhk",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAlWlN2HmunfvwDvVS3VEhk"
                },
                "created_at": "2012-09-25T22:43:06.088436Z",
                "fee": 0,
                "id": "WDlWiHRONUbIz92BO9PKtBM",
                "state": "pending",
                "uri": "/a0/debits/WDlWiHRONUbIz92BO9PKtBM"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T22:43:06.095591Z",
                    "credits_uri": "/a0/bank_accounts/BAlWSSH6HWjk07UYa4ztm2u/credits/",
                    "debits_uri": "/a0/bank_accounts/BAlWSSH6HWjk07UYa4ztm2u/debits/",
                    "id": "BAlWSSH6HWjk07UYa4ztm2u",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAlWSSH6HWjk07UYa4ztm2u"
                },
                "created_at": "2012-09-25T22:43:06.096128Z",
                "fee": 0,
                "id": "WDlWQ8M8zej9Mrt5C20Llj4",
                "state": "pending",
                "uri": "/a0/debits/WDlWQ8M8zej9Mrt5C20Llj4"
            }
        ]
    }




