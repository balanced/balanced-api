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
        "brand": "MasterCard",
        "card_type": "mastercard",
        "country_code": "USA",
        "created_at": "2013-03-07T18:39:39.218282Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC2RMHdpAQQhcd0R2xybf4Yq",
        "is_valid": true,
        "last_four": "5100",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code": "10023",
        "postal_code_check": "passed",
        "security_code_check": "passed",
        "street_address": "167 West 74th Street",
        "uri": "/v1/marketplaces/TEST-MP2RF4WVndX9RKGYAOZsD8uu/cards/CC2RMHdpAQQhcd0R2xybf4Yq"
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
        "created_at": "2013-03-07T18:39:41.096147Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC2TTEroMmcgLyaQZAUpfLzs",
        "is_valid": true,
        "last_four": "1117",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code": "10023",
        "postal_code_check": "passed",
        "security_code_check": "passed",
        "street_address": "167 West 74th Street",
        "uri": "/v1/marketplaces/TEST-MP2TMptFe4S0n5XxSbkiI7IC/cards/CC2TTEroMmcgLyaQZAUpfLzs"
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
        "first_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/cards?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq/cards",
                    "created_at": "2013-03-07T18:39:42.925066Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq/holds",
                    "id": "AC2VXd1TjTT25J9oGlbhAXSq",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq"
                },
                "brand": "MasterCard",
                "card_type": "mastercard",
                "created_at": "2013-03-07T18:39:42.936157Z",
                "expiration_month": 10,
                "expiration_year": 2016,
                "hash": "handcock",
                "id": "CC2VXVw8bAkWuaF0bzdMH0ng",
                "is_valid": true,
                "last_four": "5100",
                "meta": {},
                "name": null,
                "postal_code_check": "unknown",
                "security_code_check": "passed",
                "uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXd1TjTT25J9oGlbhAXSq/cards/CC2VXVw8bAkWuaF0bzdMH0ng"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO/cards",
                    "created_at": "2013-03-07T18:39:42.934801Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO/debits",
                    "email_address": "email.6@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO/holds",
                    "id": "AC2VXT1EugtAtxI2YJY2OwcO",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO/refunds",
                    "roles": [
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-07T18:39:42.941551Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC606f9299875611e2ab6c68a86d4bf3ea",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VXT1EugtAtxI2YJY2OwcO/cards/CC606f9299875611e2ab6c68a86d4bf3ea"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O/cards",
                    "created_at": "2013-03-07T18:39:42.950990Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O/debits",
                    "email_address": "email.7@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O/holds",
                    "id": "AC2VZ0Eai54jXu5IXjbUB36O",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O/refunds",
                    "roles": [
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-07T18:39:42.964198Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC6072b24a875611e2b17268a86d4bf3ea",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/accounts/AC2VZ0Eai54jXu5IXjbUB36O/cards/CC6072b24a875611e2b17268a86d4bf3ea"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/cards?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 3,
        "uri": "/v1/marketplaces/TEST-MP2VUp9LaQf03hpP9okqs6Bs/cards?limit=10&offset=0"
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
        "first_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards?limit=10&offset=0",
        "items": [
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards",
                    "created_at": "2013-03-07T18:39:44.776876Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/holds",
                    "id": "AC2Y2l32Cy792BBqzYpHlsgO",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-07T18:39:44.829430Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC618f8a17875611e2b42368a86d4bf3ea",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards/CC618f8a17875611e2b42368a86d4bf3ea"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards",
                    "created_at": "2013-03-07T18:39:44.776876Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/holds",
                    "id": "AC2Y2l32Cy792BBqzYpHlsgO",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO"
                },
                "brand": "Visa",
                "card_type": "visa",
                "country_code": "USA",
                "created_at": "2013-03-07T18:39:44.825387Z",
                "expiration_month": 1,
                "expiration_year": 2015,
                "hash": null,
                "id": "CC618f06eb875611e2bd3068a86d4bf3ea",
                "is_valid": true,
                "last_four": "1111",
                "meta": {},
                "name": "Jet Li",
                "postal_code": "94110",
                "postal_code_check": null,
                "security_code_check": null,
                "street_address": "Somewhere over the rainbow",
                "uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards/CC618f06eb875611e2bd3068a86d4bf3ea"
            },
            {
                "account": {
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/bank_accounts",
                    "cards_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards",
                    "created_at": "2013-03-07T18:39:44.776876Z",
                    "credits_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/credits",
                    "debits_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/debits",
                    "email_address": "email.3@y.com",
                    "holds_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/holds",
                    "id": "AC2Y2l32Cy792BBqzYpHlsgO",
                    "meta": {},
                    "name": null,
                    "refunds_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/refunds",
                    "roles": [
                        "merchant",
                        "buyer"
                    ],
                    "transactions_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/transactions",
                    "uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO"
                },
                "brand": "MasterCard",
                "card_type": "mastercard",
                "created_at": "2013-03-07T18:39:44.788818Z",
                "expiration_month": 10,
                "expiration_year": 2016,
                "hash": "handcock",
                "id": "CC2Y37kET7E3lgG2T5aOK3zQ",
                "is_valid": true,
                "last_four": "5100",
                "meta": {},
                "name": null,
                "postal_code_check": "unknown",
                "security_code_check": "passed",
                "uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards/CC2Y37kET7E3lgG2T5aOK3zQ"
            }
        ],
        "last_uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards?limit=10&offset=0",
        "limit": 10,
        "next_uri": null,
        "offset": 0,
        "previous_uri": null,
        "total": 3,
        "uri": "/v1/marketplaces/TEST-MP2XZG3mc3jzPbHxClOIHKMG/accounts/AC2Y2l32Cy792BBqzYpHlsgO/cards?limit=10&offset=0"
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
        "brand": "Discover",
        "card_type": "discover",
        "created_at": "2013-03-07T18:39:48.643977Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC32nZMg5owfMvnmc9j4gdtg",
        "is_valid": false,
        "last_four": "1117",
        "meta": {
            "my-own-field": "Customer request"
        },
        "name": "Benny Riemann",
        "postal_code_check": "unknown",
        "security_code_check": "passed",
        "uri": "/v1/marketplaces/TEST-MP32i2gxhLWcQYsLTKHt3t0u/cards/CC32nZMg5owfMvnmc9j4gdtg"
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
        "account_uri": "/v1/marketplaces/TEST-MP34rv1CTO6CvLMFneVviOg2/accounts/AC34ufMHPxdYiYt3SbWYHBea"
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE/bank_accounts",
            "cards_uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE/cards",
            "created_at": "2013-03-07T18:39:52.415892Z",
            "credits_uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE/credits",
            "debits_uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE/debits",
            "email_address": "email.3@y.com",
            "holds_uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE/holds",
            "id": "AC36D1YCRRZ3p08Xxq5IiCjE",
            "meta": {},
            "name": null,
            "refunds_uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE/refunds",
            "roles": [
                "merchant",
                "buyer"
            ],
            "transactions_uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE/transactions",
            "uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE"
        },
        "brand": "Visa",
        "card_type": "visa",
        "created_at": "2013-03-07T18:39:52.462117Z",
        "expiration_month": 4,
        "expiration_year": 2014,
        "hash": "handcock",
        "id": "CC36Gfa7ZsH7TieQ4eEmn0Ei",
        "is_valid": true,
        "last_four": "1111",
        "meta": {},
        "name": "Benny Riemann",
        "postal_code_check": "unknown",
        "security_code_check": "passed",
        "uri": "/v1/marketplaces/TEST-MP36AofeW68JeKiVWItx6k1s/accounts/AC36D1YCRRZ3p08Xxq5IiCjE/cards/CC36Gfa7ZsH7TieQ4eEmn0Ei"
    }
