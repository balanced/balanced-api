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

``security_code_check``
    **string**. One of "passed", "failed", "unknown"

``postal_code_check``
    **string**. One of "passed", "failed", "unknown"

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

``iin_uri``
    **string**. The URI of the `iin <./iins.rst>`_ for the card.


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
        "brand": "Discover",
        "card_type": "discover",
        "country_code": "USA",
        "created_at": "2013-03-22T20:37:16.492865Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC2dw2bWKcjOjLqmy0Lr4B2Z",
        "iin_uri": "/v1/cards/CC2dw2bWKcjOjLqmy0Lr4B2Z/iin",
        "is_valid": true,
        "last_four": "1117",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code": "10023",
        "postal_code_check": "passed",
        "security_code_check": "passed",
        "street_address": "167 West 74th Street",
        "uri": "/v1/marketplaces/TEST-MP2dblmPL7tG6UXwsTqJX2qN/cards/CC2dw2bWKcjOjLqmy0Lr4B2Z"
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
        "brand": "Discover",
        "card_type": "discover",
        "country_code": "USA",
        "created_at": "2013-03-22T20:37:18.673426Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC2fY3orziOBCf66BMIeeXaR",
        "iin_uri": "/v1/cards/CC2fY3orziOBCf66BMIeeXaR/iin",
        "is_valid": true,
        "last_four": "1117",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code": "10023",
        "postal_code_check": "passed",
        "security_code_check": "passed",
        "street_address": "167 West 74th Street",
        "uri": "/v1/marketplaces/TEST-MP2fKt4ZKVunA2Fe5erXgLa5/cards/CC2fY3orziOBCf66BMIeeXaR"
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
        "first_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/cards?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3/cards",
                    "created_at": "2013-03-22T20:37:20.707630Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3/holds",
                    "id": "AC2ifVXdic2nP5vzcRYs10v3",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3"
                },
                "brand": "Discover",
                "card_type": "discover",
                "created_at": "2013-03-22T20:37:20.748047Z",
                "expiration_month": 10,
                "expiration_year": 2016,
                "hash": "handcock",
                "id": "CC2iizyllLkwQLE9DzUtekFv",
                "iin_uri": "/v1/cards/CC2iizyllLkwQLE9DzUtekFv/iin",
                "is_valid": true,
                "last_four": "1117",
                "meta": {},
                "name": null,
                "postal_code_check": "unknown",
                "security_code_check": "passed",
                "uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2ifVXdic2nP5vzcRYs10v3/cards/CC2iizyllLkwQLE9DzUtekFv"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx/cards",
                    "created_at": "2013-03-22T20:37:20.742848Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx/debits",
                    "email_address": "email.6@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx/holds",
                    "id": "AC2iio9dEDcHt28docAyTQKx",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx/refunds",
                    "roles": [
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-22T20:37:20.767404Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC4b6be796933011e2b7080090f5bb1cfd",
                "iin_uri": "/v1/cards/CC4b6be796933011e2b7080090f5bb1cfd/iin",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2iio9dEDcHt28docAyTQKx/cards/CC4b6be796933011e2b7080090f5bb1cfd"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl/cards",
                    "created_at": "2013-03-22T20:37:20.797649Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl/holds",
                    "id": "AC2imefYC1ksDlvTx66fZSsl",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl/refunds",
                    "roles": [
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-22T20:37:20.848320Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC4b784c3e933011e2b7080090f5bb1cfd",
                "iin_uri": "/v1/cards/CC4b784c3e933011e2b7080090f5bb1cfd/iin",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/accounts/AC2imefYC1ksDlvTx66fZSsl/cards/CC4b784c3e933011e2b7080090f5bb1cfd"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/cards?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 3,
        "uri": "/v1/marketplaces/TEST-MP2i6zrIMGzNsXkXartSrtk9/cards?limit=10&offset=0"
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
        "first_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards",
                    "created_at": "2013-03-22T20:37:22.863979Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/holds",
                    "id": "AC2kGiMKuts6COTUCfRTjiIl",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl"
                },
                "brand": "MasterCard",
                "card_type": "mastercard",
                "created_at": "2013-03-22T20:37:22.902762Z",
                "expiration_month": 10,
                "expiration_year": 2016,
                "hash": "handcock",
                "id": "CC2kIQfMofUtrBjB9yil4K1n",
                "iin_uri": "/v1/cards/CC2kIQfMofUtrBjB9yil4K1n/iin",
                "is_valid": true,
                "last_four": "5100",
                "meta": {},
                "name": null,
                "postal_code_check": "unknown",
                "security_code_check": "passed",
                "uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards/CC2kIQfMofUtrBjB9yil4K1n"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards",
                    "created_at": "2013-03-22T20:37:22.863979Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/holds",
                    "id": "AC2kGiMKuts6COTUCfRTjiIl",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-22T20:37:23.015293Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC4cc2e31a933011e28c070090f5bb1cfd",
                "iin_uri": "/v1/cards/CC4cc2e31a933011e28c070090f5bb1cfd/iin",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards/CC4cc2e31a933011e28c070090f5bb1cfd"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards",
                    "created_at": "2013-03-22T20:37:22.863979Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/holds",
                    "id": "AC2kGiMKuts6COTUCfRTjiIl",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-22T20:37:23.030737Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC4cc4d800933011e28c070090f5bb1cfd",
                "iin_uri": "/v1/cards/CC4cc4d800933011e28c070090f5bb1cfd/iin",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards/CC4cc4d800933011e28c070090f5bb1cfd"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 3,
        "uri": "/v1/marketplaces/TEST-MP2kzr2ucJN10P9xnv58ktcx/accounts/AC2kGiMKuts6COTUCfRTjiIl/cards?limit=10&offset=0"
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
        "brand": "Visa",
        "card_type": "visa",
        "created_at": "2013-03-22T20:37:27.569219Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC2pYoe1FxP5o6APa4FZVGe9",
        "iin_uri": "/v1/cards/CC2pYoe1FxP5o6APa4FZVGe9/iin",
        "is_valid": false,
        "last_four": "1111",
        "meta": {
            "my-own-field": "Customer request"
        },
        "name": "Benny Riemann",
        "postal_code_check": "unknown",
        "security_code_check": "passed",
        "uri": "/v1/marketplaces/TEST-MP2pFHr5Az1MRMHFnDHw7CMt/cards/CC2pYoe1FxP5o6APa4FZVGe9"
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
        "account_uri": "/v1/marketplaces/TEST-MP2smuR8qoOw4DnVOvwDCjb7/accounts/AC2svy3LMWTYSrKputWDqu3H"
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt/bank_accounts",
            "cards_uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt/cards",
            "created_at": "2013-03-22T20:37:32.119184Z",
            "credits_uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt/credits",
            "debits_uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt/debits",
            "email_address": "email.3@y.com",
            "holds_uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt/holds",
            "id": "AC2v5IKLLo7bkpr5FK6kFlmt",
            "meta": {},
            "name": null,
            "refunds_uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt/refunds",
            "roles": [
                "merchant",
                "buyer"
            ],
            "transactions_uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt/transactions",
            "uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt"
        },
        "brand": "MasterCard",
        "card_type": "mastercard",
        "created_at": "2013-03-22T20:37:32.264549Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC2vfOfm1bgGeLpKg1Ax4QXP",
        "iin_uri": "/v1/cards/CC2vfOfm1bgGeLpKg1Ax4QXP/iin",
        "is_valid": true,
        "last_four": "5100",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code_check": "unknown",
        "security_code_check": "passed",
        "uri": "/v1/marketplaces/TEST-MP2uWljnuiYaocYrAE7vcp7T/accounts/AC2v5IKLLo7bkpr5FK6kFlmt/cards/CC2vfOfm1bgGeLpKg1Ax4QXP"
    }


