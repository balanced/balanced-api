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

``account``
   **object**. See `Accounts <./accounts.rst>`_.


``brand``
   **string**. The brand of the card. One of: ``Visa``, ``MasterCard``,
   ``American Express``, or ``Discover``.

``card_type``
   **string**. **Deprecated**
   The type of the card. This field has been deprecated in favor of
   ``brand``.

``country_code``
   **string**. `ISO-3166-3`_ three character country code.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this card
   was tokenized.

``customer``
   **object**. See `Customers <./customers.rst>`_.

``expiration_month``
   **string**. Card's expiration month.

``expiration_year``
   **string**. Card's expiration year.

``hash``
   **string**. A hash derived from ``card_number``, ``expiration_month`` and
   ``expiration_year``. Cards with the same ``card_number``,
   ``expiration_month`` and ``expiration_year`` will have the same
   ``hash``.

``id``
   **string**.

``is_valid``
   **boolean**. A boolean value indicating whether or not the card is valid. Once
   invalidated, ``is_valid`` can not be set to ``true`` again.

``is_verified``
   **boolean**. A boolean value indicating whether this card could be verified during
   tokenization. A value of False doesn't necessarily mean that the card is
   invalid -- some issuing banks don't adhere to the verification protocol.

``last_four``
   **string**. Last four digits of the card.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``name``
   **string**. The name on the card.

``postal_code``
   **string**. Postal code (zip code in the USA).

``postal_code_check``
   **string**. One of "passed", "failed", "unknown"

``security_code_check``
   **string**. One of "passed", "failed", "unknown"

``street_address``
   **string**. Street address.

``uri``
   **string**. The URI of the card

Tokenize a Card
---------------

.. code::


   POST /v1/marketplaces/:marketplace_id/cards

Request
~~~~~~~

``card_number``
   *required* **string**. The digits of the credit card number.

``expiration_year``
   *required* **integer**. Expiration year.

``expiration_month``
   *required* **integer**. Expiration month (e.g. 1 for January).

``security_code``
   *optional* **string**. The 3-4 digit security code for the card.

``name``
   *optional* **string**.

``phone_number``
   *optional* **string**. E.164 formatted phone number.

``city``
   *optional* **string**. City. Defaults to ``null``.

``postal_code``
   *required* **string**. Postal code. This is known as a zip code in the USA.
   *requires* ``country_code``.

``street_address``
   *optional* **string**. Street address.
   *requires* ``postal_code``. Defaults to ``null``.

``country_code``
   *optional* **string**. `ISO-3166-3
   <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_
   three character country code. Defaults to ``USA``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``is_valid``
   *optional* **boolean**. Indicates whether the card is active (``true``) or has been deactivated
   (``false``). Defaults to ``true``.


Body
^^^^

.. code:: javascript

   {
       "phone_number": "+16509241212",
       "city": null,
       "name": "Benny Riemann",
       "expiration_year": 2014,
       "region": null,
       "expiration_month": 4,
       "postal_code": "10023",
       "country_code": "USA",
       "security_code": 323,
       "card_number": "4111111111111111",
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
     "security_code_check": "true",
     "_type": "card",
     "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2",
     "last_four": "1111",
     "_uris": {},
     "brand": "Visa",
     "expiration_month": 4,
     "meta": {},
     "postal_code": "10023",
     "country_code": "USA",
     "id": "CC1qCvr5tiysnnoCL9Z1Xwgf",
     "customer": null,
     "account": null,
     "postal_code_check": "true",
     "name": "Benny Riemann",
     "expiration_year": 2014,
     "created_at": "2013-06-24T19:28:01.208388Z",
     "uri": "/v1/marketplaces/TEST-MP4GZhFzmckF3PpDFczd02s7/cards/CC1qCvr5tiysnnoCL9Z1Xwgf",
     "card_type": "visa",
     "is_valid": true,
     "is_verified": true,
     "street_address": "167 West 74th Street"
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
     "security_code_check": "true",
     "_type": "card",
     "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2",
     "last_four": "1111",
     "_uris": {},
     "brand": "Visa",
     "expiration_month": 4,
     "meta": {},
     "postal_code": "10023",
     "country_code": "USA",
     "id": "CC1r5mBshGbcVTgPCob33dfV",
     "customer": null,
     "account": null,
     "postal_code_check": "true",
     "name": "Benny Riemann",
     "expiration_year": 2014,
     "created_at": "2013-06-24T19:28:01.622236Z",
     "uri": "/v1/marketplaces/TEST-MP4GZhFzmckF3PpDFczd02s7/cards/CC1r5mBshGbcVTgPCob33dfV",
     "card_type": "visa",
     "is_valid": true,
     "is_verified": true,
     "street_address": "167 West 74th Street"
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


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "first_uri": "/v1/marketplaces/TEST-MP4GZhFzmckF3PpDFczd02s7/accounts/AC19CJtENqlmUyp2YY2ltHsH/cards?limit=2&offset=0",
     "_type": "page",
     "items": [],
     "previous_uri": null,
     "uri": "/v1/marketplaces/TEST-MP4GZhFzmckF3PpDFczd02s7/accounts/AC19CJtENqlmUyp2YY2ltHsH/cards?limit=2&offset=0",
     "_uris": {
       "first_uri": {
         "_type": "page",
         "key": "first"
       },
       "next_uri": {
         "_type": "page",
         "key": "next"
       },
       "previous_uri": {
         "_type": "page",
         "key": "previous"
       },
       "last_uri": {
         "_type": "page",
         "key": "last"
       }
     },
     "limit": 2,
     "offset": 0,
     "total": 0,
     "next_uri": null,
     "last_uri": "/v1/marketplaces/TEST-MP4GZhFzmckF3PpDFczd02s7/accounts/AC19CJtENqlmUyp2YY2ltHsH/cards?limit=2&offset=0"
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


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "first_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards?limit=2&offset=0",
     "_type": "page",
     "items": [
       {
         "customer": {
           "twitter": null,
           "meta": {},
           "id": "CU6zEbRwNXbovDRX0bThtz18",
           "email": null,
           "_type": "customer",
           "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC6yRp58mJCIbulhcxSGauXk",
           "bank_accounts_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/bank_accounts",
           "phone": null,
           "_uris": {
             "transactions_uri": {
               "_type": "page",
               "key": "transactions"
             },
             "source_uri": {
               "_type": "card",
               "key": "source"
             },
             "bank_accounts_uri": {
               "_type": "page",
               "key": "bank_accounts"
             },
             "refunds_uri": {
               "_type": "page",
               "key": "refunds"
             },
             "debits_uri": {
               "_type": "page",
               "key": "debits"
             },
             "holds_uri": {
               "_type": "page",
               "key": "holds"
             },
             "credits_uri": {
               "_type": "page",
               "key": "credits"
             },
             "cards_uri": {
               "_type": "page",
               "key": "cards"
             }
           },
           "facebook": null,
           "address": {},
           "destination_uri": null,
           "business_name": null,
           "credits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/credits",
           "cards_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/cards",
           "holds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/holds",
           "name": null,
           "dob": null,
           "created_at": "2013-06-05T02:30:10.328398Z",
           "is_identity_verified": false,
           "uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18",
           "refunds_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/refunds",
           "debits_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/debits",
           "transactions_uri": "/v1/customers/CU6zEbRwNXbovDRX0bThtz18/transactions",
           "ssn_last4": null,
           "ein": null
         },
         "card_type": "visa",
         "_type": "card",
         "postal_code_check": "true",
         "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2",
         "country_code": "USA",
         "expiration_year": 2014,
         "_uris": {},
         "brand": "Visa",
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC6yRp58mJCIbulhcxSGauXk",
         "expiration_month": 4,
         "is_valid": true,
         "is_verified": true,
         "meta": {},
         "last_four": "1111",
         "security_code_check": "true",
         "account": {
           "_type": "account",
           "_uris": {
             "transactions_uri": {
               "_type": "page",
               "key": "transactions"
             },
             "bank_accounts_uri": {
               "_type": "page",
               "key": "bank_accounts"
             },
             "refunds_uri": {
               "_type": "page",
               "key": "refunds"
             },
             "customer_uri": {
               "_type": "customer",
               "key": "customer"
             },
             "debits_uri": {
               "_type": "page",
               "key": "debits"
             },
             "holds_uri": {
               "_type": "page",
               "key": "holds"
             },
             "credits_uri": {
               "_type": "page",
               "key": "credits"
             },
             "cards_uri": {
               "_type": "page",
               "key": "cards"
             }
           },
           "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds",
           "name": "Benny Riemann",
           "roles": [
             "buyer"
           ],
           "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions",
           "created_at": "2013-06-05T02:30:09.949061Z",
           "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G",
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts",
           "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds",
           "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G",
           "meta": {},
           "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits",
           "email_address": null,
           "id": "AC6zdJPkzqXpIxTgvxpYse4G",
           "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits",
           "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards"
         },
         "postal_code": "10023",
         "created_at": "2013-06-05T02:30:09.637519Z",
         "id": "CC6yRp58mJCIbulhcxSGauXk",
         "street_address": "167 West 74th Street",
         "name": "Benny Riemann"
       }
     ],
     "previous_uri": null,
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards?limit=2&offset=0",
     "_uris": {
       "first_uri": {
         "_type": "page",
         "key": "first"
       },
       "next_uri": {
         "_type": "page",
         "key": "next"
       },
       "previous_uri": {
         "_type": "page",
         "key": "previous"
       },
       "last_uri": {
         "_type": "page",
         "key": "last"
       }
     },
     "limit": 2,
     "offset": 0,
     "total": 1,
     "next_uri": null,
     "last_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards?limit=2&offset=0"
   }

Update a Card
-------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/cards/:card_id

Request
~~~~~~~

``is_valid``
   *optional* **boolean**. Indicates whether the card is active (``true``) or has been deactivated
   (``false``). Setting this to ``false`` will deactivate the card. Defaults to ``null``.

``customer_uri``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values.


Body
^^^^

.. code:: javascript

   {
       "security_code_check": "true",
       "customer": null,
       "_type": "card",
       "postal_code_check": "true",
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2",
       "country_code": "USA",
       "expiration_year": 2014,
       "brand": "Visa",
       "meta": {
           "my-own-field": "Customer request"
       },
       "account": null,
       "expiration_month": 4,
       "is_valid": "False",
       "_uris": {},
       "postal_code": "10023",
       "last_four": "1111",
       "card_type": "visa",
       "created_at": "2013-06-24T21:33:36.296377+00:00Z",
       "is_verified": true,
       "id": "CC5Fp7HQtnealHtJW56eB51Z",
       "street_address": "167 West 74th Street",
       "name": "Benny Riemann"
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
     "security_code_check": "true",
     "_type": "card",
     "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2",
     "last_four": "1111",
     "_uris": {},
     "brand": "Visa",
     "expiration_month": 4,
     "meta": {
       "my-own-field": "Customer request"
     },
     "postal_code": "10023",
     "country_code": "USA",
     "id": "CC5G2Twslgw2EGzt9SdyIj1t",
     "customer": null,
     "account": null,
     "postal_code_check": "true",
     "name": "Benny Riemann",
     "expiration_year": 2014,
     "created_at": "2013-06-24T21:33:36.866556Z",
     "uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/cards/CC5G2Twslgw2EGzt9SdyIj1t",
     "card_type": "visa",
     "is_valid": false,
     "is_verified": true,
     "street_address": "167 West 74th Street"
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
       "security_code_check": "true",
       "customer": null,
       "_type": "card",
       "postal_code_check": "true",
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2",
       "country_code": "USA",
       "expiration_year": 2014,
       "brand": "Visa",
       "meta": {},
       "expiration_month": 4,
       "is_valid": true,
       "_uris": {},
       "postal_code": "10023",
       "account_uri": "v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN",
       "last_four": "1111",
       "card_type": "visa",
       "created_at": "2013-06-24T21:33:37.586857+00:00Z",
       "is_verified": true,
       "id": "CC5GR7RusizweiErJskHua7J",
       "street_address": "167 West 74th Street",
       "name": "Benny Riemann"
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
     "security_code_check": "true",
     "_type": "card",
     "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2",
     "last_four": "1111",
     "_uris": {},
     "brand": "Visa",
     "expiration_month": 4,
     "meta": {},
     "postal_code": "10023",
     "country_code": "USA",
     "id": "CC5HM8orI8cTnj6dEdbXMoKP",
     "customer": {
       "twitter": null,
       "meta": {},
       "id": "CU5eSPyE9H2U9D6I5Qqq1uab",
       "email": null,
       "_type": "customer",
       "source_uri": "/v1/customers/AC5eJN3HJIMGOLlhGFZLmbrN/cards/CC5HM8orI8cTnj6dEdbXMoKP",
       "bank_accounts_uri": "/v1/customers/CU5eSPyE9H2U9D6I5Qqq1uab/bank_accounts",
       "phone": null,
       "_uris": {
         "holds_uri": {
           "_type": "page",
           "key": "holds"
         },
         "source_uri": {
           "_type": "card",
           "key": "source"
         },
         "bank_accounts_uri": {
           "_type": "page",
           "key": "bank_accounts"
         },
         "refunds_uri": {
           "_type": "page",
           "key": "refunds"
         },
         "debits_uri": {
           "_type": "page",
           "key": "debits"
         },
         "transactions_uri": {
           "_type": "page",
           "key": "transactions"
         },
         "credits_uri": {
           "_type": "page",
           "key": "credits"
         },
         "cards_uri": {
           "_type": "page",
           "key": "cards"
         }
       },
       "facebook": null,
       "address": {},
       "destination_uri": null,
       "business_name": null,
       "credits_uri": "/v1/customers/CU5eSPyE9H2U9D6I5Qqq1uab/credits",
       "cards_uri": "/v1/customers/CU5eSPyE9H2U9D6I5Qqq1uab/cards",
       "holds_uri": "/v1/customers/CU5eSPyE9H2U9D6I5Qqq1uab/holds",
       "name": null,
       "dob": null,
       "created_at": "2013-06-24T21:33:12.716162Z",
       "is_identity_verified": false,
       "uri": "/v1/customers/CU5eSPyE9H2U9D6I5Qqq1uab",
       "refunds_uri": "/v1/customers/CU5eSPyE9H2U9D6I5Qqq1uab/refunds",
       "debits_uri": "/v1/customers/CU5eSPyE9H2U9D6I5Qqq1uab/debits",
       "transactions_uri": "/v1/customers/CU5eSPyE9H2U9D6I5Qqq1uab/transactions",
       "ssn_last4": null,
       "ein": null
     },
     "account": {
       "customer_uri": "/v1/customers/AC5eJN3HJIMGOLlhGFZLmbrN",
       "_type": "account",
       "holds_uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN/holds",
       "name": "Benny Riemann",
       "roles": [
         "buyer"
       ],
       "created_at": "2013-06-24T21:33:12.586613Z",
       "meta": {},
       "uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN",
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN/bank_accounts",
       "refunds_uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN/refunds",
       "_uris": {
         "holds_uri": {
           "_type": "page",
           "key": "holds"
         },
         "bank_accounts_uri": {
           "_type": "page",
           "key": "bank_accounts"
         },
         "refunds_uri": {
           "_type": "page",
           "key": "refunds"
         },
         "customer_uri": {
           "_type": "customer",
           "key": "customer"
         },
         "debits_uri": {
           "_type": "page",
           "key": "debits"
         },
         "transactions_uri": {
           "_type": "page",
           "key": "transactions"
         },
         "credits_uri": {
           "_type": "page",
           "key": "credits"
         },
         "cards_uri": {
           "_type": "page",
           "key": "cards"
         }
       },
       "debits_uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN/debits",
       "transactions_uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN/transactions",
       "email_address": null,
       "id": "AC5eJN3HJIMGOLlhGFZLmbrN",
       "credits_uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN/credits",
       "cards_uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN/cards"
     },
     "postal_code_check": "true",
     "name": "Benny Riemann",
     "expiration_year": 2014,
     "created_at": "2013-06-24T21:33:38.404379Z",
     "uri": "/v1/marketplaces/TEST-MP5dPVgGGjEny0P3ErYicO47/accounts/AC5eJN3HJIMGOLlhGFZLmbrN/cards/CC5HM8orI8cTnj6dEdbXMoKP",
     "card_type": "visa",
     "is_valid": true,
     "is_verified": true,
     "street_address": "167 West 74th Street"
   }
