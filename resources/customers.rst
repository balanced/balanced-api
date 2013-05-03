Customers
=========

- `Create a Customer`_
- `Retrieve a Customer`_
- `List all Customers`_
- `Update a Customer`_

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

``facebook_id``
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
   **key-value**. A single-level dictionary of string-type key/value pairs.

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

``twitter_id``
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
      *optional* **string**. Two character country code. Defaults to ``USA``.


``phone``
   *optional* **string**. Phone number of the person or business. Defaults to ``null``.

``dob``
   *optional* **string**. Date of birth of the customer or representative of the business.
   Format is YYYY-MM e.g. "1980-05" Defaults to ``null``.

``ein``
   *optional* **string**. Employee Identification Number of the business if the customer is a
   business. If there is a business name and EIN present, the customer will
   be treated as a business instead of a person. Defaults to ``null``.

``facebook_id``
   *optional* **string**. Facebook ID or username of the customer or representative of the
   business Defaults to ``null``.

``twitter_id``
   *optional* **string**. Twitter ID or username of the customer or representative of the business Defaults to ``null``.


Body
^^^^

.. code:: javascript

   {
       "meta": {
           "meta can store": "any flat key/value data you like", 
           "more_additional_data": 54.8
       }, 
       "id": null, 
       "address": {
           "city": "San Francisco", 
           "state": "CA", 
           "postal_code": "94103", 
           "line1": "965 Mission St", 
           "country_code": "USA"
       }, 
       "email": "user@example.org"
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
     "source_uri": null, 
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "address": {
       "city": "San Francisco", 
       "state": "CA", 
       "postal_code": "94103", 
       "line1": "965 Mission St", 
       "country_code": "USA"
     }, 
     "destination_uri": null, 
     "business_name": null, 
     "id": "CU4zOIjfDQAU0m43ACsyZmrD", 
     "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T22:41:25.883942Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4zOIjfDQAU0m43ACsyZmrD", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/transactions", 
     "ssn_last4": null, 
     "email": "user@example.org", 
     "ein": null
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
     "source_uri": null, 
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/bank_accounts", 
     "phone": null, 
     "meta": {}, 
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
     "id": "CU4A9eqVSn8sirHwRyvFPx6N", 
     "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T22:41:26.177863Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4A9eqVSn8sirHwRyvFPx6N", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/transactions", 
     "ssn_last4": null, 
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
         "uri": "/v1/customers/CU4AvAvXruxSKeGxXkQLZGaB", 
         "meta": {}, 
         "id": "CU4AvAvXruxSKeGxXkQLZGaB", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AvAvXruxSKeGxXkQLZGaB/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AvAvXruxSKeGxXkQLZGaB/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AvAvXruxSKeGxXkQLZGaB/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AvAvXruxSKeGxXkQLZGaB/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:41:26.498466Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AvAvXruxSKeGxXkQLZGaB/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AvAvXruxSKeGxXkQLZGaB/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AvAvXruxSKeGxXkQLZGaB/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU4A9eqVSn8sirHwRyvFPx6N", 
         "meta": {}, 
         "id": "CU4A9eqVSn8sirHwRyvFPx6N", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:41:26.177863Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4A9eqVSn8sirHwRyvFPx6N/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU4zOIjfDQAU0m43ACsyZmrD", 
         "meta": {}, 
         "id": "CU4zOIjfDQAU0m43ACsyZmrD", 
         "facebook_id": null, 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/bank_accounts", 
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
         "address": {
           "city": "San Francisco", 
           "state": "CA", 
           "postal_code": "94103", 
           "country_code": "USA", 
           "line1": "965 Mission St"
         }, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:41:25.883942Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4zOIjfDQAU0m43ACsyZmrD/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4z5MehGdqwdkU0ZXWMrWOl", 
         "meta": {}, 
         "id": "AC4z5MehGdqwdkU0ZXWMrWOl", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4z5MehGdqwdkU0ZXWMrWOl/cards/CC4z1XGPwDNABSSjK6zZ0tsl", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4z5MehGdqwdkU0ZXWMrWOl/bank_accounts", 
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
         "address": {}, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4z5MehGdqwdkU0ZXWMrWOl/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4z5MehGdqwdkU0ZXWMrWOl/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4z5MehGdqwdkU0ZXWMrWOl/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T22:41:25.238268Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4z5MehGdqwdkU0ZXWMrWOl/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4z5MehGdqwdkU0ZXWMrWOl/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4z5MehGdqwdkU0ZXWMrWOl/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4yO8zzfJyceZg27SilsxTX", 
         "meta": {}, 
         "id": "AC4yO8zzfJyceZg27SilsxTX", 
         "facebook_id": null, 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO8zzfJyceZg27SilsxTX/bank_accounts", 
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
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO8zzfJyceZg27SilsxTX/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO8zzfJyceZg27SilsxTX/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO8zzfJyceZg27SilsxTX/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:41:24.985239Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO8zzfJyceZg27SilsxTX/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO8zzfJyceZg27SilsxTX/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO8zzfJyceZg27SilsxTX/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4yO2FFUWzB9geSe08zwjYZ", 
         "meta": {}, 
         "id": "AC4yO2FFUWzB9geSe08zwjYZ", 
         "facebook_id": null, 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO2FFUWzB9geSe08zwjYZ/bank_accounts", 
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
         "address": null, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO2FFUWzB9geSe08zwjYZ/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO2FFUWzB9geSe08zwjYZ/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO2FFUWzB9geSe08zwjYZ/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:41:24.984018Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO2FFUWzB9geSe08zwjYZ/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO2FFUWzB9geSe08zwjYZ/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yO2FFUWzB9geSe08zwjYZ/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4yGqepBoeMij0yyPXh4suZ", 
         "meta": {}, 
         "id": "AC4yGqepBoeMij0yyPXh4suZ", 
         "facebook_id": null, 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/bank_accounts/BA4yOfoU6qsfjy4T7mkYymUF", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/bank_accounts/BA4yOfoU6qsfjy4T7mkYymUF", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T22:41:24.875127Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/AC4yGqepBoeMij0yyPXh4suZ/transactions", 
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
      *optional* **string**. Two character country code. Defaults to ``USA``.


``phone``
   *optional* **string**. Phone number of the person or business. Defaults to ``null``.

``dob``
   *optional* **string**. Date of birth of the customer or representative of the business.
   Format is YYYY-MM e.g. "1980-05" Defaults to ``null``.

``ein``
   *optional* **string**. Employee Identification Number of the business if the customer is a
   business. If there is a business name and EIN present, the customer will
   be treated as a business instead of a person. Defaults to ``null``.

``facebook_id``
   *optional* **string**. Facebook ID or username of the customer or representative of the
   business Defaults to ``null``.

``twitter_id``
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
     "source_uri": null, 
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AVx62EJV1cUwlkOl4oP4t/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "address": {
       "country_code": "USA"
     }, 
     "destination_uri": null, 
     "business_name": null, 
     "id": "CU4AVx62EJV1cUwlkOl4oP4t", 
     "credits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AVx62EJV1cUwlkOl4oP4t/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AVx62EJV1cUwlkOl4oP4t/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AVx62EJV1cUwlkOl4oP4t/holds", 
     "name": "Richie McCaw", 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T22:41:26.870549Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4AVx62EJV1cUwlkOl4oP4t", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AVx62EJV1cUwlkOl4oP4t/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AVx62EJV1cUwlkOl4oP4t/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP4yG5au4e2hZv8FqpSztOzT/accounts/CU4AVx62EJV1cUwlkOl4oP4t/transactions", 
     "ssn_last4": null, 
     "email": null, 
     "ein": null
   }

