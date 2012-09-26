Bank Accounts
=============

-  `Store a Bank Account`_
-  `Retrieve a Bank Account`_
-  `List All Bank Accounts`_
-  `Unstore a Bank Account`_


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
        "created_at": "2012-09-25T23:18:35.823247Z",
        "credits_uri": "/a0/bank_accounts/BA1YeOb5UO9QJnQpkG2mbTc/credits/",
        "debits_uri": "/a0/bank_accounts/BA1YeOb5UO9QJnQpkG2mbTc/debits/",
        "id": "BA1YeOb5UO9QJnQpkG2mbTc",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA1YeOb5UO9QJnQpkG2mbTc"
    }



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
        "created_at": "2012-09-25T23:18:36.786362Z",
        "credits_uri": "/a0/bank_accounts/BA33oTZ1oaueic1DcvqEyE2/credits/",
        "debits_uri": "/a0/bank_accounts/BA33oTZ1oaueic1DcvqEyE2/debits/",
        "id": "BA33oTZ1oaueic1DcvqEyE2",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA33oTZ1oaueic1DcvqEyE2"
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
                "created_at": "2012-09-25T23:18:37.179408Z",
                "credits_uri": "/a0/bank_accounts/BA3uMTWsuOFTwteNLVEO7RU/credits/",
                "debits_uri": "/a0/bank_accounts/BA3uMTWsuOFTwteNLVEO7RU/debits/",
                "id": "BA3uMTWsuOFTwteNLVEO7RU",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA3uMTWsuOFTwteNLVEO7RU"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T23:18:37.187217Z",
                "credits_uri": "/a0/bank_accounts/BA3vP6glq3dRmswEUoKR9bQ/credits/",
                "debits_uri": "/a0/bank_accounts/BA3vP6glq3dRmswEUoKR9bQ/debits/",
                "id": "BA3vP6glq3dRmswEUoKR9bQ",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA3vP6glq3dRmswEUoKR9bQ"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T23:18:37.192832Z",
                "credits_uri": "/a0/bank_accounts/BA3wdoZomF0DCIwGI2EBaRA/credits/",
                "debits_uri": "/a0/bank_accounts/BA3wdoZomF0DCIwGI2EBaRA/debits/",
                "id": "BA3wdoZomF0DCIwGI2EBaRA",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA3wdoZomF0DCIwGI2EBaRA"
            }
        ]
    }




