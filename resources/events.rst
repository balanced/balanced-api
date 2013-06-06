Events
=======

.. _events:

You can configure events to be published via a ``POST`` to the endpoint of
your choice via callbacks. Once configured, events are accessible via the
events endpoint.

- `Retrieve an Event`_
- `List all Events`_

Fields
------

``entity``
   **string**. Snapshot of the resource associated with this event at the time it
   occurred.

``id``
   **string**.

``occurred_at``
   **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
   event occurred.

``type``
   **string**. All resources (accounts, holds, credits, etc) are evented. The format of
   the type field is ``resource.event_type`` where ``event_type`` is one of
   ``created``, ``updated``, ``deleted``, as well as some transaction
   specific event types ``succeeded``, ``failed``, and ``canceled``.

   account.created
      Occurs whenever a new account is created.
   
   account.updated
      Occurs whenever an account is updated.
   
   credit.canceled
      Occurs whenever a credit is canceled.
   
   credit.created
      Occurs whenever a new credit is created.
   
   credit.failed
      Occurs whenever a credit is rejected.
   
   credit.succeeded
      Occurs whenever a credit is successfully captured or deposited.
   
   credit.updated
      Occurs whenever a credit is updated.
   
   debit.canceled
      Occurs whenever a debit is canceled.
   
   debit.created
      Occurs whenever a new debit is created.
   
   debit.failed
      Occurs whenever a debit is rejected.
   
   debit.succeeded
      Occurs whenever a debit is successfully captured or withdrawn.
   
   debit.updated
      Occurs whenever a debit is updated.
   
   hold.captured
      Occurs whenever a hold is captured.
   
   hold.created
      Occurs whenever a new hold is created.
   
   hold.updated
      Occurs whenever a hold is updated.
   
   hold.voided
      Occurs whenever a hold is voided.
   
   refund.canceled
      Occurs whenever a refund is canceled.
   
   refund.created
      Occurs whenever a new refund is created.
   
   refund.failed
      Occurs whenever a refund is rejected.
   
   refund.succeeded
      Occurs whenever a refund is successfully captured or deposited.
   
   refund.updated
      Occurs whenever a refund is updated.
   
``uri``
   **string**.

Retrieve an Event
-----------------

.. code::


   GET /v1/events/:event_id


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "_type": "event", 
     "occurred_at": "2013-06-06T23:14:57.822000Z", 
     "uri": "/v1/events/EVe7aa3f72cefe11e2ad6c026ba7d31e6f", 
     "entity": {
       "customer_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn", 
       "_type": "account", 
       "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/transactions", 
       "name": "William Henry Cavendish III", 
       "roles": [
         "merchant", 
         "buyer"
       ], 
       "created_at": "2013-06-06T23:14:57.822657Z", 
       "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/refunds", 
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
       "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/debits", 
       "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/holds", 
       "email_address": "whc@example.org", 
       "id": "AC738T1zFtWV7uxzgchCPDSn", 
       "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/cards"
     }, 
     "_uris": {
       "callbacks_uri": {
         "_type": "page", 
         "key": "callbacks"
       }
     }, 
     "callbacks_uri": "/v1/events/EVe7aa3f72cefe11e2ad6c026ba7d31e6f/callbacks", 
     "callback_statuses": {
       "failed": 0, 
       "retrying": 0, 
       "succeeded": 0, 
       "pending": 0
     }, 
     "type": "account.created", 
     "id": "EVe7aa3f72cefe11e2ad6c026ba7d31e6f"
   }

List all Events
---------------

.. code::


   GET /v1/events

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
     "first_uri": "/v1/events?limit=7&offset=0", 
     "_type": "page", 
     "items": [
       {
         "callbacks_uri": "/v1/events/EVe7aa3f72cefe11e2ad6c026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:14:57.822000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVe7aa3f72cefe11e2ad6c026ba7d31e6f", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
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
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/transactions", 
           "name": "William Henry Cavendish III", 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:57.822657Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/refunds", 
           "customer_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/debits", 
           "email_address": "whc@example.org", 
           "id": "AC738T1zFtWV7uxzgchCPDSn", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/cards"
         }, 
         "type": "account.created", 
         "id": "EVe7aa3f72cefe11e2ad6c026ba7d31e6f"
       }, 
       {
         "callbacks_uri": "/v1/events/EVe7d70d22cefe11e2ad6c026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:14:58.116000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVe7d70d22cefe11e2ad6c026ba7d31e6f", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
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
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tlmYDK7tMnmMcEz4j60f/transactions", 
           "name": null, 
           "roles": [], 
           "created_at": "2013-06-06T23:14:58.116138Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tlmYDK7tMnmMcEz4j60f", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tlmYDK7tMnmMcEz4j60f/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tlmYDK7tMnmMcEz4j60f/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tlmYDK7tMnmMcEz4j60f/refunds", 
           "customer_uri": "/v1/customers/AC73tlmYDK7tMnmMcEz4j60f", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tlmYDK7tMnmMcEz4j60f/debits", 
           "email_address": "escrow@poundpay.com", 
           "id": "AC73tlmYDK7tMnmMcEz4j60f", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tlmYDK7tMnmMcEz4j60f/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tlmYDK7tMnmMcEz4j60f/cards"
         }, 
         "type": "account.created", 
         "id": "EVe7d70d22cefe11e2ad6c026ba7d31e6f"
       }, 
       {
         "callbacks_uri": "/v1/events/EVe7d71218cefe11e2ad6c026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:14:58.117000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVe7d71218cefe11e2ad6c026ba7d31e6f", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
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
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tqZIlb2GVeLzP7r09dHV/transactions", 
           "name": null, 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:58.117284Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tqZIlb2GVeLzP7r09dHV", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tqZIlb2GVeLzP7r09dHV/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tqZIlb2GVeLzP7r09dHV/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tqZIlb2GVeLzP7r09dHV/refunds", 
           "customer_uri": "/v1/customers/AC73tqZIlb2GVeLzP7r09dHV", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tqZIlb2GVeLzP7r09dHV/debits", 
           "email_address": "fee@poundpay.com", 
           "id": "AC73tqZIlb2GVeLzP7r09dHV", 
           "credits_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tqZIlb2GVeLzP7r09dHV/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC73tqZIlb2GVeLzP7r09dHV/cards"
         }, 
         "type": "account.created", 
         "id": "EVe7d71218cefe11e2ad6c026ba7d31e6f"
       }, 
       {
         "callbacks_uri": "/v1/events/EVe7d973e6cefe11e2ad6c026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:14:58.120000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVe7d973e6cefe11e2ad6c026ba7d31e6f", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
           "routing_number": "121042882", 
           "bank_name": "WELLS FARGO BANK NA", 
           "_type": "bank_account", 
           "name": "TEST-MERCHANT-BANK-ACCOUNT", 
           "_uris": {
             "credits_uri": {
               "_type": "page", 
               "key": "credits"
             }, 
             "customer_uri": {
               "_type": "customer", 
               "key": "customer"
             }, 
             "account_uri": {
               "_type": "account", 
               "key": "account"
             }, 
             "verifications_uri": {
               "_type": "page", 
               "key": "verifications"
             }
           }, 
           "bank_code": "121042882", 
           "can_debit": true, 
           "created_at": "2013-06-06T23:14:58.120076Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn/bank_accounts/BA73txY5gdJpzx1YQ6FYhnaf", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC738T1zFtWV7uxzgchCPDSn", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC738T1zFtWV7uxzgchCPDSn", 
           "last_four": "5555", 
           "fingerprint": "6ybvaLUrJy07phK2EQ7pVk", 
           "credits_uri": "/v1/bank_accounts/BA73txY5gdJpzx1YQ6FYhnaf/credits", 
           "type": "CHECKING", 
           "id": "BA73txY5gdJpzx1YQ6FYhnaf", 
           "verifications_uri": "/v1/bank_accounts/BA73txY5gdJpzx1YQ6FYhnaf/verifications", 
           "account_number": "xxxxxxxxxxx5555"
         }, 
         "type": "bank_account.created", 
         "id": "EVe7d973e6cefe11e2ad6c026ba7d31e6f"
       }, 
       {
         "callbacks_uri": "/v1/events/EVe84bcaeacefe11e2baef026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:14:58.853000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVe84bcaeacefe11e2baef026ba7d31e6f", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
           "security_code_check": "true", 
           "customer_uri": null, 
           "_type": "card", 
           "postal_code_check": "true", 
           "hash": "bd1c247d10c71b3134056f83165826241115d8e55fc107d303eeab955338eba2", 
           "country_code": "USA", 
           "expiration_year": 2014, 
           "_uris": {}, 
           "created_at": "2013-06-06T23:14:58.853271Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/cards/CC74iJVEpJNENSBhnXmT6UAn", 
           "id": "CC74iJVEpJNENSBhnXmT6UAn", 
           "expiration_month": 4, 
           "is_valid": true, 
           "meta": {}, 
           "postal_code": "10023", 
           "account_uri": null, 
           "last_four": "1111", 
           "card_type": "VISA", 
           "brand": "Visa", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "type": "card.created", 
         "id": "EVe84bcaeacefe11e2baef026ba7d31e6f"
       }, 
       {
         "callbacks_uri": "/v1/events/EVe8622e3ecefe11e29e1c026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:14:59.353000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVe8622e3ecefe11e29e1c026ba7f8ec28", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
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
           "transactions_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:14:59.021264Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "holds_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/holds", 
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
         "type": "account.created", 
         "id": "EVe8622e3ecefe11e29e1c026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EVe8946430cefe11e29e1c026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:14:59.355000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVe8946430cefe11e29e1c026ba7f8ec28", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
           "security_code_check": "true", 
           "customer_uri": "/v1/customers/AC74u3FlUdGRzoRVqobCvhfW", 
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
           "created_at": "2013-06-06T23:14:58.853271Z", 
           "uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW/cards/CC74iJVEpJNENSBhnXmT6UAn", 
           "id": "CC74iJVEpJNENSBhnXmT6UAn", 
           "expiration_month": 4, 
           "is_valid": true, 
           "meta": {}, 
           "postal_code": "10023", 
           "account_uri": "/v1/marketplaces/TEST-MP738sc2kLMj13HBpCsn4Dcr/accounts/AC74u3FlUdGRzoRVqobCvhfW", 
           "last_four": "1111", 
           "card_type": "VISA", 
           "brand": "Visa", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "type": "card.updated", 
         "id": "EVe8946430cefe11e29e1c026ba7f8ec28"
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/events?limit=7&offset=0", 
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
     "limit": 7, 
     "offset": 0, 
     "total": 221, 
     "next_uri": "/v1/events?limit=7&offset=7", 
     "last_uri": "/v1/events?limit=7&offset=217"
   }

