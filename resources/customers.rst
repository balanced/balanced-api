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
   *optional* **string** or **null**. Email address of the customer. It must be **unique** among all customers
   on your marketplace. Defaults to ``null``.

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
   *optional* **key-value**. A single-level dictionary of string-type key/value pairs representing
   the address of the person or business. Defaults to ``{}``.

``phone_number``
   *optional* **string**. Phone number of the person or business. Defaults to ``null``.

``dob``
   *optional* **string**. Date of birth of the customer or representative of the business. Defaults to ``null``.

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
       "id": null
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/bank_accounts", 
     "meta": {}, 
     "address": {}, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": null, 
     "id": "CU4AEMWUERKThWKuiDvqPpgl", 
     "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:40:47.767794Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4AEMWUERKThWKuiDvqPpgl", 
     "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/bank_accounts", 
     "meta": {}, 
     "address": {}, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": null, 
     "id": "CU4AYZcOfOjOBELvsl8sWPhD", 
     "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:40:48.057558Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4AYZcOfOjOBELvsl8sWPhD", 
     "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/transactions", 
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
         "uri": "/v1/customers/CU4AYZcOfOjOBELvsl8sWPhD", 
         "meta": {}, 
         "email_address": null, 
         "id": "CU4AYZcOfOjOBELvsl8sWPhD", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/bank_accounts", 
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
         "address": {}, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:40:48.057558Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AYZcOfOjOBELvsl8sWPhD/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU4AEMWUERKThWKuiDvqPpgl", 
         "meta": {}, 
         "email_address": null, 
         "id": "CU4AEMWUERKThWKuiDvqPpgl", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/bank_accounts", 
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
         "address": {}, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:40:47.767794Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4AEMWUERKThWKuiDvqPpgl/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU4t1jVUFsbmayd34LbUX2BX", 
         "meta": {}, 
         "email_address": null, 
         "id": "CU4t1jVUFsbmayd34LbUX2BX", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4t1jVUFsbmayd34LbUX2BX/bank_accounts", 
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
         "address": {}, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4t1jVUFsbmayd34LbUX2BX/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4t1jVUFsbmayd34LbUX2BX/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4t1jVUFsbmayd34LbUX2BX/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:40:40.978263Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4t1jVUFsbmayd34LbUX2BX/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4t1jVUFsbmayd34LbUX2BX/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4t1jVUFsbmayd34LbUX2BX/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC4scOXV5F0QfxMUICtdd1AZ", 
         "meta": {}, 
         "email_address": null, 
         "id": "AC4scOXV5F0QfxMUICtdd1AZ", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC4scOXV5F0QfxMUICtdd1AZ/cards/CC4s8db4zae532OXZyTK6Onn", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC4scOXV5F0QfxMUICtdd1AZ/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC4scOXV5F0QfxMUICtdd1AZ/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC4scOXV5F0QfxMUICtdd1AZ/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC4scOXV5F0QfxMUICtdd1AZ/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T17:40:40.252963Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC4scOXV5F0QfxMUICtdd1AZ/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC4scOXV5F0QfxMUICtdd1AZ/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC4scOXV5F0QfxMUICtdd1AZ/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC1OWM2srW00CTwaRJtCpHod", 
         "meta": {}, 
         "email_address": "fee@poundpay.com", 
         "id": "AC1OWM2srW00CTwaRJtCpHod", 
         "facebook_id": null, 
         "phone_number": "+16505551212", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWM2srW00CTwaRJtCpHod/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWM2srW00CTwaRJtCpHod/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWM2srW00CTwaRJtCpHod/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWM2srW00CTwaRJtCpHod/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:38:15.098229Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWM2srW00CTwaRJtCpHod/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWM2srW00CTwaRJtCpHod/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWM2srW00CTwaRJtCpHod/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC1OWIIfe9pzeEqvkfah2Mgx", 
         "meta": {}, 
         "email_address": "escrow@poundpay.com", 
         "id": "AC1OWIIfe9pzeEqvkfah2Mgx", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWIIfe9pzeEqvkfah2Mgx/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWIIfe9pzeEqvkfah2Mgx/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWIIfe9pzeEqvkfah2Mgx/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWIIfe9pzeEqvkfah2Mgx/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:38:15.097530Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWIIfe9pzeEqvkfah2Mgx/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWIIfe9pzeEqvkfah2Mgx/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OWIIfe9pzeEqvkfah2Mgx/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC1OP6vf3FQvNQbmcKv8pcIh", 
         "meta": {}, 
         "email_address": "whc@example.org", 
         "id": "AC1OP6vf3FQvNQbmcKv8pcIh", 
         "facebook_id": null, 
         "phone_number": "+16505551212", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/bank_accounts/BA1OWUjss9lrDV3vxbDyAJ0J", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/bank_accounts/BA1OWUjss9lrDV3vxbDyAJ0J", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T17:38:14.988747Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/AC1OP6vf3FQvNQbmcKv8pcIh/transactions", 
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
   *optional* **string** or **null**. Email address of the customer. It must be **unique** among all customers
   on your marketplace. Defaults to ``null``.

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
   *optional* **key-value**. A single-level dictionary of string-type key/value pairs representing
   the address of the person or business. Defaults to ``{}``.

``phone_number``
   *optional* **string**. Phone number of the person or business. Defaults to ``null``.

``dob``
   *optional* **string**. Date of birth of the customer or representative of the business. Defaults to ``null``.

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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4BESJpW43RkXXLesq6831n/bank_accounts", 
     "meta": {}, 
     "address": {}, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": null, 
     "id": "CU4BESJpW43RkXXLesq6831n", 
     "credits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4BESJpW43RkXXLesq6831n/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4BESJpW43RkXXLesq6831n/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4BESJpW43RkXXLesq6831n/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:40:48.658209Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4BESJpW43RkXXLesq6831n", 
     "refunds_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4BESJpW43RkXXLesq6831n/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4BESJpW43RkXXLesq6831n/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP1OOOCRWuPTsoErH3HneII9/accounts/CU4BESJpW43RkXXLesq6831n/transactions", 
     "ssn_last4": null, 
     "ein": null
   }

