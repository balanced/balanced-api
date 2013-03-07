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

``can_debit``
    **string**. Flag indicating whether this funding instrument can be debited (true)
    or not (false).


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
        "brand": "Visa",
        "can_debit": true,
        "card_type": "visa",
        "country_code": "USA",
        "created_at": "2013-03-07T02:42:11.279649Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC4LsmLbg5r88JChOAfvHtfs",
        "is_valid": true,
        "last_four": "1111",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code": "10023",
        "postal_code_check": "passed",
        "security_code_check": "passed",
        "street_address": "167 West 74th Street",
        "uri": "/v1/marketplaces/TEST-MP4LjIyHgFdM3eRl1CDQr5Gy/cards/CC4LsmLbg5r88JChOAfvHtfs"
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
        "brand": "MasterCard",
        "can_debit": true,
        "card_type": "mastercard",
        "country_code": "USA",
        "created_at": "2013-03-07T02:42:13.401708Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC4NQmA6CX96kKfL3RcHj7iq",
        "is_valid": true,
        "last_four": "5100",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code": "10023",
        "postal_code_check": "passed",
        "security_code_check": "passed",
        "street_address": "167 West 74th Street",
        "uri": "/v1/marketplaces/TEST-MP4NJBFA7ves5EIWerS7yS2S/cards/CC4NQmA6CX96kKfL3RcHj7iq"
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
        "first_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/cards?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2/cards",
                    "created_at": "2013-03-07T02:42:15.325642Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2/holds",
                    "id": "AC4Q0waVTaJN8kUyh0RR4vi2",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2/refunds",
                    "roles": [
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2/transactions",
                    "uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2"
                },
                "brand": "Visa",
                "can_debit": true,
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-07T02:42:15.342361Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC9eff4a5e86d011e2b46668a86d4bf3ea",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4Q0waVTaJN8kUyh0RR4vi2/cards/CC9eff4a5e86d011e2b46668a86d4bf3ea"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA/cards",
                    "created_at": "2013-03-07T02:42:15.307228Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA/debits",
                    "email_address": "email.6@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA/holds",
                    "id": "AC4PZfs8OlPvRah9PNxJgYJA",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA/refunds",
                    "roles": [
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA/transactions",
                    "uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA"
                },
                "brand": "Visa",
                "can_debit": true,
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-07T02:42:15.315232Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC9efb6d2e86d011e287bf68a86d4bf3ea",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PZfs8OlPvRah9PNxJgYJA/cards/CC9efb6d2e86d011e287bf68a86d4bf3ea"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0/cards",
                    "created_at": "2013-03-07T02:42:15.297129Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0/holds",
                    "id": "AC4PYxMxkvoGziaIq84Lxrl0",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0/transactions",
                    "uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0"
                },
                "brand": "MasterCard",
                "can_debit": true,
                "card_type": "mastercard",
                "created_at": "2013-03-07T02:42:15.308872Z",
                "expiration_month": 10,
                "expiration_year": 2016,
                "hash": "handcock",
                "id": "CC4PZhYtbpb4qAOCS0rKdvCy",
                "is_valid": true,
                "last_four": "5100",
                "meta": {},
                "name": null,
                "postal_code_check": "unknown",
                "security_code_check": "passed",
                "uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/accounts/AC4PYxMxkvoGziaIq84Lxrl0/cards/CC4PZhYtbpb4qAOCS0rKdvCy"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/cards?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 3,
        "uri": "/v1/marketplaces/TEST-MP4PVB17WEL6XI4p59DMQEVY/cards?limit=10&offset=0"
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
        "first_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards",
                    "created_at": "2013-03-07T02:42:17.527520Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/holds",
                    "id": "AC4Su4h8SpVDY3qBPDrhH6Km",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/transactions",
                    "uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km"
                },
                "brand": "Visa",
                "can_debit": true,
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-07T02:42:17.601619Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CCa0582f3886d011e2b43568a86d4bf3ea",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards/CCa0582f3886d011e2b43568a86d4bf3ea"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards",
                    "created_at": "2013-03-07T02:42:17.527520Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/holds",
                    "id": "AC4Su4h8SpVDY3qBPDrhH6Km",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/transactions",
                    "uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km"
                },
                "brand": "Visa",
                "can_debit": true,
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-07T02:42:17.597199Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CCa05775c086d011e2a1e268a86d4bf3ea",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards/CCa05775c086d011e2a1e268a86d4bf3ea"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards",
                    "created_at": "2013-03-07T02:42:17.527520Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/holds",
                    "id": "AC4Su4h8SpVDY3qBPDrhH6Km",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/transactions",
                    "uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km"
                },
                "brand": "Visa",
                "can_debit": true,
                "card_type": "visa",
                "created_at": "2013-03-07T02:42:17.541338Z",
                "expiration_month": 10,
                "expiration_year": 2016,
                "hash": "handcock",
                "id": "CC4SuYeA3fRT0ATfQQTzbDqa",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": null,
                "postal_code_check": "unknown",
                "security_code_check": "passed",
                "uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards/CC4SuYeA3fRT0ATfQQTzbDqa"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 3,
        "uri": "/v1/marketplaces/TEST-MP4SqQThByQAVmViR3YWJKC6/accounts/AC4Su4h8SpVDY3qBPDrhH6Km/cards?limit=10&offset=0"
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
        "can_debit": true,
        "card_type": "mastercard",
        "created_at": "2013-03-07T02:42:21.745908Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC4Xee6wnFwCR4jqfmPW02aS",
        "is_valid": false,
        "last_four": "5100",
        "meta": {
            "my-own-field": "Customer request"
        },
        "name": "Benny Riemann",
        "postal_code_check": "unknown",
        "security_code_check": "passed",
        "uri": "/v1/marketplaces/TEST-MP4X80CDzAnawl2MvDmoerge/cards/CC4Xee6wnFwCR4jqfmPW02aS"
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
        "account_uri": "/v1/marketplaces/TEST-MP4ZuV2yPSuqmyMMtC4uJMBY/accounts/AC4ZxSrDSmvktHA1EV7WlJN0"
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC/bank_accounts",
            "cards_uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC/cards",
            "created_at": "2013-03-07T02:42:25.907936Z",
            "credits_uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC/credits",
            "debits_uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC/debits",
            "email_address": "email.3@y.com",
            "holds_uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC/holds",
            "id": "AC51Us3dbvycWiEgp7cUr0iC",
            "meta": {},
            "name": null,
            "refunds_uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC/refunds",
            "roles": [
                "merchant",
                "buyer"
            ],
            "transactions_uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC/transactions",
            "uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC"
        },
        "brand": "Visa",
        "can_debit": true,
        "card_type": "visa",
        "created_at": "2013-03-07T02:42:25.973888Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC51Z3ihG5m3iMhVoyeswPLY",
        "is_valid": true,
        "last_four": "1111",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code_check": "unknown",
        "security_code_check": "passed",
        "uri": "/v1/marketplaces/TEST-MP51Rfkokj7qd9BRhotRm8Gu/accounts/AC51Us3dbvycWiEgp7cUr0iC/cards/CC51Z3ihG5m3iMhVoyeswPLY"
    }
