Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**. A URI for a Balanced entity 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    refund was issued. 
 
``amount`` 
    **integer**. The amount of the refund. 
 
``fee`` 
    **integer**. The fee reversed by Balanced for this refund. 
 
``description`` 
    **string**. Free-text description of the refund. 
 
``account`` 
    **object**. Account receiving the refund. 
 
``appears_on_statement_as`` 
    **string**. Text that will appear on the statement describing this refund. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``debit`` 
    **object**. The original debit associated with the refund.  
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 

Refund an Account
----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    POST /v1/marketplaces/:marketplace_id/refunds 
 

Request
~~~~~~~

``amount`` 
    *optional* **integer** or **null**. Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original 
    ``debit``. 
 
``description`` 
    *optional* **string** or **null**.  
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``debit_uri`` 
    *optional* **string** or **null**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "debit_uri": "/v1/marketplaces/TEST-MPQDDYfObFjIEyKeoi4NR88/debits/WDQP9j8RD26JXIbtDuhm7hG",  
        "amount": 1234 
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
        "account": { 
            "holds_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:27:20.022317Z",  
            "uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm/transactions",  
            "email_address": "email.7@y.com",  
            "id": "ACSWxkLo29Vy6ZwinNImdXm",  
            "credits_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm/cards" 
        },  
        "fee": -43,  
        "description": "abc123",  
        "created_at": "2012-10-30T18:27:20.216462Z",  
        "uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/refunds/RFT9tRjQkWAEV3e7P5G2Vlq",  
        "transaction_number": "RF456-627-3842",  
        "amount": 1234,  
        "meta": {},  
        "debit": { 
            "hold_uri": null,  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W958-465-6850",  
            "source_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/accounts/ACSWxkLo29Vy6ZwinNImdXm/bank_accounts/BASWgkvHQuscQRvghxxXEKE",  
            "created_at": "2012-10-30T18:27:20.119473Z",  
            "uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/debits/WDT27IUxPtdmFFHeI34RoMc",  
            "refunds_uri": "/v1/marketplaces/TEST-MPSP8vCT6hoiM91yNZBbk1u/debits/WDT27IUxPtdmFFHeI34RoMc/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WDT27IUxPtdmFFHeI34RoMc",  
            "available_at": "2012-10-31T01:27:20.103273Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RFT9tRjQkWAEV3e7P5G2Vlq" 
    } 
 

Retrieve a Refund
----------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id 
    GET /v1/marketplaces/:marketplace_id/refunds/:refund_id 
 

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
        "account": { 
            "holds_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:27:21.941546Z",  
            "uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k/transactions",  
            "email_address": "email.7@y.com",  
            "id": "ACV6nfCV916RUdUg0pSoI0k",  
            "credits_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k/cards" 
        },  
        "fee": -43,  
        "description": "abc123",  
        "created_at": "2012-10-30T18:27:22.047499Z",  
        "uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/refunds/RFVc9JfCFsPSH745y9dY3L6",  
        "transaction_number": "RF111-222-3333",  
        "amount": 1254,  
        "meta": {},  
        "debit": { 
            "hold_uri": null,  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W857-256-2570",  
            "source_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/accounts/ACV6nfCV916RUdUg0pSoI0k/bank_accounts/BAV65fsbrdhZeQ35SQgFDH6",  
            "created_at": "2012-10-30T18:27:22.042549Z",  
            "uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/debits/WDVc1VX2lJOrrXLjr7fDl3u",  
            "refunds_uri": "/v1/marketplaces/TEST-MPV07S4f8yiEKL3hUqEnzb6/debits/WDVc1VX2lJOrrXLjr7fDl3u/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WDVc1VX2lJOrrXLjr7fDl3u",  
            "available_at": "2012-10-31T01:27:22.023496Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RFVc9JfCFsPSH745y9dY3L6" 
    } 
 

List All refunds
---------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    GET /v1/marketplaces/:marketplace_id/refunds 
 

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
        "first_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/refunds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:27:23.461546Z",  
                    "uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "ACWOnqFYcikRRN1idUrnYS8",  
                    "credits_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/cards" 
                },  
                "fee": -43,  
                "description": "abc123",  
                "created_at": "2012-10-30T18:27:23.575037Z",  
                "uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/refunds/RFWTLrEI7hWtvCgabrpiy9K",  
                "transaction_number": "RF111-222-3333",  
                "amount": 1254,  
                "meta": {},  
                "debit": { 
                    "hold_uri": null,  
                    "fee": 43,  
                    "description": "abc123",  
                    "transaction_number": "W833-345-3947",  
                    "source_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/bank_accounts/BAWOa1rxDkSSqDhjvYn69FO",  
                    "created_at": "2012-10-30T18:27:23.561255Z",  
                    "uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/debits/WDWTCHnSDCMkDErseY3T47a",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/debits/WDWTCHnSDCMkDErseY3T47a/refunds",  
                    "amount": 1254,  
                    "meta": {},  
                    "appears_on_statement_as": "PND*TESTS",  
                    "id": "WDWTCHnSDCMkDErseY3T47a",  
                    "available_at": "2012-10-31T01:27:23.537886Z" 
                },  
                "appears_on_statement_as": "PND*TESTS",  
                "id": "RFWTLrEI7hWtvCgabrpiy9K" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:27:23.461546Z",  
                    "uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "ACWOnqFYcikRRN1idUrnYS8",  
                    "credits_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/cards" 
                },  
                "fee": -15,  
                "description": "abc123",  
                "created_at": "2012-10-30T18:27:23.575888Z",  
                "uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/refunds/RFWU4s17JN2qto4VCjJEsDO",  
                "transaction_number": "RF111-222-3333",  
                "amount": 431,  
                "meta": {},  
                "debit": { 
                    "hold_uri": null,  
                    "fee": 15,  
                    "description": "abc123",  
                    "transaction_number": "W758-060-0521",  
                    "source_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/accounts/ACWOnqFYcikRRN1idUrnYS8/bank_accounts/BAWOa1rxDkSSqDhjvYn69FO",  
                    "created_at": "2012-10-30T18:27:23.562152Z",  
                    "uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/debits/WDWTWeIsZq0wYx5kmpHCMaU",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/debits/WDWTWeIsZq0wYx5kmpHCMaU/refunds",  
                    "amount": 431,  
                    "meta": {},  
                    "appears_on_statement_as": "PND*TESTS",  
                    "id": "WDWTWeIsZq0wYx5kmpHCMaU",  
                    "available_at": "2012-10-31T01:27:23.542347Z" 
                },  
                "appears_on_statement_as": "PND*TESTS",  
                "id": "RFWU4s17JN2qto4VCjJEsDO" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/refunds?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 2,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MPWHjhmVOn4kJgRG4ukKakQ/refunds?limit=10&offset=0" 
    } 
 

Update a Refund
--------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds 
    GET /v1/marketplaces/:marketplace_id/refunds 
 

Request
~~~~~~~

``description`` 
    *optional* **string** or **null**.  
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "meta": { 
            "my-id": "0987654321" 
        },  
        "description": "my new description" 
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
        "account": { 
            "holds_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:27:26.851311Z",  
            "uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC10CJwEF3ijQIK2yt40JNSk",  
            "credits_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk/cards" 
        },  
        "fee": -43,  
        "description": "my new description",  
        "created_at": "2012-10-30T18:27:26.964213Z",  
        "uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/refunds/RF10ItbvAgr2ZKeCmQntrAaM",  
        "transaction_number": "RF111-222-3333",  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "debit": { 
            "hold_uri": null,  
            "fee": 43,  
            "description": "abc123",  
            "transaction_number": "W648-945-5541",  
            "source_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/accounts/AC10CJwEF3ijQIK2yt40JNSk/bank_accounts/BA10CpNwPgIgjg65TA85Z8Ko",  
            "created_at": "2012-10-30T18:27:26.961543Z",  
            "uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/debits/WD10Il9JyyhUUu0O53Yr8vHK",  
            "refunds_uri": "/v1/marketplaces/TEST-MP10vs1kCRaJGODAD5zbmeYA/debits/WD10Il9JyyhUUu0O53Yr8vHK/refunds",  
            "amount": 1254,  
            "meta": {},  
            "appears_on_statement_as": "PND*TESTS",  
            "id": "WD10Il9JyyhUUu0O53Yr8vHK",  
            "available_at": "2012-10-31T01:27:26.932298Z" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "id": "RF10ItbvAgr2ZKeCmQntrAaM" 
    } 
 

