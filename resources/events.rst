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
 
``callback_statuses`` 
    **object**. A key/value collection of aggregated callbacks and statuses where the 
    key is the status and the value is the number of callbacks for this 
    event in that state. 
 
``callbacks`` 
    **object**. Collection of individual states for each callback that subscribed to 
    this event. 
 

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
        "callbacks_uri": "/v1/events/EVb8e29c14770311e2963a3c0754086543/callbacks",  
        "entity": { 
            "account_uri": "/v1/marketplaces/TEST-MP5CFdo2iUGVjVhqKhflLLdF/accounts/AC5CKPDcNI8zRry6Nj1VTzbl",  
            "amount": 2455,  
            "created_at": "2013-02-15T00:07:44.499000Z",  
            "debit_uri": null,  
            "description": null,  
            "expires_at": "2013-02-16T00:07:44.478000Z",  
            "fee": null,  
            "id": "HL5CS4Ce7TmTBqHLvfNOSTR1",  
            "is_void": true,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP5CFdo2iUGVjVhqKhflLLdF/accounts/AC5CKPDcNI8zRry6Nj1VTzbl/cards/CCb8d47d28770311e28c533c0754086543",  
            "transaction_number": "HL437-813-9125",  
            "uri": "/v1/marketplaces/TEST-MP5CFdo2iUGVjVhqKhflLLdF/holds/HL5CS4Ce7TmTBqHLvfNOSTR1" 
        },  
        "id": "EVb8e29c14770311e2963a3c0754086543",  
        "occurred_at": "2013-02-15T00:07:44.499000Z",  
        "type": "hold.created",  
        "uri": "/v1/events/EVb8e29c14770311e2963a3c0754086543" 
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
                "callbacks_uri": "/v1/events/EVbb45330c770311e294a63c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HipaCSeh8QSiuo6ugjYK7",  
                    "amount": 245,  
                    "available_at": "2013-02-15T00:07:48.489000Z",  
                    "bank_account_uri": "/v1/bank_accounts/BA5HitkrjhjcRlURfXLgPJIv",  
                    "created_at": "2013-02-15T00:07:48.499000Z",  
                    "description": "hiya",  
                    "destination_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HipaCSeh8QSiuo6ugjYK7/bank_accounts/BA5HitkrjhjcRlURfXLgPJIv",  
                    "fee": null,  
                    "id": "CR5HmXHkMXPXVvDxfgOurVp9",  
                    "meta": {},  
                    "state": "cleared",  
                    "status": "paid",  
                    "transaction_number": "CR483-317-7828",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HipaCSeh8QSiuo6ugjYK7/credits/CR5HmXHkMXPXVvDxfgOurVp9" 
                },  
                "id": "EVbb45330c770311e294a63c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.499000Z",  
                "type": "credit.created",  
                "uri": "/v1/events/EVbb45330c770311e294a63c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbba9a187770311e28e413c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HipaCSeh8QSiuo6ugjYK7",  
                    "amount": 245,  
                    "available_at": "2013-02-15T00:07:48.489000Z",  
                    "bank_account_uri": "/v1/bank_accounts/BA5HitkrjhjcRlURfXLgPJIv",  
                    "created_at": "2013-02-15T00:07:48.499000Z",  
                    "description": "hiya",  
                    "destination_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HipaCSeh8QSiuo6ugjYK7/bank_accounts/BA5HitkrjhjcRlURfXLgPJIv",  
                    "fee": null,  
                    "id": "CR5HmXHkMXPXVvDxfgOurVp9",  
                    "meta": {},  
                    "state": "cleared",  
                    "status": "paid",  
                    "transaction_number": "CR483-317-7828",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HipaCSeh8QSiuo6ugjYK7/credits/CR5HmXHkMXPXVvDxfgOurVp9" 
                },  
                "id": "EVbba9a187770311e28e413c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.499000Z",  
                "type": "credit.succeeded",  
                "uri": "/v1/events/EVbba9a187770311e28e413c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbb47caeb770311e2b05d3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD",  
                    "amount": 5544,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2013-02-15T00:07:48.514000Z",  
                    "created_at": "2013-02-15T00:07:48.516000Z",  
                    "description": "abc123",  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/holds/HL5HooAgv8hb2dp5YVfYh8mT",  
                    "id": "WD5HocJs24KTypM0opCGNRfR",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HocJs24KTypM0opCGNRfR/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD/cards/CCbb41ca5c770311e29afa3c0754086543",  
                    "transaction_number": "W591-111-1502",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HocJs24KTypM0opCGNRfR" 
                },  
                "id": "EVbb47caeb770311e2b05d3c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.516000Z",  
                "type": "debit.created",  
                "uri": "/v1/events/EVbb47caeb770311e2b05d3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbbae6505770311e298b63c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD",  
                    "amount": 5544,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2013-02-15T00:07:48.514000Z",  
                    "created_at": "2013-02-15T00:07:48.516000Z",  
                    "description": "abc123",  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/holds/HL5HooAgv8hb2dp5YVfYh8mT",  
                    "id": "WD5HocJs24KTypM0opCGNRfR",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HocJs24KTypM0opCGNRfR/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD/cards/CCbb41ca5c770311e29afa3c0754086543",  
                    "transaction_number": "W591-111-1502",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HocJs24KTypM0opCGNRfR" 
                },  
                "id": "EVbbae6505770311e298b63c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.516000Z",  
                "type": "debit.succeeded",  
                "uri": "/v1/events/EVbbae6505770311e298b63c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbb480854770311e2b9d33c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD",  
                    "amount": 5544,  
                    "created_at": "2013-02-15T00:07:48.519000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HocJs24KTypM0opCGNRfR",  
                    "description": null,  
                    "expires_at": "2013-02-16T00:07:48.511000Z",  
                    "fee": null,  
                    "id": "HL5HooAgv8hb2dp5YVfYh8mT",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD/cards/CCbb41ca5c770311e29afa3c0754086543",  
                    "transaction_number": "HL186-760-5190",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/holds/HL5HooAgv8hb2dp5YVfYh8mT" 
                },  
                "id": "EVbb480854770311e2b9d33c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.519000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EVbb480854770311e2b9d33c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbb49bce3770311e2a68c3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD",  
                    "amount": 123,  
                    "created_at": "2013-02-15T00:07:48.530000Z",  
                    "debit_uri": null,  
                    "description": null,  
                    "expires_at": "2013-02-16T00:07:48.514000Z",  
                    "fee": null,  
                    "id": "HL5HpbqsEOtMLDuckHePAoMP",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD/cards/CCbb41ca5c770311e29afa3c0754086543",  
                    "transaction_number": "HL238-777-6838",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/holds/HL5HpbqsEOtMLDuckHePAoMP" 
                },  
                "id": "EVbb49bce3770311e2a68c3c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.530000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EVbb49bce3770311e2a68c3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbb4b2445770311e288343c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD",  
                    "amount": 343,  
                    "appears_on_statement_as": "hiya.bom",  
                    "available_at": "2013-02-15T00:07:48.535000Z",  
                    "created_at": "2013-02-15T00:07:48.538000Z",  
                    "description": null,  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/holds/HL5HpVu0kjqwIRDBteMeOtaj",  
                    "id": "WD5HpJDPKcRgUPayEoUCK0lZ",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HpJDPKcRgUPayEoUCK0lZ/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD/cards/CCbb41ca5c770311e29afa3c0754086543",  
                    "transaction_number": "W302-662-2580",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HpJDPKcRgUPayEoUCK0lZ" 
                },  
                "id": "EVbb4b2445770311e288343c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.538000Z",  
                "type": "debit.created",  
                "uri": "/v1/events/EVbb4b2445770311e288343c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbbb54a70770311e28f1d3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD",  
                    "amount": 343,  
                    "appears_on_statement_as": "hiya.bom",  
                    "available_at": "2013-02-15T00:07:48.535000Z",  
                    "created_at": "2013-02-15T00:07:48.538000Z",  
                    "description": null,  
                    "fee": null,  
                    "hold_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/holds/HL5HpVu0kjqwIRDBteMeOtaj",  
                    "id": "WD5HpJDPKcRgUPayEoUCK0lZ",  
                    "meta": {},  
                    "on_behalf_of_uri": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HpJDPKcRgUPayEoUCK0lZ/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD/cards/CCbb41ca5c770311e29afa3c0754086543",  
                    "transaction_number": "W302-662-2580",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HpJDPKcRgUPayEoUCK0lZ" 
                },  
                "id": "EVbbb54a70770311e28f1d3c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.538000Z",  
                "type": "debit.succeeded",  
                "uri": "/v1/events/EVbbb54a70770311e28f1d3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbb4b5fae770311e2a31f3c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD",  
                    "amount": 343,  
                    "created_at": "2013-02-15T00:07:48.541000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HpJDPKcRgUPayEoUCK0lZ",  
                    "description": null,  
                    "expires_at": "2013-02-16T00:07:48.529000Z",  
                    "fee": null,  
                    "id": "HL5HpVu0kjqwIRDBteMeOtaj",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD/cards/CCbb41ca5c770311e29afa3c0754086543",  
                    "transaction_number": "HL393-870-7134",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/holds/HL5HpVu0kjqwIRDBteMeOtaj" 
                },  
                "id": "EVbb4b5fae770311e2a31f3c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.541000Z",  
                "type": "hold.created",  
                "uri": "/v1/events/EVbb4b5fae770311e2a31f3c0754086543" 
            },  
            { 
                "callback_statuses": { 
                    "failed": 0,  
                    "pending": 0,  
                    "retrying": 0,  
                    "succeeded": 0 
                },  
                "callbacks_uri": "/v1/events/EVbbb73c7d770311e29b573c0754086543/callbacks",  
                "entity": { 
                    "account_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD",  
                    "amount": 343,  
                    "created_at": "2013-02-15T00:07:48.541000Z",  
                    "debit_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/debits/WD5HpJDPKcRgUPayEoUCK0lZ",  
                    "description": null,  
                    "expires_at": "2013-02-16T00:07:48.529000Z",  
                    "fee": null,  
                    "id": "HL5HpVu0kjqwIRDBteMeOtaj",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/accounts/AC5HkOV80KeBtvYOPReAl6aD/cards/CCbb41ca5c770311e29afa3c0754086543",  
                    "transaction_number": "HL393-870-7134",  
                    "uri": "/v1/marketplaces/TEST-MP5HfbYSNhsqZiaSeyRBeEwz/holds/HL5HpVu0kjqwIRDBteMeOtaj" 
                },  
                "id": "EVbbb73c7d770311e29b573c0754086543",  
                "occurred_at": "2013-02-15T00:07:48.541000Z",  
                "type": "hold.captured",  
                "uri": "/v1/events/EVbbb73c7d770311e29b573c0754086543" 
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
 

