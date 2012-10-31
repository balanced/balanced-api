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
        "card_uri": "/v1/marketplaces/TEST-MP6sxBo32V06rtjzbjHdgek4/cards/CCd45e154e22f911e2b91780ee7316ae44",  
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
        "holds_uri": "/v1/marketplaces/TEST-MP6tYRPUQvWsDPIF1M9pREKU/accounts/AC6ufHVp4KYhLqOlsVEXZUyw/holds",  
        "name": "Benny Riemann",  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-10-30T18:25:19.320892Z",  
        "uri": "/v1/marketplaces/TEST-MP6tYRPUQvWsDPIF1M9pREKU/accounts/AC6ufHVp4KYhLqOlsVEXZUyw",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP6tYRPUQvWsDPIF1M9pREKU/accounts/AC6ufHVp4KYhLqOlsVEXZUyw/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP6tYRPUQvWsDPIF1M9pREKU/accounts/AC6ufHVp4KYhLqOlsVEXZUyw/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP6tYRPUQvWsDPIF1M9pREKU/accounts/AC6ufHVp4KYhLqOlsVEXZUyw/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP6tYRPUQvWsDPIF1M9pREKU/accounts/AC6ufHVp4KYhLqOlsVEXZUyw/transactions",  
        "email_address": "b@m.com",  
        "id": "AC6ufHVp4KYhLqOlsVEXZUyw",  
        "credits_uri": "/v1/marketplaces/TEST-MP6tYRPUQvWsDPIF1M9pREKU/accounts/AC6ufHVp4KYhLqOlsVEXZUyw/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP6tYRPUQvWsDPIF1M9pREKU/accounts/AC6ufHVp4KYhLqOlsVEXZUyw/cards" 
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
            *optional* **string** or **null**. Length must be **=** ``9``. 
 
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
                    *optional* **string** or **null**. Length must be **=** ``9``. 
 
 
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
                "tax_id": "280308600" 
            },  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "business",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "865613300" 
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
        "holds_uri": "/v1/marketplaces/TEST-MP6x6x9EwPVVV0k4ZSeqroIQ/accounts/AC6xio33nEbhRUwrJJrxS4uM/holds",  
        "name": "jo",  
        "roles": [ 
            "merchant" 
        ],  
        "created_at": "2012-10-30T18:25:22.026520Z",  
        "uri": "/v1/marketplaces/TEST-MP6x6x9EwPVVV0k4ZSeqroIQ/accounts/AC6xio33nEbhRUwrJJrxS4uM",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP6x6x9EwPVVV0k4ZSeqroIQ/accounts/AC6xio33nEbhRUwrJJrxS4uM/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP6x6x9EwPVVV0k4ZSeqroIQ/accounts/AC6xio33nEbhRUwrJJrxS4uM/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP6x6x9EwPVVV0k4ZSeqroIQ/accounts/AC6xio33nEbhRUwrJJrxS4uM/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP6x6x9EwPVVV0k4ZSeqroIQ/accounts/AC6xio33nEbhRUwrJJrxS4uM/transactions",  
        "email_address": null,  
        "id": "AC6xio33nEbhRUwrJJrxS4uM",  
        "credits_uri": "/v1/marketplaces/TEST-MP6x6x9EwPVVV0k4ZSeqroIQ/accounts/AC6xio33nEbhRUwrJJrxS4uM/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP6x6x9EwPVVV0k4ZSeqroIQ/accounts/AC6xio33nEbhRUwrJJrxS4uM/cards" 
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
            *optional* **string** or **null**. Length must be **=** ``9``. 
 
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
            "tax_id": "808081600" 
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
        "holds_uri": "/v1/marketplaces/TEST-MP6A1VkDD7yHKU6tTLCe2yig/accounts/AC6AfP1LJAoKTqHFhZK66dRa/holds",  
        "name": "jo",  
        "roles": [ 
            "merchant" 
        ],  
        "created_at": "2012-10-30T18:25:24.656971Z",  
        "uri": "/v1/marketplaces/TEST-MP6A1VkDD7yHKU6tTLCe2yig/accounts/AC6AfP1LJAoKTqHFhZK66dRa",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP6A1VkDD7yHKU6tTLCe2yig/accounts/AC6AfP1LJAoKTqHFhZK66dRa/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP6A1VkDD7yHKU6tTLCe2yig/accounts/AC6AfP1LJAoKTqHFhZK66dRa/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP6A1VkDD7yHKU6tTLCe2yig/accounts/AC6AfP1LJAoKTqHFhZK66dRa/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP6A1VkDD7yHKU6tTLCe2yig/accounts/AC6AfP1LJAoKTqHFhZK66dRa/transactions",  
        "email_address": null,  
        "id": "AC6AfP1LJAoKTqHFhZK66dRa",  
        "credits_uri": "/v1/marketplaces/TEST-MP6A1VkDD7yHKU6tTLCe2yig/accounts/AC6AfP1LJAoKTqHFhZK66dRa/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP6A1VkDD7yHKU6tTLCe2yig/accounts/AC6AfP1LJAoKTqHFhZK66dRa/cards" 
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
        "holds_uri": "/v1/marketplaces/TEST-MP6Bsvw1dD9O4n4KeIwPsNWA/accounts/AC6BFtePdFZv7upPVwB45DE0/holds",  
        "name": null,  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-10-30T18:25:25.913951Z",  
        "uri": "/v1/marketplaces/TEST-MP6Bsvw1dD9O4n4KeIwPsNWA/accounts/AC6BFtePdFZv7upPVwB45DE0",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP6Bsvw1dD9O4n4KeIwPsNWA/accounts/AC6BFtePdFZv7upPVwB45DE0/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP6Bsvw1dD9O4n4KeIwPsNWA/accounts/AC6BFtePdFZv7upPVwB45DE0/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP6Bsvw1dD9O4n4KeIwPsNWA/accounts/AC6BFtePdFZv7upPVwB45DE0/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP6Bsvw1dD9O4n4KeIwPsNWA/accounts/AC6BFtePdFZv7upPVwB45DE0/transactions",  
        "email_address": "email.10@y.com",  
        "id": "AC6BFtePdFZv7upPVwB45DE0",  
        "credits_uri": "/v1/marketplaces/TEST-MP6Bsvw1dD9O4n4KeIwPsNWA/accounts/AC6BFtePdFZv7upPVwB45DE0/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP6Bsvw1dD9O4n4KeIwPsNWA/accounts/AC6BFtePdFZv7upPVwB45DE0/cards" 
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
        "first_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5i92PVjTJohl0UNe5Ick/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-10-30T18:25:27.173189Z",  
                "uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5i92PVjTJohl0UNe5Ick",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5i92PVjTJohl0UNe5Ick/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5i92PVjTJohl0UNe5Ick/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5i92PVjTJohl0UNe5Ick/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5i92PVjTJohl0UNe5Ick/transactions",  
                "email_address": "email.11@y.com",  
                "id": "AC6D5i92PVjTJohl0UNe5Ick",  
                "credits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5i92PVjTJohl0UNe5Ick/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5i92PVjTJohl0UNe5Ick/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5lLWqjYpNrasnl2hgPGY/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-10-30T18:25:27.173968Z",  
                "uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5lLWqjYpNrasnl2hgPGY",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5lLWqjYpNrasnl2hgPGY/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5lLWqjYpNrasnl2hgPGY/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5lLWqjYpNrasnl2hgPGY/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5lLWqjYpNrasnl2hgPGY/transactions",  
                "email_address": "email.12@y.com",  
                "id": "AC6D5lLWqjYpNrasnl2hgPGY",  
                "credits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5lLWqjYpNrasnl2hgPGY/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D5lLWqjYpNrasnl2hgPGY/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D6OWUHqx7TYkagZMmtAZS/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-10-30T18:25:27.195098Z",  
                "uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D6OWUHqx7TYkagZMmtAZS",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D6OWUHqx7TYkagZMmtAZS/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D6OWUHqx7TYkagZMmtAZS/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D6OWUHqx7TYkagZMmtAZS/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D6OWUHqx7TYkagZMmtAZS/transactions",  
                "email_address": "email.14@y.com",  
                "id": "AC6D6OWUHqx7TYkagZMmtAZS",  
                "credits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D6OWUHqx7TYkagZMmtAZS/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D6OWUHqx7TYkagZMmtAZS/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6CUXiBthHo7scHRmBqhs1u/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-10-30T18:25:27.025788Z",  
                "uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6CUXiBthHo7scHRmBqhs1u",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6CUXiBthHo7scHRmBqhs1u/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6CUXiBthHo7scHRmBqhs1u/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6CUXiBthHo7scHRmBqhs1u/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6CUXiBthHo7scHRmBqhs1u/transactions",  
                "email_address": "email.2@y.com",  
                "id": "AC6CUXiBthHo7scHRmBqhs1u",  
                "credits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6CUXiBthHo7scHRmBqhs1u/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6CUXiBthHo7scHRmBqhs1u/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0aEipOTQ3pUCgyPbrEji/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-10-30T18:25:27.099784Z",  
                "uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0aEipOTQ3pUCgyPbrEji",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0aEipOTQ3pUCgyPbrEji/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0aEipOTQ3pUCgyPbrEji/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0aEipOTQ3pUCgyPbrEji/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0aEipOTQ3pUCgyPbrEji/transactions",  
                "email_address": "email.7@y.com",  
                "id": "AC6D0aEipOTQ3pUCgyPbrEji",  
                "credits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0aEipOTQ3pUCgyPbrEji/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0aEipOTQ3pUCgyPbrEji/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0f2UeJPwxK7bICZThgdm/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-10-30T18:25:27.100851Z",  
                "uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0f2UeJPwxK7bICZThgdm",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0f2UeJPwxK7bICZThgdm/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0f2UeJPwxK7bICZThgdm/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0f2UeJPwxK7bICZThgdm/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0f2UeJPwxK7bICZThgdm/transactions",  
                "email_address": "email.8@y.com",  
                "id": "AC6D0f2UeJPwxK7bICZThgdm",  
                "credits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0f2UeJPwxK7bICZThgdm/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D0f2UeJPwxK7bICZThgdm/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D2dMVYnqUCowPLyPH99xq/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-10-30T18:25:27.129263Z",  
                "uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D2dMVYnqUCowPLyPH99xq",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D2dMVYnqUCowPLyPH99xq/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D2dMVYnqUCowPLyPH99xq/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D2dMVYnqUCowPLyPH99xq/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D2dMVYnqUCowPLyPH99xq/transactions",  
                "email_address": "email.9@y.com",  
                "id": "AC6D2dMVYnqUCowPLyPH99xq",  
                "credits_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D2dMVYnqUCowPLyPH99xq/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts/AC6D2dMVYnqUCowPLyPH99xq/cards" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 7,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP6CSYTKEWBiX38A8lQEMpcU/accounts?limit=10&offset=0" 
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
        "card_uri": "/v1/marketplaces/TEST-MP6EqJXghU8zGo3eT3Ynrj6I/cards/CCdaa8e3de22f911e29a8c80ee7316ae44",  
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
        "holds_uri": "/v1/marketplaces/TEST-MP6FUt4CzwdjSy0sktFweltW/accounts/AC6G75Khey5146CINCmtAwII/holds",  
        "name": "my new name",  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-10-30T18:25:29.866579Z",  
        "uri": "/v1/marketplaces/TEST-MP6FUt4CzwdjSy0sktFweltW/accounts/AC6G75Khey5146CINCmtAwII",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP6FUt4CzwdjSy0sktFweltW/accounts/AC6G75Khey5146CINCmtAwII/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP6FUt4CzwdjSy0sktFweltW/accounts/AC6G75Khey5146CINCmtAwII/refunds",  
        "meta": { 
            "more-data": "here" 
        },  
        "debits_uri": "/v1/marketplaces/TEST-MP6FUt4CzwdjSy0sktFweltW/accounts/AC6G75Khey5146CINCmtAwII/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP6FUt4CzwdjSy0sktFweltW/accounts/AC6G75Khey5146CINCmtAwII/transactions",  
        "email_address": "new@email.com",  
        "id": "AC6G75Khey5146CINCmtAwII",  
        "credits_uri": "/v1/marketplaces/TEST-MP6FUt4CzwdjSy0sktFweltW/accounts/AC6G75Khey5146CINCmtAwII/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP6FUt4CzwdjSy0sktFweltW/accounts/AC6G75Khey5146CINCmtAwII/cards" 
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
            "tax_id": "201103100" 
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
        "holds_uri": "/v1/marketplaces/TEST-MP6IPNVtr8CwMzCEiIIYbmJu/accounts/AC6IZvzKhYSB8WgCtUlGeGPO/holds",  
        "name": null,  
        "roles": [ 
            "merchant",  
            "buyer" 
        ],  
        "created_at": "2012-10-30T18:25:32.425024Z",  
        "uri": "/v1/marketplaces/TEST-MP6IPNVtr8CwMzCEiIIYbmJu/accounts/AC6IZvzKhYSB8WgCtUlGeGPO",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP6IPNVtr8CwMzCEiIIYbmJu/accounts/AC6IZvzKhYSB8WgCtUlGeGPO/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MP6IPNVtr8CwMzCEiIIYbmJu/accounts/AC6IZvzKhYSB8WgCtUlGeGPO/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MP6IPNVtr8CwMzCEiIIYbmJu/accounts/AC6IZvzKhYSB8WgCtUlGeGPO/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MP6IPNVtr8CwMzCEiIIYbmJu/accounts/AC6IZvzKhYSB8WgCtUlGeGPO/transactions",  
        "email_address": "email.10@y.com",  
        "id": "AC6IZvzKhYSB8WgCtUlGeGPO",  
        "credits_uri": "/v1/marketplaces/TEST-MP6IPNVtr8CwMzCEiIIYbmJu/accounts/AC6IZvzKhYSB8WgCtUlGeGPO/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MP6IPNVtr8CwMzCEiIIYbmJu/accounts/AC6IZvzKhYSB8WgCtUlGeGPO/cards" 
    } 
 

