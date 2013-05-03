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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/bank_accounts", 
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
     "id": "CU7ofSHYPJgg9vdoULqYDeZX", 
     "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T21:53:54.500924Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU7ofSHYPJgg9vdoULqYDeZX", 
     "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/bank_accounts", 
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
     "id": "CU7oAtUV1cLkqN6k4BBMRVi9", 
     "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T21:53:54.796208Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU7oAtUV1cLkqN6k4BBMRVi9", 
     "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/transactions", 
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
         "uri": "/v1/customers/CU7oWhWZZljagAbcYKsoqntL", 
         "meta": {}, 
         "id": "CU7oWhWZZljagAbcYKsoqntL", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oWhWZZljagAbcYKsoqntL/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oWhWZZljagAbcYKsoqntL/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oWhWZZljagAbcYKsoqntL/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oWhWZZljagAbcYKsoqntL/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T21:53:55.108979Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oWhWZZljagAbcYKsoqntL/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oWhWZZljagAbcYKsoqntL/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oWhWZZljagAbcYKsoqntL/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU7oAtUV1cLkqN6k4BBMRVi9", 
         "meta": {}, 
         "id": "CU7oAtUV1cLkqN6k4BBMRVi9", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T21:53:54.796208Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7oAtUV1cLkqN6k4BBMRVi9/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU7ofSHYPJgg9vdoULqYDeZX", 
         "meta": {}, 
         "id": "CU7ofSHYPJgg9vdoULqYDeZX", 
         "facebook_id": null, 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T21:53:54.500924Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7ofSHYPJgg9vdoULqYDeZX/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC7nxR1hDAPcBtnVf2JddsRP", 
         "meta": {}, 
         "id": "AC7nxR1hDAPcBtnVf2JddsRP", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nxR1hDAPcBtnVf2JddsRP/cards/CC7nuRGTlLF5h3K4VPhyHaBX", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nxR1hDAPcBtnVf2JddsRP/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nxR1hDAPcBtnVf2JddsRP/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nxR1hDAPcBtnVf2JddsRP/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nxR1hDAPcBtnVf2JddsRP/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T21:53:53.868476Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nxR1hDAPcBtnVf2JddsRP/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nxR1hDAPcBtnVf2JddsRP/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nxR1hDAPcBtnVf2JddsRP/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC7niMeK2GX70m0HD9yVhiTv", 
         "meta": {}, 
         "id": "AC7niMeK2GX70m0HD9yVhiTv", 
         "facebook_id": null, 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niMeK2GX70m0HD9yVhiTv/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niMeK2GX70m0HD9yVhiTv/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niMeK2GX70m0HD9yVhiTv/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niMeK2GX70m0HD9yVhiTv/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T21:53:53.652199Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niMeK2GX70m0HD9yVhiTv/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niMeK2GX70m0HD9yVhiTv/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niMeK2GX70m0HD9yVhiTv/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC7niJ5Q9CWeclJsjpkpAm0V", 
         "meta": {}, 
         "id": "AC7niJ5Q9CWeclJsjpkpAm0V", 
         "facebook_id": null, 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niJ5Q9CWeclJsjpkpAm0V/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niJ5Q9CWeclJsjpkpAm0V/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niJ5Q9CWeclJsjpkpAm0V/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niJ5Q9CWeclJsjpkpAm0V/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T21:53:53.651597Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niJ5Q9CWeclJsjpkpAm0V/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niJ5Q9CWeclJsjpkpAm0V/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7niJ5Q9CWeclJsjpkpAm0V/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC7nbDzNL0xrSKPUKBsImzkd", 
         "meta": {}, 
         "id": "AC7nbDzNL0xrSKPUKBsImzkd", 
         "facebook_id": null, 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/bank_accounts/BA7niPBgbSMJyBAaoWVy2UAV", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/bank_accounts/BA7niPBgbSMJyBAaoWVy2UAV", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T21:53:53.549902Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/AC7nbDzNL0xrSKPUKBsImzkd/transactions", 
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
     "_type": "customer", 
     "source_uri": null, 
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7pmdIrOKFdCCAZCwqWMdd7/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "address": {
       "country_code": "USA"
     }, 
     "destination_uri": null, 
     "business_name": null, 
     "id": "CU7pmdIrOKFdCCAZCwqWMdd7", 
     "credits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7pmdIrOKFdCCAZCwqWMdd7/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7pmdIrOKFdCCAZCwqWMdd7/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7pmdIrOKFdCCAZCwqWMdd7/holds", 
     "name": "Richie McCaw", 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T21:53:55.480797Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU7pmdIrOKFdCCAZCwqWMdd7", 
     "refunds_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7pmdIrOKFdCCAZCwqWMdd7/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7pmdIrOKFdCCAZCwqWMdd7/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP7nboyjIgSXuMmjt52mAWHL/accounts/CU7pmdIrOKFdCCAZCwqWMdd7/transactions", 
     "ssn_last4": null, 
     "email": "richie@allblacks.com", 
     "ein": null
   }

