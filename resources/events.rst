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
     "occurred_at": "2013-06-06T23:39:59.535000Z", 
     "uri": "/v1/events/EV66c0c7f6cf0211e29f39026ba7f8ec28", 
     "entity": {
       "customer_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm", 
       "_type": "account", 
       "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/transactions", 
       "name": null, 
       "roles": [], 
       "created_at": "2013-06-06T23:39:59.535012Z", 
       "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm", 
       "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/bank_accounts", 
       "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/refunds", 
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
       "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/debits", 
       "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/holds", 
       "email_address": "escrow@poundpay.com", 
       "id": "AC37T5Yy8wdE3AdhIL85gLZm", 
       "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/credits", 
       "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/cards"
     }, 
     "_uris": {
       "callbacks_uri": {
         "_type": "page", 
         "key": "callbacks"
       }
     }, 
     "callbacks_uri": "/v1/events/EV66c0c7f6cf0211e29f39026ba7f8ec28/callbacks", 
     "callback_statuses": {
       "failed": 0, 
       "retrying": 0, 
       "succeeded": 0, 
       "pending": 0
     }, 
     "type": "account.created", 
     "id": "EV66c0c7f6cf0211e29f39026ba7f8ec28"
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
         "callbacks_uri": "/v1/events/EV66c0c7f6cf0211e29f39026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:39:59.535000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV66c0c7f6cf0211e29f39026ba7f8ec28", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/transactions", 
           "name": null, 
           "roles": [], 
           "created_at": "2013-06-06T23:39:59.535012Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/refunds", 
           "customer_uri": "/v1/customers/AC37T5Yy8wdE3AdhIL85gLZm", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/debits", 
           "email_address": "escrow@poundpay.com", 
           "id": "AC37T5Yy8wdE3AdhIL85gLZm", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37T5Yy8wdE3AdhIL85gLZm/cards"
         }, 
         "type": "account.created", 
         "id": "EV66c0c7f6cf0211e29f39026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV6681d19acf0211e29f39026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:39:59.123000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV6681d19acf0211e29f39026ba7f8ec28", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw/transactions", 
           "name": "William Henry Cavendish III", 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-06T23:39:59.123216Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw/refunds", 
           "customer_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw/debits", 
           "email_address": "whc@example.org", 
           "id": "AC37qorlMKPH5g9O4BTHQluw", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw/cards"
         }, 
         "type": "account.created", 
         "id": "EV6681d19acf0211e29f39026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV66c0cceccf0211e29f39026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:39:59.536000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV66c0cceccf0211e29f39026ba7f8ec28", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37TfhFtv7ra3cLQq5H8r5S/transactions", 
           "name": null, 
           "roles": [
             "merchant", 
             "buyer"
           ], 
           "created_at": "2013-06-06T23:39:59.536978Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37TfhFtv7ra3cLQq5H8r5S", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37TfhFtv7ra3cLQq5H8r5S/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37TfhFtv7ra3cLQq5H8r5S/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37TfhFtv7ra3cLQq5H8r5S/refunds", 
           "customer_uri": "/v1/customers/AC37TfhFtv7ra3cLQq5H8r5S", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37TfhFtv7ra3cLQq5H8r5S/debits", 
           "email_address": "fee@poundpay.com", 
           "id": "AC37TfhFtv7ra3cLQq5H8r5S", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37TfhFtv7ra3cLQq5H8r5S/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37TfhFtv7ra3cLQq5H8r5S/cards"
         }, 
         "type": "account.created", 
         "id": "EV66c0cceccf0211e29f39026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV66c37d2acf0211e29f39026ba7f8ec28/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:39:59.543000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV66c37d2acf0211e29f39026ba7f8ec28", 
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
           "created_at": "2013-06-06T23:39:59.543336Z", 
           "verification_uri": null, 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw/bank_accounts/BA37TqHREduYFlfbYXmIEhi8", 
           "is_valid": true, 
           "customer_uri": "/v1/customers/AC37qorlMKPH5g9O4BTHQluw", 
           "meta": {}, 
           "account_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC37qorlMKPH5g9O4BTHQluw", 
           "last_four": "5555", 
           "fingerprint": "6ybvaLUrJy07phK2EQ7pVk", 
           "credits_uri": "/v1/bank_accounts/BA37TqHREduYFlfbYXmIEhi8/credits", 
           "type": "CHECKING", 
           "id": "BA37TqHREduYFlfbYXmIEhi8", 
           "verifications_uri": "/v1/bank_accounts/BA37TqHREduYFlfbYXmIEhi8/verifications", 
           "account_number": "xxxxxxxxxxx5555"
         }, 
         "type": "bank_account.created", 
         "id": "EV66c37d2acf0211e29f39026ba7f8ec28"
       }, 
       {
         "callbacks_uri": "/v1/events/EV6733afc8cf0211e2acd8026ba7c1aba6/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:40:00.272000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV6733afc8cf0211e2acd8026ba7c1aba6", 
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
           "created_at": "2013-06-06T23:40:00.272856Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/cards/CC38IjleyNnsGVmkTSJJsloO", 
           "id": "CC38IjleyNnsGVmkTSJJsloO", 
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
         "id": "EV6733afc8cf0211e2acd8026ba7c1aba6"
       }, 
       {
         "callbacks_uri": "/v1/events/EV674b8c38cf0211e2aec0026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:40:00.723000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV674b8c38cf0211e2aec0026ba7d31e6f", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:40:00.440155Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
           "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits", 
           "email_address": null, 
           "id": "AC38UBtmXyKEBQS90mN0U4ft", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards"
         }, 
         "type": "account.created", 
         "id": "EV674b8c38cf0211e2aec0026ba7d31e6f"
       }, 
       {
         "callbacks_uri": "/v1/events/EV67774918cf0211e2aec0026ba7d31e6f/callbacks", 
         "callback_statuses": {
           "failed": 0, 
           "retrying": 0, 
           "pending": 0, 
           "succeeded": 0
         }, 
         "occurred_at": "2013-06-06T23:40:00.723000Z", 
         "_type": "event", 
         "uri": "/v1/events/EV67774918cf0211e2aec0026ba7d31e6f", 
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
           "transactions_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/transactions", 
           "name": "Benny Riemann", 
           "roles": [
             "buyer"
           ], 
           "created_at": "2013-06-06T23:40:00.440155Z", 
           "uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft", 
           "holds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/holds", 
           "bank_accounts_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/bank_accounts", 
           "refunds_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/refunds", 
           "customer_uri": "/v1/customers/AC38UBtmXyKEBQS90mN0U4ft", 
           "meta": {}, 
           "debits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/debits", 
           "email_address": null, 
           "id": "AC38UBtmXyKEBQS90mN0U4ft", 
           "credits_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/credits", 
           "cards_uri": "/v1/marketplaces/TEST-MP37q0YmggWZGDdBLL1udJ3y/accounts/AC38UBtmXyKEBQS90mN0U4ft/cards"
         }, 
         "type": "account.updated", 
         "id": "EV67774918cf0211e2aec0026ba7d31e6f"
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
     "total": 220, 
     "next_uri": "/v1/events?limit=7&offset=7", 
     "last_uri": "/v1/events?limit=7&offset=217"
   }

