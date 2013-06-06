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
     "bank_accounts_uri": "/v1/customers/CU4hL121DzkcNzEKFz99VktN/bank_accounts", 
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
     "id": "CU4hL121DzkcNzEKFz99VktN", 
     "credits_uri": "/v1/customers/CU4hL121DzkcNzEKFz99VktN/credits", 
     "cards_uri": "/v1/customers/CU4hL121DzkcNzEKFz99VktN/cards", 
     "holds_uri": "/v1/customers/CU4hL121DzkcNzEKFz99VktN/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-06-06T23:41:03.431393Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4hL121DzkcNzEKFz99VktN", 
     "refunds_uri": "/v1/customers/CU4hL121DzkcNzEKFz99VktN/refunds", 
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
     "debits_uri": "/v1/customers/CU4hL121DzkcNzEKFz99VktN/debits", 
     "transactions_uri": "/v1/customers/CU4hL121DzkcNzEKFz99VktN/transactions", 
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
     "bank_accounts_uri": "/v1/customers/CU4iOmmGs6X6EHOrKkP2qDpS/bank_accounts", 
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
     "id": "CU4iOmmGs6X6EHOrKkP2qDpS", 
     "credits_uri": "/v1/customers/CU4iOmmGs6X6EHOrKkP2qDpS/credits", 
     "cards_uri": "/v1/customers/CU4iOmmGs6X6EHOrKkP2qDpS/cards", 
     "holds_uri": "/v1/customers/CU4iOmmGs6X6EHOrKkP2qDpS/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-06T23:41:04.371068Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4iOmmGs6X6EHOrKkP2qDpS", 
     "refunds_uri": "/v1/customers/CU4iOmmGs6X6EHOrKkP2qDpS/refunds", 
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
     "debits_uri": "/v1/customers/CU4iOmmGs6X6EHOrKkP2qDpS/debits", 
     "transactions_uri": "/v1/customers/CU4iOmmGs6X6EHOrKkP2qDpS/transactions", 
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
         "id": "AC3gWtMijWPf4NUgVYoecI7d", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC3gWtMijWPf4NUgVYoecI7d/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC3gWtMijWPf4NUgVYoecI7d/credits", 
         "cards_uri": "/v1/customers/AC3gWtMijWPf4NUgVYoecI7d/cards", 
         "holds_uri": "/v1/customers/AC3gWtMijWPf4NUgVYoecI7d/holds", 
         "name": "William James", 
         "dob": null, 
         "created_at": "2013-06-06T23:40:07.579937Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC3gWtMijWPf4NUgVYoecI7d", 
         "refunds_uri": "/v1/customers/AC3gWtMijWPf4NUgVYoecI7d/refunds", 
         "debits_uri": "/v1/customers/AC3gWtMijWPf4NUgVYoecI7d/debits", 
         "transactions_uri": "/v1/customers/AC3gWtMijWPf4NUgVYoecI7d/transactions", 
         "ssn_last4": null, 
         "ein": "393483992"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC3fJEd8jV1zUw1dge3ZtAJE", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE/credits", 
         "cards_uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE/cards", 
         "holds_uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-06T23:40:06.515772Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE", 
         "refunds_uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE/refunds", 
         "debits_uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE/debits", 
         "transactions_uri": "/v1/customers/AC3fJEd8jV1zUw1dge3ZtAJE/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC3eEAd4iKlggL3MfZnE3lY4", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4/credits", 
         "cards_uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4/cards", 
         "holds_uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-06T23:40:05.550556Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4", 
         "refunds_uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4/refunds", 
         "debits_uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4/debits", 
         "transactions_uri": "/v1/customers/AC3eEAd4iKlggL3MfZnE3lY4/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC3dtgCQuWIwu8qXeQeYv2bm", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm/cards/CC3dhp1dsLw40vEWMjCXCIQ8", 
         "bank_accounts_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm/credits", 
         "cards_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm/cards", 
         "holds_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T23:40:04.496508Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm", 
         "refunds_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm/refunds", 
         "debits_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm/debits", 
         "transactions_uri": "/v1/customers/AC3dtgCQuWIwu8qXeQeYv2bm/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC3bZ0TySVgxWGI0LdkdjZmg", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg/cards/CC3bKGcriihH17kgq7iWUEaW", 
         "bank_accounts_uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg/credits", 
         "cards_uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg/cards", 
         "holds_uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T23:40:03.173539Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg", 
         "refunds_uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg/refunds", 
         "debits_uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg/debits", 
         "transactions_uri": "/v1/customers/AC3bZ0TySVgxWGI0LdkdjZmg/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC38UBtmXyKEBQS90mN0U4ft", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/cards/CC3WlOIMnA4AjcNTzG4dG5fA", 
         "bank_accounts_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/credits", 
         "cards_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/cards", 
         "holds_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T23:40:00.440155Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
         "refunds_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
         "debits_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/debits", 
         "transactions_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC37TfhFtv7ra3cLQq5H8r5S", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S/credits", 
         "cards_uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S/cards", 
         "holds_uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-06T23:39:59.536978Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S", 
         "refunds_uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S/refunds", 
         "debits_uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S/debits", 
         "transactions_uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC37T5Yy8wdE3AdhIL85gLZm", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm/credits", 
         "cards_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm/cards", 
         "holds_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-06T23:39:59.535012Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm", 
         "refunds_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm/refunds", 
         "debits_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm/debits", 
         "transactions_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC37qorlMKPH5g9O4BTHQluw", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/bank_accounts/BA37TqHREduYFlfbYXmIEhi8", 
         "bank_accounts_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/bank_accounts", 
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
         "destination_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/bank_accounts/BA37TqHREduYFlfbYXmIEhi8", 
         "business_name": null, 
         "credits_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/credits", 
         "cards_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/cards", 
         "holds_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-06-06T23:39:59.123216Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw", 
         "refunds_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/refunds", 
         "debits_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/debits", 
         "transactions_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw/transactions", 
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
     "bank_accounts_uri": "/v1/customers/CU4oAQW5Bk3kCndMohtFdKSi/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {}, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CU4oAQW5Bk3kCndMohtFdKSi", 
     "credits_uri": "/v1/customers/CU4oAQW5Bk3kCndMohtFdKSi/credits", 
     "cards_uri": "/v1/customers/CU4oAQW5Bk3kCndMohtFdKSi/cards", 
     "holds_uri": "/v1/customers/CU4oAQW5Bk3kCndMohtFdKSi/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-06T23:41:09.518126Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4oAQW5Bk3kCndMohtFdKSi", 
     "refunds_uri": "/v1/customers/CU4oAQW5Bk3kCndMohtFdKSi/refunds", 
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
     "debits_uri": "/v1/customers/CU4oAQW5Bk3kCndMohtFdKSi/debits", 
     "transactions_uri": "/v1/customers/CU4oAQW5Bk3kCndMohtFdKSi/transactions", 
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



