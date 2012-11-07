Cards
=====

- `Tokenize a Card`_
- `Retrieve a Card`_
- `Update a Card`_
- `Associate a Card with an Account`_

Fields
------

``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**. The URI of the card 
 
``account`` 
    **object**. See `Accounts <./accounts.rst>`_. 
 
 
 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this card 
    was tokenized. 
 
``street_address`` 
    **string**. Street address. 
 
``postal_code`` 
    **string**. Postal code (zip code in the USA). 
 
``country_code`` 
    **string**. `ISO-3166-3`_ three character country code. 
 
``name`` 
    **string**. The name on the card. 
 
``expiration_month`` 
    **string**. Card's expiration month. 
 
``expiration_year`` 
    **string**. Card's expiration year. 
 
``card_type`` 
    **string**. **Deprecated** 
    The type of the card. This field has been deprecated in favor of 
    ``brand``. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``last_four`` 
    **string**. Last four digits of the card. 
 
``brand`` 
    **string**. The brand of the card. One of: ``Visa``, ``MasterCard``, 
    ``American Express``, or ``Discover``. 
 
``is_valid`` 
    **boolean**. A boolean value indicating whether or not the card is valid. Once 
    invalidated, ``is_valid`` can not be set to ``true`` again. 
 
``hash`` 
    **string**. A hash derived from ``card_number``, ``expiration_month`` and 
    ``expiration_year``. Cards with the same ``card_number``, 
    ``expiration_month`` and ``expiration_year`` will have the same 
    ``hash``. 
 

Tokenize a Card
---------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/cards 
 

Request
~~~~~~~

``card_number`` 
    *required* **string**. The digits of the credit card number. 
 
``expiration_year`` 
    *required* **integer**. Expiration year. The current year or later. Value must be **<=** ``9999``. 
 
``expiration_month`` 
    *required* **integer**. Expiration month (e.g. 1 for January). If ``expiration_year`` is the current year then current month or later, 
    otherwise 1. Value must be **<=** ``12``. 
 
``security_code`` 
    *optional* **string**. The 3-4 digit security code for the card. 
 
``name`` 
    *optional* **string**. Length must be **<=** ``128``. 
 
``phone_number`` 
    *optional* **string**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
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
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``is_valid`` 
    *optional* **boolean**. Indicates whether the card is active (``true``) or has been deactivated 
    (``false``). 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "expiration_month": 4,  
        "phone_number": "+16509241212",  
        "postal_code": "10023",  
        "name": "Benny Riemann",  
        "expiration_year": 2014,  
        "country_code": "USA",  
        "security_code": 323,  
        "card_number": 6011111111111117,  
        "street_address": "167 West 74th Street" 
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
        "created_at": "2012-11-07T00:43:03.169463Z",  
        "account": null,  
        "hash": "handcock",  
        "country_code": "USA",  
        "expiration_year": 2014,  
        "brand": "American Express",  
        "uri": "/v1/marketplaces/TEST-MP16J1YEcNvUmpRFhQdhLGBJ/cards/CC16WLHUQ3P7Ljz2Kj9902t5",  
        "expiration_month": 4,  
        "is_valid": true,  
        "meta": {},  
        "postal_code": "10023",  
        "last_four": "1111",  
        "card_type": "amex",  
        "id": "CC16WLHUQ3P7Ljz2Kj9902t5",  
        "street_address": "167 West 74th Street",  
        "name": "Benny Riemann" 
    } 
 

Retrieve a Card
---------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/cards/:card_id 
 

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
        "created_at": "2012-11-07T00:43:04.409694Z",  
        "account": null,  
        "hash": "handcock",  
        "country_code": "USA",  
        "expiration_year": 2014,  
        "brand": "American Express",  
        "uri": "/v1/marketplaces/TEST-MP18cIXAyHigviEArKQazMD9/cards/CC18lh4EAij7GOanWmT8gda3",  
        "expiration_month": 4,  
        "is_valid": true,  
        "meta": {},  
        "postal_code": "10023",  
        "last_four": "1111",  
        "card_type": "amex",  
        "id": "CC18lh4EAij7GOanWmT8gda3",  
        "street_address": "167 West 74th Street",  
        "name": "Benny Riemann" 
    } 
 

Update a Card
-------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/cards/:card_id 
 

Request
~~~~~~~

``is_valid`` 
    *optional* **boolean**. Indicates whether the card is active (``true``) or has been deactivated 
    (``false``). Setting this to ``false`` will deactivate the card. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "is_valid": "False",  
        "metadata": { 
            "my-own-field": "Customer request" 
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
        "card_type": "amex",  
        "account": null,  
        "hash": "handcock",  
        "name": "Benny Riemann",  
        "expiration_year": 2014,  
        "created_at": "2012-11-07T00:43:06.878191Z",  
        "brand": "American Express",  
        "uri": "/v1/marketplaces/TEST-MP1aZoxtQDLZLjuZqfkKZB63/cards/CC1b7pOGle7n1hfpShHZ2Z6X",  
        "expiration_month": 4,  
        "is_valid": false,  
        "meta": {},  
        "last_four": "1111",  
        "id": "CC1b7pOGle7n1hfpShHZ2Z6X" 
    } 
 

Associate a Card with an Account
--------------------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/cards/:card_id 
 

Request
~~~~~~~

``account_uri`` 
    *optional* **string**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "account_uri": "/v1/marketplaces/TEST-MP1cjguQPOdgyNFFVOfzuDOH/accounts/AC1cpe6YPTRi4bXiIK1x3par" 
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
        "card_type": "amex",  
        "account": { 
            "holds_uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-11-07T00:43:09.377481Z",  
            "uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf/transactions",  
            "email_address": "email.3@y.com",  
            "id": "AC1dVIdzy9ZYRJEZIUUZvNQf",  
            "credits_uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf/cards" 
        },  
        "hash": "handcock",  
        "name": "Benny Riemann",  
        "expiration_year": 2014,  
        "created_at": "2012-11-07T00:43:09.435431Z",  
        "brand": "American Express",  
        "uri": "/v1/marketplaces/TEST-MP1dRc68V3LI6YAc3MpB5BFV/accounts/AC1dVIdzy9ZYRJEZIUUZvNQf/cards/CC1dZKey2DBcWVKAUQoXfJyr",  
        "expiration_month": 4,  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1117",  
        "id": "CC1dZKey2DBcWVKAUQoXfJyr" 
    } 
 

