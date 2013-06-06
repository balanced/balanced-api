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
       "card_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/cards/CC2KFEUVBH24b31kNbkxljJl", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/transactions", 
     "email_address": null, 
     "id": "AC2MjqNc8jEWuEgURiDB3cM0", 
     "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T21:59:27.398707Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0", 
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/refunds", 
     "customer_uri": "/v1/customers/AC2MjqNc8jEWuEgURiDB3cM0", 
     "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2OCKliLQnUnZutMDCLYYH5/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2OCKliLQnUnZutMDCLYYH5/transactions", 
     "email_address": null, 
     "id": "AC2OCKliLQnUnZutMDCLYYH5", 
     "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2OCKliLQnUnZutMDCLYYH5/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2OCKliLQnUnZutMDCLYYH5/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2OCKliLQnUnZutMDCLYYH5/holds", 
     "name": "Levain Bakery", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-06T21:59:29.448647Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2OCKliLQnUnZutMDCLYYH5", 
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2OCKliLQnUnZutMDCLYYH5/refunds", 
     "customer_uri": "/v1/customers/AC2OCKliLQnUnZutMDCLYYH5", 
     "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2OCKliLQnUnZutMDCLYYH5/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2QPCn9KSKuvlqG3vdHpcpk/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2QPCn9KSKuvlqG3vdHpcpk/transactions", 
     "email_address": null, 
     "id": "AC2QPCn9KSKuvlqG3vdHpcpk", 
     "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2QPCn9KSKuvlqG3vdHpcpk/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2QPCn9KSKuvlqG3vdHpcpk/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2QPCn9KSKuvlqG3vdHpcpk/holds", 
     "name": "William James", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-06T21:59:31.414768Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2QPCn9KSKuvlqG3vdHpcpk", 
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2QPCn9KSKuvlqG3vdHpcpk/refunds", 
     "customer_uri": "/v1/customers/AC2QPCn9KSKuvlqG3vdHpcpk", 
     "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2QPCn9KSKuvlqG3vdHpcpk/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
     "email_address": null, 
     "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
     "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T21:59:23.772410Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
     "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
     "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
     "email_address": null, 
     "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
     "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T21:59:23.772410Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
     "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
     "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits"
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
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts?limit=2&offset=0", 
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
         "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/holds", 
         "name": "Benny Riemann", 
         "roles": [
           "buyer"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/transactions", 
         "created_at": "2013-06-06T21:59:27.398707Z", 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/refunds", 
         "customer_uri": "/v1/customers/AC2MjqNc8jEWuEgURiDB3cM0", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/debits", 
         "email_address": null, 
         "id": "AC2MjqNc8jEWuEgURiDB3cM0", 
         "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2MjqNc8jEWuEgURiDB3cM0/cards"
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
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts?limit=2&offset=6"
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
       "customer_uri": "v1/customers/AC2VYryhiVHIrlRX2lvR8mcG", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2VYryhiVHIrlRX2lvR8mcG/holds", 
       "name": [
           "my new name"
       ], 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-06T21:59:35.987052+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2VYryhiVHIrlRX2lvR8mcG/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2VYryhiVHIrlRX2lvR8mcG/refunds", 
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
       "debits_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2VYryhiVHIrlRX2lvR8mcG/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2VYryhiVHIrlRX2lvR8mcG/transactions", 
       "email_address": null, 
       "id": "AC2VYryhiVHIrlRX2lvR8mcG", 
       "credits_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2VYryhiVHIrlRX2lvR8mcG/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2VYryhiVHIrlRX2lvR8mcG/cards"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Y8tI03DpOwA4jgOsTZ8ls/bank_accounts", 
     "meta": {
       "more-data": "here"
     }, 
     "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Y8tI03DpOwA4jgOsTZ8ls/transactions", 
     "email_address": null, 
     "id": "AC2Y8tI03DpOwA4jgOsTZ8ls", 
     "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Y8tI03DpOwA4jgOsTZ8ls/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Y8tI03DpOwA4jgOsTZ8ls/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Y8tI03DpOwA4jgOsTZ8ls/holds", 
     "name": "[u'my new name']", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T21:59:37.909128Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Y8tI03DpOwA4jgOsTZ8ls", 
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Y8tI03DpOwA4jgOsTZ8ls/refunds", 
     "customer_uri": "/v1/customers/AC2Y8tI03DpOwA4jgOsTZ8ls", 
     "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Y8tI03DpOwA4jgOsTZ8ls/debits"
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
       "customer_uri": "v1/customers/AC30mh6nPelUVZ22zQXS0jf1", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC30mh6nPelUVZ22zQXS0jf1/holds", 
       "name": "Benny Riemann", 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-06T21:59:39.881760+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC30mh6nPelUVZ22zQXS0jf1/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC30mh6nPelUVZ22zQXS0jf1/refunds", 
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
       "debits_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC30mh6nPelUVZ22zQXS0jf1/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC30mh6nPelUVZ22zQXS0jf1/transactions", 
       "email_address": null, 
       "id": "AC30mh6nPelUVZ22zQXS0jf1", 
       "credits_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC30mh6nPelUVZ22zQXS0jf1/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC30mh6nPelUVZ22zQXS0jf1/cards"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC32FjmOwON60fHdxuu9iqtI/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC32FjmOwON60fHdxuu9iqtI/transactions", 
     "email_address": null, 
     "id": "AC32FjmOwON60fHdxuu9iqtI", 
     "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC32FjmOwON60fHdxuu9iqtI/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC32FjmOwON60fHdxuu9iqtI/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC32FjmOwON60fHdxuu9iqtI/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "merchant", 
       "buyer"
     ], 
     "created_at": "2013-06-06T21:59:41.936303Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC32FjmOwON60fHdxuu9iqtI", 
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC32FjmOwON60fHdxuu9iqtI/refunds", 
     "customer_uri": "/v1/customers/AC32FjmOwON60fHdxuu9iqtI", 
     "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC32FjmOwON60fHdxuu9iqtI/debits"
   }

