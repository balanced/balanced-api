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
        "account": null,  
        "brand": "American Express",  
        "card_type": "amex",  
        "country_code": "USA",  
        "created_at": "2012-12-18T23:07:37.837708Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC60lwCeGNE7zLjk5qaKsBJ0",  
        "is_valid": true,  
        "last_four": "1117",  
        "meta": {},  
        "name": "Benny Riemann",  
        "postal_code": "10023",  
        "street_address": "167 West 74th Street",  
        "uri": "/v1/marketplaces/TEST-MP60f9JmA3EKCrlEc6eiPpTY/cards/CC60lwCeGNE7zLjk5qaKsBJ0" 
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
        "created_at": "2012-12-18T23:07:39.065255Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC61J8WTMYKrZ1pSYKLAkIdA",  
        "is_valid": true,  
        "last_four": "5100",  
        "meta": {},  
        "name": "Benny Riemann",  
        "postal_code": "10023",  
        "street_address": "167 West 74th Street",  
        "uri": "/v1/marketplaces/TEST-MP61EedtbrNSptZvvLy6vtyy/cards/CC61J8WTMYKrZ1pSYKLAkIdA" 
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
        "first_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/cards?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY/cards",  
                    "created_at": "2012-12-18T23:07:40.271399Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY/holds",  
                    "id": "AC635gmRjPhlbG2XUHvGzGFY",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY" 
                },  
                "brand": "American Express",  
                "card_type": "amex",  
                "created_at": "2012-12-18T23:07:40.273253Z",  
                "expiration_month": 10,  
                "expiration_year": 2016,  
                "hash": "handcock",  
                "id": "CC635kTk5lUOwjI4mLxQ4HMK",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": null,  
                "uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635gmRjPhlbG2XUHvGzGFY/cards/CC635kTk5lUOwjI4mLxQ4HMK" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ/cards",  
                    "created_at": "2012-12-18T23:07:40.271848Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ/debits",  
                    "email_address": "email.4@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ/holds",  
                    "id": "AC635iwAGtW4JUv92ctCGypQ",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-18T23:07:40.277835Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CCc6c7674f49aa11e2b55668a86d3cb93a",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC635iwAGtW4JUv92ctCGypQ/cards/CCc6c7674f49aa11e2b55668a86d3cb93a" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY/cards",  
                    "created_at": "2012-12-18T23:07:40.288463Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY/holds",  
                    "id": "AC636rSPMwxxjRp8DRQASzfY",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-18T23:07:40.304123Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CCc6cb28cc49aa11e2a22d68a86d3cb93a",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/accounts/AC636rSPMwxxjRp8DRQASzfY/cards/CCc6cb28cc49aa11e2a22d68a86d3cb93a" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/cards?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP632SL4osDuiMBuA2TH2FCy/cards?limit=10&offset=0" 
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
        "first_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards",  
                    "created_at": "2012-12-18T23:07:41.545234Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/holds",  
                    "id": "AC64w5RpPdIaTPtfw3tTsWDM",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM" 
                },  
                "brand": "American Express",  
                "card_type": "amex",  
                "created_at": "2012-12-18T23:07:41.547477Z",  
                "expiration_month": 10,  
                "expiration_year": 2016,  
                "hash": "handcock",  
                "id": "CC64wabwrtYFG2QNzuy1QHqi",  
                "is_valid": true,  
                "last_four": "5100",  
                "meta": {},  
                "name": null,  
                "uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards/CC64wabwrtYFG2QNzuy1QHqi" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards",  
                    "created_at": "2012-12-18T23:07:41.545234Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/holds",  
                    "id": "AC64w5RpPdIaTPtfw3tTsWDM",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-18T23:07:41.582707Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CCc78e7f1e49aa11e29b7968a86d3cb93a",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards/CCc78e7f1e49aa11e29b7968a86d3cb93a" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards",  
                    "created_at": "2012-12-18T23:07:41.545234Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/holds",  
                    "id": "AC64w5RpPdIaTPtfw3tTsWDM",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-18T23:07:41.586994Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CCc78f162349aa11e2acaf68a86d3cb93a",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards/CCc78f162349aa11e2acaf68a86d3cb93a" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP64tF14lqLEUOCKIg9kgCcq/accounts/AC64w5RpPdIaTPtfw3tTsWDM/cards?limit=10&offset=0" 
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
        "created_at": "2012-12-18T23:07:44.093843Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC67nNfxvflt75IGXOho0sie",  
        "is_valid": false,  
        "last_four": "1117",  
        "meta": { 
            "my-own-field": "Customer request" 
        },  
        "name": "Benny Riemann",  
        "uri": "/v1/marketplaces/TEST-MP67j29o0usRJGzdZkTttX3c/cards/CC67nNfxvflt75IGXOho0sie" 
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
        "account_uri": "/v1/marketplaces/TEST-MP68JdNMoYGpQLxrf6awtYqC/accounts/AC68LBvOyzEuoCmbPz7vuhn4" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S/cards",  
            "created_at": "2012-12-18T23:07:46.593103Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S/holds",  
            "id": "AC6ac5MQyCw1131ROTLUvH8S",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S/transactions",  
            "uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S" 
        },  
        "brand": "American Express",  
        "card_type": "amex",  
        "created_at": "2012-12-18T23:07:46.628897Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC6aezv9Ar4n4Y0WV3BhNbN8",  
        "is_valid": true,  
        "last_four": "1111",  
        "meta": {},  
        "name": "Benny Riemann",  
        "uri": "/v1/marketplaces/TEST-MP6a9CyIRpNlhAHPrafqDi5Q/accounts/AC6ac5MQyCw1131ROTLUvH8S/cards/CC6aezv9Ar4n4Y0WV3BhNbN8" 
    } 
 

