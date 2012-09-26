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
        "created_at": "2012-09-25T23:52:11.969494Z",
        "credits_uri": "/a0/bank_accounts/BA5rjF1GxzVN4bjZijMljbDA/credits/",
        "debits_uri": "/a0/bank_accounts/BA5rjF1GxzVN4bjZijMljbDA/debits/",
        "id": "BA5rjF1GxzVN4bjZijMljbDA",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA5rjF1GxzVN4bjZijMljbDA"
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
        "created_at": "2012-09-25T23:52:12.968570Z",
        "credits_uri": "/a0/bank_accounts/BA5srfTwnsLuN3sk2uEtDhIS/credits/",
        "debits_uri": "/a0/bank_accounts/BA5srfTwnsLuN3sk2uEtDhIS/debits/",
        "id": "BA5srfTwnsLuN3sk2uEtDhIS",
        "name": "Gottfried Leibniz",
        "routing_number": "121042882",
        "type": "checking",
        "uri": "/a0/bank_accounts/BA5srfTwnsLuN3sk2uEtDhIS"
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
                "created_at": "2012-09-25T23:52:13.365373Z",
                "credits_uri": "/a0/bank_accounts/BA5sT7yT4dBiHzdXdgkKaBS2/credits/",
                "debits_uri": "/a0/bank_accounts/BA5sT7yT4dBiHzdXdgkKaBS2/debits/",
                "id": "BA5sT7yT4dBiHzdXdgkKaBS2",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA5sT7yT4dBiHzdXdgkKaBS2"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T23:52:13.373605Z",
                "credits_uri": "/a0/bank_accounts/BA5sU7CzJ6T7ohUPC5wSRKiK/credits/",
                "debits_uri": "/a0/bank_accounts/BA5sU7CzJ6T7ohUPC5wSRKiK/debits/",
                "id": "BA5sU7CzJ6T7ohUPC5wSRKiK",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA5sU7CzJ6T7ohUPC5wSRKiK"
            },
            {
                "account_number": "xxxxxx2930",
                "created_at": "2012-09-25T23:52:13.379865Z",
                "credits_uri": "/a0/bank_accounts/BA5sUyxeuodEJ6koW2UBN7wm/credits/",
                "debits_uri": "/a0/bank_accounts/BA5sUyxeuodEJ6koW2UBN7wm/debits/",
                "id": "BA5sUyxeuodEJ6koW2UBN7wm",
                "name": "Gottfried Leibniz",
                "routing_number": "121042882",
                "type": "checking",
                "uri": "/a0/bank_accounts/BA5sUyxeuodEJ6koW2UBN7wm"
            }
        ]
    }




