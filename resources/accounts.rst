Accounts
========

- `Create a Buyer`_
- `Create a Person Merchant`_
- `Create a Business Merchant`_
- `Retrieve an Account`_
- `List all Accounts`_
- `Update an Account`_
- `Promote a Buyer Account to a Merchant`_

Fields
------

``id`` 
    **string**.  
 
``uri`` 
    **string**. The URI of the account. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    account was created. 
 
``name`` 
    **string**. The name of the account. 
 
``email_address`` 
    **string**. The email address of the account. 
 
``roles`` 
    **list**. A list of roles the account has. Can be zero, one, or both of 
    ``buyer``, ``merchant`` 
 
``debits_uri`` 
    **string**. URI for all debits associated with the account. 
 
``credits_uri`` 
    **string**. URI for all credits associated with the account. 
 
``refunds_uri`` 
    **string**. URI for all refunds associated with the account. 
 
``holds_uri`` 
    **string**. URI for all holds associated with the account. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``transactions_uri`` 
    **string**. URI for all transactions associated with the account. 
 
``bank_accounts_uri`` 
    **string**. URI for all bank accounts associated with the account. 
 
``cards_uri`` 
    **string**. URI for all cards associated with the account. 
 

Create a Buyer
--------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts 
 

Request
~~~~~~~

``name`` 
    *optional* **string**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``card_uri`` 
    *optional* **string**. The URI of the tokenized card. 
 
``card`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `Create a Card <./cards.rst#create-a-card>`_. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "card_uri": "/v1/marketplaces/TEST-MPztUdHq2sMQtKSvtayTswH/cards/CC12df5a744a5211e2a09180ee7316ae43",  
        "email_address": "b@m.com",  
        "name": "Benny Riemann" 
    } 
 

Response
~~~~~~~~

Headers 
^^^^^^^ 
 
.. code::  
 
    Status: 201 CREATED 
 
Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPBfgE3Y2MH2ZNGWis580WD/accounts/ACBsJY4nNaujlrGyHwgMHdN/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MPBfgE3Y2MH2ZNGWis580WD/accounts/ACBsJY4nNaujlrGyHwgMHdN/cards",  
        "created_at": "2012-12-20T03:05:15.540701Z",  
        "credits_uri": "/v1/marketplaces/TEST-MPBfgE3Y2MH2ZNGWis580WD/accounts/ACBsJY4nNaujlrGyHwgMHdN/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MPBfgE3Y2MH2ZNGWis580WD/accounts/ACBsJY4nNaujlrGyHwgMHdN/debits",  
        "email_address": "b@m.com",  
        "holds_uri": "/v1/marketplaces/TEST-MPBfgE3Y2MH2ZNGWis580WD/accounts/ACBsJY4nNaujlrGyHwgMHdN/holds",  
        "id": "ACBsJY4nNaujlrGyHwgMHdN",  
        "meta": {},  
        "name": "Benny Riemann",  
        "refunds_uri": "/v1/marketplaces/TEST-MPBfgE3Y2MH2ZNGWis580WD/accounts/ACBsJY4nNaujlrGyHwgMHdN/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MPBfgE3Y2MH2ZNGWis580WD/accounts/ACBsJY4nNaujlrGyHwgMHdN/transactions",  
        "uri": "/v1/marketplaces/TEST-MPBfgE3Y2MH2ZNGWis580WD/accounts/ACBsJY4nNaujlrGyHwgMHdN" 
    } 
 

Create a Business Merchant
--------------------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts 
 

Request
~~~~~~~

``name`` 
    *optional* **string**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``bank_account_uri`` 
    *optional* **string**. The URI of the bank account created via *balanced.js*. 
 
``bank_account`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 
``merchant_uri`` 
    *optional* **string**. The URI of the merchant account created during a request for more 
    information. 
 
``merchant`` 
    .. cssclass:: nested1 
 
    *optional* **object**.  
        ``type`` 
            *required* **string**. Merchant type. It should be one of: ``person`` or ``business``. 
 
        ``phone_number`` 
            *required* **string**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
        ``email_address`` 
            *optional* **string** or **null**. RFC-2822 formatted email address. 
 
        ``meta`` 
            *optional* **object**. Single level mapping from string keys to string values. 
 
        ``tax_id`` 
            *optional* **string**. Length must be **between** ``4`` and ``9``. 
 
        ``person`` 
            .. cssclass:: nested2 
 
            *optional* **object**.  
                ``name`` 
                    *required* **string**. Sequence of characters. 
 
                ``dob`` 
                    *required* **string**. Date-of-birth formatted as ``YYYY-MM-DD``. 
 
                ``city`` 
                    *optional* **string**. City. 
 
                ``postal_code`` 
                    *required* **string**. Postal code. This is known as a zip code in the USA. 
                    *requires* ``country_code``. 
 
                ``street_address`` 
                    *required* **string**. Street address. 
                    *requires* ``postal_code``. 
 
                ``country_code`` 
                    *optional* **string**. `ISO-3166-3 
                    <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ 
                    three character country code. 
 
                ``tax_id`` 
                    *optional* **string**. Length must be **between** ``4`` and ``9``. 
 
 
        ``name`` 
            *optional* **string**. Sequence of characters. Length must be **<=** ``128``. 
 
        ``production`` 
            *optional* **boolean**. Flag value, should be ``true`` or ``false``. 
 
        ``city`` 
            *optional* **string**. City. 
 
        ``postal_code`` 
            *required* **string**. Postal code. This is known as a zip code in the USA. 
            *requires* ``country_code``. 
 
        ``street_address`` 
            *required* **string**. Street address. 
            *requires* ``postal_code``. 
 
        ``country_code`` 
            *optional* **string**. `ISO-3166-3 
            <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ 
            three character country code. 
 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "merchant": { 
            "phone_number": "+19046281796",  
            "city": "San Francisco",  
            "name": "jo",  
            "person": { 
                "city": "San Francisco",  
                "state": "CA",  
                "postal_code": "94110",  
                "name": "jo",  
                "dob": "1984-01",  
                "street_address": "Somewhere over the rainbow",  
                "tax_id": "451223500" 
            },  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "business",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "538358600" 
        } 
    } 
 

Response
~~~~~~~~

Headers 
^^^^^^^ 
 
.. code::  
 
    Status: 201 CREATED 
 
Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPF34AGRrR6PY7lICZhk0Jd/accounts/ACFeMMv4K4zWTF6trBQiB9N/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MPF34AGRrR6PY7lICZhk0Jd/accounts/ACFeMMv4K4zWTF6trBQiB9N/cards",  
        "created_at": "2012-12-20T03:05:18.897106Z",  
        "credits_uri": "/v1/marketplaces/TEST-MPF34AGRrR6PY7lICZhk0Jd/accounts/ACFeMMv4K4zWTF6trBQiB9N/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MPF34AGRrR6PY7lICZhk0Jd/accounts/ACFeMMv4K4zWTF6trBQiB9N/debits",  
        "email_address": null,  
        "holds_uri": "/v1/marketplaces/TEST-MPF34AGRrR6PY7lICZhk0Jd/accounts/ACFeMMv4K4zWTF6trBQiB9N/holds",  
        "id": "ACFeMMv4K4zWTF6trBQiB9N",  
        "meta": {},  
        "name": "jo",  
        "refunds_uri": "/v1/marketplaces/TEST-MPF34AGRrR6PY7lICZhk0Jd/accounts/ACFeMMv4K4zWTF6trBQiB9N/refunds",  
        "roles": [ 
            "merchant" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MPF34AGRrR6PY7lICZhk0Jd/accounts/ACFeMMv4K4zWTF6trBQiB9N/transactions",  
        "uri": "/v1/marketplaces/TEST-MPF34AGRrR6PY7lICZhk0Jd/accounts/ACFeMMv4K4zWTF6trBQiB9N" 
    } 
 

Create a Person Merchant
------------------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts 
 

Request
~~~~~~~

``name`` 
    *optional* **string**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``bank_account_uri`` 
    *optional* **string**. The URI of the bank account created via *balanced.js*. 
 
``bank_account`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 
``merchant_uri`` 
    *optional* **string**. The URI of the merchant account created during a request for more 
    information. 
 
``merchant`` 
    .. cssclass:: nested1 
 
    *optional* **object**.  
        ``type`` 
            *required* **string**. Merchant type. It should be one of: ``person`` or ``business``. 
 
        ``phone_number`` 
            *required* **string**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
        ``email_address`` 
            *optional* **string** or **null**. RFC-2822 formatted email address. 
 
        ``meta`` 
            *optional* **object**. Single level mapping from string keys to string values. 
 
        ``tax_id`` 
            *optional* **string**. Length must be **between** ``4`` and ``9``. 
 
        ``dob`` 
            *optional* **string**. Date-of-birth formatted as ``YYYY-MM-DD``. 
 
        ``name`` 
            *optional* **string**. Sequence of characters. Length must be **<=** ``128``. 
 
        ``production`` 
            *optional* **boolean**. Flag value, should be ``true`` or ``false``. 
 
        ``city`` 
            *optional* **string**. City. 
 
        ``postal_code`` 
            *required* **string**. Postal code. This is known as a zip code in the USA. 
            *requires* ``country_code``. 
 
        ``street_address`` 
            *required* **string**. Street address. 
            *requires* ``postal_code``. 
 
        ``country_code`` 
            *optional* **string**. `ISO-3166-3 
            <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ 
            three character country code. 
 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "merchant": { 
            "phone_number": "+19046281796",  
            "city": "San Francisco",  
            "name": "jo",  
            "dob": "1984-01",  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "person",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "642705400" 
        } 
    } 
 

Response
~~~~~~~~

Headers 
^^^^^^^ 
 
.. code::  
 
    Status: 201 CREATED 
 
Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPIGWBVZOtuErlHmaoMG307/accounts/ACIRPT9pEDSW2waSlYggKpZ/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MPIGWBVZOtuErlHmaoMG307/accounts/ACIRPT9pEDSW2waSlYggKpZ/cards",  
        "created_at": "2012-12-20T03:05:22.124331Z",  
        "credits_uri": "/v1/marketplaces/TEST-MPIGWBVZOtuErlHmaoMG307/accounts/ACIRPT9pEDSW2waSlYggKpZ/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MPIGWBVZOtuErlHmaoMG307/accounts/ACIRPT9pEDSW2waSlYggKpZ/debits",  
        "email_address": null,  
        "holds_uri": "/v1/marketplaces/TEST-MPIGWBVZOtuErlHmaoMG307/accounts/ACIRPT9pEDSW2waSlYggKpZ/holds",  
        "id": "ACIRPT9pEDSW2waSlYggKpZ",  
        "meta": {},  
        "name": "jo",  
        "refunds_uri": "/v1/marketplaces/TEST-MPIGWBVZOtuErlHmaoMG307/accounts/ACIRPT9pEDSW2waSlYggKpZ/refunds",  
        "roles": [ 
            "merchant" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MPIGWBVZOtuErlHmaoMG307/accounts/ACIRPT9pEDSW2waSlYggKpZ/transactions",  
        "uri": "/v1/marketplaces/TEST-MPIGWBVZOtuErlHmaoMG307/accounts/ACIRPT9pEDSW2waSlYggKpZ" 
    } 
 

Retrieve an Account
-------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id 
 

Body 
~~~~ 
 
Headers 
~~~~~~~ 
 
.. code::  
 
    Status: 200 OK 
 
Body 
~~~~ 
 
.. code:: javascript 
 
    { 
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPKMf7ulLdT8Aec7vfWzggX/accounts/ACKWmUG4k52fZSY28yylyXV/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MPKMf7ulLdT8Aec7vfWzggX/accounts/ACKWmUG4k52fZSY28yylyXV/cards",  
        "created_at": "2012-12-20T03:05:23.967455Z",  
        "credits_uri": "/v1/marketplaces/TEST-MPKMf7ulLdT8Aec7vfWzggX/accounts/ACKWmUG4k52fZSY28yylyXV/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MPKMf7ulLdT8Aec7vfWzggX/accounts/ACKWmUG4k52fZSY28yylyXV/debits",  
        "email_address": "email.6@y.com",  
        "holds_uri": "/v1/marketplaces/TEST-MPKMf7ulLdT8Aec7vfWzggX/accounts/ACKWmUG4k52fZSY28yylyXV/holds",  
        "id": "ACKWmUG4k52fZSY28yylyXV",  
        "meta": {},  
        "name": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MPKMf7ulLdT8Aec7vfWzggX/accounts/ACKWmUG4k52fZSY28yylyXV/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MPKMf7ulLdT8Aec7vfWzggX/accounts/ACKWmUG4k52fZSY28yylyXV/transactions",  
        "uri": "/v1/marketplaces/TEST-MPKMf7ulLdT8Aec7vfWzggX/accounts/ACKWmUG4k52fZSY28yylyXV" 
    } 
 

List all Accounts
-----------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts 
 

Response 
~~~~~~~~ 
 
Headers 
^^^^^^^ 
 
.. code::  
 
    Status: 200 OK 
 
Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "first_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMMiI2Xmh07VwZIyLcIyIj/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMMiI2Xmh07VwZIyLcIyIj/cards",  
                "created_at": "2012-12-20T03:05:25.601752Z",  
                "credits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMMiI2Xmh07VwZIyLcIyIj/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMMiI2Xmh07VwZIyLcIyIj/debits",  
                "email_address": "email.1@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMMiI2Xmh07VwZIyLcIyIj/holds",  
                "id": "ACMMiI2Xmh07VwZIyLcIyIj",  
                "meta": {},  
                "name": "Merchants, Inc.",  
                "refunds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMMiI2Xmh07VwZIyLcIyIj/refunds",  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMMiI2Xmh07VwZIyLcIyIj/transactions",  
                "uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMMiI2Xmh07VwZIyLcIyIj" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPb01n9QbH8J7r9b94DMT/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPb01n9QbH8J7r9b94DMT/cards",  
                "created_at": "2012-12-20T03:05:25.642678Z",  
                "credits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPb01n9QbH8J7r9b94DMT/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPb01n9QbH8J7r9b94DMT/debits",  
                "email_address": "email.3@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPb01n9QbH8J7r9b94DMT/holds",  
                "id": "ACMPb01n9QbH8J7r9b94DMT",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPb01n9QbH8J7r9b94DMT/refunds",  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPb01n9QbH8J7r9b94DMT/transactions",  
                "uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPb01n9QbH8J7r9b94DMT" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPgqXP9YzuSmCgQyNTOqn/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPgqXP9YzuSmCgQyNTOqn/cards",  
                "created_at": "2012-12-20T03:05:25.643883Z",  
                "credits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPgqXP9YzuSmCgQyNTOqn/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPgqXP9YzuSmCgQyNTOqn/debits",  
                "email_address": "email.4@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPgqXP9YzuSmCgQyNTOqn/holds",  
                "id": "ACMPgqXP9YzuSmCgQyNTOqn",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPgqXP9YzuSmCgQyNTOqn/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPgqXP9YzuSmCgQyNTOqn/transactions",  
                "uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMPgqXP9YzuSmCgQyNTOqn" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMRp97EoFIQ2ObIPzTTmwj/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMRp97EoFIQ2ObIPzTTmwj/cards",  
                "created_at": "2012-12-20T03:05:25.674558Z",  
                "credits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMRp97EoFIQ2ObIPzTTmwj/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMRp97EoFIQ2ObIPzTTmwj/debits",  
                "email_address": "email.5@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMRp97EoFIQ2ObIPzTTmwj/holds",  
                "id": "ACMRp97EoFIQ2ObIPzTTmwj",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMRp97EoFIQ2ObIPzTTmwj/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMRp97EoFIQ2ObIPzTTmwj/transactions",  
                "uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMRp97EoFIQ2ObIPzTTmwj" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUdZJ6POi9rKnotfMMW67/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUdZJ6POi9rKnotfMMW67/cards",  
                "created_at": "2012-12-20T03:05:25.714896Z",  
                "credits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUdZJ6POi9rKnotfMMW67/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUdZJ6POi9rKnotfMMW67/debits",  
                "email_address": "email.7@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUdZJ6POi9rKnotfMMW67/holds",  
                "id": "ACMUdZJ6POi9rKnotfMMW67",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUdZJ6POi9rKnotfMMW67/refunds",  
                "roles": [ 
                    "merchant" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUdZJ6POi9rKnotfMMW67/transactions",  
                "uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUdZJ6POi9rKnotfMMW67" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUie9oHkItYYmTvRTnDlV/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUie9oHkItYYmTvRTnDlV/cards",  
                "created_at": "2012-12-20T03:05:25.715859Z",  
                "credits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUie9oHkItYYmTvRTnDlV/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUie9oHkItYYmTvRTnDlV/debits",  
                "email_address": "email.8@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUie9oHkItYYmTvRTnDlV/holds",  
                "id": "ACMUie9oHkItYYmTvRTnDlV",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUie9oHkItYYmTvRTnDlV/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUie9oHkItYYmTvRTnDlV/transactions",  
                "uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMUie9oHkItYYmTvRTnDlV" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMW2rfGLvoE0aW8iN63llN/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMW2rfGLvoE0aW8iN63llN/cards",  
                "created_at": "2012-12-20T03:05:25.741043Z",  
                "credits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMW2rfGLvoE0aW8iN63llN/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMW2rfGLvoE0aW8iN63llN/debits",  
                "email_address": "email.10@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMW2rfGLvoE0aW8iN63llN/holds",  
                "id": "ACMW2rfGLvoE0aW8iN63llN",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMW2rfGLvoE0aW8iN63llN/refunds",  
                "roles": [ 
                    "merchant" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMW2rfGLvoE0aW8iN63llN/transactions",  
                "uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts/ACMW2rfGLvoE0aW8iN63llN" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 7,  
        "uri": "/v1/marketplaces/TEST-MPMJYYlVR1G5h65AJoKqqPN/accounts?limit=10&offset=0" 
    } 
 

Update an Account
-----------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id 
 

Request
~~~~~~~

``name`` 
    *optional* **string**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. RFC-2822 formatted email address. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``card_uri`` 
    *optional* **string**. Tokenized card URI. 
 
``card`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `Card <./cards.rst>`_. 
 
``bank_account_uri`` 
    *optional* **string**. Tokenized bank account URI. 
 
``bank_account`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "card_uri": "/v1/marketplaces/TEST-MPORqh9SzaQZrb8akw2IJnZ/cards/CC1b0b09324a5211e2ae5280ee7316ae43",  
        "meta": { 
            "more-data": "here" 
        },  
        "email_address": "new@email.com",  
        "name": "my new name" 
    } 
 

Response
~~~~~~~~

Headers 
^^^^^^^ 
 
.. code::  
 
    Status: 200 OK 
 
Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPQVc8LhFylVRZoXvI3Nyuf/accounts/ACR6YAkSO6T1MpKzOT7Qxwf/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MPQVc8LhFylVRZoXvI3Nyuf/accounts/ACR6YAkSO6T1MpKzOT7Qxwf/cards",  
        "created_at": "2012-12-20T03:05:29.454474Z",  
        "credits_uri": "/v1/marketplaces/TEST-MPQVc8LhFylVRZoXvI3Nyuf/accounts/ACR6YAkSO6T1MpKzOT7Qxwf/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MPQVc8LhFylVRZoXvI3Nyuf/accounts/ACR6YAkSO6T1MpKzOT7Qxwf/debits",  
        "email_address": "new@email.com",  
        "holds_uri": "/v1/marketplaces/TEST-MPQVc8LhFylVRZoXvI3Nyuf/accounts/ACR6YAkSO6T1MpKzOT7Qxwf/holds",  
        "id": "ACR6YAkSO6T1MpKzOT7Qxwf",  
        "meta": { 
            "more-data": "here" 
        },  
        "name": "my new name",  
        "refunds_uri": "/v1/marketplaces/TEST-MPQVc8LhFylVRZoXvI3Nyuf/accounts/ACR6YAkSO6T1MpKzOT7Qxwf/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MPQVc8LhFylVRZoXvI3Nyuf/accounts/ACR6YAkSO6T1MpKzOT7Qxwf/transactions",  
        "uri": "/v1/marketplaces/TEST-MPQVc8LhFylVRZoXvI3Nyuf/accounts/ACR6YAkSO6T1MpKzOT7Qxwf" 
    } 
 

Promote a Buyer Account to a Merchant
-------------------------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id 
 

Request
~~~~~~~

``merchant_uri`` 
    *optional* **string**. See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_. 
 
``merchant`` 
    .. cssclass:: nested2 
 
    *optional* **object**. See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_. 
 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "merchant": { 
            "phone_number": "+19046281796",  
            "city": "San Francisco",  
            "name": "jo",  
            "dob": "1984-01",  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "person",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "467688500" 
        } 
    } 
 

Response
~~~~~~~~

Headers 
^^^^^^^ 
 
.. code::  
 
    Status: 200 OK 
 
Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPVDzIdUq3sAOFThZqVO6Mb/accounts/ACVOFGIbQN7S1wljiQJaTXt/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MPVDzIdUq3sAOFThZqVO6Mb/accounts/ACVOFGIbQN7S1wljiQJaTXt/cards",  
        "created_at": "2012-12-20T03:05:33.637328Z",  
        "credits_uri": "/v1/marketplaces/TEST-MPVDzIdUq3sAOFThZqVO6Mb/accounts/ACVOFGIbQN7S1wljiQJaTXt/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MPVDzIdUq3sAOFThZqVO6Mb/accounts/ACVOFGIbQN7S1wljiQJaTXt/debits",  
        "email_address": "email.6@y.com",  
        "holds_uri": "/v1/marketplaces/TEST-MPVDzIdUq3sAOFThZqVO6Mb/accounts/ACVOFGIbQN7S1wljiQJaTXt/holds",  
        "id": "ACVOFGIbQN7S1wljiQJaTXt",  
        "meta": {},  
        "name": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MPVDzIdUq3sAOFThZqVO6Mb/accounts/ACVOFGIbQN7S1wljiQJaTXt/refunds",  
        "roles": [ 
            "merchant",  
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MPVDzIdUq3sAOFThZqVO6Mb/accounts/ACVOFGIbQN7S1wljiQJaTXt/transactions",  
        "uri": "/v1/marketplaces/TEST-MPVDzIdUq3sAOFThZqVO6Mb/accounts/ACVOFGIbQN7S1wljiQJaTXt" 
    } 
 

