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
     "bank_accounts_uri": "/v1/customers/CU6f8J2IyEgtZwgkItLKLOdq/bank_accounts", 
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
     "id": "CU6f8J2IyEgtZwgkItLKLOdq", 
     "credits_uri": "/v1/customers/CU6f8J2IyEgtZwgkItLKLOdq/credits", 
     "cards_uri": "/v1/customers/CU6f8J2IyEgtZwgkItLKLOdq/cards", 
     "holds_uri": "/v1/customers/CU6f8J2IyEgtZwgkItLKLOdq/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-06-07T17:29:26.368776Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU6f8J2IyEgtZwgkItLKLOdq", 
     "refunds_uri": "/v1/customers/CU6f8J2IyEgtZwgkItLKLOdq/refunds", 
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
     "debits_uri": "/v1/customers/CU6f8J2IyEgtZwgkItLKLOdq/debits", 
     "transactions_uri": "/v1/customers/CU6f8J2IyEgtZwgkItLKLOdq/transactions", 
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
     "bank_accounts_uri": "/v1/customers/CU6ggOE8WZYHPMXxgMsJudC8/bank_accounts", 
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
     "id": "CU6ggOE8WZYHPMXxgMsJudC8", 
     "credits_uri": "/v1/customers/CU6ggOE8WZYHPMXxgMsJudC8/credits", 
     "cards_uri": "/v1/customers/CU6ggOE8WZYHPMXxgMsJudC8/cards", 
     "holds_uri": "/v1/customers/CU6ggOE8WZYHPMXxgMsJudC8/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-07T17:29:27.373889Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU6ggOE8WZYHPMXxgMsJudC8", 
     "refunds_uri": "/v1/customers/CU6ggOE8WZYHPMXxgMsJudC8/refunds", 
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
     "debits_uri": "/v1/customers/CU6ggOE8WZYHPMXxgMsJudC8/debits", 
     "transactions_uri": "/v1/customers/CU6ggOE8WZYHPMXxgMsJudC8/transactions", 
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
         "id": "AC5hf33hFaA6CYXGIN1g6auj", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC5hf33hFaA6CYXGIN1g6auj/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC5hf33hFaA6CYXGIN1g6auj/credits", 
         "cards_uri": "/v1/customers/AC5hf33hFaA6CYXGIN1g6auj/cards", 
         "holds_uri": "/v1/customers/AC5hf33hFaA6CYXGIN1g6auj/holds", 
         "name": "William James", 
         "dob": null, 
         "created_at": "2013-06-07T17:28:33.109490Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC5hf33hFaA6CYXGIN1g6auj", 
         "refunds_uri": "/v1/customers/AC5hf33hFaA6CYXGIN1g6auj/refunds", 
         "debits_uri": "/v1/customers/AC5hf33hFaA6CYXGIN1g6auj/debits", 
         "transactions_uri": "/v1/customers/AC5hf33hFaA6CYXGIN1g6auj/transactions", 
         "ssn_last4": null, 
         "ein": "393483992"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC5g18agEaNWuQEzTLYdmCMg", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC5g18agEaNWuQEzTLYdmCMg/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC5g18agEaNWuQEzTLYdmCMg/credits", 
         "cards_uri": "/v1/customers/AC5g18agEaNWuQEzTLYdmCMg/cards", 
         "holds_uri": "/v1/customers/AC5g18agEaNWuQEzTLYdmCMg/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-07T17:28:32.020011Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC5g18agEaNWuQEzTLYdmCMg", 
         "refunds_uri": "/v1/customers/AC5g18agEaNWuQEzTLYdmCMg/refunds", 
         "debits_uri": "/v1/customers/AC5g18agEaNWuQEzTLYdmCMg/debits", 
         "transactions_uri": "/v1/customers/AC5g18agEaNWuQEzTLYdmCMg/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC5eYWHslnNHF46Xwdl3EEyW", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC5eYWHslnNHF46Xwdl3EEyW/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC5eYWHslnNHF46Xwdl3EEyW/credits", 
         "cards_uri": "/v1/customers/AC5eYWHslnNHF46Xwdl3EEyW/cards", 
         "holds_uri": "/v1/customers/AC5eYWHslnNHF46Xwdl3EEyW/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-07T17:28:31.109985Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC5eYWHslnNHF46Xwdl3EEyW", 
         "refunds_uri": "/v1/customers/AC5eYWHslnNHF46Xwdl3EEyW/refunds", 
         "debits_uri": "/v1/customers/AC5eYWHslnNHF46Xwdl3EEyW/debits", 
         "transactions_uri": "/v1/customers/AC5eYWHslnNHF46Xwdl3EEyW/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC5dv0s1gyOTqmZSXnwPh6fK", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK/cards/CC5djYxv7xDsN3C862buq0tV", 
         "bank_accounts_uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK/credits", 
         "cards_uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK/cards", 
         "holds_uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-07T17:28:29.783444Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK", 
         "refunds_uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK/refunds", 
         "debits_uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK/debits", 
         "transactions_uri": "/v1/customers/AC5dv0s1gyOTqmZSXnwPh6fK/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC5bSa6cr9BS1K05tm46a9BM", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM/cards/CC5bHVyQCxVbn7rfVGr7BBry", 
         "bank_accounts_uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM/credits", 
         "cards_uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM/cards", 
         "holds_uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-07T17:28:28.337288Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM", 
         "refunds_uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM/refunds", 
         "debits_uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM/debits", 
         "transactions_uri": "/v1/customers/AC5bSa6cr9BS1K05tm46a9BM/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards/CC5Uj9iEBgd7fhJTmmCdwQyQ", 
         "bank_accounts_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
         "cards_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/cards", 
         "holds_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-07T17:28:25.862643Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
         "refunds_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
         "debits_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
         "transactions_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC583puCYkXyNTzY2NtnZ4Lc", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc/credits", 
         "cards_uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc/cards", 
         "holds_uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-07T17:28:24.950113Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc", 
         "refunds_uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc/refunds", 
         "debits_uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc/debits", 
         "transactions_uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC583gUh3w8JhVsBOAzmwaiy", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy/credits", 
         "cards_uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy/cards", 
         "holds_uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-07T17:28:24.948391Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy", 
         "refunds_uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy/refunds", 
         "debits_uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy/debits", 
         "transactions_uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC57G3r3PVSx3fsYXiBdPJCC", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/bank_accounts/BA583yw3raG6TFVuZjcAkjgq", 
         "bank_accounts_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/bank_accounts", 
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
         "destination_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/bank_accounts/BA583yw3raG6TFVuZjcAkjgq", 
         "business_name": null, 
         "credits_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/credits", 
         "cards_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/cards", 
         "holds_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-06-07T17:28:24.615210Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC", 
         "refunds_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/refunds", 
         "debits_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/debits", 
         "transactions_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC/transactions", 
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
     "bank_accounts_uri": "/v1/customers/CU6md85JN4HxzARE58dFY7pm/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {}, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CU6md85JN4HxzARE58dFY7pm", 
     "credits_uri": "/v1/customers/CU6md85JN4HxzARE58dFY7pm/credits", 
     "cards_uri": "/v1/customers/CU6md85JN4HxzARE58dFY7pm/cards", 
     "holds_uri": "/v1/customers/CU6md85JN4HxzARE58dFY7pm/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-07T17:29:32.655963Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU6md85JN4HxzARE58dFY7pm", 
     "refunds_uri": "/v1/customers/CU6md85JN4HxzARE58dFY7pm/refunds", 
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
     "debits_uri": "/v1/customers/CU6md85JN4HxzARE58dFY7pm/debits", 
     "transactions_uri": "/v1/customers/CU6md85JN4HxzARE58dFY7pm/transactions", 
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



