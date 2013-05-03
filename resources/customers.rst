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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/bank_accounts", 
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
     "id": "CU54Nro19OWfnFGI9atq3DA5", 
     "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-05-03T23:46:18.898323Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU54Nro19OWfnFGI9atq3DA5", 
     "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/bank_accounts", 
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
     "id": "CU558oZ9l38nFbvRmotrb6il", 
     "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-03T23:46:19.198905Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU558oZ9l38nFbvRmotrb6il", 
     "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/transactions", 
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
         "id": "CU55uZs2ClJyijYX4ZQ8kHwR", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55uZs2ClJyijYX4ZQ8kHwR/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55uZs2ClJyijYX4ZQ8kHwR/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55uZs2ClJyijYX4ZQ8kHwR/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55uZs2ClJyijYX4ZQ8kHwR/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T23:46:19.522853Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU55uZs2ClJyijYX4ZQ8kHwR", 
         "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55uZs2ClJyijYX4ZQ8kHwR/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55uZs2ClJyijYX4ZQ8kHwR/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55uZs2ClJyijYX4ZQ8kHwR/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "CU558oZ9l38nFbvRmotrb6il", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T23:46:19.198905Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU558oZ9l38nFbvRmotrb6il", 
         "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU558oZ9l38nFbvRmotrb6il/transactions", 
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
         "id": "CU54Nro19OWfnFGI9atq3DA5", 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/holds", 
         "name": "John Lee Hooker", 
         "dob": null, 
         "created_at": "2013-05-03T23:46:18.898323Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/CU54Nro19OWfnFGI9atq3DA5", 
         "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU54Nro19OWfnFGI9atq3DA5/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "123456789"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC549Ei3YETI3vgL2Yxe87Qd", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC549Ei3YETI3vgL2Yxe87Qd/cards/CC546sTNRtYIIfpgIOwY67gR", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC549Ei3YETI3vgL2Yxe87Qd/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC549Ei3YETI3vgL2Yxe87Qd/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC549Ei3YETI3vgL2Yxe87Qd/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC549Ei3YETI3vgL2Yxe87Qd/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T23:46:18.326691Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC549Ei3YETI3vgL2Yxe87Qd", 
         "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC549Ei3YETI3vgL2Yxe87Qd/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC549Ei3YETI3vgL2Yxe87Qd/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC549Ei3YETI3vgL2Yxe87Qd/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC53UCRd0IIagxyHXDEGwYqB", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UCRd0IIagxyHXDEGwYqB/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UCRd0IIagxyHXDEGwYqB/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UCRd0IIagxyHXDEGwYqB/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UCRd0IIagxyHXDEGwYqB/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T23:46:18.111195Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC53UCRd0IIagxyHXDEGwYqB", 
         "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UCRd0IIagxyHXDEGwYqB/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UCRd0IIagxyHXDEGwYqB/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UCRd0IIagxyHXDEGwYqB/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC53UzNdfUcRt5SZSmf6zSHn", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UzNdfUcRt5SZSmf6zSHn/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UzNdfUcRt5SZSmf6zSHn/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UzNdfUcRt5SZSmf6zSHn/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UzNdfUcRt5SZSmf6zSHn/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T23:46:18.110591Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC53UzNdfUcRt5SZSmf6zSHn", 
         "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UzNdfUcRt5SZSmf6zSHn/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UzNdfUcRt5SZSmf6zSHn/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53UzNdfUcRt5SZSmf6zSHn/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC53Nyo5O3ywD2IjOgEBFD2x", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/bank_accounts/BA53UI2TPbbWZ2DVUke3HMPf", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/bank_accounts/BA53UI2TPbbWZ2DVUke3HMPf", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T23:46:18.009763Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC53Nyo5O3ywD2IjOgEBFD2x", 
         "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/AC53Nyo5O3ywD2IjOgEBFD2x/transactions", 
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

You can delete a customer so long as there has been no activity associated with it such as adding a card or creating a debit. 

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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55V0hEg5l7mxXhCV51hMqd/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {
       "country_code": "US"
     }, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CU55V0hEg5l7mxXhCV51hMqd", 
     "credits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55V0hEg5l7mxXhCV51hMqd/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55V0hEg5l7mxXhCV51hMqd/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55V0hEg5l7mxXhCV51hMqd/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-05-03T23:46:19.895865Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU55V0hEg5l7mxXhCV51hMqd", 
     "refunds_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55V0hEg5l7mxXhCV51hMqd/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55V0hEg5l7mxXhCV51hMqd/debits", 
     "transactions_uri": "/v1/marketplaces/TEST-MP53NmuB92oXQohG8vS8UJwd/accounts/CU55V0hEg5l7mxXhCV51hMqd/transactions", 
     "destination_uri": null, 
     "email": null, 
     "ein": null
   }

Delete a Customer
-----------------

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



