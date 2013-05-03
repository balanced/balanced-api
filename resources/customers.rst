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

``email_address``
   **string**.

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

``phone_number``
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

``email_address``
   *optional* **string** or **null**. Email address of the customer. Defaults to ``null``.

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


``phone_number``
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
       "email_address": "user@example.org", 
       "id": null, 
       "address": {
           "city": "San Francisco", 
           "state": "CA", 
           "postal_code": "94103", 
           "line1": "965 Mission St", 
           "country_code": "USA"
       }
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
     "phone_number": null, 
     "_type": "customer", 
     "source_uri": null, 
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/bank_accounts", 
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
     "email_address": "user@example.org", 
     "id": "CU4zsT0ESD6qLLjLcSb6bShz", 
     "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T19:49:37.649169Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4zsT0ESD6qLLjLcSb6bShz", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/transactions", 
     "ssn_last4": null, 
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
     "phone_number": null, 
     "_type": "customer", 
     "source_uri": null, 
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/bank_accounts", 
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
     "email_address": null, 
     "id": "CU4zNoQHz5nkm6kYHQqSpdpD", 
     "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T19:49:37.943282Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4zNoQHz5nkm6kYHQqSpdpD", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/transactions", 
     "ssn_last4": null, 
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
         "uri": "/v1/customers/CU4A9mqDVZNZtiYmosgY5FVT", 
         "meta": {}, 
         "email_address": null, 
         "id": "CU4A9mqDVZNZtiYmosgY5FVT", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4A9mqDVZNZtiYmosgY5FVT/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4A9mqDVZNZtiYmosgY5FVT/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4A9mqDVZNZtiYmosgY5FVT/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4A9mqDVZNZtiYmosgY5FVT/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T19:49:38.258224Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4A9mqDVZNZtiYmosgY5FVT/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4A9mqDVZNZtiYmosgY5FVT/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4A9mqDVZNZtiYmosgY5FVT/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU4zNoQHz5nkm6kYHQqSpdpD", 
         "meta": {}, 
         "email_address": null, 
         "id": "CU4zNoQHz5nkm6kYHQqSpdpD", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T19:49:37.943282Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zNoQHz5nkm6kYHQqSpdpD/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU4zsT0ESD6qLLjLcSb6bShz", 
         "meta": {}, 
         "email_address": "user@example.org", 
         "id": "CU4zsT0ESD6qLLjLcSb6bShz", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T19:49:37.649169Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4zsT0ESD6qLLjLcSb6bShz/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4yOVt8OmUE8gZEHe5l3XvX", 
         "meta": {}, 
         "email_address": null, 
         "id": "AC4yOVt8OmUE8gZEHe5l3XvX", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yOVt8OmUE8gZEHe5l3XvX/cards/CC4yLWQrt7zMgPNBewxhSoUh", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yOVt8OmUE8gZEHe5l3XvX/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yOVt8OmUE8gZEHe5l3XvX/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yOVt8OmUE8gZEHe5l3XvX/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yOVt8OmUE8gZEHe5l3XvX/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T19:49:37.075074Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yOVt8OmUE8gZEHe5l3XvX/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yOVt8OmUE8gZEHe5l3XvX/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yOVt8OmUE8gZEHe5l3XvX/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4yA8BTtXN5yPHV9EnHmoSJ", 
         "meta": {}, 
         "email_address": "fee@poundpay.com", 
         "id": "AC4yA8BTtXN5yPHV9EnHmoSJ", 
         "facebook_id": null, 
         "phone_number": "+16505551212", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA8BTtXN5yPHV9EnHmoSJ/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA8BTtXN5yPHV9EnHmoSJ/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA8BTtXN5yPHV9EnHmoSJ/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA8BTtXN5yPHV9EnHmoSJ/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T19:49:36.862971Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA8BTtXN5yPHV9EnHmoSJ/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA8BTtXN5yPHV9EnHmoSJ/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA8BTtXN5yPHV9EnHmoSJ/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4yA5Ayg4sLUKSRLvT8v9lv", 
         "meta": {}, 
         "email_address": "escrow@poundpay.com", 
         "id": "AC4yA5Ayg4sLUKSRLvT8v9lv", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA5Ayg4sLUKSRLvT8v9lv/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA5Ayg4sLUKSRLvT8v9lv/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA5Ayg4sLUKSRLvT8v9lv/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA5Ayg4sLUKSRLvT8v9lv/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T19:49:36.862389Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA5Ayg4sLUKSRLvT8v9lv/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA5Ayg4sLUKSRLvT8v9lv/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yA5Ayg4sLUKSRLvT8v9lv/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4yt2LKDD8IstgHxXcfcQFP", 
         "meta": {}, 
         "email_address": "whc@example.org", 
         "id": "AC4yt2LKDD8IstgHxXcfcQFP", 
         "facebook_id": null, 
         "phone_number": "+16505551212", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/bank_accounts/BA4yActILqCGSew3ytruSqQN", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/bank_accounts/BA4yActILqCGSew3ytruSqQN", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T19:49:36.761209Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/AC4yt2LKDD8IstgHxXcfcQFP/transactions", 
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

``email_address``
   *optional* **string** or **null**. Email address of the customer. Defaults to ``null``.

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


``phone_number``
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
     "phone_number": null, 
     "_type": "customer", 
     "source_uri": null, 
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4Az2hS3LFFUXrK5LIzVHXz/bank_accounts", 
     "meta": {}, 
     "address": {
       "country_code": "USA"
     }, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": "richie@allblacks.com", 
     "id": "CU4Az2hS3LFFUXrK5LIzVHXz", 
     "credits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4Az2hS3LFFUXrK5LIzVHXz/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4Az2hS3LFFUXrK5LIzVHXz/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4Az2hS3LFFUXrK5LIzVHXz/holds", 
     "name": "Richie McCaw", 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T19:49:38.626414Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4Az2hS3LFFUXrK5LIzVHXz", 
     "refunds_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4Az2hS3LFFUXrK5LIzVHXz/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4Az2hS3LFFUXrK5LIzVHXz/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP4ysPeLUCiEeJtSd0X8rTrj/accounts/CU4Az2hS3LFFUXrK5LIzVHXz/transactions", 
     "ssn_last4": null, 
     "ein": null
   }

