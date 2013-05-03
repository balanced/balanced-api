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
   *optional* **key-value**. A single-level dictionary of string-type key/value pairs representing
   the address of the person or business. Defaults to ``{}``.

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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/bank_accounts", 
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
     "id": "CUM2w0SSKR901WeSMouK5UJ", 
     "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:51:36.383056Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUM2w0SSKR901WeSMouK5UJ", 
     "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/transactions", 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/bank_accounts", 
     "meta": {}, 
     "address": {}, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": null, 
     "id": "CUMmW6TP05bOseHLMbJnYS5", 
     "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/holds", 
     "name": null, 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:51:36.676040Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUMmW6TP05bOseHLMbJnYS5", 
     "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/transactions", 
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
         "uri": "/v1/customers/CUMmW6TP05bOseHLMbJnYS5", 
         "meta": {}, 
         "email_address": null, 
         "id": "CUMmW6TP05bOseHLMbJnYS5", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:51:36.676040Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUMmW6TP05bOseHLMbJnYS5/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/CUM2w0SSKR901WeSMouK5UJ", 
         "meta": {}, 
         "email_address": "user@example.org", 
         "id": "CUM2w0SSKR901WeSMouK5UJ", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:51:36.383056Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUM2w0SSKR901WeSMouK5UJ/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACHQMPPWDIvHca3DWYLPf4R", 
         "meta": {}, 
         "email_address": null, 
         "id": "ACHQMPPWDIvHca3DWYLPf4R", 
         "facebook_id": null, 
         "phone_number": "+16505551234", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACHQMPPWDIvHca3DWYLPf4R/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACHQMPPWDIvHca3DWYLPf4R/bank_accounts/BAHAHBABlGghjwAtVVyUXOV", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACHQMPPWDIvHca3DWYLPf4R/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACHQMPPWDIvHca3DWYLPf4R/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACHQMPPWDIvHca3DWYLPf4R/holds", 
         "name": "William James", 
         "dob": null, 
         "created_at": "2013-05-03T17:51:32.657485Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACHQMPPWDIvHca3DWYLPf4R/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACHQMPPWDIvHca3DWYLPf4R/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACHQMPPWDIvHca3DWYLPf4R/transactions", 
         "ssn_last4": null, 
         "ein": "393483992"
       }, 
       {
         "uri": "/v1/customers/CUCcBFSgE7BWnjjRWVJqJDX", 
         "meta": {}, 
         "email_address": "richie@allblacks.com", 
         "id": "CUCcBFSgE7BWnjjRWVJqJDX", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUCcBFSgE7BWnjjRWVJqJDX/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUCcBFSgE7BWnjjRWVJqJDX/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUCcBFSgE7BWnjjRWVJqJDX/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUCcBFSgE7BWnjjRWVJqJDX/holds", 
         "name": "Richie McCaw", 
         "dob": null, 
         "created_at": "2013-05-03T17:51:27.636859Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUCcBFSgE7BWnjjRWVJqJDX/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUCcBFSgE7BWnjjRWVJqJDX/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUCcBFSgE7BWnjjRWVJqJDX/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACpI1uH43MNJ9lg8krK7iUx", 
         "meta": {}, 
         "email_address": null, 
         "id": "ACpI1uH43MNJ9lg8krK7iUx", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACpI1uH43MNJ9lg8krK7iUx/cards/CCosw7XMNWGwBZqbiOgDgmB", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACpI1uH43MNJ9lg8krK7iUx/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACpI1uH43MNJ9lg8krK7iUx/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACpI1uH43MNJ9lg8krK7iUx/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACpI1uH43MNJ9lg8krK7iUx/holds", 
         "name": "Benny Riemann", 
         "dob": null, 
         "created_at": "2013-05-03T17:51:16.527845Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACpI1uH43MNJ9lg8krK7iUx/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACpI1uH43MNJ9lg8krK7iUx/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACpI1uH43MNJ9lg8krK7iUx/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACmTfvZWL5LCDzEVYeW8qrL", 
         "meta": {}, 
         "email_address": "fee@poundpay.com", 
         "id": "ACmTfvZWL5LCDzEVYeW8qrL", 
         "facebook_id": null, 
         "phone_number": "+16505551212", 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTfvZWL5LCDzEVYeW8qrL/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTfvZWL5LCDzEVYeW8qrL/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTfvZWL5LCDzEVYeW8qrL/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTfvZWL5LCDzEVYeW8qrL/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:51:14.021453Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTfvZWL5LCDzEVYeW8qrL/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTfvZWL5LCDzEVYeW8qrL/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTfvZWL5LCDzEVYeW8qrL/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACmTc9KpXP4BgV1RAvCR5sd", 
         "meta": {}, 
         "email_address": "escrow@poundpay.com", 
         "id": "ACmTc9KpXP4BgV1RAvCR5sd", 
         "facebook_id": null, 
         "phone_number": null, 
         "_type": "customer", 
         "source_uri": null, 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTc9KpXP4BgV1RAvCR5sd/bank_accounts", 
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
         "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTc9KpXP4BgV1RAvCR5sd/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTc9KpXP4BgV1RAvCR5sd/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTc9KpXP4BgV1RAvCR5sd/holds", 
         "name": null, 
         "dob": null, 
         "created_at": "2013-05-03T17:51:14.020851Z", 
         "is_identity_verified": false, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTc9KpXP4BgV1RAvCR5sd/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTc9KpXP4BgV1RAvCR5sd/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmTc9KpXP4BgV1RAvCR5sd/transactions", 
         "ssn_last4": null, 
         "ein": null
       }, 
       {
         "uri": "/v1/customers/ACmLWVbaNUW5EpI4vM8M21X", 
         "meta": {}, 
         "email_address": "whc@example.org", 
         "id": "ACmLWVbaNUW5EpI4vM8M21X", 
         "facebook_id": null, 
         "phone_number": "+16505551212", 
         "_type": "customer", 
         "source_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/bank_accounts/BAmTiHQEbiRgoo9jOWAILN7", 
         "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/bank_accounts", 
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
         "destination_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/bank_accounts/BAmTiHQEbiRgoo9jOWAILN7", 
         "business_name": null, 
         "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/credits", 
         "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/cards", 
         "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/holds", 
         "name": "William Henry Cavendish III", 
         "dob": null, 
         "created_at": "2013-05-03T17:51:13.916736Z", 
         "is_identity_verified": true, 
         "twitter_id": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/refunds", 
         "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/debits", 
         "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/ACmLWVbaNUW5EpI4vM8M21X/transactions", 
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
     "total": 8, 
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
     "bank_accounts_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUN3hn5VOc4FwTcx3j5lmXn/bank_accounts", 
     "meta": {}, 
     "address": {}, 
     "destination_uri": null, 
     "business_name": null, 
     "email_address": "richie@allblacks.com", 
     "id": "CUN3hn5VOc4FwTcx3j5lmXn", 
     "credits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUN3hn5VOc4FwTcx3j5lmXn/credits", 
     "cards_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUN3hn5VOc4FwTcx3j5lmXn/cards", 
     "holds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUN3hn5VOc4FwTcx3j5lmXn/holds", 
     "name": "Richie McCaw", 
     "twitter_id": null, 
     "dob": null, 
     "created_at": "2013-05-03T17:51:37.283167Z", 
     "is_identity_verified": false, 
     "uri": "/v1/customers/CUN3hn5VOc4FwTcx3j5lmXn", 
     "refunds_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUN3hn5VOc4FwTcx3j5lmXn/refunds", 
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
     "debits_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUN3hn5VOc4FwTcx3j5lmXn/debits", 
     "facebook_id": null, 
     "transactions_uri": "/v1/marketplaces/TEST-MPmLL6AE2gXjujTm9rGUWYh/accounts/CUN3hn5VOc4FwTcx3j5lmXn/transactions", 
     "ssn_last4": null, 
     "ein": null
   }

