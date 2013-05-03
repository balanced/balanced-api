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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/bank_accounts", 
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
     "id": "CUNt7tK5NualTrrzN8ZJC25", 
     "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T22:45:07.019880Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUNt7tK5NualTrrzN8ZJC25", 
     "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/bank_accounts", 
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
     "id": "CUNNYVdIWnxy8ZeEY6j7PSF", 
     "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T22:45:07.318974Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUNNYVdIWnxy8ZeEY6j7PSF", 
     "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/transactions", 
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
         "uri": "/v1/customers/CUOabQIVgfZGzF90NM6bJ5f", 
         "meta": {}, 
         "id": "CUOabQIVgfZGzF90NM6bJ5f", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOabQIVgfZGzF90NM6bJ5f/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOabQIVgfZGzF90NM6bJ5f/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOabQIVgfZGzF90NM6bJ5f/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOabQIVgfZGzF90NM6bJ5f/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:45:07.637224Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOabQIVgfZGzF90NM6bJ5f/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOabQIVgfZGzF90NM6bJ5f/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOabQIVgfZGzF90NM6bJ5f/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CUNNYVdIWnxy8ZeEY6j7PSF", 
         "meta": {}, 
         "id": "CUNNYVdIWnxy8ZeEY6j7PSF", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:45:07.318974Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNNYVdIWnxy8ZeEY6j7PSF/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CUNt7tK5NualTrrzN8ZJC25", 
         "meta": {}, 
         "id": "CUNt7tK5NualTrrzN8ZJC25", 
         "facebook_id": null, 
         "email": "user@example.org", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:45:07.019880Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUNt7tK5NualTrrzN8ZJC25/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACMKSFKiBnxct6cOgbAibAd", 
         "meta": {}, 
         "id": "ACMKSFKiBnxct6cOgbAibAd", 
         "facebook_id": null, 
         "email": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMKSFKiBnxct6cOgbAibAd/cards/CCMHlIL5JVDHJAK3yYCioU1", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMKSFKiBnxct6cOgbAibAd/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMKSFKiBnxct6cOgbAibAd/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMKSFKiBnxct6cOgbAibAd/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMKSFKiBnxct6cOgbAibAd/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T22:45:06.384232Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMKSFKiBnxct6cOgbAibAd/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMKSFKiBnxct6cOgbAibAd/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMKSFKiBnxct6cOgbAibAd/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACMtlvHngzwiHp41oU1j8FX", 
         "meta": {}, 
         "id": "ACMtlvHngzwiHp41oU1j8FX", 
         "facebook_id": null, 
         "email": "fee@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtlvHngzwiHp41oU1j8FX/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtlvHngzwiHp41oU1j8FX/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtlvHngzwiHp41oU1j8FX/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtlvHngzwiHp41oU1j8FX/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:45:06.132707Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtlvHngzwiHp41oU1j8FX/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtlvHngzwiHp41oU1j8FX/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtlvHngzwiHp41oU1j8FX/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACMtik8XhnElifFW7vW7eQF", 
         "meta": {}, 
         "id": "ACMtik8XhnElifFW7vW7eQF", 
         "facebook_id": null, 
         "email": "escrow@poundpay.com", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtik8XhnElifFW7vW7eQF/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtik8XhnElifFW7vW7eQF/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtik8XhnElifFW7vW7eQF/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtik8XhnElifFW7vW7eQF/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T22:45:06.132078Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtik8XhnElifFW7vW7eQF/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtik8XhnElifFW7vW7eQF/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMtik8XhnElifFW7vW7eQF/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACMlZMdFBurl70H6xWmnoOt", 
         "meta": {}, 
         "id": "ACMlZMdFBurl70H6xWmnoOt", 
         "facebook_id": null, 
         "email": "whc@example.org", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/bank_accounts/BAMtskBDkaSVmCoV6StqRG1", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/bank_accounts/BAMtskBDkaSVmCoV6StqRG1", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T22:45:06.027980Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/ACMlZMdFBurl70H6xWmnoOt/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOAbNHyfQQQkv8U04CnLCF/bank_accounts", 
     "phone": null, 
     "meta": {}, 
     "address": {
       "country_code": "US"
     }, 
     "destination_uri": null, 
     "business_name": null, 
     "id": "CUOAbNHyfQQQkv8U04CnLCF", 
     "credits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOAbNHyfQQQkv8U04CnLCF/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOAbNHyfQQQkv8U04CnLCF/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOAbNHyfQQQkv8U04CnLCF/holds", 
     "name": "Richie McCaw", 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T22:45:08.010111Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUOAbNHyfQQQkv8U04CnLCF", 
     "refunds_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOAbNHyfQQQkv8U04CnLCF/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOAbNHyfQQQkv8U04CnLCF/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MPMlwhAvSKwCoJ5J5ESzgch/accounts/CUOAbNHyfQQQkv8U04CnLCF/transactions", 
     "ssn_last4": null, 
     "email": null, 
     "ein": null
   }

