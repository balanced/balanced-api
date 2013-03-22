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
        "brand": "Discover",
        "card_type": "discover",
        "country_code": "USA",
        "created_at": "2013-03-22T19:53:41.918127Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC1xenPKBFlq1WfnKd4KcZUV",
        "iin_uri": "/v1/cards/CC1xenPKBFlq1WfnKd4KcZUV/iin",
        "is_valid": true,
        "last_four": "1117",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code": "10023",
        "postal_code_check": "passed",
        "security_code_check": "passed",
        "street_address": "167 West 74th Street",
        "uri": "/v1/marketplaces/TEST-MP1wOMByq7UWpE0LpgyI8owt/cards/CC1xenPKBFlq1WfnKd4KcZUV"
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
        "brand": "Visa",
        "card_type": "visa",
        "country_code": "USA",
        "created_at": "2013-03-22T19:53:44.183428Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC1zMpoRiPModmLYMFF6mhRj",
        "iin_uri": "/v1/cards/CC1zMpoRiPModmLYMFF6mhRj/iin",
        "is_valid": true,
        "last_four": "1111",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code": "10023",
        "postal_code_check": "passed",
        "security_code_check": "passed",
        "street_address": "167 West 74th Street",
        "uri": "/v1/marketplaces/TEST-MP1zup2klBaGcR9vSkz6h1z7/cards/CC1zMpoRiPModmLYMFF6mhRj"
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
        "first_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/cards?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp/cards",
                    "created_at": "2013-03-22T19:53:46.248052Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp/holds",
                    "id": "AC1C6oZMzf7hWiO6Izmhn1Yp",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp/transactions",
                    "uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp"
                },
                "brand": "Discover",
                "card_type": "discover",
                "created_at": "2013-03-22T19:53:46.288031Z",
                "expiration_month": 10,
                "expiration_year": 2016,
                "hash": "handcock",
                "id": "CC1C914yDm6OeYQgR9o6sJBj",
                "iin_uri": "/v1/cards/CC1C914yDm6OeYQgR9o6sJBj/iin",
                "is_valid": true,
                "last_four": "1117",
                "meta": {},
                "name": null,
                "postal_code_check": "unknown",
                "security_code_check": "passed",
                "uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C6oZMzf7hWiO6Izmhn1Yp/cards/CC1C914yDm6OeYQgR9o6sJBj"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN/cards",
                    "created_at": "2013-03-22T19:53:46.282983Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN/debits",
                    "email_address": "email.6@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN/holds",
                    "id": "AC1C8Q1pIIb4ma4dlz74o7oN",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN/refunds",
                    "roles": [
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN/transactions",
                    "uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-22T19:53:46.306858Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC3514e85e932a11e2ae9c0090f5bb1cfd",
                "iin_uri": "/v1/cards/CC3514e85e932a11e2ae9c0090f5bb1cfd/iin",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1C8Q1pIIb4ma4dlz74o7oN/cards/CC3514e85e932a11e2ae9c0090f5bb1cfd"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9/cards",
                    "created_at": "2013-03-22T19:53:46.345088Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9/holds",
                    "id": "AC1Cd9NygI29CecVfmP1i5w9",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9/refunds",
                    "roles": [
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9/transactions",
                    "uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-22T19:53:46.394279Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC3522476a932a11e2ae9c0090f5bb1cfd",
                "iin_uri": "/v1/cards/CC3522476a932a11e2ae9c0090f5bb1cfd/iin",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/accounts/AC1Cd9NygI29CecVfmP1i5w9/cards/CC3522476a932a11e2ae9c0090f5bb1cfd"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/cards?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 3,
        "uri": "/v1/marketplaces/TEST-MP1BVRYeEywQZsLXKHVDhsoR/cards?limit=10&offset=0"
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
        "first_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards",
                    "created_at": "2013-03-22T19:53:48.568780Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/holds",
                    "id": "AC1EIesWnKmMKvbcR5SzrRQV",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/transactions",
                    "uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV"
                },
                "brand": "MasterCard",
                "card_type": "mastercard",
                "created_at": "2013-03-22T19:53:48.609763Z",
                "expiration_month": 10,
                "expiration_year": 2016,
                "hash": "handcock",
                "id": "CC1EKWwYazBsKJCiivNLef2B",
                "iin_uri": "/v1/cards/CC1EKWwYazBsKJCiivNLef2B/iin",
                "is_valid": true,
                "last_four": "5100",
                "meta": {},
                "name": null,
                "postal_code_check": "unknown",
                "security_code_check": "passed",
                "uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards/CC1EKWwYazBsKJCiivNLef2B"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards",
                    "created_at": "2013-03-22T19:53:48.568780Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/holds",
                    "id": "AC1EIesWnKmMKvbcR5SzrRQV",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/transactions",
                    "uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-22T19:53:48.725219Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC3685edbe932a11e295bd0090f5bb1cfd",
                "iin_uri": "/v1/cards/CC3685edbe932a11e295bd0090f5bb1cfd/iin",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards/CC3685edbe932a11e295bd0090f5bb1cfd"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards",
                    "created_at": "2013-03-22T19:53:48.568780Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/holds",
                    "id": "AC1EIesWnKmMKvbcR5SzrRQV",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/transactions",
                    "uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-22T19:53:48.740289Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC3687ca08932a11e295bd0090f5bb1cfd",
                "iin_uri": "/v1/cards/CC3687ca08932a11e295bd0090f5bb1cfd/iin",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards/CC3687ca08932a11e295bd0090f5bb1cfd"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 3,
        "uri": "/v1/marketplaces/TEST-MP1ExliXGBprMUxZ5JZCQljL/accounts/AC1EIesWnKmMKvbcR5SzrRQV/cards?limit=10&offset=0"
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
        "brand": "MasterCard",
        "card_type": "mastercard",
        "created_at": "2013-03-22T19:53:53.376401Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC1K7sBftAKgzs7XY0UUaxOJ",
        "iin_uri": "/v1/cards/CC1K7sBftAKgzs7XY0UUaxOJ/iin",
        "is_valid": false,
        "last_four": "5100",
        "meta": {
            "my-own-field": "Customer request"
        },
        "name": "Benny Riemann",
        "postal_code_check": "unknown",
        "security_code_check": "passed",
        "uri": "/v1/marketplaces/TEST-MP1JNXsPJ3HrIi1jPXmSJ7uB/cards/CC1K7sBftAKgzs7XY0UUaxOJ"
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
        "account_uri": "/v1/marketplaces/TEST-MP1MsGqu7v85yWinjEpevSAB/accounts/AC1MD9tXwuyHxu5SBavN3ua1"
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3/bank_accounts",
            "cards_uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3/cards",
            "created_at": "2013-03-22T19:53:58.041469Z",
            "credits_uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3/credits",
            "debits_uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3/debits",
            "email_address": "email.3@y.com",
            "holds_uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3/holds",
            "id": "AC1PmMSiPLXfYUsfbLPoRGj3",
            "meta": {},
            "name": null,
            "refunds_uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3/refunds",
            "roles": [
                "merchant",
                "buyer"
            ],
            "transactions_uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3/transactions",
            "uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3"
        },
        "brand": "MasterCard",
        "card_type": "mastercard",
        "created_at": "2013-03-22T19:53:58.191899Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC1PxflADhkBlpztH7vitpsV",
        "iin_uri": "/v1/cards/CC1PxflADhkBlpztH7vitpsV/iin",
        "is_valid": true,
        "last_four": "5100",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code_check": "unknown",
        "security_code_check": "passed",
        "uri": "/v1/marketplaces/TEST-MP1PcuWgfLtenpwIYtOl883j/accounts/AC1PmMSiPLXfYUsfbLPoRGj3/cards/CC1PxflADhkBlpztH7vitpsV"
    }
