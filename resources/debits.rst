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
            "created_at": "2012-09-25T23:33:33.447759Z",
            "credits_uri": "/a0/bank_accounts/BAJqvvSt8hXhHFsfQ32gD3A/credits/",
            "debits_uri": "/a0/bank_accounts/BAJqvvSt8hXhHFsfQ32gD3A/debits/",
            "id": "BAJqvvSt8hXhHFsfQ32gD3A",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BAJqvvSt8hXhHFsfQ32gD3A"
        },
        "created_at": "2012-09-25T23:33:33.449248Z",
        "fee": 0,
        "id": "WDJpXJDfPIM1jh1cP1KOEMa",
        "state": "pending",
        "uri": "/a0/debits/WDJpXJDfPIM1jh1cP1KOEMa"
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
                    "created_at": "2012-09-25T23:33:33.844142Z",
                    "credits_uri": "/a0/bank_accounts/BAJS9c94jAyqBTRZmWr9JXk/credits/",
                    "debits_uri": "/a0/bank_accounts/BAJS9c94jAyqBTRZmWr9JXk/debits/",
                    "id": "BAJS9c94jAyqBTRZmWr9JXk",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAJS9c94jAyqBTRZmWr9JXk"
                },
                "created_at": "2012-09-25T23:33:33.845587Z",
                "fee": 0,
                "id": "WDJRFQ2pbXKnlsSIL6GfCz0",
                "state": "pending",
                "uri": "/a0/debits/WDJRFQ2pbXKnlsSIL6GfCz0"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:33:33.855159Z",
                    "credits_uri": "/a0/bank_accounts/BAJSYldja3JTWi4Jk6PNCOu/credits/",
                    "debits_uri": "/a0/bank_accounts/BAJSYldja3JTWi4Jk6PNCOu/debits/",
                    "id": "BAJSYldja3JTWi4Jk6PNCOu",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAJSYldja3JTWi4Jk6PNCOu"
                },
                "created_at": "2012-09-25T23:33:33.855689Z",
                "fee": 0,
                "id": "WDJSVwYLDSB5YhThcnGsDCa",
                "state": "pending",
                "uri": "/a0/debits/WDJSVwYLDSB5YhThcnGsDCa"
            },
            {
                "amount": 1716,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:33:33.862147Z",
                    "credits_uri": "/a0/bank_accounts/BAJTsAiAxD3QY6OOerR01nQ/credits/",
                    "debits_uri": "/a0/bank_accounts/BAJTsAiAxD3QY6OOerR01nQ/debits/",
                    "id": "BAJTsAiAxD3QY6OOerR01nQ",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAJTsAiAxD3QY6OOerR01nQ"
                },
                "created_at": "2012-09-25T23:33:33.862672Z",
                "fee": 0,
                "id": "WDJTq6WGSW0gOooncEsBcca",
                "state": "pending",
                "uri": "/a0/debits/WDJTq6WGSW0gOooncEsBcca"
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
            "created_at": "2012-09-25T23:33:34.265875Z",
            "credits_uri": "/a0/bank_accounts/BAKlaz94Jbt37UF2oHZEprs/credits/",
            "debits_uri": "/a0/bank_accounts/BAKlaz94Jbt37UF2oHZEprs/debits/",
            "id": "BAKlaz94Jbt37UF2oHZEprs",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BAKlaz94Jbt37UF2oHZEprs"
        },
        "created_at": "2012-09-25T23:33:34.282180Z",
        "fee": 0,
        "id": "WDKmEMqjSuAjC3RH8ssxcCu",
        "state": "pending",
        "uri": "/a0/debits/WDKmEMqjSuAjC3RH8ssxcCu"
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
                    "created_at": "2012-09-25T23:33:34.682448Z",
                    "credits_uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2/credits/",
                    "debits_uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2/debits/",
                    "id": "BAKO4VJR5ppocC199X5gHi2",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2"
                },
                "created_at": "2012-09-25T23:33:34.698577Z",
                "fee": 0,
                "id": "WDKPGYdGmQkXALkK2PrZSae",
                "state": "pending",
                "uri": "/a0/debits/WDKPGYdGmQkXALkK2PrZSae"
            },
            {
                "amount": 4281906,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:33:34.682448Z",
                    "credits_uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2/credits/",
                    "debits_uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2/debits/",
                    "id": "BAKO4VJR5ppocC199X5gHi2",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2"
                },
                "created_at": "2012-09-25T23:33:34.709140Z",
                "fee": 0,
                "id": "WDKQusnM7ruT06wBe3HxK54",
                "state": "pending",
                "uri": "/a0/debits/WDKQusnM7ruT06wBe3HxK54"
            },
            {
                "amount": 1300,
                "bank_account": {
                    "account_number": "xxxxxx2930",
                    "created_at": "2012-09-25T23:33:34.682448Z",
                    "credits_uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2/credits/",
                    "debits_uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2/debits/",
                    "id": "BAKO4VJR5ppocC199X5gHi2",
                    "name": "Gottfried Leibniz",
                    "routing_number": "121042882",
                    "type": "checking",
                    "uri": "/a0/bank_accounts/BAKO4VJR5ppocC199X5gHi2"
                },
                "created_at": "2012-09-25T23:33:34.718619Z",
                "fee": 0,
                "id": "WDKR9lN1snr04VMh98rhY5I",
                "state": "pending",
                "uri": "/a0/debits/WDKR9lN1snr04VMh98rhY5I"
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
            "created_at": "2012-09-25T23:33:35.130667Z",
            "credits_uri": "/a0/bank_accounts/BALjRGjk7q7A1pagbgYNUqm/credits/",
            "debits_uri": "/a0/bank_accounts/BALjRGjk7q7A1pagbgYNUqm/debits/",
            "id": "BALjRGjk7q7A1pagbgYNUqm",
            "name": "Gottfried Leibniz",
            "routing_number": "121042882",
            "type": "checking",
            "uri": "/a0/bank_accounts/BALjRGjk7q7A1pagbgYNUqm"
        },
        "created_at": "2012-09-25T23:33:35.132182Z",
        "fee": 0,
        "id": "WDLjn1Vbl4p9tWsJ7Eng3B8",
        "state": "pending",
        "uri": "/a0/debits/WDLjn1Vbl4p9tWsJ7Eng3B8"
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
        "created_at": "2012-09-25T23:33:35.541470Z",
        "fee": 0,
        "id": "WDLLVShqHcFzuPeeH28Upvk",
        "state": "pending",
        "uri": "/a0/debits/WDLLVShqHcFzuPeeH28Upvk"
    }




