Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

``account_email_address``
   **object**.

``account_name``
   **object**.

``amount``
   **integer**. The amount of the refund.

``appears_on_statement_as``
   **string**. Text that will appear on the statement describing this refund.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   refund was issued.

``debit``
   **object**. The original debit associated with the refund.

``description``
   **string**. Free-text description of the refund.

``id``
   **string**.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``transaction_number``
   **string**. An identifier for this transaction.

``uri``
   **string**.

Deprecated
~~~~~~~~~~

Refund an Account
-----------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds

Request
~~~~~~~

``amount``
   *optional* **integer**. Defaults to ``null``.

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``debit_uri``
   *optional* **string**. If the resolving URI references a ``debit`` then that is used as the
   default. Otherwise no default is provided and this field is
   **required**.


Body
^^^^

.. code:: javascript

   {
       "debit_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4XGji7JmGAfh6KfEs0izfO", 
       "amount": 1234, 
       "meta": {}, 
       "description": null
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
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
       "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
       "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T21:59:24.065137Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
       "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
       "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1234, 
     "created_at": "2013-06-06T22:01:30.878490Z", 
     "account": {
       "_type": "account", 
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
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
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
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
       "created_at": "2013-06-06T21:59:23.772410Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
       "email_address": null, 
       "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds/RF51bM6uAgNBE4LLiV3qT7My", 
     "transaction_number": "RF086-643-5064", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL50qke15RxC6rlRZK4SsBWM", 
       "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "created_at": "2013-06-06T22:01:30.160679Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD50nWzsZpTBsafLR3fGaAU0", 
       "status": "succeeded", 
       "transaction_number": "W755-518-7836", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD50nWzsZpTBsafLR3fGaAU0/refunds", 
       "amount": 1254, 
       "_uris": {
         "hold_uri": {
           "_type": "hold", 
           "key": "hold"
         }, 
         "refunds_uri": {
           "_type": "page", 
           "key": "refunds"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "appears_on_statement_as": "example.com", 
       "id": "WD50nWzsZpTBsafLR3fGaAU0", 
       "available_at": "2013-06-06T22:01:29.883049Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF51bM6uAgNBE4LLiV3qT7My"
   }

Retrieve a Refund
-----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id

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
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
       "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
       "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T21:59:24.065137Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
       "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
       "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T22:01:33.237210Z", 
     "account": {
       "_type": "account", 
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
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
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
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
       "created_at": "2013-06-06T21:59:23.772410Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
       "email_address": null, 
       "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds/RF53QCyWPH5fkznbmWWF0BqG", 
     "transaction_number": "RF806-147-2398", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL52YDklDWWbSygCf02PMb5t", 
       "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "created_at": "2013-06-06T22:01:32.433493Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD52WNPXc8Ux0O8TaXk0VwXJ", 
       "status": "succeeded", 
       "transaction_number": "W252-840-7353", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD52WNPXc8Ux0O8TaXk0VwXJ/refunds", 
       "amount": 1254, 
       "_uris": {
         "hold_uri": {
           "_type": "hold", 
           "key": "hold"
         }, 
         "refunds_uri": {
           "_type": "page", 
           "key": "refunds"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "appears_on_statement_as": "example.com", 
       "id": "WD52WNPXc8Ux0O8TaXk0VwXJ", 
       "available_at": "2013-06-06T22:01:32.235916Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF53QCyWPH5fkznbmWWF0BqG"
   }

List All Refunds
----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds

Request
~~~~~~~

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
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 431, 
         "created_at": "2013-06-06T22:01:38.041600Z", 
         "account": {
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
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
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
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
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds/RF59fStXHa7XeM2QMQSgh9U3", 
         "transaction_number": "RF830-771-9554", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL58oHHh2tKGQUxI9Ig3mL7U", 
           "status": "succeeded", 
           "_type": "debit", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "hold_uri": {
               "_type": "hold", 
               "key": "hold"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }
           }, 
           "amount": 431, 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD58mGXFOcrxekKvk1ME8cF8", 
           "id": "WD58mGXFOcrxekKvk1ME8cF8", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD58mGXFOcrxekKvk1ME8cF8/refunds", 
           "transaction_number": "W597-751-2710", 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:01:37.259074Z", 
           "available_at": "2013-06-06T22:01:37.008753Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF59fStXHa7XeM2QMQSgh9U3"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
           "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
           "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T21:59:24.065137Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
           "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
           "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "_type": "refund", 
         "fee": null, 
         "description": null, 
         "amount": 1254, 
         "created_at": "2013-06-06T22:01:36.112124Z", 
         "account": {
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
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
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
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
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
           "email_address": null, 
           "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds/RF574XufPgQeEOtuNbjWD9UI", 
         "transaction_number": "RF845-662-7237", 
         "_uris": {}, 
         "meta": {}, 
         "debit": {
           "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL56b8JEtlhX9KxwhuKdQmRY", 
           "status": "succeeded", 
           "_type": "debit", 
           "fee": null, 
           "description": null, 
           "_uris": {
             "hold_uri": {
               "_type": "hold", 
               "key": "hold"
             }, 
             "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
             }
           }, 
           "amount": 1254, 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD567iatRXrPLbh43QsXojLY", 
           "id": "WD567iatRXrPLbh43QsXojLY", 
           "on_behalf_of_uri": null, 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD567iatRXrPLbh43QsXojLY/refunds", 
           "transaction_number": "W884-063-4608", 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "appears_on_statement_as": "example.com", 
           "created_at": "2013-06-06T22:01:35.254585Z", 
           "available_at": "2013-06-06T22:01:34.995973Z"
         }, 
         "appears_on_statement_as": "example.com", 
         "id": "RF574XufPgQeEOtuNbjWD9UI"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds?limit=2&offset=0", 
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
     "limit": 2, 
     "offset": 0, 
     "total": 8, 
     "next_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds?limit=2&offset=6"
   }

Update a Refund
---------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id

Request
~~~~~~~

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values.


Body
^^^^

.. code:: javascript

   {
       "_type": "refund", 
       "fee": null, 
       "description": "my new description", 
       "created_at": "2013-06-06T22:01:41.680330+00:00Z", 
       "transaction_number": "RF213-621-6016", 
       "amount": 1254, 
       "_uris": {}, 
       "meta": {
           "my-id": "0987654321"
       }, 
       "appears_on_statement_as": "example.com", 
       "id": "RF5dlfKrRG1ZWgjplHznZaQ0"
   }

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
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU2IyYbAGFklvoPZhFbT5TQc", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "bank_accounts_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/credits", 
       "cards_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/cards", 
       "holds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T21:59:24.065137Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "refunds_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/refunds", 
       "debits_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/debits", 
       "transactions_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": "my new description", 
     "amount": 1254, 
     "created_at": "2013-06-06T22:01:44.533886Z", 
     "account": {
       "_type": "account", 
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
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
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
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
       "created_at": "2013-06-06T21:59:23.772410Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/refunds", 
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/debits", 
       "email_address": null, 
       "id": "AC2IeyzRJbL9DnV4nRy1RyQw", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds/RF5gyeLnC8e5SLrZDKgnYNwk", 
     "transaction_number": "RF201-250-2211", 
     "_uris": {}, 
     "meta": {
       "my-id": "0987654321"
     }, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL5fz656KG354jE8v9TWNOFI", 
       "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "created_at": "2013-06-06T22:01:43.633429Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5fxzUnj15klyIUdrdxBy3g", 
       "status": "succeeded", 
       "transaction_number": "W396-588-2338", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD5fxzUnj15klyIUdrdxBy3g/refunds", 
       "amount": 1254, 
       "_uris": {
         "hold_uri": {
           "_type": "hold", 
           "key": "hold"
         }, 
         "refunds_uri": {
           "_type": "page", 
           "key": "refunds"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "appears_on_statement_as": "example.com", 
       "id": "WD5fxzUnj15klyIUdrdxBy3g", 
       "available_at": "2013-06-06T22:01:43.379091Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF5gyeLnC8e5SLrZDKgnYNwk"
   }

