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
                    "created_at": "2012-09-25T22:38:17.798230Z",
                    "credits_uri": "/a0/bank_accounts/BA2UL4a7hkbvlbmxytCCkLtU/credits/",
                    "debits_uri": "/a0/bank_accounts/BA2UL4a7hkbvlbmxytCCkLtU/debits/",
                    "id": "BA2UL4a7hkbvlbmxytCCkLtU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA2UL4a7hkbvlbmxytCCkLtU"
                },
                "created_at": "2012-09-25T22:38:17.799673Z",
                "fee": 0,
                "id": "CR2UKyXTMxWhLH11zlkedppg",
                "state": "pending",
                "uri": "/a0/credits/CR2UKyXTMxWhLH11zlkedppg"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T22:38:17.810739Z",
                    "credits_uri": "/a0/bank_accounts/BA2ULZ9kbpKitSHI5fbD9M5Y/credits/",
                    "debits_uri": "/a0/bank_accounts/BA2ULZ9kbpKitSHI5fbD9M5Y/debits/",
                    "id": "BA2ULZ9kbpKitSHI5fbD9M5Y",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA2ULZ9kbpKitSHI5fbD9M5Y"
                },
                "created_at": "2012-09-25T22:38:17.811387Z",
                "fee": 0,
                "id": "CR2ULVTidOlwXTyx6le16Np8",
                "state": "pending",
                "uri": "/a0/credits/CR2ULVTidOlwXTyx6le16Np8"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T22:38:17.819132Z",
                    "credits_uri": "/a0/bank_accounts/BA2UMzSfrIeQLjNP6OB8AP90/credits/",
                    "debits_uri": "/a0/bank_accounts/BA2UMzSfrIeQLjNP6OB8AP90/debits/",
                    "id": "BA2UMzSfrIeQLjNP6OB8AP90",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA2UMzSfrIeQLjNP6OB8AP90"
                },
                "created_at": "2012-09-25T22:38:17.819747Z",
                "fee": 0,
                "id": "CR2UMwQAhlr1hk5X2xA40sAi",
                "state": "pending",
                "uri": "/a0/credits/CR2UMwQAhlr1hk5X2xA40sAi"
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
            "created_at": "2012-09-25T22:38:18.235138Z",
            "credits_uri": "/a0/bank_accounts/BA2Vfxb0HjIBd5YdsZEKk32O/credits/",
            "debits_uri": "/a0/bank_accounts/BA2Vfxb0HjIBd5YdsZEKk32O/debits/",
            "id": "BA2Vfxb0HjIBd5YdsZEKk32O",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA2Vfxb0HjIBd5YdsZEKk32O"
        },
        "created_at": "2012-09-25T22:38:18.236569Z",
        "fee": 0,
        "id": "CR2Vf1Vy6KfX7one8DtgbskG",
        "state": "pending",
        "uri": "/a0/credits/CR2Vf1Vy6KfX7one8DtgbskG"
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
            "created_at": "2012-09-25T22:38:18.723513Z",
            "credits_uri": "/a0/bank_accounts/BA2VNAvr8oZvhsU5DxrjcoDU/credits/",
            "debits_uri": "/a0/bank_accounts/BA2VNAvr8oZvhsU5DxrjcoDU/debits/",
            "id": "BA2VNAvr8oZvhsU5DxrjcoDU",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA2VNAvr8oZvhsU5DxrjcoDU"
        },
        "created_at": "2012-09-25T22:38:18.725039Z",
        "fee": 0,
        "id": "CR2VN1YYKNHya7ZWeJXJzlq2",
        "state": "pending",
        "uri": "/a0/credits/CR2VN1YYKNHya7ZWeJXJzlq2"
    }




