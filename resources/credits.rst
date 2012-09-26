Credits
=======

-  `Credit a New Bank Account`_
-  `Credit an Existing Bank Account`_
-  `Retrieve a Credit`_
-  `Retrieve a Credit (Unstored Bank Account)`_
-  `List All Credits`_
-  `List All Credits for a Bank Account`_


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
                    "created_at": "2012-09-25T22:43:06.514371Z",
                    "credits_uri": "/a0/bank_accounts/BAmq2bnSQ5ThPRiC2ptI09Y/credits/",
                    "debits_uri": "/a0/bank_accounts/BAmq2bnSQ5ThPRiC2ptI09Y/debits/",
                    "id": "BAmq2bnSQ5ThPRiC2ptI09Y",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAmq2bnSQ5ThPRiC2ptI09Y"
                },
                "created_at": "2012-09-25T22:43:06.515902Z",
                "fee": 0,
                "id": "CRmpuKrU2jtH7s4PJvKb7bc",
                "state": "pending",
                "uri": "/a0/credits/CRmpuKrU2jtH7s4PJvKb7bc"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T22:43:06.526054Z",
                    "credits_uri": "/a0/bank_accounts/BAmqUaxkWeq7WK9LgdPrf3c/credits/",
                    "debits_uri": "/a0/bank_accounts/BAmqUaxkWeq7WK9LgdPrf3c/debits/",
                    "id": "BAmqUaxkWeq7WK9LgdPrf3c",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAmqUaxkWeq7WK9LgdPrf3c"
                },
                "created_at": "2012-09-25T22:43:06.526521Z",
                "fee": 0,
                "id": "CRmqRbBGBYsfPQfAvE76jou",
                "state": "pending",
                "uri": "/a0/credits/CRmqRbBGBYsfPQfAvE76jou"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T22:43:06.533280Z",
                    "credits_uri": "/a0/bank_accounts/BAmrphq6PFnfbHIy2SCyCPU/credits/",
                    "debits_uri": "/a0/bank_accounts/BAmrphq6PFnfbHIy2SCyCPU/debits/",
                    "id": "BAmrphq6PFnfbHIy2SCyCPU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAmrphq6PFnfbHIy2SCyCPU"
                },
                "created_at": "2012-09-25T22:43:06.533842Z",
                "fee": 0,
                "id": "CRmrmsYgZPTdfUccNofsAT8",
                "state": "pending",
                "uri": "/a0/credits/CRmrmsYgZPTdfUccNofsAT8"
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
            "created_at": "2012-09-25T22:43:06.941843Z",
            "credits_uri": "/a0/bank_accounts/BAmTQcfyHYJeTnuJBoZKQOK/credits/",
            "debits_uri": "/a0/bank_accounts/BAmTQcfyHYJeTnuJBoZKQOK/debits/",
            "id": "BAmTQcfyHYJeTnuJBoZKQOK",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BAmTQcfyHYJeTnuJBoZKQOK"
        },
        "created_at": "2012-09-25T22:43:06.943218Z",
        "fee": 0,
        "id": "CRmTjHMfjsTrvjnnAbI1dd8",
        "state": "pending",
        "uri": "/a0/credits/CRmTjHMfjsTrvjnnAbI1dd8"
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
            "created_at": "2012-09-25T22:43:07.389057Z",
            "credits_uri": "/a0/bank_accounts/BAnp1Jew7rW3X3TgWzmCYZQ/credits/",
            "debits_uri": "/a0/bank_accounts/BAnp1Jew7rW3X3TgWzmCYZQ/debits/",
            "id": "BAnp1Jew7rW3X3TgWzmCYZQ",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BAnp1Jew7rW3X3TgWzmCYZQ"
        },
        "created_at": "2012-09-25T22:43:07.390533Z",
        "fee": 0,
        "id": "CRnovOaC3KSrrFdlCjMiCYa",
        "state": "pending",
        "uri": "/a0/credits/CRnovOaC3KSrrFdlCjMiCYa"
    }




