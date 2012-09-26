Bank Accounts
=============

-  `Store a Bank Account`_
-  `Retrieve a Bank Account`_
-  `List All Bank Accounts`_
-  `Unstore a Bank Account`_


Store a bank account
--------------------

.. code::

    POST /a0/bank_accounts


Request
~~~~~~~

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
        "name": "Gottfried Leibniz",
        "account_number": "3819372930",
        "routing_number": "121042882",
        "type": "checking"
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
        "account_number": "xxxxxx2930",
        "created_at": "2012-09-25T21:25:31.803647Z",
        "credits_uri": "/a0/bank_accounts/BA1CRHMGKwPAYnLaij05r1VM/credits",
        "debits_uri": "/a0/bank_accounts/BA1CRHMGKwPAYnLaij05r1VM/debits",
        "id": "BA1CRHMGKwPAYnLaij05r1VM",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA1CRHMGKwPAYnLaij05r1VM"
    }



List all bank accounts
----------------------

.. code::

    GET /a0/bank_accounts


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
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T21:25:32.205962Z",
                "credits_uri": "/a0/bank_accounts/BA1DjDf8yJJb6JjaL08cIH2O/credits",
                "debits_uri": "/a0/bank_accounts/BA1DjDf8yJJb6JjaL08cIH2O/debits",
                "id": "BA1DjDf8yJJb6JjaL08cIH2O",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA1DjDf8yJJb6JjaL08cIH2O"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T21:25:32.214489Z",
                "credits_uri": "/a0/bank_accounts/BA1DkPcZqDzSpiu2ruSyaYdk/credits",
                "debits_uri": "/a0/bank_accounts/BA1DkPcZqDzSpiu2ruSyaYdk/debits",
                "id": "BA1DkPcZqDzSpiu2ruSyaYdk",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA1DkPcZqDzSpiu2ruSyaYdk"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T21:25:32.219899Z",
                "credits_uri": "/a0/bank_accounts/BA1DldigbH6Gm8Vu0juskI9Y/credits",
                "debits_uri": "/a0/bank_accounts/BA1DldigbH6Gm8Vu0juskI9Y/debits",
                "id": "BA1DldigbH6Gm8Vu0juskI9Y",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA1DldigbH6Gm8Vu0juskI9Y"
            }
        ]
    }



Unstore a bank account
----------------------

.. code::

    DELETE /a0/bank_accounts/:bank_account_id


Response
~~~~~~~~

Header
^^^^^^

.. code::

    Status: 204 No Content



Retrieve a bank account
-----------------------

.. code::

    GET /a0/bank_accounts/:bank_account_id


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
        "account_number": "xxxxxx2930",
        "created_at": "2012-09-25T21:25:33.034398Z",
        "credits_uri": "/a0/bank_accounts/BA1Efw8iwJWSIfvEJVD2cllM/credits",
        "debits_uri": "/a0/bank_accounts/BA1Efw8iwJWSIfvEJVD2cllM/debits",
        "id": "BA1Efw8iwJWSIfvEJVD2cllM",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA1Efw8iwJWSIfvEJVD2cllM"
    }




