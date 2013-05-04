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
   ``default``
      *optional* **string**. Defaults to ``null``.

   ``line1``
      *optional* **string**. Street address of the person or business. Defaults to ``null``.

   ``line2``
      *optional* **string**. Second line of the address for the person or business. Defaults to ``null``.

   ``city``
      *optional* **string**. City of the person or business. Defaults to ``null``.

   ``state``
      *optional* **string**. State of the person or business. Defaults to ``null``.

   ``postal_code``
      *optional* **string**. Postal code/zip code of the person or business. Defaults to ``null``.

   ``country_code``
      *optional* **string**. Two character country code. Defaults to ``US``.


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
       "id": null, 
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
           "country_code": "USA"
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/bank_accounts", 
     "phone": "+9045551796", 
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
       "country_code": "USA"
     }, 
     "source_uri": null, 
     "business_name": "Balanced", 
     "id": "CU6ib21Ucr7KjUhJbpUOaie5", 
     "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-05-04T01:13:19.880484Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU6ib21Ucr7KjUhJbpUOaie5", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/bank_accounts", 
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
     "id": "CU6ivKBhIx6sGx776vPLLtVD", 
     "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-04T01:13:20.177554Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU6ivKBhIx6sGx776vPLLtVD", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/transactions", 
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
         "id": "CU6iRR7yMKy2OCUti5tKTvFf", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6iRR7yMKy2OCUti5tKTvFf/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6iRR7yMKy2OCUti5tKTvFf/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6iRR7yMKy2OCUti5tKTvFf/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6iRR7yMKy2OCUti5tKTvFf/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-04T01:13:20.494541Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU6iRR7yMKy2OCUti5tKTvFf", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6iRR7yMKy2OCUti5tKTvFf/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6iRR7yMKy2OCUti5tKTvFf/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6iRR7yMKy2OCUti5tKTvFf/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "CU6ivKBhIx6sGx776vPLLtVD", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-04T01:13:20.177554Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU6ivKBhIx6sGx776vPLLtVD", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ivKBhIx6sGx776vPLLtVD/transactions", 
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
         "id": "CU6ib21Ucr7KjUhJbpUOaie5", 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/bank_accounts", 
         "phone": "+9045551796", 
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
           "country_code": "USA", 
           "line1": "965 Mission St"
         }, 
         "destination_uri": null, 
         "business_name": "Balanced", 
         "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/holds", 
         "name": "John Lee Hooker", 
         "dob": null, 
         "created_at": "2013-05-04T01:13:19.880484Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU6ib21Ucr7KjUhJbpUOaie5", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6ib21Ucr7KjUhJbpUOaie5/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "123456789"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6huNyQF4uTZfS9gOLT9TeV", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6huNyQF4uTZfS9gOLT9TeV/cards/CC6hrSUMJlU0jsdM0vcPf2lH", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6huNyQF4uTZfS9gOLT9TeV/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6huNyQF4uTZfS9gOLT9TeV/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6huNyQF4uTZfS9gOLT9TeV/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6huNyQF4uTZfS9gOLT9TeV/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-04T01:13:19.273729Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6huNyQF4uTZfS9gOLT9TeV", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6huNyQF4uTZfS9gOLT9TeV/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6huNyQF4uTZfS9gOLT9TeV/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6huNyQF4uTZfS9gOLT9TeV/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6hfvdXA8vOmvg9PP3lcDjX", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfvdXA8vOmvg9PP3lcDjX/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfvdXA8vOmvg9PP3lcDjX/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfvdXA8vOmvg9PP3lcDjX/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfvdXA8vOmvg9PP3lcDjX/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-04T01:13:19.054475Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6hfvdXA8vOmvg9PP3lcDjX", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfvdXA8vOmvg9PP3lcDjX/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfvdXA8vOmvg9PP3lcDjX/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfvdXA8vOmvg9PP3lcDjX/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6hfsqPbf2FPwFpckmeixpv", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfsqPbf2FPwFpckmeixpv/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfsqPbf2FPwFpckmeixpv/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfsqPbf2FPwFpckmeixpv/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfsqPbf2FPwFpckmeixpv/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-04T01:13:19.053831Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6hfsqPbf2FPwFpckmeixpv", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfsqPbf2FPwFpckmeixpv/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfsqPbf2FPwFpckmeixpv/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6hfsqPbf2FPwFpckmeixpv/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6h8drMc1m3W2DJMyHvvxM5", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/bank_accounts/BA6hfz3ZvWLNq4EMBHsTtvuV", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/bank_accounts/BA6hfz3ZvWLNq4EMBHsTtvuV", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-04T01:13:18.949895Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6h8drMc1m3W2DJMyHvvxM5", 
         "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/AC6h8drMc1m3W2DJMyHvvxM5/transactions", 
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
     "total": 7, 
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
   ``default``
      *optional* **string**. Defaults to ``null``.

   ``line1``
      *optional* **string**. Street address of the person or business. Defaults to ``null``.

   ``line2``
      *optional* **string**. Second line of the address for the person or business. Defaults to ``null``.

   ``city``
      *optional* **string**. City of the person or business. Defaults to ``null``.

   ``state``
      *optional* **string**. State of the person or business. Defaults to ``null``.

   ``postal_code``
      *optional* **string**. Postal code/zip code of the person or business. Defaults to ``null``.

   ``country_code``
      *optional* **string**. Two character country code. Defaults to ``US``.


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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6jhx7YX6W9KZSGbi3lCfu1/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {
       "country_code": "US"
     }, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CU6jhx7YX6W9KZSGbi3lCfu1", 
     "credits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6jhx7YX6W9KZSGbi3lCfu1/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6jhx7YX6W9KZSGbi3lCfu1/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6jhx7YX6W9KZSGbi3lCfu1/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-04T01:13:20.862775Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU6jhx7YX6W9KZSGbi3lCfu1", 
     "refunds_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6jhx7YX6W9KZSGbi3lCfu1/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6jhx7YX6W9KZSGbi3lCfu1/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP6h7ZCdKyh5EvcJQPLsevzr/accounts/CU6jhx7YX6W9KZSGbi3lCfu1/transactions", 
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



