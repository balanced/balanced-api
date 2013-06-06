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
       "card_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/cards/CC7708hFSajwPepxuK7jy4Bk", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/transactions", 
     "email_address": null, 
     "id": "AC795MDqTD7JfARMXuN2uszK", 
     "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T23:15:03.118708Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK", 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/refunds", 
     "customer_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK", 
     "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7blw98unHYJRxnuEEoTXQz/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7blw98unHYJRxnuEEoTXQz/transactions", 
     "email_address": null, 
     "id": "AC7blw98unHYJRxnuEEoTXQz", 
     "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7blw98unHYJRxnuEEoTXQz/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7blw98unHYJRxnuEEoTXQz/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7blw98unHYJRxnuEEoTXQz/holds", 
     "name": "Levain Bakery", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-06T23:15:05.116712Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7blw98unHYJRxnuEEoTXQz", 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7blw98unHYJRxnuEEoTXQz/refunds", 
     "customer_uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz", 
     "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7blw98unHYJRxnuEEoTXQz/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7dzFUXICyWRLws9XAXZs2O/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7dzFUXICyWRLws9XAXZs2O/transactions", 
     "email_address": null, 
     "id": "AC7dzFUXICyWRLws9XAXZs2O", 
     "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7dzFUXICyWRLws9XAXZs2O/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7dzFUXICyWRLws9XAXZs2O/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7dzFUXICyWRLws9XAXZs2O/holds", 
     "name": "William James", 
     "roles": [
       "merchant"
     ], 
     "created_at": "2013-06-06T23:15:07.107376Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7dzFUXICyWRLws9XAXZs2O", 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7dzFUXICyWRLws9XAXZs2O/refunds", 
     "customer_uri": "/v1/customers/AC7dzFUXICyWRLws9XAXZs2O", 
     "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7dzFUXICyWRLws9XAXZs2O/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
     "email_address": null, 
     "id": "AC74u3FlUdGRzoRVqobCvhfW", 
     "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T23:14:59.021264Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
     "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
     "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
     "email_address": null, 
     "id": "AC74u3FlUdGRzoRVqobCvhfW", 
     "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T23:14:59.021264Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
     "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
     "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits"
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
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts?limit=2&offset=0", 
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
         "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/holds", 
         "name": "Benny Riemann", 
         "roles": [
           "buyer"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/transactions", 
         "created_at": "2013-06-06T23:15:03.118708Z", 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/refunds", 
         "customer_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/debits", 
         "email_address": null, 
         "id": "AC795MDqTD7JfARMXuN2uszK", 
         "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC795MDqTD7JfARMXuN2uszK/cards"
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
         "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ai9JceoGaJuONww3G6cHC/holds", 
         "name": "Levain Bakery", 
         "roles": [
           "merchant"
         ], 
         "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ai9JceoGaJuONww3G6cHC/transactions", 
         "created_at": "2013-06-06T23:15:04.182572Z", 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ai9JceoGaJuONww3G6cHC", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ai9JceoGaJuONww3G6cHC/bank_accounts", 
         "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ai9JceoGaJuONww3G6cHC/refunds", 
         "customer_uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC", 
         "meta": {}, 
         "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ai9JceoGaJuONww3G6cHC/debits", 
         "email_address": null, 
         "id": "AC7ai9JceoGaJuONww3G6cHC", 
         "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ai9JceoGaJuONww3G6cHC/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ai9JceoGaJuONww3G6cHC/cards"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts?limit=2&offset=6"
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
       "customer_uri": "v1/customers/AC7hJnnR7Xx0Ov8B8vQFKD2K", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7hJnnR7Xx0Ov8B8vQFKD2K/holds", 
       "name": [
           "my new name"
       ], 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-06T23:15:10.801720+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7hJnnR7Xx0Ov8B8vQFKD2K/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7hJnnR7Xx0Ov8B8vQFKD2K/refunds", 
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
       "debits_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7hJnnR7Xx0Ov8B8vQFKD2K/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7hJnnR7Xx0Ov8B8vQFKD2K/transactions", 
       "email_address": null, 
       "id": "AC7hJnnR7Xx0Ov8B8vQFKD2K", 
       "credits_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7hJnnR7Xx0Ov8B8vQFKD2K/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7hJnnR7Xx0Ov8B8vQFKD2K/cards"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7jC1EIDstO58GCnRBHf1RZ/bank_accounts", 
     "meta": {
       "more-data": "here"
     }, 
     "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7jC1EIDstO58GCnRBHf1RZ/transactions", 
     "email_address": null, 
     "id": "AC7jC1EIDstO58GCnRBHf1RZ", 
     "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7jC1EIDstO58GCnRBHf1RZ/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7jC1EIDstO58GCnRBHf1RZ/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7jC1EIDstO58GCnRBHf1RZ/holds", 
     "name": "[u'my new name']", 
     "roles": [
       "buyer"
     ], 
     "created_at": "2013-06-06T23:15:12.466275Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7jC1EIDstO58GCnRBHf1RZ", 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7jC1EIDstO58GCnRBHf1RZ/refunds", 
     "customer_uri": "/v1/customers/AC7jC1EIDstO58GCnRBHf1RZ", 
     "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7jC1EIDstO58GCnRBHf1RZ/debits"
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
       "customer_uri": "v1/customers/AC7lKK1pBaFGIfJpxUXcgxYW", 
       "_type": "account", 
       "holds_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7lKK1pBaFGIfJpxUXcgxYW/holds", 
       "name": "Benny Riemann", 
       "roles": [
           "buyer"
       ], 
       "created_at": "2013-06-06T23:15:14.377842+00:00Z", 
       "bank_accounts_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7lKK1pBaFGIfJpxUXcgxYW/bank_accounts", 
       "refunds_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7lKK1pBaFGIfJpxUXcgxYW/refunds", 
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
       "debits_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7lKK1pBaFGIfJpxUXcgxYW/debits", 
       "transactions_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7lKK1pBaFGIfJpxUXcgxYW/transactions", 
       "email_address": null, 
       "id": "AC7lKK1pBaFGIfJpxUXcgxYW", 
       "credits_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7lKK1pBaFGIfJpxUXcgxYW/credits", 
       "cards_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7lKK1pBaFGIfJpxUXcgxYW/cards"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ocVLXuXKAmotnkcw0H6We/bank_accounts", 
     "meta": {}, 
     "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ocVLXuXKAmotnkcw0H6We/transactions", 
     "email_address": null, 
     "id": "AC7ocVLXuXKAmotnkcw0H6We", 
     "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ocVLXuXKAmotnkcw0H6We/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ocVLXuXKAmotnkcw0H6We/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ocVLXuXKAmotnkcw0H6We/holds", 
     "name": "Benny Riemann", 
     "roles": [
       "merchant", 
       "buyer"
     ], 
     "created_at": "2013-06-06T23:15:16.554685Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ocVLXuXKAmotnkcw0H6We", 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ocVLXuXKAmotnkcw0H6We/refunds", 
     "customer_uri": "/v1/customers/AC7ocVLXuXKAmotnkcw0H6We", 
     "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7ocVLXuXKAmotnkcw0H6We/debits"
   }

