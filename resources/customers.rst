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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/bank_accounts", 
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
     "id": "CUg7siu807XnbQS2E8Slf9v", 
     "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-05-03T23:13:15.355572Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUg7siu807XnbQS2E8Slf9v", 
     "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/bank_accounts", 
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
     "id": "CUgs71lNzDpVmeYeUlcr7R7", 
     "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-03T23:13:15.651529Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUgs71lNzDpVmeYeUlcr7R7", 
     "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/transactions", 
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
         "id": "CUgOoBzDCHwwYcJBwFR1BND", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgOoBzDCHwwYcJBwFR1BND/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgOoBzDCHwwYcJBwFR1BND/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgOoBzDCHwwYcJBwFR1BND/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgOoBzDCHwwYcJBwFR1BND/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T23:13:15.971214Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CUgOoBzDCHwwYcJBwFR1BND", 
         "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgOoBzDCHwwYcJBwFR1BND/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgOoBzDCHwwYcJBwFR1BND/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgOoBzDCHwwYcJBwFR1BND/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "CUgs71lNzDpVmeYeUlcr7R7", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T23:13:15.651529Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CUgs71lNzDpVmeYeUlcr7R7", 
         "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUgs71lNzDpVmeYeUlcr7R7/transactions", 
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
         "id": "CUg7siu807XnbQS2E8Slf9v", 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/holds", 
         "name": "John Lee Hooker", 
         "dob": null, 
         "created_at": "2013-05-03T23:13:15.355572Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CUg7siu807XnbQS2E8Slf9v", 
         "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUg7siu807XnbQS2E8Slf9v/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "123456789"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "ACfoqOLZCfckwDu8282Vo8p", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACfoqOLZCfckwDu8282Vo8p/cards/CCfkHLKlc4IqlphSnXzx173", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACfoqOLZCfckwDu8282Vo8p/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACfoqOLZCfckwDu8282Vo8p/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACfoqOLZCfckwDu8282Vo8p/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACfoqOLZCfckwDu8282Vo8p/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T23:13:14.708683Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/ACfoqOLZCfckwDu8282Vo8p", 
         "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACfoqOLZCfckwDu8282Vo8p/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACfoqOLZCfckwDu8282Vo8p/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACfoqOLZCfckwDu8282Vo8p/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "ACf6SPcQ8mrh3f6be0R7zvr", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6SPcQ8mrh3f6be0R7zvr/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6SPcQ8mrh3f6be0R7zvr/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6SPcQ8mrh3f6be0R7zvr/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6SPcQ8mrh3f6be0R7zvr/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T23:13:14.456943Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/ACf6SPcQ8mrh3f6be0R7zvr", 
         "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6SPcQ8mrh3f6be0R7zvr/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6SPcQ8mrh3f6be0R7zvr/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6SPcQ8mrh3f6be0R7zvr/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "ACf6PHHn84MqsVXGQmVA1eF", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6PHHn84MqsVXGQmVA1eF/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6PHHn84MqsVXGQmVA1eF/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6PHHn84MqsVXGQmVA1eF/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6PHHn84MqsVXGQmVA1eF/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T23:13:14.456327Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/ACf6PHHn84MqsVXGQmVA1eF", 
         "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6PHHn84MqsVXGQmVA1eF/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6PHHn84MqsVXGQmVA1eF/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACf6PHHn84MqsVXGQmVA1eF/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "ACeZnU8NCBQdoQkevHecHE5", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/bank_accounts/BAf6Zmyxf41EuCabrG7x1MR", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/bank_accounts/BAf6Zmyxf41EuCabrG7x1MR", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T23:13:14.349944Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/ACeZnU8NCBQdoQkevHecHE5", 
         "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/ACeZnU8NCBQdoQkevHecHE5/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUheeoRSWwqsubLc4cm6HN7/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {
       "country_code": "US"
     }, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CUheeoRSWwqsubLc4cm6HN7", 
     "credits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUheeoRSWwqsubLc4cm6HN7/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUheeoRSWwqsubLc4cm6HN7/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUheeoRSWwqsubLc4cm6HN7/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-03T23:13:16.341541Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUheeoRSWwqsubLc4cm6HN7", 
     "refunds_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUheeoRSWwqsubLc4cm6HN7/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUheeoRSWwqsubLc4cm6HN7/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MPeZ4MfnRStg4PwYLGYnFkZ/accounts/CUheeoRSWwqsubLc4cm6HN7/transactions", 
     "destination_uri": null, 
     "email": null, 
     "ein": null
   }

