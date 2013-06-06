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
     "occurred_at": "2013-06-06T20:36:55.236000Z", 
     "uri": "/v1/events/EVd39a43f8cee811e2afa1026ba7cd33d0", 
     "entity": {
       "customer_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA", 
       "_type": "account", 
       "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/transactions", 
       "name": "William Henry Cavendish III", 
       "roles": [
         "merchant", 
         "buyer"
       ], 
       "created_at": "2013-06-06T20:36:55.236981Z", 
       "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/refunds", 
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
       "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/debits", 
       "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/holds", 
       "email_address": "whc@example.org", 
       "id": "AC6rhmWC8gdYJS7KPZFERlgA", 
       "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/cards"
     }, 
     "_uris": {
       "callbacks_uri": {
         "_type": "page", 
         "key": "callbacks"
       }
     }, 
     "callbacks_uri": "/v1/events/EVd39a43f8cee811e2afa1026ba7cd33d0/callbacks", 
     "callback_statuses": {
       "failed": 0, 
       "retrying": 0, 
       "succeeded": 0, 
       "pending": 0
     }, 
     "type": "account.created", 
     "id": "EVd39a43f8cee811e2afa1026ba7cd33d0"
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
         "callbacks_uri": "/v1/events/EVd39a43f8cee811e2afa1026ba7cd33d0/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T20:36:55.236000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVd39a43f8cee811e2afa1026ba7cd33d0", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/transactions", 
           "name": "William Henry Cavendish III", 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-06T20:36:55.236981Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/refunds", 
           "customer_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/debits", 
           "email_address": "whc@example.org", 
           "id": "AC6rhmWC8gdYJS7KPZFERlgA", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/cards"
         }, 
         "type": "account.created", 
         "id": "EVd39a43f8cee811e2afa1026ba7cd33d0"
       }, 
       {
         "callbacks_uri": "/v1/events/EVd3ddb390cee811e2afa1026ba7cd33d0/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T20:36:55.681000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVd3ddb390cee811e2afa1026ba7cd33d0", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMnO2FTl6mnaGJpmZtC1i/transactions", 
           "name": null, 
           "roles": [], 
           "created_at": "2013-06-06T20:36:55.681872Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMnO2FTl6mnaGJpmZtC1i", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMnO2FTl6mnaGJpmZtC1i/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMnO2FTl6mnaGJpmZtC1i/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMnO2FTl6mnaGJpmZtC1i/refunds", 
           "customer_uri": "/v1/customers/AC6rMnO2FTl6mnaGJpmZtC1i", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMnO2FTl6mnaGJpmZtC1i/debits", 
           "email_address": "escrow@poundpay.com", 
           "id": "AC6rMnO2FTl6mnaGJpmZtC1i", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMnO2FTl6mnaGJpmZtC1i/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMnO2FTl6mnaGJpmZtC1i/cards"
         }, 
         "type": "account.created", 
         "id": "EVd3ddb390cee811e2afa1026ba7cd33d0"
       }, 
       {
         "callbacks_uri": "/v1/events/EVd3ddb8c2cee811e2afa1026ba7cd33d0/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T20:36:55.684000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVd3ddb8c2cee811e2afa1026ba7cd33d0", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMy754onf0fq0Z5E2FMek/transactions", 
           "name": null, 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-06T20:36:55.684081Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMy754onf0fq0Z5E2FMek", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMy754onf0fq0Z5E2FMek/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMy754onf0fq0Z5E2FMek/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMy754onf0fq0Z5E2FMek/refunds", 
           "customer_uri": "/v1/customers/AC6rMy754onf0fq0Z5E2FMek", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMy754onf0fq0Z5E2FMek/debits", 
           "email_address": "fee@poundpay.com", 
           "id": "AC6rMy754onf0fq0Z5E2FMek", 
           "credits_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMy754onf0fq0Z5E2FMek/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rMy754onf0fq0Z5E2FMek/cards"
         }, 
         "type": "account.created", 
         "id": "EVd3ddb8c2cee811e2afa1026ba7cd33d0"
       }, 
       {
         "callbacks_uri": "/v1/events/EVd3e19a8ccee811e2afa1026ba7cd33d0/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T20:36:55.691000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVd3e19a8ccee811e2afa1026ba7cd33d0", 
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
           "created_at": "2013-06-06T20:36:55.691688Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA/bank_accounts/BA6rN0UQNLqZ09YWfYavjKHm", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC6rhmWC8gdYJS7KPZFERlgA", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6rhmWC8gdYJS7KPZFERlgA", 
           "last_four": "5555", 
           "fingerprint": "6ybvaLUrJy07phK2EQ7pVk", 
           "credits_uri": "/v1/bank_accounts/BA6rN0UQNLqZ09YWfYavjKHm/credits", 
           "type": "CHECKING", 
           "id": "BA6rN0UQNLqZ09YWfYavjKHm", 
           "verifications_uri": "/v1/bank_accounts/BA6rN0UQNLqZ09YWfYavjKHm/verifications", 
           "account_number": "xxxxxxxxxxx5555"
         }, 
         "type": "bank_account.created", 
         "id": "EVd3e19a8ccee811e2afa1026ba7cd33d0"
       }, 
       {
         "callbacks_uri": "/v1/events/EVd446f846cee811e28e69026ba7c1aba6/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T20:36:56.378000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVd446f846cee811e28e69026ba7c1aba6", 
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
           "created_at": "2013-06-06T20:36:56.378379Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/cards/CC6syCaJxuBC8nPeHaBa7Y3Q", 
           "id": "CC6syCaJxuBC8nPeHaBa7Y3Q", 
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
         "id": "EVd446f846cee811e28e69026ba7c1aba6"
       }, 
       {
         "callbacks_uri": "/v1/events/EVd48015e0cee811e2be33026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T20:36:56.734000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVd48015e0cee811e2be33026ba7d31e6f", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
           "security_code_check": "true", 
           "customer_uri": "/v1/customers/AC6sHXqdPI8b7OZ9P70WNCuX", 
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
           "created_at": "2013-06-06T20:36:56.378379Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/cards/CC6syCaJxuBC8nPeHaBa7Y3Q", 
           "id": "CC6syCaJxuBC8nPeHaBa7Y3Q", 
           "expiration_month": 4, 
           "is_valid": true, 
           "meta": {}, 
           "postal_code": "10023", 
           "account_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "last_four": "1111", 
           "card_type": "VISA", 
           "brand": "Visa", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "type": "card.updated", 
         "id": "EVd48015e0cee811e2be33026ba7d31e6f"
       }, 
       {
         "callbacks_uri": "/v1/events/EVd45b2c80cee811e2be33026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T20:36:56.732000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVd45b2c80cee811e2be33026ba7d31e6f", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T20:36:56.502056Z", 
           "uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX", 
           "holds_uri": "/v1/marketplaces/TEST-MP6rgR0eNgazCotkAtAFsEbm/accounts/AC6sHXqdPI8b7OZ9P70WNCuX/holds", 
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
         "type": "account.created", 
         "id": "EVd45b2c80cee811e2be33026ba7d31e6f"
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
     "total": 222, 
     "next_uri": "/v1/events?limit=7&offset=7", 
     "last_uri": "/v1/events?limit=7&offset=217"
   }

