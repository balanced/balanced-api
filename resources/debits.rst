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
       "on_behalf_of_uri": "v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504"
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/transactions", 
       "created_at": "2013-06-06T20:37:17.621572Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/refunds", 
       "customer_uri": "/v1/customers/AC6QsguYqDOlly6X1OltA504", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/debits", 
       "email_address": null, 
       "id": "AC6QsguYqDOlly6X1OltA504", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6QsguYqDOlly6X1OltA504/cards"
     }, 
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD97IvDS2Q3ifDgQVXBKieW", 
       "created_at": "2013-06-06T20:38:17.876482Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T20:38:17.162801Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HL99GgP1KyNX3jyF0r5t2JM", 
       "transaction_number": "HL300-555-5034", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "HL99GgP1KyNX3jyF0r5t2JM"
     }, 
     "id": "WD97IvDS2Q3ifDgQVXBKieW", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
       "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
       "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:36:56.751062Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
       "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
       "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
       "created_at": "2013-06-06T20:36:56.502056Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
       "email_address": null, 
       "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD97IvDS2Q3ifDgQVXBKieW/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T20:38:17.848559Z", 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WD97IvDS2Q3ifDgQVXBKieW", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "CC7ci8uopveqNjOYwe4hgB2M", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T20:37:37.036245Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W167-613-4915", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T20:38:17.612787Z"
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
       "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDbfqAuFWNwqzzWNd3Na6HK", 
       "created_at": "2013-06-06T20:38:19.750662Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T20:38:19.091116Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLbgHoz9zBtR50Q5N4L4BxK", 
       "transaction_number": "HL777-279-9112", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "HLbgHoz9zBtR50Q5N4L4BxK"
     }, 
     "id": "WDbfqAuFWNwqzzWNd3Na6HK", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
       "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
       "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:36:56.751062Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
       "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
       "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
       "created_at": "2013-06-06T20:36:56.502056Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
       "email_address": null, 
       "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDbfqAuFWNwqzzWNd3Na6HK/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T20:38:19.732943Z", 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDbfqAuFWNwqzzWNd3Na6HK", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "CC7ci8uopveqNjOYwe4hgB2M", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T20:37:37.036245Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W410-754-9168", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T20:38:19.477718Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
           "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
           "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T20:36:56.751062Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
           "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
           "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDeJUtbPrzuTFC5VjX7Le7o/refunds", 
         "amount": 431, 
         "created_at": "2013-06-06T20:38:22.835392Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T20:36:56.502056Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
           "email_address": null, 
           "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDeJUtbPrzuTFC5VjX7Le7o", 
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
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T20:37:37.036245Z", 
           "id": "CC7ci8uopveqNjOYwe4hgB2M", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W189-955-0065", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDeJUtbPrzuTFC5VjX7Le7o", 
           "amount": 431, 
           "created_at": "2013-06-06T20:38:22.873070Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLeMyBi3K9MaIRvsIssmlRw", 
           "expires_at": "2013-06-13T20:38:22.239284Z", 
           "id": "HLeMyBi3K9MaIRvsIssmlRw", 
           "transaction_number": "HL197-149-6735", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M"
         }, 
         "id": "WDeJUtbPrzuTFC5VjX7Le7o", 
         "available_at": "2013-06-06T20:38:22.613926Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
           "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
           "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T20:36:56.751062Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
           "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
           "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDdpSIWLjHr6Xf0ALmgWBW0/refunds", 
         "amount": 1254, 
         "created_at": "2013-06-06T20:38:21.660860Z", 
         "account": {
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T20:36:56.502056Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
           "email_address": null, 
           "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDdpSIWLjHr6Xf0ALmgWBW0", 
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
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T20:37:37.036245Z", 
           "id": "CC7ci8uopveqNjOYwe4hgB2M", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W256-905-4207", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDdpSIWLjHr6Xf0ALmgWBW0", 
           "amount": 1254, 
           "created_at": "2013-06-06T20:38:21.676971Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLdr1JIECMn6dwB7elgwo4o", 
           "expires_at": "2013-06-13T20:38:21.082922Z", 
           "id": "HLdr1JIECMn6dwB7elgwo4o", 
           "transaction_number": "HL726-321-6921", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M"
         }, 
         "id": "WDdpSIWLjHr6Xf0ALmgWBW0", 
         "available_at": "2013-06-06T20:38:21.441904Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits?limit=2&offset=4"
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
       "transaction_number": "W293-176-0759", 
       "created_at": "2013-06-06T20:38:25.319734+00:00Z", 
       "on_behalf_of": null, 
       "refunds_uri": "v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDhx9BhzcvrdGRPBSf9zGj0/refunds", 
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
       "id": "WDhx9BhzcvrdGRPBSf9zGj0", 
       "available_at": "2013-06-06T20:38:24.979416+00:00Z"
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
       "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDkar7bp0Ix9ssPnxpHx0qY", 
       "created_at": "2013-06-06T20:38:27.669565Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T20:38:26.791066Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLkaUc6LJPF6hpsSZc16JmE", 
       "transaction_number": "HL049-156-8360", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "HLkaUc6LJPF6hpsSZc16JmE"
     }, 
     "id": "WDkar7bp0Ix9ssPnxpHx0qY", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
       "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
       "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:36:56.751062Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
       "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
       "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
       "created_at": "2013-06-06T20:36:56.502056Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
       "email_address": null, 
       "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDkar7bp0Ix9ssPnxpHx0qY/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T20:38:27.663077Z", 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDkar7bp0Ix9ssPnxpHx0qY", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "id": "CC7ci8uopveqNjOYwe4hgB2M", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T20:37:37.036245Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W390-461-2776", 
     "meta": {
       "my-id": "0987654321"
     }, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T20:38:27.245820Z"
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
       "id": "CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "bank_accounts_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/credits", 
       "cards_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/cards", 
       "holds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T20:36:56.751062Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "refunds_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/refunds", 
       "debits_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/debits", 
       "transactions_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T20:38:33.831521Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
       "created_at": "2013-06-06T20:36:56.502056Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/refunds", 
       "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/debits", 
       "email_address": null, 
       "id": "AC6sHXqdPI8b7OZ9P70WNCuX", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/refunds/RFr6XT5vHI7V0s0JQk3Cw3R", 
     "transaction_number": "RF099-446-6719", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/holds/HLqcddnu6UCH6j75CEa4l5u", 
       "customer_uri": "/v1/customers/CU6sZjXZ66fPuIjBJjdGx0Gb", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC7ci8uopveqNjOYwe4hgB2M", 
       "created_at": "2013-06-06T20:38:33.017904Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDqbOf6rKZ0H1MYnNORvsog", 
       "status": "succeeded", 
       "transaction_number": "W603-601-0360", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/debits/WDqbOf6rKZ0H1MYnNORvsog/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
       "appears_on_statement_as": "example.com", 
       "id": "WDqbOf6rKZ0H1MYnNORvsog", 
       "available_at": "2013-06-06T20:38:32.692846Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RFr6XT5vHI7V0s0JQk3Cw3R"
   }

