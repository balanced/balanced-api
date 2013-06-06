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
     "occurred_at": "2013-06-06T21:59:22.622000Z", 
     "uri": "/v1/events/EV5878be14cef411e29e10026ba7f8ec28", 
     "entity": {
       "customer_uri": "/v1/customers/AC2GWnT3ihQEKnkBav6dE2LK", 
       "_type": "account", 
       "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/transactions", 
       "name": "William Henry Cavendish III", 
       "roles": [
         "merchant", 
         "buyer"
       ], 
       "created_at": "2013-06-06T21:59:22.622694Z", 
       "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/refunds", 
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
       "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/debits", 
       "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/holds", 
       "email_address": "whc@example.org", 
       "id": "AC2GWnT3ihQEKnkBav6dE2LK", 
       "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/cards"
     }, 
     "_uris": {
       "callbacks_uri": {
         "_type": "page", 
         "key": "callbacks"
       }
     }, 
     "callbacks_uri": "/v1/events/EV5878be14cef411e29e10026ba7f8ec28/callbacks", 
     "callback_statuses": {
       "failed": 0, 
       "retrying": 0, 
       "succeeded": 0, 
       "pending": 0
     }, 
     "type": "account.created", 
     "id": "EV5878be14cef411e29e10026ba7f8ec28"
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
         "callbacks_uri": "/v1/events/EV5878be14cef411e29e10026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T21:59:22.622000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV5878be14cef411e29e10026ba7f8ec28", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/transactions", 
           "name": "William Henry Cavendish III", 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:22.622694Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/refunds", 
           "customer_uri": "/v1/customers/AC2GWnT3ihQEKnkBav6dE2LK", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/debits", 
           "email_address": "whc@example.org", 
           "id": "AC2GWnT3ihQEKnkBav6dE2LK", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/cards"
         }, 
         "type": "account.created", 
         "id": "EV5878be14cef411e29e10026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV58af4740cef411e29e10026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T21:59:22.979000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV58af4740cef411e29e10026ba7f8ec28", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Hle9VkSH5UY2dxhVpZHWE/transactions", 
           "name": null, 
           "roles": [], 
           "created_at": "2013-06-06T21:59:22.979702Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Hle9VkSH5UY2dxhVpZHWE", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Hle9VkSH5UY2dxhVpZHWE/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Hle9VkSH5UY2dxhVpZHWE/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Hle9VkSH5UY2dxhVpZHWE/refunds", 
           "customer_uri": "/v1/customers/AC2Hle9VkSH5UY2dxhVpZHWE", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Hle9VkSH5UY2dxhVpZHWE/debits", 
           "email_address": "escrow@poundpay.com", 
           "id": "AC2Hle9VkSH5UY2dxhVpZHWE", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Hle9VkSH5UY2dxhVpZHWE/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2Hle9VkSH5UY2dxhVpZHWE/cards"
         }, 
         "type": "account.created", 
         "id": "EV58af4740cef411e29e10026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV58af4c18cef411e29e10026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T21:59:22.980000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV58af4c18cef411e29e10026ba7f8ec28", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2HlmvxbUwTg1WWMxt6bVzy/transactions", 
           "name": null, 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:22.980795Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2HlmvxbUwTg1WWMxt6bVzy", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2HlmvxbUwTg1WWMxt6bVzy/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2HlmvxbUwTg1WWMxt6bVzy/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2HlmvxbUwTg1WWMxt6bVzy/refunds", 
           "customer_uri": "/v1/customers/AC2HlmvxbUwTg1WWMxt6bVzy", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2HlmvxbUwTg1WWMxt6bVzy/debits", 
           "email_address": "fee@poundpay.com", 
           "id": "AC2HlmvxbUwTg1WWMxt6bVzy", 
           "credits_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2HlmvxbUwTg1WWMxt6bVzy/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2HlmvxbUwTg1WWMxt6bVzy/cards"
         }, 
         "type": "account.created", 
         "id": "EV58af4c18cef411e29e10026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV58b4ed6ccef411e29e10026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T21:59:22.984000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV58b4ed6ccef411e29e10026ba7f8ec28", 
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
           "created_at": "2013-06-06T21:59:22.984307Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK/bank_accounts/BA2HlyWshkJyToDzsY1oVi5i", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC2GWnT3ihQEKnkBav6dE2LK", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2GWnT3ihQEKnkBav6dE2LK", 
           "last_four": "5555", 
           "fingerprint": "6ybvaLUrJy07phK2EQ7pVk", 
           "credits_uri": "/v1/bank_accounts/BA2HlyWshkJyToDzsY1oVi5i/credits", 
           "type": "CHECKING", 
           "id": "BA2HlyWshkJyToDzsY1oVi5i", 
           "verifications_uri": "/v1/bank_accounts/BA2HlyWshkJyToDzsY1oVi5i/verifications", 
           "account_number": "xxxxxxxxxxx5555"
         }, 
         "type": "bank_account.created", 
         "id": "EV58b4ed6ccef411e29e10026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV59149122cef411e29333026ba7cd33d0/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T21:59:23.640000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV59149122cef411e29333026ba7cd33d0", 
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
           "created_at": "2013-06-06T21:59:23.640139Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/cards/CC2I5ju5j8rW2gd1ZVvTPGLe", 
           "id": "CC2I5ju5j8rW2gd1ZVvTPGLe", 
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
         "id": "EV59149122cef411e29333026ba7cd33d0"
       }, 
       {
         "callbacks_uri": "/v1/events/EV59282502cef411e28974026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T21:59:24.056000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV59282502cef411e28974026ba7f8ec28", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T21:59:23.772410Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "holds_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/holds", 
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
         "type": "account.created", 
         "id": "EV59282502cef411e28974026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV5953bee2cef411e28974026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T21:59:24.057000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV5953bee2cef411e28974026ba7f8ec28", 
         "_uris": {
           "callbacks_uri": {
             "_type": "page", 
             "key": "callbacks"
           }
         }, 
         "entity": {
           "security_code_check": "true", 
           "customer_uri": "/v1/customers/AC2IeyzRJbL9DnV4nRy1RyQw", 
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
           "created_at": "2013-06-06T21:59:23.640139Z", 
           "uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw/cards/CC2I5ju5j8rW2gd1ZVvTPGLe", 
           "id": "CC2I5ju5j8rW2gd1ZVvTPGLe", 
           "expiration_month": 4, 
           "is_valid": true, 
           "meta": {}, 
           "postal_code": "10023", 
           "account_uri": "/v1/marketplaces/TEST-MP2GVQpfufeUMl3gJH9UWmRG/accounts/AC2IeyzRJbL9DnV4nRy1RyQw", 
           "last_four": "1111", 
           "card_type": "VISA", 
           "brand": "Visa", 
           "street_address": "167 West 74th Street", 
           "name": "Benny Riemann"
         }, 
         "type": "card.updated", 
         "id": "EV5953bee2cef411e28974026ba7f8ec28"
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

