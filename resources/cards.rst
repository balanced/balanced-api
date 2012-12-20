Cards
=====

- `Tokenize a Card`_
- `Retrieve a Card`_
- `List All Cards`_
- `List All Cards for an Account`_
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
        "card_number": 4111111111111111,  
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
        "created_at": "2012-12-20T03:06:03.400847Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC1ti7RGtuiPcC03Ut0xX8rx",  
        "is_valid": true,  
        "last_four": "1117",  
        "meta": {},  
        "name": "Benny Riemann",  
        "postal_code": "10023",  
        "street_address": "167 West 74th Street",  
        "uri": "/v1/marketplaces/TEST-MP1t45Q0ZzSGQA0Da9i6SBx1/cards/CC1ti7RGtuiPcC03Ut0xX8rx" 
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
        "created_at": "2012-12-20T03:06:05.439992Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC1vAlh0qM0Zl8pCWpX5chBV",  
        "is_valid": true,  
        "last_four": "5100",  
        "meta": {},  
        "name": "Benny Riemann",  
        "postal_code": "10023",  
        "street_address": "167 West 74th Street",  
        "uri": "/v1/marketplaces/TEST-MP1voqzZdIA06C5jWwXKKTyr/cards/CC1vAlh0qM0Zl8pCWpX5chBV" 
    } 
 

List All Cards
--------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/cards 
 

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.

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
        "first_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/cards?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH/cards",  
                    "created_at": "2012-12-20T03:06:07.775054Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH/holds",  
                    "id": "AC1ydbF8OVKn65BOLvtwSVuH",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH" 
                },  
                "brand": "American Express",  
                "card_type": "amex",  
                "created_at": "2012-12-20T03:06:07.780441Z",  
                "expiration_month": 10,  
                "expiration_year": 2016,  
                "hash": "handcock",  
                "id": "CC1ydpmkK2rZD6xDoEDhZwmD",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": null,  
                "uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydbF8OVKn65BOLvtwSVuH/cards/CC1ydpmkK2rZD6xDoEDhZwmD" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5/cards",  
                    "created_at": "2012-12-20T03:06:07.776516Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5/debits",  
                    "email_address": "email.4@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5/holds",  
                    "id": "AC1ydhFJDCOas5FlqNji3ip5",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-20T03:06:07.790790Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CC32fec77c4a5211e2abbf80ee7316ae43",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1ydhFJDCOas5FlqNji3ip5/cards/CC32fec77c4a5211e2abbf80ee7316ae43" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR/cards",  
                    "created_at": "2012-12-20T03:06:07.815383Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR/holds",  
                    "id": "AC1yfZXYfrU1zs2OUACgvGhR",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-20T03:06:07.843747Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CC3306ea244a5211e2abbf80ee7316ae43",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/accounts/AC1yfZXYfrU1zs2OUACgvGhR/cards/CC3306ea244a5211e2abbf80ee7316ae43" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/cards?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP1y70p2ku9RqlXP0Up9LE6T/cards?limit=10&offset=0" 
    } 
 

List All Cards for an Account
-----------------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/cards 
 

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.

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
        "first_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards",  
                    "created_at": "2012-12-20T03:06:10.394856Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/holds",  
                    "id": "AC1B9SiRAzWux0FqeGN6QUCf",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf" 
                },  
                "brand": "American Express",  
                "card_type": "amex",  
                "created_at": "2012-12-20T03:06:10.399561Z",  
                "expiration_month": 10,  
                "expiration_year": 2016,  
                "hash": "handcock",  
                "id": "CC1Ba4AFCwZC88TWRfJVwIL1",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": null,  
                "uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards/CC1Ba4AFCwZC88TWRfJVwIL1" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards",  
                    "created_at": "2012-12-20T03:06:10.394856Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/holds",  
                    "id": "AC1B9SiRAzWux0FqeGN6QUCf",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-20T03:06:10.474402Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CC349854a44a5211e2907b80ee7316ae43",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards/CC349854a44a5211e2907b80ee7316ae43" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards",  
                    "created_at": "2012-12-20T03:06:10.394856Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/holds",  
                    "id": "AC1B9SiRAzWux0FqeGN6QUCf",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-20T03:06:10.482850Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CC349973e84a5211e2907b80ee7316ae43",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards/CC349973e84a5211e2907b80ee7316ae43" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP1B39rrWZYg2l4IPa6CKrnl/accounts/AC1B9SiRAzWux0FqeGN6QUCf/cards?limit=10&offset=0" 
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
        "created_at": "2012-12-20T03:06:15.404339Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC1GNaZEs6iW2bvLXnj4YQ0P",  
        "is_valid": false,  
        "last_four": "1111",  
        "meta": { 
            "my-own-field": "Customer request" 
        },  
        "name": "Benny Riemann",  
        "uri": "/v1/marketplaces/TEST-MP1GASgfYgCLnEXmikYHRYjN/cards/CC1GNaZEs6iW2bvLXnj4YQ0P" 
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
        "account_uri": "/v1/marketplaces/TEST-MP1JpBi5picnoIkStmamaL75/accounts/AC1Jw5G3Es3XSjq4dvMRVsVZ" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ/cards",  
            "created_at": "2012-12-20T03:06:20.290923Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ/holds",  
            "id": "AC1MhWToNg2sFXxmlMfcIxvZ",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ/transactions",  
            "uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ" 
        },  
        "brand": "American Express",  
        "card_type": "amex",  
        "created_at": "2012-12-20T03:06:20.383025Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC1Momax281g8vO5GZBYPyVB",  
        "is_valid": true,  
        "last_four": "1111",  
        "meta": {},  
        "name": "Benny Riemann",  
        "uri": "/v1/marketplaces/TEST-MP1MbsF4QmshinavC4cJC4cH/accounts/AC1MhWToNg2sFXxmlMfcIxvZ/cards/CC1Momax281g8vO5GZBYPyVB" 
    } 
 

