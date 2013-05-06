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
   *optional* **string**. Name of the customer or representative of the business. Defaults to ``null``.

``email``
   *optional* **string**. Email address of the customer. Defaults to ``null``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``ssn_last4``
   *optional* **string**. Last four digits of the Social Security Number of the customer or
   representative of the business. Defaults to ``null``.

``business_name``
   *optional* **string**. Full business name if the customer is a business. If there is a business
   name and EIN present, the customer will be treated as a business instead
   of a person. Defaults to ``null``.

``address``
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
   *optional* **string**. Phone number of the person or business. Defaults to ``null``.

``dob``
   *optional* **string**. Date of birth of the customer or representative of the business.
   Format is YYYY-MM e.g. "1980-05" Defaults to ``null``.

``ein``
   *optional* **string**. Employee Identification Number of the business if the customer is a
   business. If there is a business name and EIN present, the customer will
   be treated as a business instead of a person. Defaults to ``null``.

``facebook``
   *optional* **string**. Facebook ID or username of the customer or representative of the
   business Defaults to ``null``.

``twitter``
   *optional* **string**. Twitter ID or username of the customer or representative of the business Defaults to ``null``.


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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/bank_accounts", 
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
     "id": "CU4GB5RgIMnuEaGYNU9ne1k5", 
     "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-05-06T18:48:54.544721Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4GB5RgIMnuEaGYNU9ne1k5", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/bank_accounts", 
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
     "id": "CU4GYQXoNSoYT4kgfAkGQpMZ", 
     "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-06T18:48:54.885559Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4GYQXoNSoYT4kgfAkGQpMZ", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/transactions", 
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
         "id": "CU4HkUjKPwuyoFOH2ANZWjBv", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HkUjKPwuyoFOH2ANZWjBv/bank_accounts", 
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
         "address": {
           "city": "San Francisco", 
           "line2": "#425", 
           "line1": "965 Mission St", 
           "state": "CA", 
           "postal_code": "94103", 
           "country_code": "USA"
         }, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HkUjKPwuyoFOH2ANZWjBv/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HkUjKPwuyoFOH2ANZWjBv/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HkUjKPwuyoFOH2ANZWjBv/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-06T18:48:55.201705Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU4HkUjKPwuyoFOH2ANZWjBv", 
         "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HkUjKPwuyoFOH2ANZWjBv/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HkUjKPwuyoFOH2ANZWjBv/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HkUjKPwuyoFOH2ANZWjBv/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "CU4GYQXoNSoYT4kgfAkGQpMZ", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/bank_accounts", 
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
         "address": {
           "city": "San Francisco", 
           "line2": "#425", 
           "line1": "965 Mission St", 
           "state": "CA", 
           "postal_code": "94103", 
           "country_code": "USA"
         }, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-06T18:48:54.885559Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU4GYQXoNSoYT4kgfAkGQpMZ", 
         "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GYQXoNSoYT4kgfAkGQpMZ/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": "@balanced", 
         "meta": {
           "meta can store": "any flat key/value data you like", 
           "github": "https://github.com/balanced", 
           "more_additional_data": "54.8"
         }, 
         "id": "CU4GB5RgIMnuEaGYNU9ne1k5", 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/bank_accounts", 
         "phone": "(904) 555-1796", 
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
         "facebook": "https://facebook.com/balanced", 
         "address": {
           "city": "San Francisco", 
           "state": "CA", 
           "postal_code": "94103", 
           "country_code": "US", 
           "line1": "965 Mission St"
         }, 
         "destination_uri": null, 
         "business_name": "Balanced", 
         "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/holds", 
         "name": "John Lee Hooker", 
         "dob": null, 
         "created_at": "2013-05-06T18:48:54.544721Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU4GB5RgIMnuEaGYNU9ne1k5", 
         "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GB5RgIMnuEaGYNU9ne1k5/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "123456789"
       }, 
       {
         "twitter": "@balanced", 
         "meta": {
           "meta can store": "any flat key/value data you like", 
           "github": "https://github.com/balanced", 
           "more_additional_data": "54.8"
         }, 
         "id": "CU4GjAHzuevJJqTbUGZKezTj", 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GjAHzuevJJqTbUGZKezTj/bank_accounts", 
         "phone": "(904) 555-1796", 
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
         "facebook": "https://facebook.com/balanced", 
         "address": {
           "city": "San Francisco", 
           "state": "CA", 
           "postal_code": "94103", 
           "country_code": "US", 
           "line1": "965 Mission St"
         }, 
         "destination_uri": null, 
         "business_name": "Balanced", 
         "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GjAHzuevJJqTbUGZKezTj/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GjAHzuevJJqTbUGZKezTj/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GjAHzuevJJqTbUGZKezTj/holds", 
         "name": "John Lee Hooker", 
         "dob": null, 
         "created_at": "2013-05-06T18:48:54.293961Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU4GjAHzuevJJqTbUGZKezTj", 
         "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GjAHzuevJJqTbUGZKezTj/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GjAHzuevJJqTbUGZKezTj/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4GjAHzuevJJqTbUGZKezTj/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "123456789"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC4FyESe8OiVSzVywCJjDP2x", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FyESe8OiVSzVywCJjDP2x/cards/CC4Fv34Wl6wTNtBSk86WidMt", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FyESe8OiVSzVywCJjDP2x/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FyESe8OiVSzVywCJjDP2x/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FyESe8OiVSzVywCJjDP2x/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FyESe8OiVSzVywCJjDP2x/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-06T18:48:53.619697Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC4FyESe8OiVSzVywCJjDP2x", 
         "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FyESe8OiVSzVywCJjDP2x/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FyESe8OiVSzVywCJjDP2x/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FyESe8OiVSzVywCJjDP2x/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC4FhaXnEQKBKxPR5nVV9KcV", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FhaXnEQKBKxPR5nVV9KcV/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FhaXnEQKBKxPR5nVV9KcV/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FhaXnEQKBKxPR5nVV9KcV/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FhaXnEQKBKxPR5nVV9KcV/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-06T18:48:53.369018Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC4FhaXnEQKBKxPR5nVV9KcV", 
         "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FhaXnEQKBKxPR5nVV9KcV/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FhaXnEQKBKxPR5nVV9KcV/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4FhaXnEQKBKxPR5nVV9KcV/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC4Fh33Y9uYPpSzbOcBj2v17", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4Fh33Y9uYPpSzbOcBj2v17/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4Fh33Y9uYPpSzbOcBj2v17/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4Fh33Y9uYPpSzbOcBj2v17/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4Fh33Y9uYPpSzbOcBj2v17/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-06T18:48:53.367221Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC4Fh33Y9uYPpSzbOcBj2v17", 
         "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4Fh33Y9uYPpSzbOcBj2v17/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4Fh33Y9uYPpSzbOcBj2v17/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4Fh33Y9uYPpSzbOcBj2v17/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC4F9s3nv0cyQePd9NPEb12V", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/bank_accounts/BA4FhkIqJ79uktI1eAiHlN73", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/bank_accounts/BA4FhkIqJ79uktI1eAiHlN73", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-06T18:48:53.258718Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC4F9s3nv0cyQePd9NPEb12V", 
         "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/AC4F9s3nv0cyQePd9NPEb12V/transactions", 
         "ssn_last4": null, 
         "ein": null
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/customers?limit=10&offset=0", 
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
     "offset": 0, 
     "total": 8, 
     "next_uri": null, 
     "last_uri": "/v1/customers?limit=10&offset=0"
   }

Update a Customer
-----------------

.. code::


   PUT /v1/customers/:customer_id

Request
~~~~~~~

``name``
   *optional* **string**. Name of the customer or representative of the business. Defaults to ``null``.

``email``
   *optional* **string**. Email address of the customer. Defaults to ``null``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``ssn_last4``
   *optional* **string**. Last four digits of the Social Security Number of the customer or
   representative of the business. Defaults to ``null``.

``business_name``
   *optional* **string**. Full business name if the customer is a business. If there is a business
   name and EIN present, the customer will be treated as a business instead
   of a person. Defaults to ``null``.

``address``
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
   *optional* **string**. Phone number of the person or business. Defaults to ``null``.

``dob``
   *optional* **string**. Date of birth of the customer or representative of the business.
   Format is YYYY-MM e.g. "1980-05" Defaults to ``null``.

``ein``
   *optional* **string**. Employee Identification Number of the business if the customer is a
   business. If there is a business name and EIN present, the customer will
   be treated as a business instead of a person. Defaults to ``null``.

``facebook``
   *optional* **string**. Facebook ID or username of the customer or representative of the
   business Defaults to ``null``.

``twitter``
   *optional* **string**. Twitter ID or username of the customer or representative of the business Defaults to ``null``.


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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HOFx0bMGZ3X4qRSATeSJ3/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {}, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CU4HOFx0bMGZ3X4qRSATeSJ3", 
     "credits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HOFx0bMGZ3X4qRSATeSJ3/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HOFx0bMGZ3X4qRSATeSJ3/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HOFx0bMGZ3X4qRSATeSJ3/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-06T18:48:55.628485Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4HOFx0bMGZ3X4qRSATeSJ3", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HOFx0bMGZ3X4qRSATeSJ3/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HOFx0bMGZ3X4qRSATeSJ3/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP4F99ERJk2SZGw3p9Is2GUp/accounts/CU4HOFx0bMGZ3X4qRSATeSJ3/transactions", 
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



