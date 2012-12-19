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
        "created_at": "2012-12-18T22:07:40.331686Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC34FqBh0EQ5XQ9VIQUC2rPA",  
        "is_valid": true,  
        "last_four": "5100",  
        "meta": {},  
        "name": "Benny Riemann",  
        "postal_code": "10023",  
        "street_address": "167 West 74th Street",  
        "uri": "/v1/marketplaces/TEST-MP34yRt26zkfkTN7SIW8lG8a/cards/CC34FqBh0EQ5XQ9VIQUC2rPA" 
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
        "created_at": "2012-12-18T22:07:41.579838Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC364tNjqHUEBrVR56Dklnd0",  
        "is_valid": true,  
        "last_four": "5100",  
        "meta": {},  
        "name": "Benny Riemann",  
        "postal_code": "10023",  
        "street_address": "167 West 74th Street",  
        "uri": "/v1/marketplaces/TEST-MP35ZsEkKB3HbLxCAtPEVn5g/cards/CC364tNjqHUEBrVR56Dklnd0" 
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
        "first_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/cards?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6/cards",  
                    "created_at": "2012-12-18T22:07:42.788482Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6/holds",  
                    "id": "AC37qLHw2Ce4qpjOkUONZ6C6",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6" 
                },  
                "brand": "American Express",  
                "card_type": "amex",  
                "created_at": "2012-12-18T22:07:42.790501Z",  
                "expiration_month": 10,  
                "expiration_year": 2016,  
                "hash": "handcock",  
                "id": "CC37qRfISm1NHHcijgWSUBIu",  
                "is_valid": true,  
                "last_four": "1117",  
                "meta": {},  
                "name": null,  
                "uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qLHw2Ce4qpjOkUONZ6C6/cards/CC37qRfISm1NHHcijgWSUBIu" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG/cards",  
                    "created_at": "2012-12-18T22:07:42.789122Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG/debits",  
                    "email_address": "email.4@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG/holds",  
                    "id": "AC37qOvxhOKS0xn6LfJVLjWG",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-18T22:07:42.794835Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CC668311c549a211e2819068a86d3cb93a",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37qOvxhOKS0xn6LfJVLjWG/cards/CC668311c549a211e2819068a86d3cb93a" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc/cards",  
                    "created_at": "2012-12-18T22:07:42.805831Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc/debits",  
                    "email_address": "email.5@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc/holds",  
                    "id": "AC37rYL1CvRM135gMn2Fbmhc",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-18T22:07:42.819921Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CC6686d88049a211e2992468a86d3cb93a",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/accounts/AC37rYL1CvRM135gMn2Fbmhc/cards/CC6686d88049a211e2992468a86d3cb93a" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/cards?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP37oqTlqRgCPiBk1vrXWyAW/cards?limit=10&offset=0" 
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
        "first_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards",  
                    "created_at": "2012-12-18T22:07:44.074296Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/holds",  
                    "id": "AC38Sr3Ud1d3criC6REXRas2",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2" 
                },  
                "brand": "American Express",  
                "card_type": "amex",  
                "created_at": "2012-12-18T22:07:44.076284Z",  
                "expiration_month": 10,  
                "expiration_year": 2016,  
                "hash": "handcock",  
                "id": "CC38SvNbntYtGII5x7Y4uNCO",  
                "is_valid": true,  
                "last_four": "5100",  
                "meta": {},  
                "name": null,  
                "uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards/CC38SvNbntYtGII5x7Y4uNCO" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards",  
                    "created_at": "2012-12-18T22:07:44.074296Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/holds",  
                    "id": "AC38Sr3Ud1d3criC6REXRas2",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-18T22:07:44.111211Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CC674beb3d49a211e2990d68a86d3cb93a",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards/CC674beb3d49a211e2990d68a86d3cb93a" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards",  
                    "created_at": "2012-12-18T22:07:44.074296Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/holds",  
                    "id": "AC38Sr3Ud1d3criC6REXRas2",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2" 
                },  
                "brand": "Visa",  
                "card_type": "visa",  
                "country_code": "USA",  
                "created_at": "2012-12-18T22:07:44.115485Z",  
                "expiration_month": 1,  
                "expiration_year": 2015,  
                "hash": null,  
                "id": "CC674c7e0749a211e286bc68a86d3cb93a",  
                "is_valid": true,  
                "last_four": "1111",  
                "meta": {},  
                "name": "Jet Li",  
                "postal_code": "94110",  
                "street_address": "Somewhere over the rainbow",  
                "uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards/CC674c7e0749a211e286bc68a86d3cb93a" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP38PXUIj6sfCXsMRfeaFWiu/accounts/AC38Sr3Ud1d3criC6REXRas2/cards?limit=10&offset=0" 
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
        "account": null,  
        "brand": "American Express",  
        "card_type": "amex",  
        "created_at": "2012-12-18T22:07:46.647571Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC3bLRpXu3e4X6cdmDtvGopc",  
        "is_valid": false,  
        "last_four": "5100",  
        "meta": {},  
        "name": "Benny Riemann",  
        "uri": "/v1/marketplaces/TEST-MP3bH5pJepGXoRAfpykAtKDU/cards/CC3bLRpXu3e4X6cdmDtvGopc" 
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
        "account_uri": "/v1/marketplaces/TEST-MP3d87ex0mHyDChGGYvMpN8K/accounts/AC3dastbBgwhrQ9yo3XwtfXY" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0/cards",  
            "created_at": "2012-12-18T22:07:49.181001Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0/holds",  
            "id": "AC3eCxlEuYS5duWkLADfZDB0",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0/transactions",  
            "uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0" 
        },  
        "brand": "American Express",  
        "card_type": "amex",  
        "created_at": "2012-12-18T22:07:49.216528Z",  
        "expiration_month": 4,  
        "expiration_year": 2014,  
        "hash": "handcock",  
        "id": "CC3eF0ro0ML72PSDibs8WHDI",  
        "is_valid": true,  
        "last_four": "1111",  
        "meta": {},  
        "name": "Benny Riemann",  
        "uri": "/v1/marketplaces/TEST-MP3eAaaUsAFEKR66hZ1J7dV0/accounts/AC3eCxlEuYS5duWkLADfZDB0/cards/CC3eF0ro0ML72PSDibs8WHDI" 
    } 
 

