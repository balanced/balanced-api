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
    **object**. The account this card is associated with. See `Accounts <./accounts.rst>`_. 
 
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
    *required* **string** or **null**. The digits of the credit card number. 
 
``expiration_year`` 
    *required* **integer** or **null**. Expiration year. The current year or later. Value must be **<=** ``9999``. 
 
``expiration_month`` 
    *required* **integer** or **null**. Expiration month (e.g. 1 for January). If ``expiration_year`` is the current year then current month or later, 
    otherwise 1. Value must be **<=** ``12``. 
 
``security_code`` 
    *optional* **string** or **null**. The 3-4 digit security code for the card. 
 
``name`` 
    *optional* **string** or **null**. Length must be **<=** ``128``. 
 
``phone_number`` 
    *optional* **string** or **null**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
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
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``is_valid`` 
    *optional* **boolean** or **null**. Indicates whether the card is active (``true``) or has been deactivated 
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
        "created_at": "2012-10-30T18:26:02.665052Z",  
        "account": null,  
        "hash": "handcock",  
        "country_code": "USA",  
        "expiration_year": 2014,  
        "brand": "American Express",  
        "uri": "/v1/marketplaces/TEST-MP7gKlUJsbcZf1eZUG6TbIIk/cards/CC7h0dlanzPik7BCNWNhTLhO",  
        "expiration_month": 4,  
        "is_valid": true,  
        "meta": {},  
        "postal_code": "10023",  
        "last_four": "1117",  
        "card_type": "amex",  
        "id": "CC7h0dlanzPik7BCNWNhTLhO",  
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
        "created_at": "2012-10-30T18:26:04.139147Z",  
        "account": null,  
        "hash": "handcock",  
        "country_code": "USA",  
        "expiration_year": 2014,  
        "brand": "American Express",  
        "uri": "/v1/marketplaces/TEST-MP7irYziVBhrWPLCdrjyhORK/cards/CC7iF02vR8xDUTFcuNiEni0Q",  
        "expiration_month": 4,  
        "is_valid": true,  
        "meta": {},  
        "postal_code": "10023",  
        "last_four": "5100",  
        "card_type": "amex",  
        "id": "CC7iF02vR8xDUTFcuNiEni0Q",  
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
    *optional* **boolean** or **null**. Indicates whether the card is active (``true``) or has been deactivated 
    (``false``). Setting this to ``false`` will deactivate the card. 
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 

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
        "created_at": "2012-10-30T18:26:07.325399Z",  
        "brand": "American Express",  
        "uri": "/v1/marketplaces/TEST-MP7m4ThVPUWBOSDlNs0o7XiQ/cards/CC7mfcxJiLfEdAvD6etx59OY",  
        "expiration_month": 4,  
        "is_valid": false,  
        "meta": {},  
        "last_four": "1111",  
        "id": "CC7mfcxJiLfEdAvD6etx59OY" 
    } 
 

Associate a Card with an Account
--------------------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/cards/:card_id 
 

Request
~~~~~~~

``account_uri`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "account_uri": "/v1/marketplaces/TEST-MP7nVSI4YChkI8tX6LcMv0sQ/accounts/AC7o2jv1Y9qTPUARNwvc8Yhm" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:10.683175Z",  
            "uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC7q1mb9eT7YWlqQiLB61s1u",  
            "credits_uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u/cards" 
        },  
        "hash": "handcock",  
        "name": "Benny Riemann",  
        "expiration_year": 2014,  
        "created_at": "2012-10-30T18:26:10.749281Z",  
        "brand": "American Express",  
        "uri": "/v1/marketplaces/TEST-MP7pTYloyGfWaDzWKD7RAn3u/accounts/AC7q1mb9eT7YWlqQiLB61s1u/cards/CC7q5WzGlOvXkx2QbQBnZK8Q",  
        "expiration_month": 4,  
        "is_valid": true,  
        "meta": {},  
        "last_four": "1111",  
        "id": "CC7q5WzGlOvXkx2QbQBnZK8Q" 
    } 
 

