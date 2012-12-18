Cards
=====

- `Tokenize a Card`_
- `Retrieve a Card`_
- `Update a Card`_
- `Associate a Card with an Account`_

Fields
------

``id`` 
    **string**.  
 
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
    *optional* **string**. Sequence of characters. Length must be **<=** ``128``. 
 
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
        "card_number": 5105105105105100,  
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
        "account": null,  
        "brand": "American Express",  
        "card_type": "amex",  
        "country_code": "USA",  
        "created_at": "2012-12-15T22:50:02.395178Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC6mmAu7g34Ps3604j8p3kzU",  
        "is_valid": true,  
        "last_four": "1117",  
        "meta": {},  
        "name": "Benny Riemann",  
        "postal_code": "10023",  
        "street_address": "167 West 74th Street",  
        "uri": "/v1/marketplaces/TEST-MP6mg7THXMtPXlIcyflgYjjk/cards/CC6mmAu7g34Ps3604j8p3kzU" 
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
        "account": null,  
        "brand": "American Express",  
        "card_type": "amex",  
        "country_code": "USA",  
        "created_at": "2012-12-15T22:50:03.689337Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC6nORiJlHLb9LKMIQM1UHOy",  
        "is_valid": true,  
        "last_four": "1111",  
        "meta": {},  
        "name": "Benny Riemann",  
        "postal_code": "10023",  
        "street_address": "167 West 74th Street",  
        "uri": "/v1/marketplaces/TEST-MP6nJENzMOYBc4um0QpKa3fs/cards/CC6nORiJlHLb9LKMIQM1UHOy" 
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
        "meta": { 
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
        "account": null,  
        "brand": "American Express",  
        "card_type": "amex",  
        "created_at": "2012-12-15T22:50:06.313180Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC6qLOXxjLLQG8e5Q2fwWGIq",  
        "is_valid": false,  
        "last_four": "1111",  
        "meta": {},  
        "name": "Benny Riemann",  
        "uri": "/v1/marketplaces/TEST-MP6qGnHr7ATqL71ehNDwOF18/cards/CC6qLOXxjLLQG8e5Q2fwWGIq" 
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
        "account_uri": "/v1/marketplaces/TEST-MP6sacgznrfDvbgxyvY6vp4S/accounts/AC6scz0lvYnvZQZJDG7aHqmm" 
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
        "account": { 
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w/cards",  
            "created_at": "2012-12-15T22:50:08.902284Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w/holds",  
            "id": "AC6tGnyAVvG3GKc872l6rw7w",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w/transactions",  
            "uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w" 
        },  
        "brand": "American Express",  
        "card_type": "amex",  
        "created_at": "2012-12-15T22:50:08.936832Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC6tIMcgehLDhMF2ZRogOeV4",  
        "is_valid": true,  
        "last_four": "1111",  
        "meta": {},  
        "name": "Benny Riemann",  
        "uri": "/v1/marketplaces/TEST-MP6tDZGoTTL18FU1qkVHcGGS/accounts/AC6tGnyAVvG3GKc872l6rw7w/cards/CC6tIMcgehLDhMF2ZRogOeV4" 
    } 
 

