Customers
=========

- `Create a Customer`_
- `Retrieve a Customer`_
- `List all Customers`_
- `Update a Customer`_
- `Delete a Customer`_

Fields
------

``address``
   **object**. A single-level dictionary of string-type key/value pairs representing
   the address of the person or business.

``bank_accounts_uri``
   **string**. URI for all bank accounts associated with the customer.

``business_name``
   **string**. Full business name if the customer is a business. If there is a
   business name and EIN present, the customer will be treated as a
   business instead of a person.

``cards_uri``
   **string**. URI for all cards associated with the customer.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   customer was created.

``credits_uri``
   **string**. URI for all credits associated with the customer.

``debits_uri``
   **string**. URI for all debits associated with the customer.

``destination_uri``
   **string**. The default bank account that will be credited.

``dob``
   **string**. Date of birth of the customer or representative of the business.
   Format is YYYY-MM e.g. "1980-05"

``ein``
   **string**. Employee Identification Number of the business if the customer is a
   business. If there is a business name and EIN present, the customer
   will be treated as a business instead of a person.

``email``
   **string**. Email address of the person or business.

``facebook``
   **string**. Facebook ID or username of the customer or representative of the
   business.

``holds_uri``
   **string**. URI for all holds associated with the customer.

``id``
   **string**.

``is_identity_verified``
   **boolean**. Indicates if Balanced was able to match the identify information
   provided for the customer.

``meta``
   **object**. A single-level dictionary of string-type key/value pairs.

``name``
   **string**. Name of the customer or representative of the business.

``phone``
   **string**. Phone number of the person or business.

``refunds_uri``
   **string**. URI for all refunds associated with the customer.

``source_uri``
   **string**. The default credit card that will be debited.

``ssn_last4``
   **string**. Last four digits of the Social Security Number of the customer or
   representative of the business.

``transactions_uri``
   **string**. URI for all transactions associated with the customer.

``twitter``
   **string**. Twitter ID or username of the customer or representative of the
   business.

``uri``
   **string**. The URI of this customer.

Create a Customer
-----------------

.. code::


   POST /v1/customers

Request
~~~~~~~

``name``
   *optional* **string** or **null**. Name of the customer or representative of the business.

``email``
   *optional* **string** or **null**. Email address of the customer.

``meta``
   *optional* **key-value** or **null**. Single level mapping from string keys to string values.

``ssn_last4``
   *optional* **string** or **null**. Last four digits of the Social Security Number of the customer or
   representative of the business.

``business_name``
   *optional* **string** or **null**. Full business name if the customer is a business. If there is a business
   name and EIN present, the customer will be treated as a business instead
   of a person.

``address``

   .. cssclass:: nested1

   *optional* **object**.

      ``line1``
         *optional* **string**. Street address of the person or business.

      ``line2``
         *optional* **string**. Second line of the address for the person or business.

      ``city``
         *optional* **string**. City of the person or business.

      ``state``
         *optional* **string**. State of the person or business.

      ``postal_code``
         *optional* **string**. Postal code/zip code of the person or business.

      ``country_code``
         *optional* **string**. Two character country code.



``phone``
   *optional* **string** or **null**. Phone number of the person or business.

``dob``
   *optional* **string** or **null**. Date of birth of the customer or representative of the business.
   Format is YYYY-MM e.g. "1980-05"

``ein``
   *optional* **string** or **null**. Employee Identification Number of the business if the customer is a
   business. If there is a business name and EIN present, the customer will
   be treated as a business instead of a person.

``facebook``
   *optional* **string** or **null**. Facebook ID or username of the customer or representative of the
   business

``twitter``
   *optional* **string** or **null**. Twitter ID or username of the customer or representative of the business

``card_uri``
   *optional* **string**. The URI of a card tokenized via *balanced.js*.

``card``

   .. cssclass:: nested1

   *optional* **object**.

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

      ``region``
         *optional* **string**. Region (e.g. state, province, etc). This field has been
         **deprecated**.

      ``state``
         *optional* **string**. US state. This field has been **deprecated**.

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



``bank_account_uri``
   *optional* **string**. The URI of a bank account tokenized via *balanced.js*.

``bank_account``

   .. cssclass:: nested1

   *optional* **object**.

      ``name``
         *required* **string**. Name on the bank account.

      ``account_number``
         *required* **string**. Bank account number.

      ``bank_code``
         *required* **string**. Bank account code.

      ``routing_number``
         *required* **string**. Bank account code.

      ``bank_code``
         *required* **string**.

      ``routing_number``
         *required* **string**.

      ``account_type``
         *optional* **string**.

      ``type``
         *optional* **string**.

      ``meta``
         *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.




Body
^^^^

.. code:: javascript

   {
       "name": "John Lee Hooker", 
       "twitter": "@balanced", 
       "phone": "(904) 555-1796", 
       "meta": {
           "meta can store": "any flat key/value data you like", 
           "github": "https://github.com/balanced", 
           "more_additional_data": 54.8
       }, 
       "facebook": "https://facebook.com/balanced", 
       "address": {
           "city": "San Francisco", 
           "state": "CA", 
           "postal_code": "94103", 
           "line1": "965 Mission St", 
           "country_code": "US"
       }, 
       "business_name": "Balanced", 
       "ssn_last4": "3209", 
       "email": "user@example.org", 
       "ein": "123456789"
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
     "_type": "customer", 
     "twitter": "@balanced", 
     "bank_accounts_uri": "/v1/customers/CU7A6sk7hCzNJzhl0LYtGsoE/bank_accounts", 
     "phone": "(904) 555-1796", 
     "meta": {
       "meta can store": "any flat key/value data you like", 
       "github": "https://github.com/balanced", 
       "more_additional_data": "54.8"
     }, 
     "facebook": "https://facebook.com/balanced", 
     "address": {
       "city": "San Francisco", 
       "state": "CA", 
       "postal_code": "94103", 
       "line1": "965 Mission St", 
       "country_code": "US"
     }, 
     "source_uri": null, 
     "business_name": "Balanced", 
     "id": "CU7A6sk7hCzNJzhl0LYtGsoE", 
     "credits_uri": "/v1/customers/CU7A6sk7hCzNJzhl0LYtGsoE/credits", 
     "cards_uri": "/v1/customers/CU7A6sk7hCzNJzhl0LYtGsoE/cards", 
     "holds_uri": "/v1/customers/CU7A6sk7hCzNJzhl0LYtGsoE/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-06-06T20:37:58.209746Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU7A6sk7hCzNJzhl0LYtGsoE", 
     "refunds_uri": "/v1/customers/CU7A6sk7hCzNJzhl0LYtGsoE/refunds", 
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
     "debits_uri": "/v1/customers/CU7A6sk7hCzNJzhl0LYtGsoE/debits", 
     "transactions_uri": "/v1/customers/CU7A6sk7hCzNJzhl0LYtGsoE/transactions", 
     "destination_uri": null, 
     "email": "user@example.org", 
     "ein": "123456789"
   }

Retrieve a Customer
-------------------

.. code::


   HEAD /v1/customers/:customer_id
   GET /v1/customers/:customer_id

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
     "_type": "customer", 
     "twitter": null, 
     "bank_accounts_uri": "/v1/customers/CU7Bhqj965GHhIOicIBxJ1mf/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {
       "city": "San Francisco", 
       "line2": "#425", 
       "line1": "965 Mission St", 
       "state": "CA", 
       "postal_code": "94103", 
       "country_code": "USA"
     }, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CU7Bhqj965GHhIOicIBxJ1mf", 
     "credits_uri": "/v1/customers/CU7Bhqj965GHhIOicIBxJ1mf/credits", 
     "cards_uri": "/v1/customers/CU7Bhqj965GHhIOicIBxJ1mf/cards", 
     "holds_uri": "/v1/customers/CU7Bhqj965GHhIOicIBxJ1mf/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-06T20:37:59.250315Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU7Bhqj965GHhIOicIBxJ1mf", 
     "refunds_uri": "/v1/customers/CU7Bhqj965GHhIOicIBxJ1mf/refunds", 
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
     "debits_uri": "/v1/customers/CU7Bhqj965GHhIOicIBxJ1mf/debits", 
     "transactions_uri": "/v1/customers/CU7Bhqj965GHhIOicIBxJ1mf/transactions", 
     "destination_uri": null, 
     "email": null, 
     "ein": null
   }

List all Customers
------------------

.. code::


   HEAD /v1/customers
   GET /v1/customers

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
     "first_uri": "/v1/customers?limit=10&offset=0", 
     "_type": "page", 
     "items": [
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6A12QEpCLyWTHGFljjQnhY", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6A12QEpCLyWTHGFljjQnhY/bank_accounts", 
         "phone": "+16505551234", 
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
         "credits_uri": "/v1/customers/AC6A12QEpCLyWTHGFljjQnhY/credits", 
         "cards_uri": "/v1/customers/AC6A12QEpCLyWTHGFljjQnhY/cards", 
         "holds_uri": "/v1/customers/AC6A12QEpCLyWTHGFljjQnhY/holds", 
         "name": "William James", 
         "dob": null, 
         "created_at": "2013-06-06T20:37:03.009766Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6A12QEpCLyWTHGFljjQnhY", 
         "refunds_uri": "/v1/customers/AC6A12QEpCLyWTHGFljjQnhY/refunds", 
         "debits_uri": "/v1/customers/AC6A12QEpCLyWTHGFljjQnhY/debits", 
         "transactions_uri": "/v1/customers/AC6A12QEpCLyWTHGFljjQnhY/transactions", 
         "ssn_last4": null, 
         "ein": "393483992"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6yYr4t5Fc3FmP9lOY1I4G3", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6yYr4t5Fc3FmP9lOY1I4G3/bank_accounts", 
         "phone": "+16505551234", 
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
         "business_name": "Levain Bakery", 
         "credits_uri": "/v1/customers/AC6yYr4t5Fc3FmP9lOY1I4G3/credits", 
         "cards_uri": "/v1/customers/AC6yYr4t5Fc3FmP9lOY1I4G3/cards", 
         "holds_uri": "/v1/customers/AC6yYr4t5Fc3FmP9lOY1I4G3/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-06T20:37:02.073078Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6yYr4t5Fc3FmP9lOY1I4G3", 
         "refunds_uri": "/v1/customers/AC6yYr4t5Fc3FmP9lOY1I4G3/refunds", 
         "debits_uri": "/v1/customers/AC6yYr4t5Fc3FmP9lOY1I4G3/debits", 
         "transactions_uri": "/v1/customers/AC6yYr4t5Fc3FmP9lOY1I4G3/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6xUSYMJZ6Tog90et4LRBQX", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6xUSYMJZ6Tog90et4LRBQX/bank_accounts", 
         "phone": "+16505551234", 
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
         "business_name": "Levain Bakery", 
         "credits_uri": "/v1/customers/AC6xUSYMJZ6Tog90et4LRBQX/credits", 
         "cards_uri": "/v1/customers/AC6xUSYMJZ6Tog90et4LRBQX/cards", 
         "holds_uri": "/v1/customers/AC6xUSYMJZ6Tog90et4LRBQX/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-06T20:37:01.133175Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6xUSYMJZ6Tog90et4LRBQX", 
         "refunds_uri": "/v1/customers/AC6xUSYMJZ6Tog90et4LRBQX/refunds", 
         "debits_uri": "/v1/customers/AC6xUSYMJZ6Tog90et4LRBQX/debits", 
         "transactions_uri": "/v1/customers/AC6xUSYMJZ6Tog90et4LRBQX/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6wIZFDIwuPk08onKd01BmL", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL/cards/CC6wyA5Ge40fQrsPkDBbEhsa", 
         "bank_accounts_uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL/credits", 
         "cards_uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL/cards", 
         "holds_uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T20:37:00.073331Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL", 
         "refunds_uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL/refunds", 
         "debits_uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL/debits", 
         "transactions_uri": "/v1/customers/AC6wIZFDIwuPk08onKd01BmL/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6vdQAcFLRSDbvRlZaZ7NRu", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu/cards/CC6v3TVfDnE6ttuSPgVJm8Hu", 
         "bank_accounts_uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu/credits", 
         "cards_uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu/cards", 
         "holds_uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T20:36:58.742984Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu", 
         "refunds_uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu/refunds", 
         "debits_uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu/debits", 
         "transactions_uri": "/v1/customers/AC6vdQAcFLRSDbvRlZaZ7NRu/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
         "bank_accounts_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
         "cards_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards", 
         "holds_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T20:36:56.502056Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
         "refunds_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
         "debits_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
         "transactions_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6rMy754onf0fq0Z5E2FMek", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek/bank_accounts", 
         "phone": "+16505551212", 
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
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek/credits", 
         "cards_uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek/cards", 
         "holds_uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-06T20:36:55.684081Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek", 
         "refunds_uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek/refunds", 
         "debits_uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek/debits", 
         "transactions_uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6rMnO2FTl6mnaGJpmZtC1i", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i/bank_accounts", 
         "phone": null, 
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
         "address": null, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i/credits", 
         "cards_uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i/cards", 
         "holds_uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-06T20:36:55.681872Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i", 
         "refunds_uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i/refunds", 
         "debits_uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i/debits", 
         "transactions_uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6rhmWC8gdYJS7KPZFERlgA", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/bank_accounts/BA6rN0UQNLqZ09YWfYavjKHm", 
         "bank_accounts_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/bank_accounts", 
         "phone": "+16505551212", 
         "_uris": {
           "holds_uri": {
             "_type": "page", 
             "key": "holds"
           }, 
           "source_uri": {
             "_type": "bank_account", 
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
           "destination_uri": {
             "_type": "bank_account", 
             "key": "destination"
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
         "destination_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/bank_accounts/BA6rN0UQNLqZ09YWfYavjKHm", 
         "business_name": null, 
         "credits_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/credits", 
         "cards_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/cards", 
         "holds_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-06-06T20:36:55.236981Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA", 
         "refunds_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/refunds", 
         "debits_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/debits", 
         "transactions_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA/transactions", 
         "ssn_last4": null, 
         "ein": null
       }
     ], 
     "previous_uri": "/v1/customers?limit=10&offset=0", 
     "uri": "/v1/customers?limit=10&offset=10", 
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
     "limit": 10, 
     "offset": 10, 
     "total": 19, 
     "next_uri": null, 
     "last_uri": "/v1/customers?limit=10&offset=10"
   }

Update a Customer
-----------------

.. code::


   PUT /v1/customers/:customer_id

Request
~~~~~~~

``name``
   *optional* **string** or **null**. Name of the customer or representative of the business.

``email``
   *optional* **string** or **null**. Email address of the customer.

``meta``
   *optional* **key-value** or **null**. Single level mapping from string keys to string values.

``ssn_last4``
   *optional* **string** or **null**. Last four digits of the Social Security Number of the customer or
   representative of the business.

``business_name``
   *optional* **string** or **null**. Full business name if the customer is a business. If there is a business
   name and EIN present, the customer will be treated as a business instead
   of a person.

``address``

   .. cssclass:: nested1

   *optional* **object**.

      ``line1``
         *optional* **string**. Street address of the person or business.

      ``line2``
         *optional* **string**. Second line of the address for the person or business.

      ``city``
         *optional* **string**. City of the person or business.

      ``state``
         *optional* **string**. State of the person or business.

      ``postal_code``
         *optional* **string**. Postal code/zip code of the person or business.

      ``country_code``
         *optional* **string**. Two character country code.



``phone``
   *optional* **string** or **null**. Phone number of the person or business.

``dob``
   *optional* **string** or **null**. Date of birth of the customer or representative of the business.
   Format is YYYY-MM e.g. "1980-05"

``ein``
   *optional* **string** or **null**. Employee Identification Number of the business if the customer is a
   business. If there is a business name and EIN present, the customer will
   be treated as a business instead of a person.

``facebook``
   *optional* **string** or **null**. Facebook ID or username of the customer or representative of the
   business

``twitter``
   *optional* **string** or **null**. Twitter ID or username of the customer or representative of the business

``card_uri``
   *optional* **string**. The URI of a card tokenized via *balanced.js*.

``card``

   .. cssclass:: nested1

   *optional* **object**.

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

      ``region``
         *optional* **string**. Region (e.g. state, province, etc). This field has been
         **deprecated**.

      ``state``
         *optional* **string**. US state. This field has been **deprecated**.

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



``bank_account_uri``
   *optional* **string**. The URI of a bank account tokenized via *balanced.js*.

``bank_account``

   .. cssclass:: nested1

   *optional* **object**.

      ``name``
         *required* **string**. Name on the bank account.

      ``account_number``
         *required* **string**. Bank account number.

      ``bank_code``
         *required* **string**. Bank account code.

      ``routing_number``
         *required* **string**. Bank account code.

      ``bank_code``
         *required* **string**.

      ``routing_number``
         *required* **string**.

      ``account_type``
         *optional* **string**.

      ``type``
         *optional* **string**.

      ``meta``
         *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.




Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "_type": "customer", 
     "twitter": null, 
     "bank_accounts_uri": "/v1/customers/CU7JUCXaLHoSteWSi6XgjzUI/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {}, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CU7JUCXaLHoSteWSi6XgjzUI", 
     "credits_uri": "/v1/customers/CU7JUCXaLHoSteWSi6XgjzUI/credits", 
     "cards_uri": "/v1/customers/CU7JUCXaLHoSteWSi6XgjzUI/cards", 
     "holds_uri": "/v1/customers/CU7JUCXaLHoSteWSi6XgjzUI/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-06T20:38:06.930693Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU7JUCXaLHoSteWSi6XgjzUI", 
     "refunds_uri": "/v1/customers/CU7JUCXaLHoSteWSi6XgjzUI/refunds", 
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
     "debits_uri": "/v1/customers/CU7JUCXaLHoSteWSi6XgjzUI/debits", 
     "transactions_uri": "/v1/customers/CU7JUCXaLHoSteWSi6XgjzUI/transactions", 
     "destination_uri": null, 
     "email": null, 
     "ein": null
   }

Delete a Customer
-----------------

You can delete a customer so long as there has been no activity associated with it such as creating a hold, credit, or debit. 

.. code::


   DELETE /v1/customers/:customer_id

Request
~~~~~~~


Headers
^^^^^^^

.. code::

   Status: 204 NO CONTENT


Body
^^^^

.. code:: javascript



