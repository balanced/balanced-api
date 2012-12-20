Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

``id`` 
    **string**.  
 
``uri`` 
    **string**.  
 
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
    *optional* **integer**. Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original 
    ``debit``. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``debit_uri`` 
    *optional* **string**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "debit_uri": "/v1/marketplaces/TEST-MP45Fl67J6z5OSThC5eEiSsG/debits/WD45L7P3ofA0dNoGJBZ4dYym",  
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk/cards",  
            "created_at": "2012-12-18T22:08:37.690678Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk/holds",  
            "id": "AC47bghG4qXl9Fsp4Y50RVrk",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk/transactions",  
            "uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-18T22:08:37.783307Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-19T06:08:37.734325Z",  
            "created_at": "2012-12-18T22:08:37.740022Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/holds/HL47eN6RELC276no8cL9uvsS",  
            "id": "WD47eDbt5d48stInHle4Qd9U",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/debits/WD47eDbt5d48stInHle4Qd9U/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/accounts/AC47bghG4qXl9Fsp4Y50RVrk/cards/CC47blzdbwUXeOERH5S5IggG",  
            "transaction_number": "W572-164-9195",  
            "uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/debits/WD47eDbt5d48stInHle4Qd9U" 
        },  
        "description": "abc123",  
        "fee": 0,  
        "id": "RF47hHl0vaVNNa154lwtSarE",  
        "meta": {},  
        "transaction_number": "RF691-474-7844",  
        "uri": "/v1/marketplaces/TEST-MP478OdIhSGRqqh6AWXRAKdc/refunds/RF47hHl0vaVNNa154lwtSarE" 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o/cards",  
            "created_at": "2012-12-18T22:08:39.005381Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o/holds",  
            "id": "AC48EWboiYfnsjNnpBTUSf5o",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o/transactions",  
            "uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-18T22:08:39.065804Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-19T06:08:39.048859Z",  
            "created_at": "2012-12-18T22:08:39.054675Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/holds/HL48Itpsa4nMry7CqwjJT21Y",  
            "id": "WD48IjtwlII1J54YjFyletXs",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/debits/WD48IjtwlII1J54YjFyletXs/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/accounts/AC48EWboiYfnsjNnpBTUSf5o/cards/CC48F16G1brYvFNoQmKSezZU",  
            "transaction_number": "W776-785-7798",  
            "uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/debits/WD48IjtwlII1J54YjFyletXs" 
        },  
        "description": "abc123",  
        "fee": 0,  
        "id": "RF48J8MbyKy1ZvquPKKzMTii",  
        "meta": {},  
        "transaction_number": "RF111-222-3333",  
        "uri": "/v1/marketplaces/TEST-MP48CCqkwrJ7BL0WSyptmIRQ/refunds/RF48J8MbyKy1ZvquPKKzMTii" 
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
        "first_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/refunds?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/cards",  
                    "created_at": "2012-12-18T22:08:40.293757Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/holds",  
                    "id": "AC4a6LBJczlEHYcjWHxOfKpI",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "created_at": "2012-12-18T22:08:40.353365Z",  
                "debit": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI",  
                    "amount": 1254,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2012-12-19T06:08:40.336474Z",  
                    "created_at": "2012-12-18T22:08:40.342366Z",  
                    "description": "abc123",  
                    "fee": 43,  
                    "hold_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/holds/HL4aafOytVYUEYJELpRLlfiW",  
                    "id": "WD4aa7hTUA8ugvYoYSAIXBjA",  
                    "meta": {},  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/debits/WD4aa7hTUA8ugvYoYSAIXBjA/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/cards/CC4a6RgjzJL4pzRIRlRncA66",  
                    "transaction_number": "W570-295-4465",  
                    "uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/debits/WD4aa7hTUA8ugvYoYSAIXBjA" 
                },  
                "description": "abc123",  
                "fee": 0,  
                "id": "RF4aaVBQQSnjSuBGy1XsetYe",  
                "meta": {},  
                "transaction_number": "RF111-222-3333",  
                "uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/refunds/RF4aaVBQQSnjSuBGy1XsetYe" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/cards",  
                    "created_at": "2012-12-18T22:08:40.293757Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/holds",  
                    "id": "AC4a6LBJczlEHYcjWHxOfKpI",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "created_at": "2012-12-18T22:08:40.383720Z",  
                "debit": { 
                    "account_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI",  
                    "amount": 431,  
                    "appears_on_statement_as": "PND*TESTS",  
                    "available_at": "2012-12-19T06:08:40.367160Z",  
                    "created_at": "2012-12-18T22:08:40.373459Z",  
                    "description": "abc123",  
                    "fee": 15,  
                    "hold_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/holds/HL4acpEHBCaxBLmazy75nq8G",  
                    "id": "WD4ackq2jL2fTTZ93Edl02gy",  
                    "meta": {},  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/debits/WD4ackq2jL2fTTZ93Edl02gy/refunds",  
                    "source_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/accounts/AC4a6LBJczlEHYcjWHxOfKpI/cards/CC4a6RgjzJL4pzRIRlRncA66",  
                    "transaction_number": "W253-471-6190",  
                    "uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/debits/WD4ackq2jL2fTTZ93Edl02gy" 
                },  
                "description": "abc123",  
                "fee": 0,  
                "id": "RF4ad2R3KGJ1VKkrhejpKaCu",  
                "meta": {},  
                "transaction_number": "RF111-222-3333",  
                "uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/refunds/RF4ad2R3KGJ1VKkrhejpKaCu" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/refunds?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP4a4luo6iAJGNCMrePQByoG/refunds?limit=10&offset=0" 
    } 
 

Update a Refund
--------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/refunds/:refund_id 
    PUT /v1/marketplaces/:marketplace_id/refunds/:refund_id 
 

Request
~~~~~~~

``description`` 
    *optional* **string**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg/cards",  
            "created_at": "2012-12-18T22:08:43.000294Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg/holds",  
            "id": "AC4d9vFBlqehe1N2G1cGTBFg",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg/transactions",  
            "uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-18T22:08:43.060788Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-19T06:08:43.043902Z",  
            "created_at": "2012-12-18T22:08:43.049872Z",  
            "description": "abc123",  
            "fee": 43,  
            "hold_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/holds/HL4dd3rMPXhp2yUwynoAj8Qq",  
            "id": "WD4dcUYXVgGQx0Pku2L2t1qi",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/debits/WD4dcUYXVgGQx0Pku2L2t1qi/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/accounts/AC4d9vFBlqehe1N2G1cGTBFg/cards/CC4d9B4oQfReMAWLcaeLk3xw",  
            "transaction_number": "W697-394-7290",  
            "uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/debits/WD4dcUYXVgGQx0Pku2L2t1qi" 
        },  
        "description": "my new description",  
        "fee": 0,  
        "id": "RF4ddIuX1IjURCfiQ1Y8eswW",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "transaction_number": "RF111-222-3333",  
        "uri": "/v1/marketplaces/TEST-MP4d7ac62zBlCRDrlNFHwElQ/refunds/RF4ddIuX1IjURCfiQ1Y8eswW" 
    } 
 

