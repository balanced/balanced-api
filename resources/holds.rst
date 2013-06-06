Holds
=====

- `Create a Hold`_
- `Retrieve a Hold`_
- `List all Holds`_
- `Update a Hold`_
- `Capture a Hold`_
- `Void a Hold`_

Fields
------

``account_email_address``
   **object**.

``account_name``
   **object**.

``amount``
   **integer**. Amount of the hold.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   hold was created.

``debit``
   **object**. See `Debit <./debits.rst>`_.

``description``
   **string**. A description of the hold, used for display purposes.

``expires_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   hold was will expire and can **NO LONGER BE CAPTURED**.

``id``
   **string**.

``is_void``
   **boolean**. A boolean flag indicating if the hold has been voided or not.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``source``
   **object**. See `Card <./cards.rst>`_.


``transaction_number``
   **string**. An identifier for this transaction.

``uri``
   **string**.

Deprecated
~~~~~~~~~~

Create a Hold
-------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts/:account_id/holds

Request
~~~~~~~

``amount``
   *required* **integer**.

``customer_uri``
   *optional* **string**.

``appears_on_statement_as``
   *optional* **string**. Text that will appear on the buyer's statement. Characters that can be
   used are limited to:

   - ASCII letters (``a-z`` and ``A-Z``)
   - Digits (``0-9``)
   - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

   Any other characters will be rejected.

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``source_uri``
   *optional* **string**.


Body
^^^^

.. code:: javascript

   {
       "source_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "meta": {
           "id": "#12312123123"
       }, 
       "amount": 3421, 
       "description": "Something tasty"
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
     "_type": "hold", 
     "description": "Something tasty", 
     "expires_at": "2013-06-13T22:01:13.016270Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL4HeJ9o9p4OkZBR0dFJl1Hq", 
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
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-06T22:01:13.135432Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4HeJ9o9p4OkZBR0dFJl1Hq", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
       "card_type": "visa", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:00:05.933421Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL511-657-7188", 
     "_uris": {}, 
     "debit": null
   }

Retrieve a Hold
---------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id

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
     "_type": "hold", 
     "description": "Something tasty", 
     "expires_at": "2013-06-13T22:01:14.335584Z", 
     "is_void": false, 
     "meta": {
       "id": "#12312123123"
     }, 
     "id": "HL4II06Emht92Ovdb3MGoCJ8", 
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
     "fee": null, 
     "amount": 3421, 
     "created_at": "2013-06-06T22:01:14.447568Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4II06Emht92Ovdb3MGoCJ8", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
       "card_type": "visa", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:00:05.933421Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL673-200-3051", 
     "_uris": {}, 
     "debit": null
   }

List all Holds
--------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/holds

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
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds?limit=4&offset=0", 
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something tangy", 
         "_uris": {}, 
         "amount": 1322, 
         "created_at": "2013-06-06T22:01:17.235933Z", 
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
         "expires_at": "2013-06-13T22:01:17.134347Z", 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4LQOGreuEry0j3jbtItpcm", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:00:05.933421Z", 
           "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL933-474-8975", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL4LQOGreuEry0j3jbtItpcm"
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something spicy", 
         "_uris": {}, 
         "amount": 6754, 
         "created_at": "2013-06-06T22:01:16.710192Z", 
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
         "expires_at": "2013-06-13T22:01:16.577807Z", 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4Lg0WsouHizWLRR0jNky4o", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:00:05.933421Z", 
           "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL127-303-7076", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL4Lg0WsouHizWLRR0jNky4o"
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something sour", 
         "_uris": {}, 
         "amount": 3344, 
         "created_at": "2013-06-06T22:01:15.967522Z", 
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
         "expires_at": "2013-06-13T22:01:15.808140Z", 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4KqekkS8we0Vu7gtTWnBlS", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:00:05.933421Z", 
           "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL450-757-0123", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL4KqekkS8we0Vu7gtTWnBlS"
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
         "_type": "hold", 
         "fee": null, 
         "description": "Something sweet", 
         "_uris": {}, 
         "amount": 1233, 
         "created_at": "2013-06-06T22:01:15.433886Z", 
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
         "expires_at": "2013-06-13T22:01:15.325294Z", 
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4JPnPkVn94BDDzt8Br79Rt", 
         "source": {
           "security_code_check": "true", 
           "card_type": "visa", 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }
           }, 
           "brand": "Visa", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T22:00:05.933421Z", 
           "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "HL667-106-9522", 
         "meta": {}, 
         "is_void": false, 
         "debit": null, 
         "id": "HL4JPnPkVn94BDDzt8Br79Rt"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds?limit=4&offset=0", 
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
     "limit": 4, 
     "offset": 0, 
     "total": 20, 
     "next_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds?limit=4&offset=4", 
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds?limit=4&offset=16"
   }

Update a Hold
-------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id

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
       "_type": "hold", 
       "fee": null, 
       "description": "Something really tasty", 
       "created_at": "2013-06-06T22:01:18.510920+00:00Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:01:18.372920+00:00Z", 
       "transaction_number": "HL865-720-9670", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "the-address": "123 Fake Street"
       }, 
       "debit": null, 
       "id": "HL4NhWyKYssKP0xveXyQyoTd"
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
     "_type": "hold", 
     "description": "Something really tasty", 
     "expires_at": "2013-06-13T22:01:19.444804Z", 
     "is_void": false, 
     "meta": {
       "the-address": "123 Fake Street"
     }, 
     "id": "HL4OvqytZcbjqjAhjLBkBuei", 
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
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-06T22:01:19.601866Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4OvqytZcbjqjAhjLBkBuei", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
       "card_type": "visa", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:00:05.933421Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL062-952-6311", 
     "_uris": {}, 
     "debit": null
   }

Capture a Hold
--------------

Use ``hold_uri`` when `creating a debit <./debits.rst#create-a-debit>`_.

Request
~~~~~~~

Body
^^^^

.. code:: javascript

   {
       "hold_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4Q72qaTJ6FfZQAbBO8xZy0", 
       "description": null, 
       "source_uri": null, 
       "amount": null, 
       "merchant_uri": null, 
       "meta": {}, 
       "appears_on_statement_as": null, 
       "on_behalf_of_uri": null
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
     "status": "succeeded", 
     "_type": "debit", 
     "description": null, 
     "on_behalf_of": null, 
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "_type": "hold", 
       "fee": null, 
       "description": "Something sour", 
       "debit_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4R2tCbFMuaFd7bsUdZBxvq", 
       "created_at": "2013-06-06T22:01:21.027061Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:01:20.872447Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4Q72qaTJ6FfZQAbBO8xZy0", 
       "transaction_number": "HL104-010-2251", 
       "amount": 3344, 
       "_uris": {
         "debit_uri": {
           "_type": "debit", 
           "key": "debit"
         }, 
         "source_uri": {
           "_type": "card", 
           "key": "source"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "id": "HL4Q72qaTJ6FfZQAbBO8xZy0"
     }, 
     "id": "WD4R2tCbFMuaFd7bsUdZBxvq", 
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
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4R2tCbFMuaFd7bsUdZBxvq/refunds", 
     "amount": 3344, 
     "created_at": "2013-06-06T22:01:21.850761Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4R2tCbFMuaFd7bsUdZBxvq", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
       "card_type": "visa", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:00:05.933421Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W462-256-7096", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:01:21.517114Z"
   }

Void a Hold
------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/holds/:hold_id

Request
~~~~~~~

``is_void``
   *optional* **boolean**. Flag value, should be ``true`` or ``false``. Defaults to ``null``.

``appears_on_statement_as``
   *optional* **string**. Text that will appear on the buyer's statement. Characters that can be
   used are limited to:

   - ASCII letters (``a-z`` and ``A-Z``)
   - Digits (``0-9``)
   - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

   Any other characters will be rejected.


Body
^^^^

.. code:: javascript

   {
       "_type": "hold", 
       "fee": null, 
       "description": "Something sour", 
       "created_at": "2013-06-06T22:01:22.974265+00:00Z", 
       "is_void": true, 
       "expires_at": "2013-06-13T22:01:22.887038+00:00Z", 
       "transaction_number": "HL490-274-3579", 
       "amount": 3344, 
       "_uris": {}, 
       "meta": {
           "reason": "Customer request"
       }, 
       "debit": null, 
       "id": "HL4SjbZ6s1nGtLJhJ74BvaOj"
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
     "_type": "hold", 
     "description": "Something sour", 
     "expires_at": "2013-06-13T22:01:24.806341Z", 
     "is_void": true, 
     "meta": {
       "reason": "Customer request"
     }, 
     "id": "HL4UsKZljgoSB3xdhUxMGkD8", 
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
     "fee": null, 
     "amount": 3344, 
     "created_at": "2013-06-06T22:01:24.892995Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4UsKZljgoSB3xdhUxMGkD8", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "id": "CC3tEGO6Td4ANTrdllwvzMmK", 
       "card_type": "visa", 
       "is_valid": true, 
       "_uris": {
         "customer_uri": {
           "_type": "customer", 
           "key": "customer"
         }, 
         "account_uri": {
           "_type": "account", 
           "key": "account"
         }
       }, 
       "meta": {}, 
       "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T22:00:05.933421Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "HL472-618-3818", 
     "_uris": {}, 
     "debit": null
   }

