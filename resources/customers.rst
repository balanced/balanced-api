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

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``address``

   .. cssclass:: nested1

   *optional* **object**.

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
     "bank_accounts_uri": "/v1/customers/CU4UALP4h1o5KTwj28zkIEU/bank_accounts", 
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
     "id": "CU4UALP4h1o5KTwj28zkIEU", 
     "credits_uri": "/v1/customers/CU4UALP4h1o5KTwj28zkIEU/credits", 
     "cards_uri": "/v1/customers/CU4UALP4h1o5KTwj28zkIEU/cards", 
     "holds_uri": "/v1/customers/CU4UALP4h1o5KTwj28zkIEU/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-06-05T02:31:21.752921Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4UALP4h1o5KTwj28zkIEU", 
     "refunds_uri": "/v1/customers/CU4UALP4h1o5KTwj28zkIEU/refunds", 
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
     "debits_uri": "/v1/customers/CU4UALP4h1o5KTwj28zkIEU/debits", 
     "transactions_uri": "/v1/customers/CU4UALP4h1o5KTwj28zkIEU/transactions", 
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
     "bank_accounts_uri": "/v1/customers/CU5SZBVyZXLjVn0rGh9DkWY/bank_accounts", 
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
     "id": "CU5SZBVyZXLjVn0rGh9DkWY", 
     "credits_uri": "/v1/customers/CU5SZBVyZXLjVn0rGh9DkWY/credits", 
     "cards_uri": "/v1/customers/CU5SZBVyZXLjVn0rGh9DkWY/cards", 
     "holds_uri": "/v1/customers/CU5SZBVyZXLjVn0rGh9DkWY/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-05T02:31:22.618258Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU5SZBVyZXLjVn0rGh9DkWY", 
     "refunds_uri": "/v1/customers/CU5SZBVyZXLjVn0rGh9DkWY/refunds", 
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
     "debits_uri": "/v1/customers/CU5SZBVyZXLjVn0rGh9DkWY/debits", 
     "transactions_uri": "/v1/customers/CU5SZBVyZXLjVn0rGh9DkWY/transactions", 
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
         "id": "AC6IIXuoA0UWUxduVgD5PmJg", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6IIXuoA0UWUxduVgD5PmJg/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6IIXuoA0UWUxduVgD5PmJg/credits", 
         "cards_uri": "/v1/customers/AC6IIXuoA0UWUxduVgD5PmJg/cards", 
         "holds_uri": "/v1/customers/AC6IIXuoA0UWUxduVgD5PmJg/holds", 
         "name": "William James", 
         "dob": null, 
         "created_at": "2013-06-05T02:30:18.407401Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6IIXuoA0UWUxduVgD5PmJg", 
         "refunds_uri": "/v1/customers/AC6IIXuoA0UWUxduVgD5PmJg/refunds", 
         "debits_uri": "/v1/customers/AC6IIXuoA0UWUxduVgD5PmJg/debits", 
         "transactions_uri": "/v1/customers/AC6IIXuoA0UWUxduVgD5PmJg/transactions", 
         "ssn_last4": null, 
         "ein": "393483992"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6GYfhsHiUt9sNvAxii2SsG", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG/credits", 
         "cards_uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG/cards", 
         "holds_uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-05T02:30:16.839761Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG", 
         "refunds_uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG/refunds", 
         "debits_uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG/debits", 
         "transactions_uri": "/v1/customers/AC6GYfhsHiUt9sNvAxii2SsG/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6FHYIFdjvhki3hF6ZqEkbm", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6FHYIFdjvhki3hF6ZqEkbm/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6FHYIFdjvhki3hF6ZqEkbm/credits", 
         "cards_uri": "/v1/customers/AC6FHYIFdjvhki3hF6ZqEkbm/cards", 
         "holds_uri": "/v1/customers/AC6FHYIFdjvhki3hF6ZqEkbm/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-05T02:30:15.717558Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6FHYIFdjvhki3hF6ZqEkbm", 
         "refunds_uri": "/v1/customers/AC6FHYIFdjvhki3hF6ZqEkbm/refunds", 
         "debits_uri": "/v1/customers/AC6FHYIFdjvhki3hF6ZqEkbm/debits", 
         "transactions_uri": "/v1/customers/AC6FHYIFdjvhki3hF6ZqEkbm/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6EhJMLs2MRhi96oKrenvtg", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg/cards/CC6E36x9QZTpza9miY98ZwLl", 
         "bank_accounts_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg/credits", 
         "cards_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg/cards", 
         "holds_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-05T02:30:14.451958Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg", 
         "refunds_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg/refunds", 
         "debits_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg/debits", 
         "transactions_uri": "/v1/customers/AC6EhJMLs2MRhi96oKrenvtg/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6Cqa5V3LtTgsLhwqk6BX4c", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c/cards/CC6CfiuaGQLFK8KCmkdN9sLK", 
         "bank_accounts_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c/credits", 
         "cards_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c/cards", 
         "holds_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-05T02:30:12.795445Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c", 
         "refunds_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c/refunds", 
         "debits_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c/debits", 
         "transactions_uri": "/v1/customers/AC6Cqa5V3LtTgsLhwqk6BX4c/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6zdJPkzqXpIxTgvxpYse4G", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards/CC7uYy1Z3UTZykFqReFNpvwb", 
         "bank_accounts_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/credits", 
         "cards_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/cards", 
         "holds_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-05T02:30:09.949061Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G", 
         "refunds_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/refunds", 
         "debits_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/debits", 
         "transactions_uri": "/v1/customers/AC6zdJPkzqXpIxTgvxpYse4G/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6xZWzXQuCRVCvRzV2E8wxN", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6xZWzXQuCRVCvRzV2E8wxN/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6xZWzXQuCRVCvRzV2E8wxN/credits", 
         "cards_uri": "/v1/customers/AC6xZWzXQuCRVCvRzV2E8wxN/cards", 
         "holds_uri": "/v1/customers/AC6xZWzXQuCRVCvRzV2E8wxN/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-05T02:30:08.864265Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6xZWzXQuCRVCvRzV2E8wxN", 
         "refunds_uri": "/v1/customers/AC6xZWzXQuCRVCvRzV2E8wxN/refunds", 
         "debits_uri": "/v1/customers/AC6xZWzXQuCRVCvRzV2E8wxN/debits", 
         "transactions_uri": "/v1/customers/AC6xZWzXQuCRVCvRzV2E8wxN/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6xYZFJYuW5g8XJPPuKOhCD", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC6xYZFJYuW5g8XJPPuKOhCD/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC6xYZFJYuW5g8XJPPuKOhCD/credits", 
         "cards_uri": "/v1/customers/AC6xYZFJYuW5g8XJPPuKOhCD/cards", 
         "holds_uri": "/v1/customers/AC6xYZFJYuW5g8XJPPuKOhCD/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-05T02:30:08.850803Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC6xYZFJYuW5g8XJPPuKOhCD", 
         "refunds_uri": "/v1/customers/AC6xYZFJYuW5g8XJPPuKOhCD/refunds", 
         "debits_uri": "/v1/customers/AC6xYZFJYuW5g8XJPPuKOhCD/debits", 
         "transactions_uri": "/v1/customers/AC6xYZFJYuW5g8XJPPuKOhCD/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC6xEUte50oDdcfGLsXBLXHx", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/bank_accounts/BA6y061VCy7hxqPki9CsLoWX", 
         "bank_accounts_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/bank_accounts", 
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
         "destination_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/bank_accounts/BA6y061VCy7hxqPki9CsLoWX", 
         "business_name": null, 
         "credits_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/credits", 
         "cards_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/cards", 
         "holds_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-06-05T02:30:08.562678Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx", 
         "refunds_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/refunds", 
         "debits_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/debits", 
         "transactions_uri": "/v1/customers/AC6xEUte50oDdcfGLsXBLXHx/transactions", 
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
   *optional* **string**. Name of the customer or representative of the business. Defaults to ``null``.

``email``
   *optional* **string**. Email address of the customer. Defaults to ``null``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``ssn_last4``
   *optional* **string**. Last four digits of the Social Security Number of the customer or
   representative of the business. Defaults to ``null``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``address``

   .. cssclass:: nested1

   *optional* **object**.

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
     "bank_accounts_uri": "/v1/customers/CUcg3mf9t505OfkrA1dZAMK/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {}, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CUcg3mf9t505OfkrA1dZAMK", 
     "credits_uri": "/v1/customers/CUcg3mf9t505OfkrA1dZAMK/credits", 
     "cards_uri": "/v1/customers/CUcg3mf9t505OfkrA1dZAMK/cards", 
     "holds_uri": "/v1/customers/CUcg3mf9t505OfkrA1dZAMK/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-05T02:31:28.292314Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUcg3mf9t505OfkrA1dZAMK", 
     "refunds_uri": "/v1/customers/CUcg3mf9t505OfkrA1dZAMK/refunds", 
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
     "debits_uri": "/v1/customers/CUcg3mf9t505OfkrA1dZAMK/debits", 
     "transactions_uri": "/v1/customers/CUcg3mf9t505OfkrA1dZAMK/transactions", 
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



