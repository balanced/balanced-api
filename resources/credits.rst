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
                    "created_at": "2012-09-25T23:33:35.956108Z",
                    "credits_uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe/credits/",
                    "debits_uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe/debits/",
                    "id": "BAMf1gB2BaPGvO5Iwho4fEe",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe"
                },
                "created_at": "2012-09-25T23:33:35.972257Z",
                "fee": 0,
                "id": "CRMgvyJ5V4WErSxDIamGvH4",
                "state": "pending",
                "uri": "/a0/credits/CRMgvyJ5V4WErSxDIamGvH4"
            },
            {
                "amount": 4281906,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:33:35.956108Z",
                    "credits_uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe/credits/",
                    "debits_uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe/debits/",
                    "id": "BAMf1gB2BaPGvO5Iwho4fEe",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe"
                },
                "created_at": "2012-09-25T23:33:35.983197Z",
                "fee": 0,
                "id": "CRMhkHwImZcAR5kGgs6761Y",
                "state": "pending",
                "uri": "/a0/credits/CRMhkHwImZcAR5kGgs6761Y"
            },
            {
                "amount": 1300,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:33:35.956108Z",
                    "credits_uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe/credits/",
                    "debits_uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe/debits/",
                    "id": "BAMf1gB2BaPGvO5Iwho4fEe",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAMf1gB2BaPGvO5Iwho4fEe"
                },
                "created_at": "2012-09-25T23:33:35.992635Z",
                "fee": 0,
                "id": "CRMhZu2QwDTnkrLoua5nSY2",
                "state": "pending",
                "uri": "/a0/credits/CRMhZu2QwDTnkrLoua5nSY2"
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
                    "created_at": "2012-09-25T23:33:36.403495Z",
                    "credits_uri": "/a0/bank_accounts/BAMKCzpWCl1uGbABobNCrfI/credits/",
                    "debits_uri": "/a0/bank_accounts/BAMKCzpWCl1uGbABobNCrfI/debits/",
                    "id": "BAMKCzpWCl1uGbABobNCrfI",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAMKCzpWCl1uGbABobNCrfI"
                },
                "created_at": "2012-09-25T23:33:36.405013Z",
                "fee": 0,
                "id": "CRMK8Mx0UPIxZmhXf94jFZ8",
                "state": "pending",
                "uri": "/a0/credits/CRMK8Mx0UPIxZmhXf94jFZ8"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:33:36.415248Z",
                    "credits_uri": "/a0/bank_accounts/BAMLuHecvS7LATmiRawmhM6/credits/",
                    "debits_uri": "/a0/bank_accounts/BAMLuHecvS7LATmiRawmhM6/debits/",
                    "id": "BAMLuHecvS7LATmiRawmhM6",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAMLuHecvS7LATmiRawmhM6"
                },
                "created_at": "2012-09-25T23:33:36.415782Z",
                "fee": 0,
                "id": "CRMLrJx00BCW4HxF3mnQlU6",
                "state": "pending",
                "uri": "/a0/credits/CRMLrJx00BCW4HxF3mnQlU6"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:33:36.422728Z",
                    "credits_uri": "/a0/bank_accounts/BAMM0PDKiOZBBANDOeQtKAO/credits/",
                    "debits_uri": "/a0/bank_accounts/BAMM0PDKiOZBBANDOeQtKAO/debits/",
                    "id": "BAMM0PDKiOZBBANDOeQtKAO",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAMM0PDKiOZBBANDOeQtKAO"
                },
                "created_at": "2012-09-25T23:33:36.423464Z",
                "fee": 0,
                "id": "CRMLY15gjakXPfSLRxUbd10",
                "state": "pending",
                "uri": "/a0/credits/CRMLY15gjakXPfSLRxUbd10"
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
            "created_at": "2012-09-25T23:33:36.826450Z",
            "credits_uri": "/a0/bank_accounts/BANe76c7VE3LtN3gQjEpXJg/credits/",
            "debits_uri": "/a0/bank_accounts/BANe76c7VE3LtN3gQjEpXJg/debits/",
            "id": "BANe76c7VE3LtN3gQjEpXJg",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BANe76c7VE3LtN3gQjEpXJg"
        },
        "created_at": "2012-09-25T23:33:36.827847Z",
        "fee": 0,
        "id": "CRNdwJ5FSBQ41FsANQltlQC",
        "state": "pending",
        "uri": "/a0/credits/CRNdwJ5FSBQ41FsANQltlQC"
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
        "created_at": "2012-09-25T23:33:37.232099Z",
        "fee": 0,
        "id": "CRNFOS0URqaA5G5aYTIkRK2",
        "state": "pending",
        "uri": "/a0/credits/CRNFOS0URqaA5G5aYTIkRK2"
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
            "created_at": "2012-09-25T23:33:37.655091Z",
            "credits_uri": "/a0/bank_accounts/BAO9svhFuH5S7MQpHynidlg/credits/",
            "debits_uri": "/a0/bank_accounts/BAO9svhFuH5S7MQpHynidlg/debits/",
            "id": "BAO9svhFuH5S7MQpHynidlg",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BAO9svhFuH5S7MQpHynidlg"
        },
        "created_at": "2012-09-25T23:33:37.671701Z",
        "fee": 0,
        "id": "CROb1h8YiGOyMYMV75rpoOS",
        "state": "pending",
        "uri": "/a0/credits/CROb1h8YiGOyMYMV75rpoOS"
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
            "created_at": "2012-09-25T23:33:38.072810Z",
            "credits_uri": "/a0/bank_accounts/BAOD1KNMtDHzrJR0RGBOJw6/credits/",
            "debits_uri": "/a0/bank_accounts/BAOD1KNMtDHzrJR0RGBOJw6/debits/",
            "id": "BAOD1KNMtDHzrJR0RGBOJw6",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BAOD1KNMtDHzrJR0RGBOJw6"
        },
        "created_at": "2012-09-25T23:33:38.074214Z",
        "fee": 0,
        "id": "CROClMOiJathR7wi1UkAGxQ",
        "state": "pending",
        "uri": "/a0/credits/CROClMOiJathR7wi1UkAGxQ"
    }




