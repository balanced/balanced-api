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
    **string**. The resource identifier. 
 
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
    *optional* **string** or **null**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``card_uri`` 
    *optional* **string** or **null**. The URI of the tokenized card. 
 
``card`` 
    *optional* **object** or **null**. See `Create a Card <./cards.rst#create-a-card>`_. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "card_uri": "/v1/marketplaces/TEST-MP4JP4U6ulaY2QdSnHa7eexe/cards/CC9bd14d90237b11e2868180ee7316ae44",  
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
        "holds_uri": "/v1/marketplaces/TEST-MP4Lgj9x4hn1eCbGvrinl45S/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/holds",  
        "name": "Benny Riemann",  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-10-31T09:54:19.011465Z",  
        "uri": "/v1/marketplaces/TEST-MP4Lgj9x4hn1eCbGvrinl45S/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP4Lgj9x4hn1eCbGvrinl45S/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP4Lgj9x4hn1eCbGvrinl45S/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP4Lgj9x4hn1eCbGvrinl45S/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP4Lgj9x4hn1eCbGvrinl45S/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/transactions",  
        "email_address": "b@m.com",  
        "id": "AC4Lx9LIQR834Hg4zZnXyMoQ",  
        "credits_uri": "/v1/marketplaces/TEST-MP4Lgj9x4hn1eCbGvrinl45S/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP4Lgj9x4hn1eCbGvrinl45S/accounts/AC4Lx9LIQR834Hg4zZnXyMoQ/cards" 
    } 
 

Create a Business Merchant
--------------------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts 
 

Request
~~~~~~~

``name`` 
    *optional* **string** or **null**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``bank_account_uri`` 
    *optional* **string** or **null**. The URI of the bank account created via *balanced.js*. 
 
``bank_account`` 
    *optional* **object** or **null**. See `BankAccount <./bank_accounts.rst>`_. 
 
``merchant_uri`` 
    *optional* **string** or **null**. The URI of the merchant account created during a request for more 
    information. 
 
``merchant`` 
    *optional* **object** or **null**.  
        ``type`` 
            *required* **string** or **null**. Merchant type. It should be one of: ``person`` or ``business``. 
 
        ``phone_number`` 
            *required* **string** or **null**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
        ``email_address`` 
            *optional* **string**. RFC-2822 formatted email address. 
 
        ``meta`` 
            *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
        ``tax_id`` 
            *optional* **string** or **null**. Length must be **=** ``4`` or ``9``.
 
        ``person`` 
            *optional* **object** or **null**.  
                ``name`` 
                    *required* **string** or **null**.  
 
                ``dob`` 
                    *required* **string** or **null**. Date-of-birth formatted as ``YYYY-MM-DD``. 
 
                ``city`` 
                    *optional* **string** or **null**. City. 
 
                ``postal_code`` 
                    *required* **string** or **null**. Postal code. This is known as a zip code in the USA. 
                    *requires* ``country_code``. 
 
                ``street_address`` 
                    *required* **string** or **null**. Street address. 
                    *requires* ``postal_code``. 
 
                ``country_code`` 
                    *optional* **string** or **null**. `ISO-3166-3 
                    <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ 
                    three character country code. 
 
                ``tax_id`` 
                    *optional* **string** or **null**. Length must be **=** ``4`` or ``9``.
 
 
        ``name`` 
            *optional* **string** or **null**. Length must be **<=** ``128``. 
 
        ``production`` 
            *optional* **boolean** or **null**. Flag value, should be ``true`` or ``false``. 
 
        ``city`` 
            *optional* **string** or **null**. City. 
 
        ``postal_code`` 
            *required* **string** or **null**. Postal code. This is known as a zip code in the USA. 
            *requires* ``country_code``. 
 
        ``street_address`` 
            *required* **string** or **null**. Street address. 
            *requires* ``postal_code``. 
 
        ``country_code`` 
            *optional* **string** or **null**. `ISO-3166-3 
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
                "tax_id": "487470400" 
            },  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "business",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "451553600" 
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
        "holds_uri": "/v1/marketplaces/TEST-MP4OvyE2Tw2Nfk4ivrS0MlF2/accounts/AC4OHPedArJNfUwOnhYJSjHK/holds",  
        "name": "jo",  
        "roles": [ 
            "merchant" 
        ],  
        "created_at": "2012-10-31T09:54:21.831706Z",  
        "uri": "/v1/marketplaces/TEST-MP4OvyE2Tw2Nfk4ivrS0MlF2/accounts/AC4OHPedArJNfUwOnhYJSjHK",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP4OvyE2Tw2Nfk4ivrS0MlF2/accounts/AC4OHPedArJNfUwOnhYJSjHK/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP4OvyE2Tw2Nfk4ivrS0MlF2/accounts/AC4OHPedArJNfUwOnhYJSjHK/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP4OvyE2Tw2Nfk4ivrS0MlF2/accounts/AC4OHPedArJNfUwOnhYJSjHK/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP4OvyE2Tw2Nfk4ivrS0MlF2/accounts/AC4OHPedArJNfUwOnhYJSjHK/transactions",  
        "email_address": null,  
        "id": "AC4OHPedArJNfUwOnhYJSjHK",  
        "credits_uri": "/v1/marketplaces/TEST-MP4OvyE2Tw2Nfk4ivrS0MlF2/accounts/AC4OHPedArJNfUwOnhYJSjHK/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP4OvyE2Tw2Nfk4ivrS0MlF2/accounts/AC4OHPedArJNfUwOnhYJSjHK/cards" 
    } 
 

Create a Person Merchant
------------------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts 
 

Request
~~~~~~~

``name`` 
    *optional* **string** or **null**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``bank_account_uri`` 
    *optional* **string** or **null**. The URI of the bank account created via *balanced.js*. 
 
``bank_account`` 
    *optional* **object** or **null**. See `BankAccount <./bank_accounts.rst>`_. 
 
``merchant_uri`` 
    *optional* **string** or **null**. The URI of the merchant account created during a request for more 
    information. 
 
``merchant`` 
    *optional* **object** or **null**.  
        ``type`` 
            *required* **string** or **null**. Merchant type. It should be one of: ``person`` or ``business``. 
 
        ``phone_number`` 
            *required* **string** or **null**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
        ``email_address`` 
            *optional* **string**. RFC-2822 formatted email address. 
 
        ``meta`` 
            *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
        ``tax_id`` 
            *optional* **string** or **null**. Length must be **=** ``4`` or ``9``.
 
        ``dob`` 
            *optional* **string** or **null**. Date-of-birth formatted as ``YYYY-MM-DD``. 
 
        ``name`` 
            *optional* **string** or **null**. Length must be **<=** ``128``. 
 
        ``production`` 
            *optional* **boolean** or **null**. Flag value, should be ``true`` or ``false``. 
 
        ``city`` 
            *optional* **string** or **null**. City. 
 
        ``postal_code`` 
            *required* **string** or **null**. Postal code. This is known as a zip code in the USA. 
            *requires* ``country_code``. 
 
        ``street_address`` 
            *required* **string** or **null**. Street address. 
            *requires* ``postal_code``. 
 
        ``country_code`` 
            *optional* **string** or **null**. `ISO-3166-3 
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
            "tax_id": "818230100" 
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
        "holds_uri": "/v1/marketplaces/TEST-MP4RrM819iZ5bs9R5rlNGPxq/accounts/AC4REPjDW7TEKx3hUYIEddmA/holds",  
        "name": "jo",  
        "roles": [ 
            "merchant" 
        ],  
        "created_at": "2012-10-31T09:54:24.456207Z",  
        "uri": "/v1/marketplaces/TEST-MP4RrM819iZ5bs9R5rlNGPxq/accounts/AC4REPjDW7TEKx3hUYIEddmA",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP4RrM819iZ5bs9R5rlNGPxq/accounts/AC4REPjDW7TEKx3hUYIEddmA/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP4RrM819iZ5bs9R5rlNGPxq/accounts/AC4REPjDW7TEKx3hUYIEddmA/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP4RrM819iZ5bs9R5rlNGPxq/accounts/AC4REPjDW7TEKx3hUYIEddmA/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP4RrM819iZ5bs9R5rlNGPxq/accounts/AC4REPjDW7TEKx3hUYIEddmA/transactions",  
        "email_address": null,  
        "id": "AC4REPjDW7TEKx3hUYIEddmA",  
        "credits_uri": "/v1/marketplaces/TEST-MP4RrM819iZ5bs9R5rlNGPxq/accounts/AC4REPjDW7TEKx3hUYIEddmA/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP4RrM819iZ5bs9R5rlNGPxq/accounts/AC4REPjDW7TEKx3hUYIEddmA/cards" 
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
        "holds_uri": "/v1/marketplaces/TEST-MP4SRONIB01WODJ38y2fccOE/accounts/AC4T4jPZAn0XbR2tjjgyaeVK/holds",  
        "name": null,  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-10-31T09:54:25.710731Z",  
        "uri": "/v1/marketplaces/TEST-MP4SRONIB01WODJ38y2fccOE/accounts/AC4T4jPZAn0XbR2tjjgyaeVK",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP4SRONIB01WODJ38y2fccOE/accounts/AC4T4jPZAn0XbR2tjjgyaeVK/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP4SRONIB01WODJ38y2fccOE/accounts/AC4T4jPZAn0XbR2tjjgyaeVK/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP4SRONIB01WODJ38y2fccOE/accounts/AC4T4jPZAn0XbR2tjjgyaeVK/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP4SRONIB01WODJ38y2fccOE/accounts/AC4T4jPZAn0XbR2tjjgyaeVK/transactions",  
        "email_address": "email.10@y.com",  
        "id": "AC4T4jPZAn0XbR2tjjgyaeVK",  
        "credits_uri": "/v1/marketplaces/TEST-MP4SRONIB01WODJ38y2fccOE/accounts/AC4T4jPZAn0XbR2tjjgyaeVK/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP4SRONIB01WODJ38y2fccOE/accounts/AC4T4jPZAn0XbR2tjjgyaeVK/cards" 
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
        "first_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsTFTGg0pCMrUb7vxMvVa/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-10-31T09:54:26.952406Z",  
                "uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsTFTGg0pCMrUb7vxMvVa",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsTFTGg0pCMrUb7vxMvVa/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsTFTGg0pCMrUb7vxMvVa/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsTFTGg0pCMrUb7vxMvVa/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsTFTGg0pCMrUb7vxMvVa/transactions",  
                "email_address": "email.11@y.com",  
                "id": "AC4UsTFTGg0pCMrUb7vxMvVa",  
                "credits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsTFTGg0pCMrUb7vxMvVa/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsTFTGg0pCMrUb7vxMvVa/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsZQWEp2oFsC8gITbu8y8/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-10-31T09:54:26.953469Z",  
                "uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsZQWEp2oFsC8gITbu8y8",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsZQWEp2oFsC8gITbu8y8/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsZQWEp2oFsC8gITbu8y8/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsZQWEp2oFsC8gITbu8y8/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsZQWEp2oFsC8gITbu8y8/transactions",  
                "email_address": "email.12@y.com",  
                "id": "AC4UsZQWEp2oFsC8gITbu8y8",  
                "credits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsZQWEp2oFsC8gITbu8y8/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UsZQWEp2oFsC8gITbu8y8/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UuvvMoUXJgoX1kUXotXSc/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-10-31T09:54:26.975164Z",  
                "uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UuvvMoUXJgoX1kUXotXSc",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UuvvMoUXJgoX1kUXotXSc/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UuvvMoUXJgoX1kUXotXSc/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UuvvMoUXJgoX1kUXotXSc/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UuvvMoUXJgoX1kUXotXSc/transactions",  
                "email_address": "email.14@y.com",  
                "id": "AC4UuvvMoUXJgoX1kUXotXSc",  
                "credits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UuvvMoUXJgoX1kUXotXSc/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UuvvMoUXJgoX1kUXotXSc/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UjwzGktmHAPkMpWBKGqc4/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-10-31T09:54:26.818043Z",  
                "uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UjwzGktmHAPkMpWBKGqc4",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UjwzGktmHAPkMpWBKGqc4/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UjwzGktmHAPkMpWBKGqc4/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UjwzGktmHAPkMpWBKGqc4/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UjwzGktmHAPkMpWBKGqc4/transactions",  
                "email_address": "email.2@y.com",  
                "id": "AC4UjwzGktmHAPkMpWBKGqc4",  
                "credits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UjwzGktmHAPkMpWBKGqc4/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UjwzGktmHAPkMpWBKGqc4/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UngxxgSXTXzBcfyE2rxPu/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-10-31T09:54:26.871331Z",  
                "uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UngxxgSXTXzBcfyE2rxPu",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UngxxgSXTXzBcfyE2rxPu/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UngxxgSXTXzBcfyE2rxPu/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UngxxgSXTXzBcfyE2rxPu/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UngxxgSXTXzBcfyE2rxPu/transactions",  
                "email_address": "email.7@y.com",  
                "id": "AC4UngxxgSXTXzBcfyE2rxPu",  
                "credits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UngxxgSXTXzBcfyE2rxPu/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UngxxgSXTXzBcfyE2rxPu/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4Unks7JqNF2j8gN87v95Vq/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-10-31T09:54:26.872232Z",  
                "uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4Unks7JqNF2j8gN87v95Vq",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4Unks7JqNF2j8gN87v95Vq/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4Unks7JqNF2j8gN87v95Vq/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4Unks7JqNF2j8gN87v95Vq/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4Unks7JqNF2j8gN87v95Vq/transactions",  
                "email_address": "email.8@y.com",  
                "id": "AC4Unks7JqNF2j8gN87v95Vq",  
                "credits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4Unks7JqNF2j8gN87v95Vq/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4Unks7JqNF2j8gN87v95Vq/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UpA31tom2T65Il0CI3F0U/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-10-31T09:54:26.904664Z",  
                "uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UpA31tom2T65Il0CI3F0U",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UpA31tom2T65Il0CI3F0U/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UpA31tom2T65Il0CI3F0U/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UpA31tom2T65Il0CI3F0U/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UpA31tom2T65Il0CI3F0U/transactions",  
                "email_address": "email.9@y.com",  
                "id": "AC4UpA31tom2T65Il0CI3F0U",  
                "credits_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UpA31tom2T65Il0CI3F0U/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts/AC4UpA31tom2T65Il0CI3F0U/cards" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 7,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP4UhITRZ3WLwydFLL064vlO/accounts?limit=10&offset=0" 
    } 
 

Update an Account
-----------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id 
 

Request
~~~~~~~   
 
``name`` 
    *optional* **string** or **null**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string**. RFC-2822 formatted email address. 
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``card_uri`` 
    *optional* **string** or **null**. Tokenized card URI. 
 
``card`` 
    *optional* **object** or **null**. See `Card <./cards.rst>`_. 
 
``bank_account_uri`` 
    *optional* **string** or **null**. Tokenized bank account URI. 
 
``bank_account`` 
    *optional* **object** or **null**. See `BankAccount <./bank_accounts.rst>`_. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "card_uri": "/v1/marketplaces/TEST-MP4VKrYoN3l3VCdi5sOyHJHu/cards/CCa2224712237b11e2844a80ee7316ae44",  
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
        "holds_uri": "/v1/marketplaces/TEST-MP4XaFCq0gaXTE6S3zSHNmSM/accounts/AC4Xkcw2FNnjYy16kcqDbwAQ/holds",  
        "name": "my new name",  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-10-31T09:54:29.494756Z",  
        "uri": "/v1/marketplaces/TEST-MP4XaFCq0gaXTE6S3zSHNmSM/accounts/AC4Xkcw2FNnjYy16kcqDbwAQ",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP4XaFCq0gaXTE6S3zSHNmSM/accounts/AC4Xkcw2FNnjYy16kcqDbwAQ/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP4XaFCq0gaXTE6S3zSHNmSM/accounts/AC4Xkcw2FNnjYy16kcqDbwAQ/refunds",  
        "meta": { 
            "more-data": "here" 
        },  
        "debits_uri": "/v1/marketplaces/TEST-MP4XaFCq0gaXTE6S3zSHNmSM/accounts/AC4Xkcw2FNnjYy16kcqDbwAQ/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP4XaFCq0gaXTE6S3zSHNmSM/accounts/AC4Xkcw2FNnjYy16kcqDbwAQ/transactions",  
        "email_address": "new@email.com",  
        "id": "AC4Xkcw2FNnjYy16kcqDbwAQ",  
        "credits_uri": "/v1/marketplaces/TEST-MP4XaFCq0gaXTE6S3zSHNmSM/accounts/AC4Xkcw2FNnjYy16kcqDbwAQ/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP4XaFCq0gaXTE6S3zSHNmSM/accounts/AC4Xkcw2FNnjYy16kcqDbwAQ/cards" 
    } 
 

Promote a Buyer Account to a Merchant
-------------------------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id 
 

Request
~~~~~~~

``merchant_uri`` 
    *optional* **string** or **null**. See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_. 
 
``merchant`` 
    *optional* **object** or **null**. See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_. 
 
 

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
            "tax_id": "704753400" 
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
        "holds_uri": "/v1/marketplaces/TEST-MP504cPkRf6JrF1PEueUFvAo/accounts/AC50dGusiqV0JqXUy5uaNt9a/holds",  
        "name": null,  
        "roles": [ 
            "merchant",  
            "buyer" 
        ],  
        "created_at": "2012-10-31T09:54:32.068742Z",  
        "uri": "/v1/marketplaces/TEST-MP504cPkRf6JrF1PEueUFvAo/accounts/AC50dGusiqV0JqXUy5uaNt9a",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP504cPkRf6JrF1PEueUFvAo/accounts/AC50dGusiqV0JqXUy5uaNt9a/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP504cPkRf6JrF1PEueUFvAo/accounts/AC50dGusiqV0JqXUy5uaNt9a/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP504cPkRf6JrF1PEueUFvAo/accounts/AC50dGusiqV0JqXUy5uaNt9a/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP504cPkRf6JrF1PEueUFvAo/accounts/AC50dGusiqV0JqXUy5uaNt9a/transactions",  
        "email_address": "email.10@y.com",  
        "id": "AC50dGusiqV0JqXUy5uaNt9a",  
        "credits_uri": "/v1/marketplaces/TEST-MP504cPkRf6JrF1PEueUFvAo/accounts/AC50dGusiqV0JqXUy5uaNt9a/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP504cPkRf6JrF1PEueUFvAo/accounts/AC50dGusiqV0JqXUy5uaNt9a/cards" 
    } 
 

