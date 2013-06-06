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
     "bank_accounts_uri": "/v1/customers/CUrWYoWJKiOl6cWrn8jVkhi/bank_accounts", 
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
     "id": "CUrWYoWJKiOl6cWrn8jVkhi", 
     "credits_uri": "/v1/customers/CUrWYoWJKiOl6cWrn8jVkhi/credits", 
     "cards_uri": "/v1/customers/CUrWYoWJKiOl6cWrn8jVkhi/cards", 
     "holds_uri": "/v1/customers/CUrWYoWJKiOl6cWrn8jVkhi/holds", 
     "name": "John Lee Hooker", 
     "dob": null, 
     "ssn_last4": "xxxx", 
     "created_at": "2013-06-06T23:16:03.511468Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUrWYoWJKiOl6cWrn8jVkhi", 
     "refunds_uri": "/v1/customers/CUrWYoWJKiOl6cWrn8jVkhi/refunds", 
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
     "debits_uri": "/v1/customers/CUrWYoWJKiOl6cWrn8jVkhi/debits", 
     "transactions_uri": "/v1/customers/CUrWYoWJKiOl6cWrn8jVkhi/transactions", 
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
     "bank_accounts_uri": "/v1/customers/CUt0SEFAg8rOm1efpElP2uc/bank_accounts", 
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
     "id": "CUt0SEFAg8rOm1efpElP2uc", 
     "credits_uri": "/v1/customers/CUt0SEFAg8rOm1efpElP2uc/credits", 
     "cards_uri": "/v1/customers/CUt0SEFAg8rOm1efpElP2uc/cards", 
     "holds_uri": "/v1/customers/CUt0SEFAg8rOm1efpElP2uc/holds", 
     "name": null, 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-06T23:16:04.453902Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUt0SEFAg8rOm1efpElP2uc", 
     "refunds_uri": "/v1/customers/CUt0SEFAg8rOm1efpElP2uc/refunds", 
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
     "debits_uri": "/v1/customers/CUt0SEFAg8rOm1efpElP2uc/debits", 
     "transactions_uri": "/v1/customers/CUt0SEFAg8rOm1efpElP2uc/transactions", 
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
         "id": "AC7cJaCfbjyZlQD229pVHoQv", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC7cJaCfbjyZlQD229pVHoQv/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC7cJaCfbjyZlQD229pVHoQv/credits", 
         "cards_uri": "/v1/customers/AC7cJaCfbjyZlQD229pVHoQv/cards", 
         "holds_uri": "/v1/customers/AC7cJaCfbjyZlQD229pVHoQv/holds", 
         "name": "William James", 
         "dob": null, 
         "created_at": "2013-06-06T23:15:06.345031Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC7cJaCfbjyZlQD229pVHoQv", 
         "refunds_uri": "/v1/customers/AC7cJaCfbjyZlQD229pVHoQv/refunds", 
         "debits_uri": "/v1/customers/AC7cJaCfbjyZlQD229pVHoQv/debits", 
         "transactions_uri": "/v1/customers/AC7cJaCfbjyZlQD229pVHoQv/transactions", 
         "ssn_last4": null, 
         "ein": "393483992"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC7blw98unHYJRxnuEEoTXQz", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz/credits", 
         "cards_uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz/cards", 
         "holds_uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-06T23:15:05.116712Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz", 
         "refunds_uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz/refunds", 
         "debits_uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz/debits", 
         "transactions_uri": "/v1/customers/AC7blw98unHYJRxnuEEoTXQz/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC7ai9JceoGaJuONww3G6cHC", 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC/credits", 
         "cards_uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC/cards", 
         "holds_uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC/holds", 
         "name": "William James", 
         "dob": "1842-01", 
         "created_at": "2013-06-06T23:15:04.182572Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC", 
         "refunds_uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC/refunds", 
         "debits_uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC/debits", 
         "transactions_uri": "/v1/customers/AC7ai9JceoGaJuONww3G6cHC/transactions", 
         "ssn_last4": "xxxx", 
         "ein": "253912384"
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC795MDqTD7JfARMXuN2uszK", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK/cards/CC78WsRlMvHA9ntuIPcp75mE", 
         "bank_accounts_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK/credits", 
         "cards_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK/cards", 
         "holds_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T23:15:03.118708Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK", 
         "refunds_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK/refunds", 
         "debits_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK/debits", 
         "transactions_uri": "/v1/customers/AC795MDqTD7JfARMXuN2uszK/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC77drSig6AAZXYtvLyx4pey", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey/cards/CC7708hFSajwPepxuK7jy4Bk", 
         "bank_accounts_uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey/credits", 
         "cards_uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey/cards", 
         "holds_uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T23:15:01.447210Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey", 
         "refunds_uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey/refunds", 
         "debits_uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey/debits", 
         "transactions_uri": "/v1/customers/AC77drSig6AAZXYtvLyx4pey/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC74u3FlUdGRzoRVqobCvhfW", 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
         "bank_accounts_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/credits", 
         "cards_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards", 
         "holds_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-06-06T23:14:59.021264Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
         "refunds_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
         "debits_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/debits", 
         "transactions_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC73tqZIlb2GVeLzP7r09dHV", 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV/credits", 
         "cards_uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV/cards", 
         "holds_uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-06T23:14:58.117284Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV", 
         "refunds_uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV/refunds", 
         "debits_uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV/debits", 
         "transactions_uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC73tlmYDK7tMnmMcEz4j60f", 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f/bank_accounts", 
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
         "credits_uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f/credits", 
         "cards_uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f/cards", 
         "holds_uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-06-06T23:14:58.116138Z", 
         "is_identity_verified": false, 
         "uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f", 
         "refunds_uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f/refunds", 
         "debits_uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f/debits", 
         "transactions_uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "twitter": null, 
         "meta": {}, 
         "id": "AC738T1zFtWV7uxzgchCPDSn", 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/bank_accounts/BA73txY5gdJpzx1YQ6FYhnaf", 
         "bank_accounts_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/bank_accounts", 
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
         "destination_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/bank_accounts/BA73txY5gdJpzx1YQ6FYhnaf", 
         "business_name": null, 
         "credits_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/credits", 
         "cards_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/cards", 
         "holds_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-06-06T23:14:57.822657Z", 
         "is_identity_verified": true, 
         "uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn", 
         "refunds_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/refunds", 
         "debits_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/debits", 
         "transactions_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn/transactions", 
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
     "bank_accounts_uri": "/v1/customers/CUyTfRWxX1BePUJJ4ujqO6j/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "facebook": null, 
     "address": {}, 
     "source_uri": null, 
     "business_name": null, 
     "id": "CUyTfRWxX1BePUJJ4ujqO6j", 
     "credits_uri": "/v1/customers/CUyTfRWxX1BePUJJ4ujqO6j/credits", 
     "cards_uri": "/v1/customers/CUyTfRWxX1BePUJJ4ujqO6j/cards", 
     "holds_uri": "/v1/customers/CUyTfRWxX1BePUJJ4ujqO6j/holds", 
     "name": "Richie McCaw", 
     "dob": null, 
     "ssn_last4": null, 
     "created_at": "2013-06-06T23:16:09.676084Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUyTfRWxX1BePUJJ4ujqO6j", 
     "refunds_uri": "/v1/customers/CUyTfRWxX1BePUJJ4ujqO6j/refunds", 
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
     "debits_uri": "/v1/customers/CUyTfRWxX1BePUJJ4ujqO6j/debits", 
     "transactions_uri": "/v1/customers/CUyTfRWxX1BePUJJ4ujqO6j/transactions", 
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



