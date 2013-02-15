Events
=======

.. _events:

You can configure events to be published via a ``POST`` to the endpoint of your
choice via callbacks. Once configured, events are accessible via the
events endpoint.

- `Retrieve an Event`_
- `List all Events`_


Event types
-----------

All resources (accounts, holds, credits etc) are evented. The format of the
type field is ``resource.event_type`` where ``event_type`` is one of
``created``, ``updated``, ``deleted``, as well as some transaction specific
event types ``succeeded``, ``failed``, and ``canceled``.

Transactional Events
~~~~~~~~~~~~~~~~~~~~

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
    Occurs whenever a debit is successfully captured or deposited. 
 
debit.updated 
    Occurs whenever a debit is updated. 
 
hold.canceled 
    Occurs whenever a hold is canceled. 
 
hold.created 
    Occurs whenever a new hold is created. 
 
hold.failed 
    Occurs whenever a hold is rejected. 
 
hold.succeeded 
    Occurs whenever a hold is successfully captured or deposited. 
 
hold.updated 
    Occurs whenever a hold is updated. 
 
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
 

Fields
------

``uri`` 
    **string**.  
 
``id`` 
    **string**.  
 
``occurred_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    event occurred. 
 
``type`` 
    **string**. Type of event e.g. ``hold.created`` 
 
``entity`` 
    **string**. The JSON representation of the resource for which this event occurred. 
 

Retrieve an Event
-----------------

.. code:: 
 
    GET /v1/events/:event_id 
 

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
        "entity": { 
            "account_uri": "/v1/marketplaces/TEST-MP2sH8UtAgV17hKk7FYg1gUX/accounts/AC2sMvOT6QBFegOZInsZ6M6L",  
            "amount": 2455,  
            "created_at": "2013-02-15T00:47:47.235000Z",  
            "debit_uri": null,  
            "description": null,  
            "expires_at": "2013-02-16T00:47:47.214000Z",  
            "fee": null,  
            "id": "HL2sTtUhfCSPqOta1ovXoIx5",  
            "is_void": true,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP2sH8UtAgV17hKk7FYg1gUX/accounts/AC2sMvOT6QBFegOZInsZ6M6L/cards/CC50f96923770911e2b5e93c0754086543",  
            "transaction_number": "HL697-518-2291",  
            "uri": "/v1/marketplaces/TEST-MP2sH8UtAgV17hKk7FYg1gUX/holds/HL2sTtUhfCSPqOta1ovXoIx5" 
        },  
        "id": "EV5106f7a6770911e2949d3c0754086543",  
        "occurred_at": "2013-02-15T00:47:47.235000Z",  
        "type": "hold.created",  
        "uri": "/v1/events/EV5106f7a6770911e2949d3c0754086543" 
    } 
 

List all Events
---------------

.. code:: 
 
    GET /v1/events 
 

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.

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
        "first_uri": "/v1/events?limit=10&offset=0",  
        "items": [ 
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x3ZydQ6Awbbvh1dDmDLTJ",  
                    "amount": 245,  
                    "available_at": "2013-02-15T00:47:50.998000Z",  
                    "bank_account_uri": "/v1/bank_accounts/BA2x43ekRg0aBUFq7PK0GJCH",  
                    "created_at": "2013-02-15T00:47:51.008000Z",  
                    "description": "hiya",  
                    "destination_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x3ZydQ6Awbbvh1dDmDLTJ/bank_accounts/BA2x43ekRg0aBUFq7PK0GJCH",  
                    "fee": null,  
                    "id": "CR2x8yhhU6wjO7VxcrkLAY5d",  
                    "meta": {},  
                    "state": "cleared",  
                    "status": "paid",  
                    "transaction_number": "CR332-225-8999",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x3ZydQ6Awbbvh1dDmDLTJ/credits/CR2x8yhhU6wjO7VxcrkLAY5d" 
                },  
                "id": "EV5346edf0770911e2aa5f3c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.008000Z",  
                "type": "credit.created",  
                "uri": "/v1/events/EV5346edf0770911e2aa5f3c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x3ZydQ6Awbbvh1dDmDLTJ",  
                    "amount": 245,  
                    "available_at": "2013-02-15T00:47:50.998000Z",  
                    "bank_account_uri": "/v1/bank_accounts/BA2x43ekRg0aBUFq7PK0GJCH",  
                    "created_at": "2013-02-15T00:47:51.008000Z",  
                    "description": "hiya",  
                    "destination_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x3ZydQ6Awbbvh1dDmDLTJ/bank_accounts/BA2x43ekRg0aBUFq7PK0GJCH",  
                    "fee": null,  
                    "id": "CR2x8yhhU6wjO7VxcrkLAY5d",  
                    "meta": {},  
                    "state": "cleared",  
                    "status": "paid",  
                    "transaction_number": "CR332-225-8999",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x3ZydQ6Awbbvh1dDmDLTJ/credits/CR2x8yhhU6wjO7VxcrkLAY5d" 
                },  
                "id": "EV53a95628770911e290153c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.008000Z",  
                "type": "credit.succeeded",  
                "uri": "/v1/events/EV53a95628770911e290153c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx",  
                    "amount": 5544,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2013-02-15T00:47:51.023000Z",  
                    "created_at": "2013-02-15T00:47:51.025000Z",  
                    "description": "abc123",  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/holds/HL2xa0p7GWby0zDk2HNVy0JZ",  
                    "id": "WD2x9OzYgkXq16IHMRRAemD9",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2x9OzYgkXq16IHMRRAemD9/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx/cards/CC534353de770911e2b98e3c0754086543",  
                    "transaction_number": "W545-181-0628",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2x9OzYgkXq16IHMRRAemD9" 
                },  
                "id": "EV534991e8770911e29fe33c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.025000Z",  
                "type": "debit.created",  
                "uri": "/v1/events/EV534991e8770911e29fe33c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx",  
                    "amount": 5544,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2013-02-15T00:47:51.023000Z",  
                    "created_at": "2013-02-15T00:47:51.025000Z",  
                    "description": "abc123",  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/holds/HL2xa0p7GWby0zDk2HNVy0JZ",  
                    "id": "WD2x9OzYgkXq16IHMRRAemD9",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2x9OzYgkXq16IHMRRAemD9/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx/cards/CC534353de770911e2b98e3c0754086543",  
                    "transaction_number": "W545-181-0628",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2x9OzYgkXq16IHMRRAemD9" 
                },  
                "id": "EV53b029f0770911e2a6be3c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.025000Z",  
                "type": "debit.succeeded",  
                "uri": "/v1/events/EV53b029f0770911e2a6be3c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx",  
                    "amount": 5544,  
                    "created_at": "2013-02-15T00:47:51.028000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2x9OzYgkXq16IHMRRAemD9",  
                    "description": null,  
                    "expires_at": "2013-02-16T00:47:51.020000Z",  
                    "fee": null,  
                    "id": "HL2xa0p7GWby0zDk2HNVy0JZ",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx/cards/CC534353de770911e2b98e3c0754086543",  
                    "transaction_number": "HL376-780-5280",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/holds/HL2xa0p7GWby0zDk2HNVy0JZ" 
                },  
                "id": "EV5349cc45770911e283c83c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.028000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EV5349cc45770911e283c83c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx",  
                    "amount": 123,  
                    "created_at": "2013-02-15T00:47:51.039000Z",  
                    "debit_uri": null,  
                    "description": null,  
                    "expires_at": "2013-02-16T00:47:51.023000Z",  
                    "fee": null,  
                    "id": "HL2xaN6tpxNxeCjnZVFrpASn",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx/cards/CC534353de770911e2b98e3c0754086543",  
                    "transaction_number": "HL062-227-8093",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/holds/HL2xaN6tpxNxeCjnZVFrpASn" 
                },  
                "id": "EV534b837d770911e2bbba3c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.039000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EV534b837d770911e2bbba3c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx",  
                    "amount": 343,  
                    "appears_on_statement_as": "hiya.bom",  
                    "available_at": "2013-02-15T00:47:51.044000Z",  
                    "created_at": "2013-02-15T00:47:51.047000Z",  
                    "description": null,  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/holds/HL2xbx7pSctSlsp6DXALMo2T",  
                    "id": "WD2xblKWHZx278SOOORVit7Z",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2xblKWHZx278SOOORVit7Z/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx/cards/CC534353de770911e2b98e3c0754086543",  
                    "transaction_number": "W531-487-7302",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2xblKWHZx278SOOORVit7Z" 
                },  
                "id": "EV534ce9c5770911e2ad423c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.047000Z",  
                "type": "debit.created",  
                "uri": "/v1/events/EV534ce9c5770911e2ad423c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx",  
                    "amount": 343,  
                    "appears_on_statement_as": "hiya.bom",  
                    "available_at": "2013-02-15T00:47:51.044000Z",  
                    "created_at": "2013-02-15T00:47:51.047000Z",  
                    "description": null,  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/holds/HL2xbx7pSctSlsp6DXALMo2T",  
                    "id": "WD2xblKWHZx278SOOORVit7Z",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2xblKWHZx278SOOORVit7Z/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx/cards/CC534353de770911e2b98e3c0754086543",  
                    "transaction_number": "W531-487-7302",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2xblKWHZx278SOOORVit7Z" 
                },  
                "id": "EV53b67666770911e286ed3c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.047000Z",  
                "type": "debit.succeeded",  
                "uri": "/v1/events/EV53b67666770911e286ed3c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx",  
                    "amount": 343,  
                    "created_at": "2013-02-15T00:47:51.050000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2xblKWHZx278SOOORVit7Z",  
                    "description": null,  
                    "expires_at": "2013-02-16T00:47:51.038000Z",  
                    "fee": null,  
                    "id": "HL2xbx7pSctSlsp6DXALMo2T",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx/cards/CC534353de770911e2b98e3c0754086543",  
                    "transaction_number": "HL594-112-0626",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/holds/HL2xbx7pSctSlsp6DXALMo2T" 
                },  
                "id": "EV534d2300770911e29b143c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.050000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EV534d2300770911e29b143c0754086543" 
            },  
            { 
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx",  
                    "amount": 343,  
                    "created_at": "2013-02-15T00:47:51.050000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/debits/WD2xblKWHZx278SOOORVit7Z",  
                    "description": null,  
                    "expires_at": "2013-02-16T00:47:51.038000Z",  
                    "fee": null,  
                    "id": "HL2xbx7pSctSlsp6DXALMo2T",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/accounts/AC2x6ihKQJARiY4RcEEryrlx/cards/CC534353de770911e2b98e3c0754086543",  
                    "transaction_number": "HL594-112-0626",  
                    "uri": "/v1/marketplaces/TEST-MP2x0Sgn5WKppjnAr3dy0BwL/holds/HL2xbx7pSctSlsp6DXALMo2T" 
                },  
                "id": "EV53b8a6e8770911e2b4c63c0754086543",  
                "occurred_at": "2013-02-15T00:47:51.050000Z",  
                "type": "hold.captured",  
                "uri": "/v1/events/EV53b8a6e8770911e2b4c63c0754086543" 
            } 
        ],  
        "last_uri": "/v1/events?limit=10&offset=10",  
        "limit": 10,  
        "next_uri": "/v1/events?limit=10&offset=10",  
        "offset": 0,  
        "previous_uri": null,  
        "total": 15,  
        "uri": "/v1/events?limit=10&offset=0" 
    } 
 

