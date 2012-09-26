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
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:18:38.012160Z",
                    "credits_uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU/debits/",
                    "id": "BA4qSnbTtjbtBXERDs0KTRU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU"
                },
                "created_at": "2012-09-25T23:18:38.028108Z",
                "fee": 0,
                "id": "CR4smvWgVuOSu6f1UQ0lo26",
                "state": "pending",
                "uri": "/a0/credits/CR4smvWgVuOSu6f1UQ0lo26"
            },
            {
                "amount": 1400,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:18:38.012160Z",
                    "credits_uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU/debits/",
                    "id": "BA4qSnbTtjbtBXERDs0KTRU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU"
                },
                "created_at": "2012-09-25T23:18:38.038900Z",
                "fee": 0,
                "id": "CR4tb2Ei4X1laQJmUjMQHiO",
                "state": "pending",
                "uri": "/a0/credits/CR4tb2Ei4X1laQJmUjMQHiO"
            },
            {
                "amount": 1300,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:18:38.012160Z",
                    "credits_uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU/debits/",
                    "id": "BA4qSnbTtjbtBXERDs0KTRU",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4qSnbTtjbtBXERDs0KTRU"
                },
                "created_at": "2012-09-25T23:18:38.048286Z",
                "fee": 0,
                "id": "CR4tPD8drIfp5BlXH2IJ9UK",
                "state": "pending",
                "uri": "/a0/credits/CR4tPD8drIfp5BlXH2IJ9UK"
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
                    "created_at": "2012-09-25T23:18:38.453755Z",
                    "credits_uri": "/a0/bank_accounts/BA4W5pa5jO5dN2qnDtqidXc/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4W5pa5jO5dN2qnDtqidXc/debits/",
                    "id": "BA4W5pa5jO5dN2qnDtqidXc",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4W5pa5jO5dN2qnDtqidXc"
                },
                "created_at": "2012-09-25T23:18:38.455163Z",
                "fee": 0,
                "id": "CR4VzgbDHh4atLQeQYx7ISu",
                "state": "pending",
                "uri": "/a0/credits/CR4VzgbDHh4atLQeQYx7ISu"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:18:38.465153Z",
                    "credits_uri": "/a0/bank_accounts/BA4WW9Eq6PeluEgpuo76wqK/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4WW9Eq6PeluEgpuo76wqK/debits/",
                    "id": "BA4WW9Eq6PeluEgpuo76wqK",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4WW9Eq6PeluEgpuo76wqK"
                },
                "created_at": "2012-09-25T23:18:38.465711Z",
                "fee": 0,
                "id": "CR4WTbOUphgKtL0YMEroOHo",
                "state": "pending",
                "uri": "/a0/credits/CR4WTbOUphgKtL0YMEroOHo"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:18:38.472438Z",
                    "credits_uri": "/a0/bank_accounts/BA4XrTZyjZaKv8j0e7lQPFM/credits/",
                    "debits_uri": "/a0/bank_accounts/BA4XrTZyjZaKv8j0e7lQPFM/debits/",
                    "id": "BA4XrTZyjZaKv8j0e7lQPFM",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BA4XrTZyjZaKv8j0e7lQPFM"
                },
                "created_at": "2012-09-25T23:18:38.472992Z",
                "fee": 0,
                "id": "CR4XpbWUXdFiqp8coZq8mJY",
                "state": "pending",
                "uri": "/a0/credits/CR4XpbWUXdFiqp8coZq8mJY"
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
            "created_at": "2012-09-25T23:18:38.876342Z",
            "credits_uri": "/a0/bank_accounts/BA5pynVeIwlhi3Cf3UTptVg/credits/",
            "debits_uri": "/a0/bank_accounts/BA5pynVeIwlhi3Cf3UTptVg/debits/",
            "id": "BA5pynVeIwlhi3Cf3UTptVg",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA5pynVeIwlhi3Cf3UTptVg"
        },
        "created_at": "2012-09-25T23:18:38.877799Z",
        "fee": 0,
        "id": "CR5p3CNWZD8r4gjWpl9OnSG",
        "state": "pending",
        "uri": "/a0/credits/CR5p3CNWZD8r4gjWpl9OnSG"
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
        "created_at": "2012-09-25T23:18:39.287511Z",
        "fee": 0,
        "id": "CR5RDpCRL1YEnyXQ98QlfOa",
        "state": "pending",
        "uri": "/a0/credits/CR5RDpCRL1YEnyXQ98QlfOa"
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
            "created_at": "2012-09-25T23:18:39.750121Z",
            "credits_uri": "/a0/bank_accounts/BA6o5c4KEb9jOltfXjNT2B4/credits/",
            "debits_uri": "/a0/bank_accounts/BA6o5c4KEb9jOltfXjNT2B4/debits/",
            "id": "BA6o5c4KEb9jOltfXjNT2B4",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA6o5c4KEb9jOltfXjNT2B4"
        },
        "created_at": "2012-09-25T23:18:39.766350Z",
        "fee": 0,
        "id": "CR6pAm6WDM43UJemDLzsuzo",
        "state": "pending",
        "uri": "/a0/credits/CR6pAm6WDM43UJemDLzsuzo"
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
            "created_at": "2012-09-25T23:18:40.161839Z",
            "credits_uri": "/a0/bank_accounts/BA6RbWjRAW2CzwdrBWuLvjY/credits/",
            "debits_uri": "/a0/bank_accounts/BA6RbWjRAW2CzwdrBWuLvjY/debits/",
            "id": "BA6RbWjRAW2CzwdrBWuLvjY",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BA6RbWjRAW2CzwdrBWuLvjY"
        },
        "created_at": "2012-09-25T23:18:40.163187Z",
        "fee": 0,
        "id": "CR6QEPMBWqruW56C8IgdvaW",
        "state": "pending",
        "uri": "/a0/credits/CR6QEPMBWqruW56C8IgdvaW"
    }




