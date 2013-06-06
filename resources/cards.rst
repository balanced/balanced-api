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
   **object**.

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
     "country_code": "USA", 
     "brand": "Visa", 
     "expiration_month": 4, 
     "_uris": {}, 
     "meta": {}, 
     "last_four": "1111", 
     "id": "CC3lmW0xDzevedg2p6i4Pklc", 
     "customer": null, 
     "account": null, 
     "postal_code_check": "true", 
     "name": "Benny Riemann", 
     "expiration_year": 2014, 
     "created_at": "2013-06-06T21:59:58.565952Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/cards/CC3lmW0xDzevedg2p6i4Pklc", 
     "card_type": "visa", 
     "is_valid": true, 
     "postal_code": "10023", 
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
     "country_code": "USA", 
     "brand": "Visa", 
     "expiration_month": 4, 
     "_uris": {}, 
     "meta": {}, 
     "last_four": "1111", 
     "id": "CC3mi3SmaGqfqJNGtEKoWtZM", 
     "customer": null, 
     "account": null, 
     "postal_code_check": "true", 
     "name": "Benny Riemann", 
     "expiration_year": 2014, 
     "created_at": "2013-06-06T21:59:59.385070Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/cards/CC3mi3SmaGqfqJNGtEKoWtZM", 
     "card_type": "visa", 
     "is_valid": true, 
     "postal_code": "10023", 
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
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards?limit=2&offset=0", 
     "_type": "page", 
     "items": [], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards?limit=2&offset=0", 
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
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards?limit=2&offset=0"
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
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC2I5ju5j8rW2gd1ZVvTPGLe", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
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
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC2I5ju5j8rW2gd1ZVvTPGLe", 
         "expiration_month": 4, 
         "is_valid": true, 
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
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "postal_code": "10023", 
         "created_at": "2013-06-06T21:59:23.640139Z", 
         "id": "CC2I5ju5j8rW2gd1ZVvTPGLe", 
         "street_address": "167 West 74th Street", 
         "name": "Benny Riemann"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards?limit=2&offset=0", 
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
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards?limit=2&offset=0"
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
       "last_four": "1111", 
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
       "country_code": "USA", 
       "card_type": "visa", 
       "created_at": "2013-06-06T22:00:01.262955+00:00Z", 
       "id": "CC3opeLTTSE0clnSexIX0VcP", 
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
     "country_code": "USA", 
     "brand": "Visa", 
     "expiration_month": 4, 
     "_uris": {}, 
     "meta": {
       "my-own-field": "Customer request"
     }, 
     "last_four": "1111", 
     "id": "CC3r7NzGR9gSk9rYTAdR8I92", 
     "customer": null, 
     "account": null, 
     "postal_code_check": "true", 
     "name": "Benny Riemann", 
     "expiration_year": 2014, 
     "created_at": "2013-06-06T22:00:03.685598Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/cards/CC3r7NzGR9gSk9rYTAdR8I92", 
     "card_type": "visa", 
     "is_valid": false, 
     "postal_code": "10023", 
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
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "meta": {}, 
       "expiration_month": 4, 
       "is_valid": true, 
       "_uris": {}, 
       "postal_code": "10023", 
       "account_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "country_code": "USA", 
       "card_type": "visa", 
       "created_at": "2013-06-06T22:00:04.562110+00:00Z", 
       "id": "CC3s73CZC5XYAFEwghZa0rtE", 
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
     "country_code": "USA", 
     "brand": "Visa", 
     "expiration_month": 4, 
     "_uris": {}, 
     "meta": {}, 
     "last_four": "1111", 
     "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
       "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
       "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T21:59:24.065137Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
       "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
       "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "account": {
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "_type": "account", 
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "created_at": "2013-06-06T21:59:23.772410Z", 
       "meta": {}, 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
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
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
       "email_address": null, 
       "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
     }, 
     "postal_code_check": "true", 
     "name": "Benny Riemann", 
     "expiration_year": 2014, 
     "created_at": "2013-06-06T22:00:05.933421Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
     "card_type": "visa", 
     "is_valid": true, 
     "postal_code": "10023", 
     "street_address": "167 West 74th Street"
   }

