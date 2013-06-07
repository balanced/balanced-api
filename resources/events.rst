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
     "occurred_at": "2013-06-07T17:28:24.615000Z", 
     "uri": "/v1/events/EVa85ba63ccf9711e2a546026ba7c1aba6", 
     "entity": {
       "customer_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC", 
       "_type": "account", 
       "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/transactions", 
       "name": "William Henry Cavendish III", 
       "roles": [
         "merchant", 
         "buyer"
       ], 
       "created_at": "2013-06-07T17:28:24.615210Z", 
       "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/refunds", 
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
       "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/debits", 
       "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/holds", 
       "email_address": "whc@example.org", 
       "id": "AC57G3r3PVSx3fsYXiBdPJCC", 
       "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/cards"
     }, 
     "_uris": {
       "callbacks_uri": {
         "_type": "page", 
         "key": "callbacks"
       }
     }, 
     "callbacks_uri": "/v1/events/EVa85ba63ccf9711e2a546026ba7c1aba6/callbacks", 
     "callback_statuses": {
       "failed": 0, 
       "retrying": 0, 
       "succeeded": 0, 
       "pending": 0
     }, 
     "type": "account.created", 
     "id": "EVa85ba63ccf9711e2a546026ba7c1aba6"
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
         "callbacks_uri": "/v1/events/EVa85ba63ccf9711e2a546026ba7c1aba6/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-07T17:28:24.615000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVa85ba63ccf9711e2a546026ba7c1aba6", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/transactions", 
           "name": "William Henry Cavendish III", 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:24.615210Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/refunds", 
           "customer_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/debits", 
           "email_address": "whc@example.org", 
           "id": "AC57G3r3PVSx3fsYXiBdPJCC", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/cards"
         }, 
         "type": "account.created", 
         "id": "EVa85ba63ccf9711e2a546026ba7c1aba6"
       }, 
       {
         "callbacks_uri": "/v1/events/EVa88dcedccf9711e2a546026ba7c1aba6/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-07T17:28:24.948000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVa88dcedccf9711e2a546026ba7c1aba6", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583gUh3w8JhVsBOAzmwaiy/transactions", 
           "name": null, 
           "roles": [], 
           "created_at": "2013-06-07T17:28:24.948391Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583gUh3w8JhVsBOAzmwaiy", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583gUh3w8JhVsBOAzmwaiy/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583gUh3w8JhVsBOAzmwaiy/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583gUh3w8JhVsBOAzmwaiy/refunds", 
           "customer_uri": "/v1/customers/AC583gUh3w8JhVsBOAzmwaiy", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583gUh3w8JhVsBOAzmwaiy/debits", 
           "email_address": "escrow@poundpay.com", 
           "id": "AC583gUh3w8JhVsBOAzmwaiy", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583gUh3w8JhVsBOAzmwaiy/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583gUh3w8JhVsBOAzmwaiy/cards"
         }, 
         "type": "account.created", 
         "id": "EVa88dcedccf9711e2a546026ba7c1aba6"
       }, 
       {
         "callbacks_uri": "/v1/events/EVa88dd3a0cf9711e2a546026ba7c1aba6/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-07T17:28:24.950000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVa88dd3a0cf9711e2a546026ba7c1aba6", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583puCYkXyNTzY2NtnZ4Lc/transactions", 
           "name": null, 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:24.950113Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583puCYkXyNTzY2NtnZ4Lc", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583puCYkXyNTzY2NtnZ4Lc/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583puCYkXyNTzY2NtnZ4Lc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583puCYkXyNTzY2NtnZ4Lc/refunds", 
           "customer_uri": "/v1/customers/AC583puCYkXyNTzY2NtnZ4Lc", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583puCYkXyNTzY2NtnZ4Lc/debits", 
           "email_address": "fee@poundpay.com", 
           "id": "AC583puCYkXyNTzY2NtnZ4Lc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583puCYkXyNTzY2NtnZ4Lc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC583puCYkXyNTzY2NtnZ4Lc/cards"
         }, 
         "type": "account.created", 
         "id": "EVa88dd3a0cf9711e2a546026ba7c1aba6"
       }, 
       {
         "callbacks_uri": "/v1/events/EVa893cc2ecf9711e2a546026ba7c1aba6/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-07T17:28:24.952000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVa893cc2ecf9711e2a546026ba7c1aba6", 
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
           "created_at": "2013-06-07T17:28:24.952405Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC/bank_accounts/BA583yw3raG6TFVuZjcAkjgq", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC57G3r3PVSx3fsYXiBdPJCC", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC57G3r3PVSx3fsYXiBdPJCC", 
           "last_four": "5555", 
           "fingerprint": "6ybvaLUrJy07phK2EQ7pVk", 
           "credits_uri": "/v1/bank_accounts/BA583yw3raG6TFVuZjcAkjgq/credits", 
           "type": "CHECKING", 
           "id": "BA583yw3raG6TFVuZjcAkjgq", 
           "verifications_uri": "/v1/bank_accounts/BA583yw3raG6TFVuZjcAkjgq/verifications", 
           "account_number": "xxxxxxxxxxx5555"
         }, 
         "type": "bank_account.created", 
         "id": "EVa893cc2ecf9711e2a546026ba7c1aba6"
       }, 
       {
         "callbacks_uri": "/v1/events/EVa90596f6cf9711e29f39026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-07T17:28:25.713000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVa90596f6cf9711e29f39026ba7f8ec28", 
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
           "created_at": "2013-06-07T17:28:25.713841Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/cards/CC58Vn831uFhYWgRoO7Hf8hi", 
           "id": "CC58Vn831uFhYWgRoO7Hf8hi", 
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
         "id": "EVa90596f6cf9711e29f39026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EVa947ce04cf9711e284f9026ba7cac9da/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-07T17:28:26.160000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVa947ce04cf9711e284f9026ba7cac9da", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "type": "account.updated", 
         "id": "EVa947ce04cf9711e284f9026ba7cac9da"
       }, 
       {
         "callbacks_uri": "/v1/events/EVa91a6572cf9711e284f9026ba7cac9da/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-07T17:28:26.160000Z", 
         "_type": "event", 
         "uri": "/v1/events/EVa91a6572cf9711e284f9026ba7cac9da", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-07T17:28:25.862643Z", 
           "uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc", 
           "holds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/refunds", 
           "customer_uri": "/v1/customers/AC595Bqo9UO0VGFaGRcAiPnc", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/debits", 
           "email_address": null, 
           "id": "AC595Bqo9UO0VGFaGRcAiPnc", 
           "credits_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP57FG7rZjIjdK70bBjLz0CW/accounts/AC595Bqo9UO0VGFaGRcAiPnc/cards"
         }, 
         "type": "account.created", 
         "id": "EVa91a6572cf9711e284f9026ba7cac9da"
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

