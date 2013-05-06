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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/bank_accounts", 
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
     "id": "CU75sp5yGSxBGHksti1E7j3j", 
     "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-05-06T17:18:03.439563Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU75sp5yGSxBGHksti1E7j3j", 
     "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/bank_accounts", 
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
     "id": "CU75MJmNITWYDR8nm33mYyAx", 
     "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-06T17:18:03.731064Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU75MJmNITWYDR8nm33mYyAx", 
     "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/transactions", 
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
         "id": "CU768BuagopoCrU0falz4CpH", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU768BuagopoCrU0falz4CpH/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU768BuagopoCrU0falz4CpH/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU768BuagopoCrU0falz4CpH/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU768BuagopoCrU0falz4CpH/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-06T17:18:04.044735Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU768BuagopoCrU0falz4CpH", 
         "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU768BuagopoCrU0falz4CpH/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU768BuagopoCrU0falz4CpH/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU768BuagopoCrU0falz4CpH/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "CU75MJmNITWYDR8nm33mYyAx", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-06T17:18:03.731064Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU75MJmNITWYDR8nm33mYyAx", 
         "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75MJmNITWYDR8nm33mYyAx/transactions", 
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
         "id": "CU75sp5yGSxBGHksti1E7j3j", 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/holds", 
         "name": "John Lee Hooker", 
         "dob": null, 
         "created_at": "2013-05-06T17:18:03.439563Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU75sp5yGSxBGHksti1E7j3j", 
         "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75sp5yGSxBGHksti1E7j3j/transactions", 
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
         "id": "CU75beT5vAN8OukrF9bw61Bn", 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75beT5vAN8OukrF9bw61Bn/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75beT5vAN8OukrF9bw61Bn/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75beT5vAN8OukrF9bw61Bn/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75beT5vAN8OukrF9bw61Bn/holds", 
         "name": "John Lee Hooker", 
         "dob": null, 
         "created_at": "2013-05-06T17:18:03.193394Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU75beT5vAN8OukrF9bw61Bn", 
         "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75beT5vAN8OukrF9bw61Bn/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75beT5vAN8OukrF9bw61Bn/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU75beT5vAN8OukrF9bw61Bn/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "123456789"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC74w68Qf4ZnVTsMihAoqz17", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74w68Qf4ZnVTsMihAoqz17/cards/CC74sZM5pj8V9sM56NpFndp7", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74w68Qf4ZnVTsMihAoqz17/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74w68Qf4ZnVTsMihAoqz17/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74w68Qf4ZnVTsMihAoqz17/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74w68Qf4ZnVTsMihAoqz17/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-06T17:18:02.602476Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC74w68Qf4ZnVTsMihAoqz17", 
         "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74w68Qf4ZnVTsMihAoqz17/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74w68Qf4ZnVTsMihAoqz17/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74w68Qf4ZnVTsMihAoqz17/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC74h1zsEDb3tT28nPIihp29", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74h1zsEDb3tT28nPIihp29/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74h1zsEDb3tT28nPIihp29/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74h1zsEDb3tT28nPIihp29/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74h1zsEDb3tT28nPIihp29/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-06T17:18:02.386336Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC74h1zsEDb3tT28nPIihp29", 
         "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74h1zsEDb3tT28nPIihp29/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74h1zsEDb3tT28nPIihp29/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74h1zsEDb3tT28nPIihp29/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC74gTtDFW7IhLIC7gEOMaFb", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74gTtDFW7IhLIC7gEOMaFb/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74gTtDFW7IhLIC7gEOMaFb/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74gTtDFW7IhLIC7gEOMaFb/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74gTtDFW7IhLIC7gEOMaFb/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-06T17:18:02.384546Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC74gTtDFW7IhLIC7gEOMaFb", 
         "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74gTtDFW7IhLIC7gEOMaFb/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74gTtDFW7IhLIC7gEOMaFb/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC74gTtDFW7IhLIC7gEOMaFb/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC749LgQpQRtRBWBHYDVzmfL", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/bank_accounts/BA74h8dpbu8FvBdKT3pr9FS1", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/bank_accounts/BA74h8dpbu8FvBdKT3pr9FS1", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-06T17:18:02.282115Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC749LgQpQRtRBWBHYDVzmfL", 
         "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/AC749LgQpQRtRBWBHYDVzmfL/transactions", 
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
   ``default``
      *optional* **string**. Defaults to ``null``.

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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU76CEiTIS7Zd5enDN79zkvn/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {}, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CU76CEiTIS7Zd5enDN79zkvn", 
     "credits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU76CEiTIS7Zd5enDN79zkvn/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU76CEiTIS7Zd5enDN79zkvn/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU76CEiTIS7Zd5enDN79zkvn/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-06T17:18:04.475601Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU76CEiTIS7Zd5enDN79zkvn", 
     "refunds_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU76CEiTIS7Zd5enDN79zkvn/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU76CEiTIS7Zd5enDN79zkvn/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP749yMwgoHCN7OAhPmgjbd7/accounts/CU76CEiTIS7Zd5enDN79zkvn/transactions", 
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



