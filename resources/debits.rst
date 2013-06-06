Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_
- `Refund a Debit`_

Fields
------

``account_email_address``
   **object**.

``account_name``
   **object**.

``amount``
   **integer**. The amount of the debit.

``appears_on_statement_as``
   **string**. The text that will appear on the buyer's statement.

``available_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   transaction is guaranteed to clear.

``created_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   debit was created.

``description``
   **string**. Free-text description of the debit.

``hold``
   **object**. The original hold for this debit, if this debit was to a card.
   If the debit was to a bank account, this field will be null.

``id``
   **string**.

``meta``
   **key-value**. A single-level dictionary of string-type key/value pairs.

``refunds_uri``
   **string**. URI for any partial or complete refunds of this debit.

``source``
   **object**. The funding source (card or bank account) for this debit.

``status``
   **string**. One of ``pending``, ``charged``, ``failed``.

``transaction_number``
   **string**. An identifier for this transaction.

``uri``
   **string**. The URI of the debit.

Deprecated
~~~~~~~~~~

Debit an Account
----------------

.. code::


   POST /v1/marketplaces/:marketplace_id/accounts/:account_id/debits

Request
~~~~~~~

``on_behalf_of_uri``
   *optional* **string**. A customer or the account of a merchant, usually a seller or service
   provider, that is associated with this card charge or bank account
   debit.

``amount``
   *optional* **integer**. If the resolving URI references a hold then this is hold amount. You can
   always capture less than the hold amount (e.g. a partial capture).
   Otherwise its the maximum per debit amount for your marketplace. If the resolving URI references a hold then the default ``amount``
   is the ``amount`` associated with that hold. Otherwise no default
   is provided and this field is **required**.

``appears_on_statement_as``
   *optional* **string**. Text that will appear on the buyer's statement. Characters that can be
   used are limited to:

   - ASCII letters (``a-z`` and ``A-Z``)
   - Digits (``0-9``)
   - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

   Any other characters will be rejected.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``description``
   *optional* **string**. Defaults to ``null``.

``customer_uri``
   *optional* **string**.

``hold_uri``
   *optional* **string**. If no ``hold`` is provided one my be generated and captured if the
   funding source is a card. If the resolved URI references a ``hold`` it will be used. Otherwise
   defaults to ``null``.

``source_uri``
   *optional* **string**. URI of a specific bank account or card to be debited.

``bank_account_uri``
   *optional* **string**. **Deprecated**
   This field is deprecated in favour of ``source_uri``.


Body
^^^^

.. code:: javascript

   {
       "hold_uri": null, 
       "description": null, 
       "source_uri": null, 
       "amount": 1254, 
       "merchant_uri": null, 
       "meta": {}, 
       "appears_on_statement_as": null, 
       "on_behalf_of_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg"
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
     "on_behalf_of": {
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
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/transactions", 
       "created_at": "2013-06-06T21:59:46.286553Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/refunds", 
       "customer_uri": "/v1/customers/AC37yiAn5M6zGCC30kJX3whg", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/debits", 
       "email_address": null, 
       "id": "AC37yiAn5M6zGCC30kJX3whg", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC37yiAn5M6zGCC30kJX3whg/cards"
     }, 
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
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4dgOHieJEf1fyGI3Sfm8p1", 
       "created_at": "2013-06-06T22:00:46.518539Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:00:45.670691Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4dj1ZR8k3UbRY8oSykcftd", 
       "transaction_number": "HL623-783-7928", 
       "amount": 1254, 
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
       "id": "HL4dj1ZR8k3UbRY8oSykcftd"
     }, 
     "id": "WD4dgOHieJEf1fyGI3Sfm8p1", 
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
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4dgOHieJEf1fyGI3Sfm8p1/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T22:00:46.487591Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4dgOHieJEf1fyGI3Sfm8p1", 
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
     "transaction_number": "W650-698-9348", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:00:46.206312Z"
   }

Retrieve a Debit
----------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id

Request
~~~~~~~


Headers
^^^^^^^

.. code::

   Status: 200 OK


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
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4goCCIVRhbsTohbdp5S7X0", 
       "created_at": "2013-06-06T22:00:49.304236Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:00:48.542041Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4gqH4jw3WuepyTlPTQUgey", 
       "transaction_number": "HL260-649-7152", 
       "amount": 1254, 
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
       "id": "HL4gqH4jw3WuepyTlPTQUgey"
     }, 
     "id": "WD4goCCIVRhbsTohbdp5S7X0", 
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
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4goCCIVRhbsTohbdp5S7X0/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T22:00:49.274794Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4goCCIVRhbsTohbdp5S7X0", 
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
     "transaction_number": "W187-556-0702", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:00:49.012371Z"
   }

List All Debits
---------------

.. code::


   GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits

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
     "first_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits?limit=2&offset=0", 
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
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4jLFkZVGPHaGxz2hbme612/refunds", 
         "amount": 431, 
         "created_at": "2013-06-06T22:00:52.269118Z", 
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
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4jLFkZVGPHaGxz2hbme612", 
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
         "transaction_number": "W014-948-7776", 
         "_uris": {
           "refunds_uri": {
             "_type": "page", 
             "key": "refunds"
           }
         }, 
         "meta": {}, 
         "on_behalf_of": null, 
         "appears_on_statement_as": "example.com", 
         "hold": {
           "_type": "hold", 
           "fee": null, 
           "description": null, 
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
           "debit_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4jLFkZVGPHaGxz2hbme612", 
           "amount": 431, 
           "created_at": "2013-06-06T22:00:52.289003Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4jN45u36we4FzRaPPMwRVC", 
           "expires_at": "2013-06-13T22:00:51.546942Z", 
           "id": "HL4jN45u36we4FzRaPPMwRVC", 
           "transaction_number": "HL643-035-5850", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK"
         }, 
         "id": "WD4jLFkZVGPHaGxz2hbme612", 
         "available_at": "2013-06-06T22:00:51.986998Z"
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
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4irHwpNH36Ajbk4be4sXh5/refunds", 
         "amount": 1254, 
         "created_at": "2013-06-06T22:00:51.088584Z", 
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
         "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4irHwpNH36Ajbk4be4sXh5", 
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
         "transaction_number": "W739-187-1651", 
         "_uris": {
           "refunds_uri": {
             "_type": "page", 
             "key": "refunds"
           }
         }, 
         "meta": {}, 
         "on_behalf_of": null, 
         "appears_on_statement_as": "example.com", 
         "hold": {
           "_type": "hold", 
           "fee": null, 
           "description": null, 
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
           "debit_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4irHwpNH36Ajbk4be4sXh5", 
           "amount": 1254, 
           "created_at": "2013-06-06T22:00:51.105034Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4isRM7qHOlOM3vaUS7Wgq3", 
           "expires_at": "2013-06-13T22:00:50.535360Z", 
           "id": "HL4isRM7qHOlOM3vaUS7Wgq3", 
           "transaction_number": "HL885-455-1063", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK"
         }, 
         "id": "WD4irHwpNH36Ajbk4be4sXh5", 
         "available_at": "2013-06-06T22:00:50.891173Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits?limit=2&offset=0", 
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
     "total": 6, 
     "next_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits?limit=2&offset=4"
   }

Update a Debit
--------------

.. code::


   PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id

Request
~~~~~~~

``on_behalf_of_uri``
   *optional* **string**. A customer or the account of a merchant, usually a seller or service
   provider, that is associated with this card charge or bank account
   debit.

``merchant_uri``
   *optional* **string**. **Deprecated** The account of a merchant, usually a seller or service
   provider, that is associated with this card charge or bank account
   debit. Deprecated in favour of ``on_behalf_of_uri``.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values.

``description``
   *optional* **string**.


Body
^^^^

.. code:: javascript

   {
       "status": "succeeded", 
       "_type": "debit", 
       "fee": null, 
       "description": "my new description", 
       "transaction_number": "W102-937-8902", 
       "created_at": "2013-06-06T22:00:54.320477+00:00Z", 
       "on_behalf_of": null, 
       "refunds_uri": "v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4m4QEcc5O3Zjrl8Qu91awG/refunds", 
       "amount": 1254, 
       "_uris": {
           "refunds_uri": {
               "_type": "page", 
               "key": "refunds"
           }
       }, 
       "meta": {
           "my-id": "0987654321"
       }, 
       "appears_on_statement_as": "example.com", 
       "id": "WD4m4QEcc5O3Zjrl8Qu91awG", 
       "available_at": "2013-06-06T22:00:54.043401+00:00Z"
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
     "status": "succeeded", 
     "_type": "debit", 
     "description": "my new description", 
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
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4opfBfC7d9Vprkie0w32qk", 
       "created_at": "2013-06-06T22:00:56.421931Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T22:00:55.709020Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4orfQ1CPJBxJaFNxOQgvS0", 
       "transaction_number": "HL466-535-7280", 
       "amount": 1254, 
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
       "id": "HL4orfQ1CPJBxJaFNxOQgvS0"
     }, 
     "id": "WD4opfBfC7d9Vprkie0w32qk", 
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
     "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4opfBfC7d9Vprkie0w32qk/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T22:00:56.393574Z", 
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4opfBfC7d9Vprkie0w32qk", 
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
     "transaction_number": "W573-339-3911", 
     "meta": {
       "my-id": "0987654321"
     }, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T22:00:56.062745Z"
   }

Refund a Debit
--------------

.. code::


   POST /v1/marketplaces/:marketplace_id/debits/:debit_id/refunds

Request
~~~~~~~

``amount``
   *optional* **integer**. Defaults to ``null``.

``description``
   *optional* **string**.

``meta``
   *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.


Body
^^^^

.. code:: javascript

   {}

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
     "created_at": "2013-06-06T22:01:01.840694Z", 
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
     "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/refunds/RF4ux6Z6k8ro1TIJGFH9EX8s", 
     "transaction_number": "RF350-091-3262", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/holds/HL4tqsuwbw0kJaoN5ijqOm5N", 
       "customer_uri": "/v1/customers/CU2IyYbAGFklvoPZhFbT5TQc", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC3tEGO6Td4ANTrdllwvzMmK", 
       "created_at": "2013-06-06T22:01:00.825082Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4toEkGtJutfiCbwC0x4nrp", 
       "status": "succeeded", 
       "transaction_number": "W572-949-8223", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/debits/WD4toEkGtJutfiCbwC0x4nrp/refunds", 
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
       "id": "WD4toEkGtJutfiCbwC0x4nrp", 
       "available_at": "2013-06-06T22:01:00.594373Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RF4ux6Z6k8ro1TIJGFH9EX8s"
   }

