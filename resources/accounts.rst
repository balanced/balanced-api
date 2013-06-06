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
       "card_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/cards/CC4epZVb1yCqk8ONKX1M55hM", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4g8ygUY2DRas50d62wDmmX/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4g8ygUY2DRas50d62wDmmX/transactions", 
     "email_address": null, 
     "id": "AC4g8ygUY2DRas50d62wDmmX", 
     "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4g8ygUY2DRas50d62wDmmX/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4g8ygUY2DRas50d62wDmmX/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4g8ygUY2DRas50d62wDmmX/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T22:43:46.015726Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4g8ygUY2DRas50d62wDmmX", 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4g8ygUY2DRas50d62wDmmX/refunds", 
     "customer_uri": "/v1/customers/AC4g8ygUY2DRas50d62wDmmX", 
     "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4g8ygUY2DRas50d62wDmmX/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4iu1iTFkl8Pe5Xn4OEIqyA/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4iu1iTFkl8Pe5Xn4OEIqyA/transactions", 
     "email_address": null, 
     "id": "AC4iu1iTFkl8Pe5Xn4OEIqyA", 
     "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4iu1iTFkl8Pe5Xn4OEIqyA/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4iu1iTFkl8Pe5Xn4OEIqyA/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4iu1iTFkl8Pe5Xn4OEIqyA/holds", 
     "name": "Levain Bakery", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-06T22:43:48.107861Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4iu1iTFkl8Pe5Xn4OEIqyA", 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4iu1iTFkl8Pe5Xn4OEIqyA/refunds", 
     "customer_uri": "/v1/customers/AC4iu1iTFkl8Pe5Xn4OEIqyA", 
     "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4iu1iTFkl8Pe5Xn4OEIqyA/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4kWh1MHd8MYznMZcVrWW00/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4kWh1MHd8MYznMZcVrWW00/transactions", 
     "email_address": null, 
     "id": "AC4kWh1MHd8MYznMZcVrWW00", 
     "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4kWh1MHd8MYznMZcVrWW00/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4kWh1MHd8MYznMZcVrWW00/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4kWh1MHd8MYznMZcVrWW00/holds", 
     "name": "William James", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-06T22:43:50.291183Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4kWh1MHd8MYznMZcVrWW00", 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4kWh1MHd8MYznMZcVrWW00/refunds", 
     "customer_uri": "/v1/customers/AC4kWh1MHd8MYznMZcVrWW00", 
     "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4kWh1MHd8MYznMZcVrWW00/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
     "email_address": null, 
     "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
     "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T22:43:41.675985Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
     "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
     "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/transactions", 
     "email_address": null, 
     "id": "AC4bfKr90eDzdl6ZqBK0rk7M", 
     "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T22:43:41.675985Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M", 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/refunds", 
     "customer_uri": "/v1/customers/AC4bfKr90eDzdl6ZqBK0rk7M", 
     "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4bfKr90eDzdl6ZqBK0rk7M/debits"
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
     "first_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts?limit=2&offset=0", 
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
         "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4hqjE0OTyvCdY5i24LsAtQ/holds", 
         "name": "Levain Bakery", 
         "roles": [
           "merchant"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4hqjE0OTyvCdY5i24LsAtQ/transactions", 
         "created_at": "2013-06-06T22:43:47.162002Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4hqjE0OTyvCdY5i24LsAtQ", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4hqjE0OTyvCdY5i24LsAtQ/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4hqjE0OTyvCdY5i24LsAtQ/refunds", 
         "customer_uri": "/v1/customers/AC4hqjE0OTyvCdY5i24LsAtQ", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4hqjE0OTyvCdY5i24LsAtQ/debits", 
         "email_address": null, 
         "id": "AC4hqjE0OTyvCdY5i24LsAtQ", 
         "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4hqjE0OTyvCdY5i24LsAtQ/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4hqjE0OTyvCdY5i24LsAtQ/cards"
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
         "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4jPLTxkkmF8WITWad93PVS/holds", 
         "name": "William James", 
         "roles": [
           "merchant"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4jPLTxkkmF8WITWad93PVS/transactions", 
         "created_at": "2013-06-06T22:43:49.309372Z", 
         "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4jPLTxkkmF8WITWad93PVS", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4jPLTxkkmF8WITWad93PVS/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4jPLTxkkmF8WITWad93PVS/refunds", 
         "customer_uri": "/v1/customers/AC4jPLTxkkmF8WITWad93PVS", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4jPLTxkkmF8WITWad93PVS/debits", 
         "email_address": null, 
         "id": "AC4jPLTxkkmF8WITWad93PVS", 
         "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4jPLTxkkmF8WITWad93PVS/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4jPLTxkkmF8WITWad93PVS/cards"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts?limit=2&offset=6"
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
       "customer_uri": "v1/customers/AC4pl8Xt74GvIpQMrka1091E", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4pl8Xt74GvIpQMrka1091E/holds", 
       "name": [
           "my new name"
       ], 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-06T22:43:54.200688+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4pl8Xt74GvIpQMrka1091E/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4pl8Xt74GvIpQMrka1091E/refunds", 
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
       "debits_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4pl8Xt74GvIpQMrka1091E/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4pl8Xt74GvIpQMrka1091E/transactions", 
       "email_address": null, 
       "id": "AC4pl8Xt74GvIpQMrka1091E", 
       "credits_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4pl8Xt74GvIpQMrka1091E/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4pl8Xt74GvIpQMrka1091E/cards"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4r8GIaa0wXc2UvQclcE8HY/bank_accounts", 
     "meta": {
       "more-data": "here"
     }, 
     "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4r8GIaa0wXc2UvQclcE8HY/transactions", 
     "email_address": null, 
     "id": "AC4r8GIaa0wXc2UvQclcE8HY", 
     "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4r8GIaa0wXc2UvQclcE8HY/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4r8GIaa0wXc2UvQclcE8HY/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4r8GIaa0wXc2UvQclcE8HY/holds", 
     "name": "[u'my new name']", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T22:43:55.806012Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4r8GIaa0wXc2UvQclcE8HY", 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4r8GIaa0wXc2UvQclcE8HY/refunds", 
     "customer_uri": "/v1/customers/AC4r8GIaa0wXc2UvQclcE8HY", 
     "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4r8GIaa0wXc2UvQclcE8HY/debits"
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
       "customer_uri": "v1/customers/AC4t7PTqQBvC7OeVNgcAJWW4", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4t7PTqQBvC7OeVNgcAJWW4/holds", 
       "name": "Benny Riemann", 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-06T22:43:57.567688+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4t7PTqQBvC7OeVNgcAJWW4/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4t7PTqQBvC7OeVNgcAJWW4/refunds", 
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
       "debits_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4t7PTqQBvC7OeVNgcAJWW4/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4t7PTqQBvC7OeVNgcAJWW4/transactions", 
       "email_address": null, 
       "id": "AC4t7PTqQBvC7OeVNgcAJWW4", 
       "credits_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4t7PTqQBvC7OeVNgcAJWW4/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4t7PTqQBvC7OeVNgcAJWW4/cards"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4vaSxJGql1oTIyyHMFUsSk/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4vaSxJGql1oTIyyHMFUsSk/transactions", 
     "email_address": null, 
     "id": "AC4vaSxJGql1oTIyyHMFUsSk", 
     "credits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4vaSxJGql1oTIyyHMFUsSk/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4vaSxJGql1oTIyyHMFUsSk/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4vaSxJGql1oTIyyHMFUsSk/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "merchant", 
       "buyer"
     ], 
     "created_at": "2013-06-06T22:43:59.391650Z", 
     "uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4vaSxJGql1oTIyyHMFUsSk", 
     "refunds_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4vaSxJGql1oTIyyHMFUsSk/refunds", 
     "customer_uri": "/v1/customers/AC4vaSxJGql1oTIyyHMFUsSk", 
     "debits_uri": "/v1/marketplaces/TEST-MP48FpqiM6HrwRbMJdlUXuJ2/accounts/AC4vaSxJGql1oTIyyHMFUsSk/debits"
   }

