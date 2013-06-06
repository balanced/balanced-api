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
       "on_behalf_of_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr"
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/holds", 
       "name": "William James", 
       "roles": [
         "merchant"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/transactions", 
       "created_at": "2013-06-06T23:15:21.686412Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/refunds", 
       "customer_uri": "/v1/customers/AC7tYY6I2HACOAiftgFo4oCr", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/debits", 
       "email_address": null, 
       "id": "AC7tYY6I2HACOAiftgFo4oCr", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC7tYY6I2HACOAiftgFo4oCr/cards"
     }, 
     "_uris": {
       "refunds_uri": {
         "_type": "page", 
         "key": "refunds"
       }
     }, 
     "hold": {
       "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDFMgvuPCAnC9sTl66qTq7J", 
       "created_at": "2013-06-06T23:16:15.807749Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T23:16:15.199970Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HLFMXXXY3pJUu2o7xcAjqWj", 
       "transaction_number": "HL787-852-3867", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "HLFMXXXY3pJUu2o7xcAjqWj"
     }, 
     "id": "WDFMgvuPCAnC9sTl66qTq7J", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU74SnDBcVISAI37kzTFU2yQ", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
       "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
       "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:14:59.370052Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
       "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
       "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDFMgvuPCAnC9sTl66qTq7J/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T23:16:15.797919Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDFMgvuPCAnC9sTl66qTq7J", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "CC6d1n4vID0GHQvPo8To1eU", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:15:44.176785Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W599-115-6289", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:16:15.573740Z"
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
       "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDHGvVlYom1E82PiCAoWijk", 
       "created_at": "2013-06-06T23:16:17.529676Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T23:16:16.915659Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HLHIsRkQqtxZ5I5ShhBa8uy", 
       "transaction_number": "HL299-280-4272", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "HLHIsRkQqtxZ5I5ShhBa8uy"
     }, 
     "id": "WDHGvVlYom1E82PiCAoWijk", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU74SnDBcVISAI37kzTFU2yQ", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
       "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
       "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:14:59.370052Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
       "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
       "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDHGvVlYom1E82PiCAoWijk/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T23:16:17.502050Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDHGvVlYom1E82PiCAoWijk", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "CC6d1n4vID0GHQvPo8To1eU", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:15:44.176785Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W260-920-4920", 
     "meta": {}, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:16:17.299425Z"
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
     "first_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits?limit=2&offset=0", 
     "_type": "page", 
     "items": [
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU74SnDBcVISAI37kzTFU2yQ", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
           "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
           "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:14:59.370052Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
           "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
           "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDL54YOzkQtLnj1fe0LAyis/refunds", 
         "amount": 431, 
         "created_at": "2013-06-06T23:16:20.516505Z", 
         "account": {
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
           "email_address": null, 
           "id": "AC74u3FlUdGRzoRVqobCvhfW", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDL54YOzkQtLnj1fe0LAyis", 
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
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T23:15:44.176785Z", 
           "id": "CC6d1n4vID0GHQvPo8To1eU", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W594-649-9864", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDL54YOzkQtLnj1fe0LAyis", 
           "amount": 431, 
           "created_at": "2013-06-06T23:16:20.557651Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HLL7Y3j4QnClxcXtkkcu8Zq", 
           "expires_at": "2013-06-13T23:16:19.846347Z", 
           "id": "HLL7Y3j4QnClxcXtkkcu8Zq", 
           "transaction_number": "HL491-934-3690", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU"
         }, 
         "id": "WDL54YOzkQtLnj1fe0LAyis", 
         "available_at": "2013-06-06T23:16:20.252313Z"
       }, 
       {
         "customer": {
           "twitter": null, 
           "meta": {}, 
           "id": "CU74SnDBcVISAI37kzTFU2yQ", 
           "email": null, 
           "_type": "customer", 
           "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
           "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
           "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
           "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
           "name": null, 
           "dob": null, 
           "created_at": "2013-06-06T23:14:59.370052Z", 
           "is_identity_verified": false, 
           "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
           "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
           "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
           "ssn_last4": null, 
           "ein": null
         }, 
         "status": "succeeded", 
         "_type": "debit", 
         "fee": null, 
         "description": null, 
         "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDJLRUXtFajGVnl8dCO83pI/refunds", 
         "amount": 1254, 
         "created_at": "2013-06-06T23:16:19.356901Z", 
         "account": {
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "_type": "account", 
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
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
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
           "email_address": null, 
           "id": "AC74u3FlUdGRzoRVqobCvhfW", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
         }, 
         "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDJLRUXtFajGVnl8dCO83pI", 
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
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
           "expiration_month": 4, 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "last_four": "1111", 
           "postal_code": "10023", 
           "created_at": "2013-06-06T23:15:44.176785Z", 
           "id": "CC6d1n4vID0GHQvPo8To1eU", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "transaction_number": "W583-185-8222", 
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
           "debit_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDJLRUXtFajGVnl8dCO83pI", 
           "amount": 1254, 
           "created_at": "2013-06-06T23:16:19.386158Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HLJNVpjcjkydVBjTIGUN5hY", 
           "expires_at": "2013-06-13T23:16:18.755133Z", 
           "id": "HLJNVpjcjkydVBjTIGUN5hY", 
           "transaction_number": "HL405-605-3749", 
           "is_void": false, 
           "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU"
         }, 
         "id": "WDJLRUXtFajGVnl8dCO83pI", 
         "available_at": "2013-06-06T23:16:19.093383Z"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits?limit=2&offset=0", 
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
     "next_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits?limit=2&offset=2", 
     "last_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits?limit=2&offset=4"
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
       "transaction_number": "W426-308-8990", 
       "created_at": "2013-06-06T23:16:23.246249+00:00Z", 
       "on_behalf_of": null, 
       "refunds_uri": "v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDO9fwDvqRqKx2EVU1337iU/refunds", 
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
       "id": "WDO9fwDvqRqKx2EVU1337iU", 
       "available_at": "2013-06-06T23:16:22.763414+00:00Z"
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
       "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "_type": "hold", 
       "fee": null, 
       "description": null, 
       "debit_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDQmKq1jLd0gVaVt1xiwIZV", 
       "created_at": "2013-06-06T23:16:25.239038Z", 
       "is_void": false, 
       "expires_at": "2013-06-13T23:16:24.517072Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HLQoDmAA7m3Z8WWZSY0ITPp", 
       "transaction_number": "HL117-690-3846", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "HLQoDmAA7m3Z8WWZSY0ITPp"
     }, 
     "id": "WDQmKq1jLd0gVaVt1xiwIZV", 
     "customer": {
       "twitter": null, 
       "meta": {}, 
       "id": "CU74SnDBcVISAI37kzTFU2yQ", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
       "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
       "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:14:59.370052Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
       "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
       "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "fee": null, 
     "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDQmKq1jLd0gVaVt1xiwIZV/refunds", 
     "amount": 1254, 
     "created_at": "2013-06-06T23:16:25.212234Z", 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDQmKq1jLd0gVaVt1xiwIZV", 
     "source": {
       "security_code_check": "true", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "_type": "card", 
       "postal_code_check": "true", 
       "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
       "last_four": "1111", 
       "expiration_year": 2014, 
       "brand": "Visa", 
       "expiration_month": 4, 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "id": "CC6d1n4vID0GHQvPo8To1eU", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "country_code": "USA", 
       "postal_code": "10023", 
       "created_at": "2013-06-06T23:15:44.176785Z", 
       "street_address": "167 West 74th Street", 
       "name": "Benny Riemann"
     }, 
     "transaction_number": "W768-219-9248", 
     "meta": {
       "my-id": "0987654321"
     }, 
     "appears_on_statement_as": "example.com", 
     "available_at": "2013-06-06T23:16:24.851570Z"
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
       "id": "CU74SnDBcVISAI37kzTFU2yQ", 
       "email": null, 
       "_type": "customer", 
       "source_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "bank_accounts_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/bank_accounts", 
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
       "credits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/credits", 
       "cards_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/cards", 
       "holds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/holds", 
       "name": null, 
       "dob": null, 
       "created_at": "2013-06-06T23:14:59.370052Z", 
       "is_identity_verified": false, 
       "uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "refunds_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/refunds", 
       "debits_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/debits", 
       "transactions_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ/transactions", 
       "ssn_last4": null, 
       "ein": null
     }, 
     "_type": "refund", 
     "fee": null, 
     "description": null, 
     "amount": 1254, 
     "created_at": "2013-06-06T23:16:30.659610Z", 
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
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
       "name": "Benny Riemann", 
       "roles": [
         "buyer"
       ], 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
       "created_at": "2013-06-06T23:14:59.021264Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/refunds", 
       "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
       "meta": {}, 
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/debits", 
       "email_address": null, 
       "id": "AC74u3FlUdGRzoRVqobCvhfW", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards"
     }, 
     "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/refunds/RFWudbj9w8MllomQFwUMYsM", 
     "transaction_number": "RF250-041-2079", 
     "_uris": {}, 
     "meta": {}, 
     "debit": {
       "hold_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/holds/HLVmpgKUlFzbISsMAAX5Fw3", 
       "customer_uri": "/v1/customers/CU74SnDBcVISAI37kzTFU2yQ", 
       "_type": "debit", 
       "fee": null, 
       "description": null, 
       "source_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC6d1n4vID0GHQvPo8To1eU", 
       "created_at": "2013-06-06T23:16:29.597538Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDViyd1HNBFjMGgHRDSUSth", 
       "status": "succeeded", 
       "transaction_number": "W671-534-6290", 
       "on_behalf_of_uri": null, 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/debits/WDViyd1HNBFjMGgHRDSUSth/refunds", 
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
       "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
       "appears_on_statement_as": "example.com", 
       "id": "WDViyd1HNBFjMGgHRDSUSth", 
       "available_at": "2013-06-06T23:16:29.380069Z"
     }, 
     "appears_on_statement_as": "example.com", 
     "id": "RFWudbj9w8MllomQFwUMYsM"
   }

