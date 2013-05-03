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
       "email_address": "user@example.org", 
       "id": null, 
       "address": {
           "city": "San Francisco", 
           "state": "CA", 
           "postal_code": "94103", 
           "street_address": "965 Mission St", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/bank_accounts", 
     "meta": {}, 
     "address": {
       "city": "San Francisco", 
       "state": "CA", 
       "postal_code": "94103", 
       "street_address": "965 Mission St", 
       "country_code": "USA"
     }, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": "user@example.org", 
     "id": "CU49LWlpI27oxqXwsnO6COMF", 
     "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:47:33.361127Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU49LWlpI27oxqXwsnO6COMF", 
     "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/bank_accounts", 
     "meta": {}, 
     "address": {}, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": null, 
     "id": "CU4a6CERXk1JZSVRMCltihIR", 
     "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:47:33.657757Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4a6CERXk1JZSVRMCltihIR", 
     "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/transactions", 
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
         "uri": "/v1/customers/CU4a6CERXk1JZSVRMCltihIR", 
         "meta": {}, 
         "email_address": null, 
         "id": "CU4a6CERXk1JZSVRMCltihIR", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:47:33.657757Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4a6CERXk1JZSVRMCltihIR/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CU49LWlpI27oxqXwsnO6COMF", 
         "meta": {}, 
         "email_address": "user@example.org", 
         "id": "CU49LWlpI27oxqXwsnO6COMF", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/bank_accounts", 
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
           "street_address": "965 Mission St"
         }, 
         "destination_uri": null, 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:47:33.361127Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU49LWlpI27oxqXwsnO6COMF/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC403nh7y4OMdJMnpWpB5nsl", 
         "meta": {}, 
         "email_address": null, 
         "id": "AC403nh7y4OMdJMnpWpB5nsl", 
         "facebook_id": null, 
         "phone_number": "+16505551234", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC403nh7y4OMdJMnpWpB5nsl/bank_accounts", 
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
           "destination_uri": {
             "_type": "bank_account", 
             "key": "destination"
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
         "destination_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC403nh7y4OMdJMnpWpB5nsl/bank_accounts/BA3ZHugsrQWkvx4nTkCYAE13", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC403nh7y4OMdJMnpWpB5nsl/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC403nh7y4OMdJMnpWpB5nsl/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC403nh7y4OMdJMnpWpB5nsl/holds", 
         "name": "William James", 
         "dob": null, 
         "created_at": "2013-05-03T17:47:24.719175Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC403nh7y4OMdJMnpWpB5nsl/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC403nh7y4OMdJMnpWpB5nsl/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC403nh7y4OMdJMnpWpB5nsl/transactions", 
         "ssn_last4": null, 
         "ein": "393483992"
       }, 
       {
         "uri": "/v1/customers/AC3FXQtQh7Au8LMspjFHWSXv", 
         "meta": {}, 
         "email_address": null, 
         "id": "AC3FXQtQh7Au8LMspjFHWSXv", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3FXQtQh7Au8LMspjFHWSXv/cards/CC3EHzvOUQLMiuyQ6H3o6UvL", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3FXQtQh7Au8LMspjFHWSXv/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3FXQtQh7Au8LMspjFHWSXv/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3FXQtQh7Au8LMspjFHWSXv/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3FXQtQh7Au8LMspjFHWSXv/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T17:47:06.857783Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3FXQtQh7Au8LMspjFHWSXv/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3FXQtQh7Au8LMspjFHWSXv/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3FXQtQh7Au8LMspjFHWSXv/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC3CMYRyqqna7BZSPHVivm6J", 
         "meta": {}, 
         "email_address": "fee@poundpay.com", 
         "id": "AC3CMYRyqqna7BZSPHVivm6J", 
         "facebook_id": null, 
         "phone_number": "+16505551212", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMYRyqqna7BZSPHVivm6J/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMYRyqqna7BZSPHVivm6J/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMYRyqqna7BZSPHVivm6J/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMYRyqqna7BZSPHVivm6J/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:47:04.034483Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMYRyqqna7BZSPHVivm6J/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMYRyqqna7BZSPHVivm6J/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMYRyqqna7BZSPHVivm6J/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC3CMVCuifoW7bjaFysdTNIZ", 
         "meta": {}, 
         "email_address": "escrow@poundpay.com", 
         "id": "AC3CMVCuifoW7bjaFysdTNIZ", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMVCuifoW7bjaFysdTNIZ/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMVCuifoW7bjaFysdTNIZ/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMVCuifoW7bjaFysdTNIZ/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMVCuifoW7bjaFysdTNIZ/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:47:04.033949Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMVCuifoW7bjaFysdTNIZ/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMVCuifoW7bjaFysdTNIZ/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CMVCuifoW7bjaFysdTNIZ/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/AC3CFKx0C4cXtR5BCXgMA02B", 
         "meta": {}, 
         "email_address": "whc@example.org", 
         "id": "AC3CFKx0C4cXtR5BCXgMA02B", 
         "facebook_id": null, 
         "phone_number": "+16505551212", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/bank_accounts/BA3CN1STEjHtLFfAnNfBBrjP", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/bank_accounts/BA3CN1STEjHtLFfAnNfBBrjP", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T17:47:03.930819Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/AC3CFKx0C4cXtR5BCXgMA02B/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4aLYrk3mNroWFCjOKPWY6Z/bank_accounts", 
     "meta": {}, 
     "address": {}, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": "richie@allblacks.com", 
     "id": "CU4aLYrk3mNroWFCjOKPWY6Z", 
     "credits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4aLYrk3mNroWFCjOKPWY6Z/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4aLYrk3mNroWFCjOKPWY6Z/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4aLYrk3mNroWFCjOKPWY6Z/holds", 
     "name": "Richie McCaw", 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:47:34.250761Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CU4aLYrk3mNroWFCjOKPWY6Z", 
     "refunds_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4aLYrk3mNroWFCjOKPWY6Z/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4aLYrk3mNroWFCjOKPWY6Z/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MP3CFyCeb99llIviPcR07Zf3/accounts/CU4aLYrk3mNroWFCjOKPWY6Z/transactions", 
     "ssn_last4": null, 
     "ein": null
   }

