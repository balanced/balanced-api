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
        "callback_statuses": { 
            "failed": 0,  
            "pending": 0,  
            "retrying": 0,  
            "succeeded": 0 
        },  
        "callbacks_uri": "/v1/events/EV807a9b2b761a11e2b78f3c0754086543/callbacks",  
        "entity": { 
            "account_uri": "/v1/marketplaces/TEST-MP3UdtM5TasM3BFcXdyDTBPt/accounts/AC3Uk0UOCHbrrDg6a59qEfar",  
            "amount": 2455,  
            "created_at": "2013-02-13T20:18:17.127000Z",  
            "debit_uri": null,  
            "description": null,  
            "expires_at": "2013-02-14T20:18:17.106000Z",  
            "fee": null,  
            "id": "HL3UqXHEFqaLJVXnOwYk1Egb",  
            "is_void": true,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP3UdtM5TasM3BFcXdyDTBPt/accounts/AC3Uk0UOCHbrrDg6a59qEfar/cards/CC806d0551761a11e2ad9c3c0754086543",  
            "transaction_number": "HL006-317-3375",  
            "uri": "/v1/marketplaces/TEST-MP3UdtM5TasM3BFcXdyDTBPt/holds/HL3UqXHEFqaLJVXnOwYk1Egb" 
        },  
        "id": "EV807a9b2b761a11e2b78f3c0754086543",  
        "occurred_at": "2013-02-13T20:18:17.127000Z",  
        "type": "hold.created",  
        "uri": "/v1/events/EV807a9b2b761a11e2b78f3c0754086543" 
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
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV83ebc05e761a11e2b47c3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40R6E3Bg0InOsobeSRCLxF",  
                    "amount": 245,  
                    "available_at": "2013-02-13T20:18:22.890000Z",  
                    "bank_account_uri": "/v1/bank_accounts/BA40RayUGcpoZuhHximIyAYX",  
                    "created_at": "2013-02-13T20:18:22.900000Z",  
                    "description": "hiya",  
                    "destination_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40R6E3Bg0InOsobeSRCLxF/bank_accounts/BA40RayUGcpoZuhHximIyAYX",  
                    "fee": null,  
                    "id": "CR40VvoFDbneUoJi3SllO08P",  
                    "meta": {},  
                    "state": "cleared",  
                    "status": "paid",  
                    "transaction_number": "CR922-696-8521",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40R6E3Bg0InOsobeSRCLxF/credits/CR40VvoFDbneUoJi3SllO08P" 
                },  
                "id": "EV83ebc05e761a11e2b47c3c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.900000Z",  
                "type": "credit.created",  
                "uri": "/v1/events/EV83ebc05e761a11e2b47c3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV84a10145761a11e293503c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40R6E3Bg0InOsobeSRCLxF",  
                    "amount": 245,  
                    "available_at": "2013-02-13T20:18:22.890000Z",  
                    "bank_account_uri": "/v1/bank_accounts/BA40RayUGcpoZuhHximIyAYX",  
                    "created_at": "2013-02-13T20:18:22.900000Z",  
                    "description": "hiya",  
                    "destination_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40R6E3Bg0InOsobeSRCLxF/bank_accounts/BA40RayUGcpoZuhHximIyAYX",  
                    "fee": null,  
                    "id": "CR40VvoFDbneUoJi3SllO08P",  
                    "meta": {},  
                    "state": "cleared",  
                    "status": "paid",  
                    "transaction_number": "CR922-696-8521",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40R6E3Bg0InOsobeSRCLxF/credits/CR40VvoFDbneUoJi3SllO08P" 
                },  
                "id": "EV84a10145761a11e293503c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.900000Z",  
                "type": "credit.succeeded",  
                "uri": "/v1/events/EV84a10145761a11e293503c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV83ee76e8761a11e2978c3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP",  
                    "amount": 5544,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2013-02-13T20:18:22.916000Z",  
                    "created_at": "2013-02-13T20:18:22.918000Z",  
                    "description": "abc123",  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/holds/HL40WZLHOKMVSNLtHP9G3C8j",  
                    "id": "WD40WOduJbXQCner0vOQWkkH",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40WOduJbXQCner0vOQWkkH/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP/cards/CC83e870ca761a11e2849d3c0754086543",  
                    "transaction_number": "W881-173-3488",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40WOduJbXQCner0vOQWkkH" 
                },  
                "id": "EV83ee76e8761a11e2978c3c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.918000Z",  
                "type": "debit.created",  
                "uri": "/v1/events/EV83ee76e8761a11e2978c3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV84a53af3761a11e29e523c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP",  
                    "amount": 5544,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2013-02-13T20:18:22.916000Z",  
                    "created_at": "2013-02-13T20:18:22.918000Z",  
                    "description": "abc123",  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/holds/HL40WZLHOKMVSNLtHP9G3C8j",  
                    "id": "WD40WOduJbXQCner0vOQWkkH",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40WOduJbXQCner0vOQWkkH/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP/cards/CC83e870ca761a11e2849d3c0754086543",  
                    "transaction_number": "W881-173-3488",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40WOduJbXQCner0vOQWkkH" 
                },  
                "id": "EV84a53af3761a11e29e523c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.918000Z",  
                "type": "debit.succeeded",  
                "uri": "/v1/events/EV84a53af3761a11e29e523c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV83eead6e761a11e28efa3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP",  
                    "amount": 5544,  
                    "created_at": "2013-02-13T20:18:22.921000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40WOduJbXQCner0vOQWkkH",  
                    "description": null,  
                    "expires_at": "2013-02-14T20:18:22.913000Z",  
                    "fee": null,  
                    "id": "HL40WZLHOKMVSNLtHP9G3C8j",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP/cards/CC83e870ca761a11e2849d3c0754086543",  
                    "transaction_number": "HL812-062-1149",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/holds/HL40WZLHOKMVSNLtHP9G3C8j" 
                },  
                "id": "EV83eead6e761a11e28efa3c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.921000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EV83eead6e761a11e28efa3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV83f04d68761a11e284fa3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP",  
                    "amount": 123,  
                    "created_at": "2013-02-13T20:18:22.931000Z",  
                    "debit_uri": null,  
                    "description": null,  
                    "expires_at": "2013-02-14T20:18:22.916000Z",  
                    "fee": null,  
                    "id": "HL40XJwZIgYhC8kIe7T57ynN",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP/cards/CC83e870ca761a11e2849d3c0754086543",  
                    "transaction_number": "HL276-188-4587",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/holds/HL40XJwZIgYhC8kIe7T57ynN" 
                },  
                "id": "EV83f04d68761a11e284fa3c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.931000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EV83f04d68761a11e284fa3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV83f1c711761a11e2b4763c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP",  
                    "amount": 343,  
                    "appears_on_statement_as": "hiya.bom",  
                    "available_at": "2013-02-13T20:18:22.936000Z",  
                    "created_at": "2013-02-13T20:18:22.940000Z",  
                    "description": null,  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/holds/HL40YvY1jKFXDqIGzN17wOXx",  
                    "id": "WD40Yih612xgDg2OCrK4iVMf",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40Yih612xgDg2OCrK4iVMf/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP/cards/CC83e870ca761a11e2849d3c0754086543",  
                    "transaction_number": "W325-492-0091",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40Yih612xgDg2OCrK4iVMf" 
                },  
                "id": "EV83f1c711761a11e2b4763c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.940000Z",  
                "type": "debit.created",  
                "uri": "/v1/events/EV83f1c711761a11e2b4763c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV84accfba761a11e2bdfa3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP",  
                    "amount": 343,  
                    "appears_on_statement_as": "hiya.bom",  
                    "available_at": "2013-02-13T20:18:22.936000Z",  
                    "created_at": "2013-02-13T20:18:22.940000Z",  
                    "description": null,  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/holds/HL40YvY1jKFXDqIGzN17wOXx",  
                    "id": "WD40Yih612xgDg2OCrK4iVMf",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40Yih612xgDg2OCrK4iVMf/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP/cards/CC83e870ca761a11e2849d3c0754086543",  
                    "transaction_number": "W325-492-0091",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40Yih612xgDg2OCrK4iVMf" 
                },  
                "id": "EV84accfba761a11e2bdfa3c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.940000Z",  
                "type": "debit.succeeded",  
                "uri": "/v1/events/EV84accfba761a11e2bdfa3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV83f206d1761a11e2b8863c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP",  
                    "amount": 343,  
                    "created_at": "2013-02-13T20:18:22.943000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40Yih612xgDg2OCrK4iVMf",  
                    "description": null,  
                    "expires_at": "2013-02-14T20:18:22.930000Z",  
                    "fee": null,  
                    "id": "HL40YvY1jKFXDqIGzN17wOXx",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP/cards/CC83e870ca761a11e2849d3c0754086543",  
                    "transaction_number": "HL665-355-1521",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/holds/HL40YvY1jKFXDqIGzN17wOXx" 
                },  
                "id": "EV83f206d1761a11e2b8863c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.943000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EV83f206d1761a11e2b8863c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EV84af0459761a11e284273c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP",  
                    "amount": 343,  
                    "created_at": "2013-02-13T20:18:22.943000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/debits/WD40Yih612xgDg2OCrK4iVMf",  
                    "description": null,  
                    "expires_at": "2013-02-14T20:18:22.930000Z",  
                    "fee": null,  
                    "id": "HL40YvY1jKFXDqIGzN17wOXx",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/accounts/AC40ToPfG8rZsoYuKihJIbSP/cards/CC83e870ca761a11e2849d3c0754086543",  
                    "transaction_number": "HL665-355-1521",  
                    "uri": "/v1/marketplaces/TEST-MP40NJ1NrKQbaT0oo29Xsm31/holds/HL40YvY1jKFXDqIGzN17wOXx" 
                },  
                "id": "EV84af0459761a11e284273c0754086543",  
                "occurred_at": "2013-02-13T20:18:22.943000Z",  
                "type": "hold.captured",  
                "uri": "/v1/events/EV84af0459761a11e284273c0754086543" 
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
 

