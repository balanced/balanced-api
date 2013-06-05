Accounts
========

- `Create a Buyer`_
- `Create a Person Merchant`_
- `Create a Business Merchant`_
- `Retrieve an Account`_
- `List all Accounts`_
- `Update an Account`_
- `Promote a Buyer Account to a Merchant`_

Fields
------

``bank_accounts_uri``
   **string**. URI for all bank accounts associated with the account.

``cards_uri``
   **string**. URI for all cards associated with the account.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   account was created.

``credits_uri``
   **string**. URI for all credits associated with the account.

``customer_uri``
   **string**.

``debits_uri``
   **string**. URI for all debits associated with the account.

``email_address``
   **string**. The email address of the account.

``holds_uri``
   **string**. URI for all holds associated with the account.

``id``
   **string**.

``merchant_uri``
   **object**.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``name``
   **string**. The name of the account.

``refunds_uri``
   **string**. URI for all refunds associated with the account.

``roles``
   **list**. A list of roles the account has. Can be zero, one, or both of
   ``buyer``, ``merchant``

``transactions_uri``
   **string**. URI for all transactions associated with the account.

``uri``
   **string**. The URI of the account.

Create a Buyer
--------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts

Request
~~~~~~~

``name``
   *optional* **string**. The display ``name`` of the account. If a ``card`` is provided with a ``name`` then that is used as the
   default. Otherwise no default is provided and this field is
   **required**.

``email_address``
   *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts
   on your marketplace. Defaults to ``null``.

``card_uri``
   *optional* **string**. The URI of the tokenized card.

``card``

   .. cssclass:: nested1

   *optional* **object**.

      See `Create a Card <./cards.rst#create-a-card>`_.



Body
^^^^

.. code:: javascript

   {
       "card_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/cards/CC6CfiuaGQLFK8KCmkdN9sLK", 
       "meta": {}, 
       "email_address": null, 
       "name": "Benny Riemann"
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
     "_type": "account", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6EhJMLs2MRhi96oKrenvtg/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6EhJMLs2MRhi96oKrenvtg/transactions", 
     "email_address": null, 
     "id": "AC6EhJMLs2MRhi96oKrenvtg", 
     "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6EhJMLs2MRhi96oKrenvtg/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6EhJMLs2MRhi96oKrenvtg/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6EhJMLs2MRhi96oKrenvtg/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-05T02:30:14.451958Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6EhJMLs2MRhi96oKrenvtg", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6EhJMLs2MRhi96oKrenvtg/refunds", 
     "customer_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg", 
     "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6EhJMLs2MRhi96oKrenvtg/debits"
   }

Create a Business Merchant
--------------------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts

Request
~~~~~~~

``name``
   *optional* **string**. The display ``name`` of the account. If a ``card`` is provided with a ``name`` then that is used as the
   default. Otherwise no default is provided and this field is
   **required**.

``email_address``
   *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts
   on your marketplace. Defaults to ``null``.

``bank_account_uri``
   *optional* **string**. The URI of the bank account created via *balanced.js*.

``bank_account``

   .. cssclass:: nested1

   *optional* **object**.

      See `BankAccount <./bank_accounts.rst>`_.


``merchant_uri``
   *optional* **string**. The URI of the merchant account created during a request for more
   information.

``merchant``

   .. cssclass:: nested1

   *required* **object**.

      ``type``
         *required* **string**. Merchant type. It should be one of: ``person`` or ``business``.

      ``phone_number``
         *required* **string**. E.164 formatted phone number.

      ``email_address``
         *optional* **string** or **null**. RFC-2822 formatted email address. Defaults to ``null``.

      ``meta``
         *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

      ``tax_id``
         *optional* **string**. For *person* merchants `tax_id` is optional, defaulting to ``null``.
         For *business* merchants `tax_id` is required.

      ``person``

         .. cssclass:: nested1

         *required* **object**.

            ``name``
               *required* **string**.

            ``dob``
               *required* **string**. Date-of-birth formatted as ``YYYY-MM-DD``.

            ``city``
               *required* **string**. City. Defaults to ``null``.

            ``postal_code``
               *required* **string**. Postal code. This is known as a zip code in the USA.
               *requires* ``country_code``.

            ``street_address``
               *required* **string**. Street address.
               *requires* ``postal_code``.

            ``country_code``
               *required* **string**. `ISO-3166-3
               <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_
               three character country code. Defaults to ``USA``.

            ``tax_id``
               *required* **string**.



      ``name``
         *optional* **string**. If an account is referenced in the resolving URI then the default is
         null. If this is nested in an account creation then the account
         ``name`` is used. Otherwise no default is provided and this field is
         required.

      ``production``
         *optional* **boolean**. Flag value, should be ``true`` or ``false``. Defaults to ``null``.

      ``city``
         *optional* **string**. City. Defaults to ``null``.

      ``postal_code``
         *required* **string**. Postal code. This is known as a zip code in the USA.
         *requires* ``country_code``.

      ``street_address``
         *required* **string**. Street address.
         *requires* ``postal_code``.

      ``country_code``
         *optional* **string**. `ISO-3166-3
         <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_
         three character country code. Defaults to ``USA``.




Body
^^^^

.. code:: javascript

   {
       "merchant": {
           "phone_number": "+16505551234", 
           "name": "Levain Bakery", 
           "person": {
               "phone_number": "+16505551234", 
               "name": "William James", 
               "dob": "1842-01-01", 
               "postal_code": "10023", 
               "country_code": "USA", 
               "street_address": "167 West 74th Street", 
               "tax_id": "393483992"
           }, 
           "postal_code": "10023", 
           "country_code": "USA", 
           "type": "business", 
           "street_address": "167 West 74th Street", 
           "tax_id": "253912384"
       }, 
       "name": null, 
       "bank_account_uri": null, 
       "meta": {}, 
       "email_address": null, 
       "merchant_uri": null
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
     "_type": "account", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6GYfhsHiUt9sNvAxii2SsG/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6GYfhsHiUt9sNvAxii2SsG/transactions", 
     "email_address": null, 
     "id": "AC6GYfhsHiUt9sNvAxii2SsG", 
     "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6GYfhsHiUt9sNvAxii2SsG/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6GYfhsHiUt9sNvAxii2SsG/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6GYfhsHiUt9sNvAxii2SsG/holds", 
     "name": "Levain Bakery", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-05T02:30:16.839761Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6GYfhsHiUt9sNvAxii2SsG", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6GYfhsHiUt9sNvAxii2SsG/refunds", 
     "customer_uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG", 
     "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6GYfhsHiUt9sNvAxii2SsG/debits"
   }

Create a Person Merchant
------------------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts

Request
~~~~~~~

``name``
   *optional* **string**. The display ``name`` of the account. If a ``card`` is provided with a ``name`` then that is used as the
   default. Otherwise no default is provided and this field is
   **required**.

``email_address``
   *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts
   on your marketplace. Defaults to ``null``.

``bank_account_uri``
   *optional* **string**. The URI of the bank account created via *balanced.js*.

``bank_account``

   .. cssclass:: nested1

   *optional* **object**.

      See `BankAccount <./bank_accounts.rst>`_.


``merchant_uri``
   *optional* **string**. The URI of the merchant account created during a request for more
   information.

``merchant``

   .. cssclass:: nested1

   *optional* **object**.

      ``type``
         *required* **string**. Merchant type. It should be one of: ``person`` or ``business``.

      ``phone_number``
         *required* **string**. E.164 formatted phone number.

      ``email_address``
         *optional* **string** or **null**. RFC-2822 formatted email address. Defaults to ``null``.

      ``meta``
         *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

      ``tax_id``
         *optional* **string**. For *person* merchants `tax_id` is optional, defaulting to ``null``.
         For *business* merchants `tax_id` is required.

      ``dob``
         *optional* **string**. Date-of-birth formatted as ``YYYY-MM-DD``. For *person* merchants `dob` is required. For *business* merchants
         `dob` is optional, defaulting to ``null``.

      ``name``
         *optional* **string**. If an account is referenced in the resolving URI then the default is
         null. If this is nested in an account creation then the account
         ``name`` is used. Otherwise no default is provided and this field is
         required.

      ``production``
         *optional* **boolean**. Flag value, should be ``true`` or ``false``. Defaults to ``null``.

      ``city``
         *optional* **string**. City. Defaults to ``null``.

      ``postal_code``
         *required* **string**. Postal code. This is known as a zip code in the USA.
         *requires* ``country_code``.

      ``street_address``
         *required* **string**. Street address.
         *requires* ``postal_code``.

      ``country_code``
         *optional* **string**. `ISO-3166-3
         <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_
         three character country code. Defaults to ``USA``.




Body
^^^^

.. code:: javascript

   {
       "merchant": {
           "phone_number": "+16505551234", 
           "name": "William James", 
           "dob": "1842-01-01", 
           "postal_code": "10023", 
           "country_code": "USA", 
           "type": "person", 
           "street_address": "167 West 74th Street", 
           "tax_id": "393-48-3992"
       }, 
       "name": null, 
       "bank_account_uri": null, 
       "meta": {}, 
       "email_address": null, 
       "merchant_uri": null
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
     "_type": "account", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6KoUKKh6XlVHBxXuu6Zbw2/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6KoUKKh6XlVHBxXuu6Zbw2/transactions", 
     "email_address": null, 
     "id": "AC6KoUKKh6XlVHBxXuu6Zbw2", 
     "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6KoUKKh6XlVHBxXuu6Zbw2/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6KoUKKh6XlVHBxXuu6Zbw2/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6KoUKKh6XlVHBxXuu6Zbw2/holds", 
     "name": "William James", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-05T02:30:19.898192Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6KoUKKh6XlVHBxXuu6Zbw2", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6KoUKKh6XlVHBxXuu6Zbw2/refunds", 
     "customer_uri": "/v1/customers/AC6KoUKKh6XlVHBxXuu6Zbw2", 
     "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6KoUKKh6XlVHBxXuu6Zbw2/debits"
   }

Retrieve an Account
-------------------

Request
~~~~~~~

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
     "_type": "account", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
     "email_address": null, 
     "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
     "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-05T02:30:09.949061Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
     "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
     "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits"
   }

.. code::


   HEAD /v1/marketplaces/:marketplace_id/accounts/:account_id
   GET /v1/marketplaces/:marketplace_id/accounts/:account_id

Request
~~~~~~~

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
     "_type": "account", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
     "email_address": null, 
     "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
     "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-05T02:30:09.949061Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
     "customer_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
     "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6zdJPkzqXpIxTgvxpYse4G/debits"
   }

List all Accounts
-----------------

Request
~~~~~~~

.. code::


   HEAD /v1/marketplaces/:marketplace_id/accounts
   GET /v1/marketplaces/:marketplace_id/accounts


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "first_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
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
         "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6xEUte50oDdcfGLsXBLXHx/holds", 
         "name": "William Henry Cavendish III", 
         "roles": [
           "merchant", 
           "buyer"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6xEUte50oDdcfGLsXBLXHx/transactions", 
         "created_at": "2013-06-05T02:30:08.562678Z", 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6xEUte50oDdcfGLsXBLXHx", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6xEUte50oDdcfGLsXBLXHx/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6xEUte50oDdcfGLsXBLXHx/refunds", 
         "customer_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6xEUte50oDdcfGLsXBLXHx/debits", 
         "email_address": "whc@example.org", 
         "id": "AC6xEUte50oDdcfGLsXBLXHx", 
         "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6xEUte50oDdcfGLsXBLXHx/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6xEUte50oDdcfGLsXBLXHx/cards"
       }, 
       {
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
         "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6Cqa5V3LtTgsLhwqk6BX4c/holds", 
         "name": "Benny Riemann", 
         "roles": [
           "buyer"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6Cqa5V3LtTgsLhwqk6BX4c/transactions", 
         "created_at": "2013-06-05T02:30:12.795445Z", 
         "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6Cqa5V3LtTgsLhwqk6BX4c", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6Cqa5V3LtTgsLhwqk6BX4c/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6Cqa5V3LtTgsLhwqk6BX4c/refunds", 
         "customer_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6Cqa5V3LtTgsLhwqk6BX4c/debits", 
         "email_address": null, 
         "id": "AC6Cqa5V3LtTgsLhwqk6BX4c", 
         "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6Cqa5V3LtTgsLhwqk6BX4c/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6Cqa5V3LtTgsLhwqk6BX4c/cards"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts?limit=2&offset=0", 
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
     "total": 8, 
     "next_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts?limit=2&offset=6"
   }

Update an Account
-----------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id

Request
~~~~~~~

``name``
   *optional* **string**. The display ``name`` of the account.

``email_address``
   *optional* **string** or **null**. RFC-2822 formatted email address.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values.

``card_uri``
   *optional* **string**. Tokenized card URI.

``card``

   .. cssclass:: nested1

   *optional* **object**.

      See `Card <./cards.rst>`_.


``bank_account_uri``
   *optional* **string**. Tokenized bank account URI.

``bank_account``

   .. cssclass:: nested1

   *optional* **object**.

      See `BankAccount <./bank_accounts.rst>`_.




Body
^^^^

.. code:: javascript

   {
       "customer_uri": "v1/customers/AC6SLZUwlvc2kNoNa4s4srxB", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6SLZUwlvc2kNoNa4s4srxB/holds", 
       "name": [
           "my new name"
       ], 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-05T02:30:27.335644+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6SLZUwlvc2kNoNa4s4srxB/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6SLZUwlvc2kNoNa4s4srxB/refunds", 
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
       "meta": {
           "more-data": "here"
       }, 
       "debits_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6SLZUwlvc2kNoNa4s4srxB/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6SLZUwlvc2kNoNa4s4srxB/transactions", 
       "email_address": null, 
       "id": "AC6SLZUwlvc2kNoNa4s4srxB", 
       "credits_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6SLZUwlvc2kNoNa4s4srxB/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6SLZUwlvc2kNoNa4s4srxB/cards"
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
     "_type": "account", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6V4Sk3GbKvsA8aFczsOBPN/bank_accounts", 
     "meta": {
       "more-data": "here"
     }, 
     "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6V4Sk3GbKvsA8aFczsOBPN/transactions", 
     "email_address": null, 
     "id": "AC6V4Sk3GbKvsA8aFczsOBPN", 
     "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6V4Sk3GbKvsA8aFczsOBPN/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6V4Sk3GbKvsA8aFczsOBPN/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6V4Sk3GbKvsA8aFczsOBPN/holds", 
     "name": "[u'my new name']", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-05T02:30:29.384525Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6V4Sk3GbKvsA8aFczsOBPN", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6V4Sk3GbKvsA8aFczsOBPN/refunds", 
     "customer_uri": "/v1/customers/AC6V4Sk3GbKvsA8aFczsOBPN", 
     "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6V4Sk3GbKvsA8aFczsOBPN/debits"
   }

Promote a Buyer Account to a Merchant
-------------------------------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id

Request
~~~~~~~

``merchant_uri``
   See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_.


``merchant``

   .. cssclass:: nested1

   *optional* **object**.

      See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_.



Body
^^^^

.. code:: javascript

   {
       "merchant": {
           "phone_number": "+16505551234", 
           "name": "William James", 
           "dob": "1842-01-01", 
           "postal_code": "10023", 
           "country_code": "USA", 
           "type": "person", 
           "street_address": "167 West 74th Street", 
           "tax_id": "393-48-3992"
       }, 
       "customer_uri": "v1/customers/AC6XoUMHxgABT6pBpQkb6rbW", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6XoUMHxgABT6pBpQkb6rbW/holds", 
       "name": "Benny Riemann", 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-05T02:30:31.447963+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6XoUMHxgABT6pBpQkb6rbW/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6XoUMHxgABT6pBpQkb6rbW/refunds", 
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
       "meta": {}, 
       "debits_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6XoUMHxgABT6pBpQkb6rbW/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6XoUMHxgABT6pBpQkb6rbW/transactions", 
       "email_address": null, 
       "id": "AC6XoUMHxgABT6pBpQkb6rbW", 
       "credits_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6XoUMHxgABT6pBpQkb6rbW/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC6XoUMHxgABT6pBpQkb6rbW/cards"
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
     "_type": "account", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC70q5xcXN3wpmLC4N6EQdGg/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC70q5xcXN3wpmLC4N6EQdGg/transactions", 
     "email_address": null, 
     "id": "AC70q5xcXN3wpmLC4N6EQdGg", 
     "credits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC70q5xcXN3wpmLC4N6EQdGg/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC70q5xcXN3wpmLC4N6EQdGg/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC70q5xcXN3wpmLC4N6EQdGg/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "merchant", 
       "buyer"
     ], 
     "created_at": "2013-06-05T02:30:34.132070Z", 
     "uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC70q5xcXN3wpmLC4N6EQdGg", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC70q5xcXN3wpmLC4N6EQdGg/refunds", 
     "customer_uri": "/v1/customers/AC70q5xcXN3wpmLC4N6EQdGg", 
     "debits_uri": "/v1/marketplaces/TEST-MP6xDq5coY66zGqeAztpK2Sj/accounts/AC70q5xcXN3wpmLC4N6EQdGg/debits"
   }

