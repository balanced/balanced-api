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
       "card_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/cards/CC3bKGcriihH17kgq7iWUEaW", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/transactions", 
     "email_address": null, 
     "id": "AC3dtgCQuWIwu8qXeQeYv2bm", 
     "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T23:40:04.496508Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm", 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/refunds", 
     "customer_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm", 
     "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/debits"
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
               *requires* ``postal_code``. Defaults to ``null``.

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
         *optional* **string**. Street address.
         *requires* ``postal_code``. Defaults to ``null``.

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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3fJEd8jV1zUw1dge3ZtAJE/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3fJEd8jV1zUw1dge3ZtAJE/transactions", 
     "email_address": null, 
     "id": "AC3fJEd8jV1zUw1dge3ZtAJE", 
     "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3fJEd8jV1zUw1dge3ZtAJE/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3fJEd8jV1zUw1dge3ZtAJE/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3fJEd8jV1zUw1dge3ZtAJE/holds", 
     "name": "Levain Bakery", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-06T23:40:06.515772Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3fJEd8jV1zUw1dge3ZtAJE", 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3fJEd8jV1zUw1dge3ZtAJE/refunds", 
     "customer_uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE", 
     "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3fJEd8jV1zUw1dge3ZtAJE/debits"
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
         *optional* **string**. Street address.
         *requires* ``postal_code``. Defaults to ``null``.

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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3hTJF6Yw0Kdi6gBmZemrAs/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3hTJF6Yw0Kdi6gBmZemrAs/transactions", 
     "email_address": null, 
     "id": "AC3hTJF6Yw0Kdi6gBmZemrAs", 
     "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3hTJF6Yw0Kdi6gBmZemrAs/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3hTJF6Yw0Kdi6gBmZemrAs/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3hTJF6Yw0Kdi6gBmZemrAs/holds", 
     "name": "William James", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-06T23:40:08.432550Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3hTJF6Yw0Kdi6gBmZemrAs", 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3hTJF6Yw0Kdi6gBmZemrAs/refunds", 
     "customer_uri": "/v1/customers/AC3hTJF6Yw0Kdi6gBmZemrAs", 
     "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3hTJF6Yw0Kdi6gBmZemrAs/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
     "email_address": null, 
     "id": "AC38UBtmXyKEBQS90mN0U4ft", 
     "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T23:40:00.440155Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
     "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
     "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
     "email_address": null, 
     "id": "AC38UBtmXyKEBQS90mN0U4ft", 
     "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T23:40:00.440155Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
     "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
     "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits"
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
     "first_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts?limit=2&offset=0", 
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
         "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/holds", 
         "name": "Benny Riemann", 
         "roles": [
           "buyer"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/transactions", 
         "created_at": "2013-06-06T23:40:04.496508Z", 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/refunds", 
         "customer_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/debits", 
         "email_address": null, 
         "id": "AC3dtgCQuWIwu8qXeQeYv2bm", 
         "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3dtgCQuWIwu8qXeQeYv2bm/cards"
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
         "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3eEAd4iKlggL3MfZnE3lY4/holds", 
         "name": "Levain Bakery", 
         "roles": [
           "merchant"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3eEAd4iKlggL3MfZnE3lY4/transactions", 
         "created_at": "2013-06-06T23:40:05.550556Z", 
         "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3eEAd4iKlggL3MfZnE3lY4", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3eEAd4iKlggL3MfZnE3lY4/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3eEAd4iKlggL3MfZnE3lY4/refunds", 
         "customer_uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3eEAd4iKlggL3MfZnE3lY4/debits", 
         "email_address": null, 
         "id": "AC3eEAd4iKlggL3MfZnE3lY4", 
         "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3eEAd4iKlggL3MfZnE3lY4/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3eEAd4iKlggL3MfZnE3lY4/cards"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts?limit=2&offset=6"
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
       "customer_uri": "v1/customers/AC3nCONUPbrlxSWcE5FrEyBq", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3nCONUPbrlxSWcE5FrEyBq/holds", 
       "name": [
           "my new name"
       ], 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-06T23:40:13.527143+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3nCONUPbrlxSWcE5FrEyBq/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3nCONUPbrlxSWcE5FrEyBq/refunds", 
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
       "debits_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3nCONUPbrlxSWcE5FrEyBq/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3nCONUPbrlxSWcE5FrEyBq/transactions", 
       "email_address": null, 
       "id": "AC3nCONUPbrlxSWcE5FrEyBq", 
       "credits_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3nCONUPbrlxSWcE5FrEyBq/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3nCONUPbrlxSWcE5FrEyBq/cards"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3pAzo54erX8PKqgnZyGkRi/bank_accounts", 
     "meta": {
       "more-data": "here"
     }, 
     "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3pAzo54erX8PKqgnZyGkRi/transactions", 
     "email_address": null, 
     "id": "AC3pAzo54erX8PKqgnZyGkRi", 
     "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3pAzo54erX8PKqgnZyGkRi/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3pAzo54erX8PKqgnZyGkRi/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3pAzo54erX8PKqgnZyGkRi/holds", 
     "name": "[u'my new name']", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T23:40:15.273105Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3pAzo54erX8PKqgnZyGkRi", 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3pAzo54erX8PKqgnZyGkRi/refunds", 
     "customer_uri": "/v1/customers/AC3pAzo54erX8PKqgnZyGkRi", 
     "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3pAzo54erX8PKqgnZyGkRi/debits"
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
       "customer_uri": "v1/customers/AC3rIwfFR54Suf4m6bDtQsaY", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3rIwfFR54Suf4m6bDtQsaY/holds", 
       "name": "Benny Riemann", 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-06T23:40:17.165328+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3rIwfFR54Suf4m6bDtQsaY/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3rIwfFR54Suf4m6bDtQsaY/refunds", 
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
       "debits_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3rIwfFR54Suf4m6bDtQsaY/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3rIwfFR54Suf4m6bDtQsaY/transactions", 
       "email_address": null, 
       "id": "AC3rIwfFR54Suf4m6bDtQsaY", 
       "credits_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3rIwfFR54Suf4m6bDtQsaY/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3rIwfFR54Suf4m6bDtQsaY/cards"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3u1otGyJprNRRKWXezcjzg/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3u1otGyJprNRRKWXezcjzg/transactions", 
     "email_address": null, 
     "id": "AC3u1otGyJprNRRKWXezcjzg", 
     "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3u1otGyJprNRRKWXezcjzg/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3u1otGyJprNRRKWXezcjzg/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3u1otGyJprNRRKWXezcjzg/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "merchant", 
       "buyer"
     ], 
     "created_at": "2013-06-06T23:40:19.217666Z", 
     "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3u1otGyJprNRRKWXezcjzg", 
     "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3u1otGyJprNRRKWXezcjzg/refunds", 
     "customer_uri": "/v1/customers/AC3u1otGyJprNRRKWXezcjzg", 
     "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC3u1otGyJprNRRKWXezcjzg/debits"
   }

