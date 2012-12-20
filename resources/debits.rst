Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_
- `Refund a Debit`_

Fields
------

``id`` 
    **string**.  
 
``uri`` 
    **string**. The URI of the debit. 
 
``amount`` 
    **integer**. The amount of the debit. 
 
``description`` 
    **string**. Free-text description of the debit. 
 
``hold`` 
    **object**. The original hold for this debit, if this debit was to a card. 
    If the debit was to a bank account, this field will be null. 
 
``refunds_uri`` 
    **string**. URI for any partial or complete refunds of this debit. 
 
``appears_on_statement_as`` 
    **string**. The text that will appear on the buyer's statement. 
 
``account`` 
    **object**. The account to which this debit is associated. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    debit was created. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``available_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    transaction is guaranteed to clear. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``source`` 
    **object**. The funding source (card or bank account) for this debit. 
 

Deprecated
~~~~~~~~~~

``fee`` 
    **null**. The fee charged by Balanced. 
 

Debit an Account
----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/debits 
    POST /v1/marketplaces/:marketplace_id/holds/:hold_id/debits 
    POST /v1/marketplaces/:marketplace_id/debits 
 

Request
~~~~~~~

``amount`` 
    *optional* **integer**. If the resolving URI references a hold then this is hold amount. You can 
    always capture less than the hold amount (e.g. a partial capture). 
    Otherwise its the maximum per debit amount for your marketplace. Value must be >= the minimum per debit ``amount`` for *your* 
    marketplace. Value must be <= the maximum per debit ``amount`` for *your* 
    marketplace. 
 
``appears_on_statement_as`` 
    *optional* **string**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 
``merchant_uri`` 
    *optional* **string**. URI referencing the merchant account on behalf of whom the 
    debit is being done. This is different from marketplace. 
    In a peer-to-peer transaction, there are three parties: 
 
    1. Marketplace 
    2. Seller/Service provider 
    3. Buyer 
 
    This merchant account represents 2. 
 
``hold_uri`` 
    *optional* **string**. If no ``hold`` is provided one my be generated and captured if the 
    funding source is a card. 
 
``source_uri`` 
    *optional* **string**.  
 
``bank_account_uri`` 
    *optional* **string**.  
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/cards",  
            "created_at": "2012-12-20T03:06:55.963510Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/holds",  
            "id": "AC2qpvwCC47NlC1xXl1Qn54f",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/transactions",  
            "uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f" 
        },  
        "amount": 1234,  
        "appears_on_statement_as": "hiya.bom",  
        "available_at": "2012-12-20T03:06:56.080268Z",  
        "created_at": "2012-12-20T03:06:56.094128Z",  
        "description": null,  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f",  
            "amount": 1234,  
            "created_at": "2012-12-20T03:06:56.098218Z",  
            "description": null,  
            "expires_at": "2012-12-27T03:06:56.079529Z",  
            "fee": null,  
            "id": "HL2qySs7c0eo9ZTQOUotDA0r",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/cards/CC2qpIzBDKkejfjhIXVL6HtN",  
            "transaction_number": "HL624-422-1394",  
            "uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/holds/HL2qySs7c0eo9ZTQOUotDA0r" 
        },  
        "id": "WD2qyvSBRwXLzr4Bj770fj0f",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/debits/WD2qyvSBRwXLzr4Bj770fj0f/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-20T03:06:55.968733Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC2qpIzBDKkejfjhIXVL6HtN",  
            "is_valid": true,  
            "last_four": "5100",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/accounts/AC2qpvwCC47NlC1xXl1Qn54f/cards/CC2qpIzBDKkejfjhIXVL6HtN" 
        },  
        "transaction_number": "W524-818-1763",  
        "uri": "/v1/marketplaces/TEST-MP2qjfvVwdpvGDr60SJTak3V/debits/WD2qyvSBRwXLzr4Bj770fj0f" 
    } 
 

Retrieve a Debit
----------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id 
    GET /v1/marketplaces/:marketplace_id/holds/:hold_id/debits/:debit_id 
    GET /v1/marketplaces/:marketplace_id/debits/:debit_id 
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/cards",  
            "created_at": "2012-12-20T03:06:58.173030Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/holds",  
            "id": "AC2sTzguUEQGtuFM3Zn0U8Jt",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/transactions",  
            "uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2012-12-20T03:06:58.262301Z",  
        "created_at": "2012-12-20T03:06:58.271679Z",  
        "description": "abc123",  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt",  
            "amount": 1254,  
            "created_at": "2012-12-20T03:06:58.274362Z",  
            "description": null,  
            "expires_at": "2012-12-21T03:06:58.258297Z",  
            "fee": null,  
            "id": "HL2t0E3cZhAlZlrE7N581Uwb",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/cards/CC2sTOAd4kOgVXIMQWanWaKn",  
            "transaction_number": "HL617-412-3698",  
            "uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/holds/HL2t0E3cZhAlZlrE7N581Uwb" 
        },  
        "id": "WD2t0lqHGVdQfwkypbaD0feP",  
        "meta": {},  
        "refunds_uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/debits/WD2t0lqHGVdQfwkypbaD0feP/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-20T03:06:58.178432Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC2sTOAd4kOgVXIMQWanWaKn",  
            "is_valid": true,  
            "last_four": "5100",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/accounts/AC2sTzguUEQGtuFM3Zn0U8Jt/cards/CC2sTOAd4kOgVXIMQWanWaKn" 
        },  
        "transaction_number": "W230-066-8199",  
        "uri": "/v1/marketplaces/TEST-MP2sMLEe3hbKsH0uZjtFpQNJ/debits/WD2t0lqHGVdQfwkypbaD0feP" 
    } 
 

List All Debits
---------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits 
    GET /v1/marketplaces/:marketplace_id/holds/:hold_id/debits 
    GET /v1/marketplaces/:marketplace_id/debits 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/cards",  
                    "created_at": "2012-12-20T03:07:00.669712Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/debits",  
                    "email_address": "email.4@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/holds",  
                    "id": "AC2vHG5Oh0DhfsA8piF67lZx",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/refunds",  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx" 
                },  
                "amount": 9999999,  
                "appears_on_statement_as": "hiya.bom",  
                "available_at": "2012-12-20T03:07:00.692544Z",  
                "created_at": "2012-12-20T03:07:00.713324Z",  
                "description": null,  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx",  
                    "amount": 9999999,  
                    "created_at": "2012-12-20T03:07:00.720866Z",  
                    "description": null,  
                    "expires_at": "2012-12-27T03:07:00.691687Z",  
                    "fee": null,  
                    "id": "HL2vL9sBKtwe8x1RC5lrhQYz",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/cards/CC528575504a5211e2814780ee7316ae43",  
                    "transaction_number": "HL171-290-1185",  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/holds/HL2vL9sBKtwe8x1RC5lrhQYz" 
                },  
                "id": "WD2vKwseu6WCe5mvqugCxRYf",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits/WD2vKwseu6WCe5mvqugCxRYf/refunds",  
                "source": { 
                    "brand": "Visa",  
                    "card_type": "visa",  
                    "country_code": "USA",  
                    "created_at": "2012-12-20T03:07:00.681882Z",  
                    "expiration_month": 1,  
                    "expiration_year": 2015,  
                    "hash": null,  
                    "id": "CC528575504a5211e2814780ee7316ae43",  
                    "is_valid": true,  
                    "last_four": "1111",  
                    "meta": {},  
                    "name": "Jet Li",  
                    "postal_code": "94110",  
                    "street_address": "Somewhere over the rainbow",  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHG5Oh0DhfsA8piF67lZx/cards/CC528575504a5211e2814780ee7316ae43" 
                },  
                "transaction_number": "W136-808-0439",  
                "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits/WD2vKwseu6WCe5mvqugCxRYf" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/cards",  
                    "created_at": "2012-12-20T03:07:00.668242Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/holds",  
                    "id": "AC2vHzZjPBb4dTDXlD5crvy3",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3" 
                },  
                "amount": 1254,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2012-12-20T03:07:00.760982Z",  
                "created_at": "2012-12-20T03:07:00.775075Z",  
                "description": "abc123",  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3",  
                    "amount": 1254,  
                    "created_at": "2012-12-20T03:07:00.779221Z",  
                    "description": null,  
                    "expires_at": "2012-12-21T03:07:00.754657Z",  
                    "fee": null,  
                    "id": "HL2vPizJ7u95fObmwpJsJNar",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/cards/CC2vHNaSFXpc9Z7yexC2E0bV",  
                    "transaction_number": "HL968-376-4553",  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/holds/HL2vPizJ7u95fObmwpJsJNar" 
                },  
                "id": "WD2vOUP2IR58QuBd2pCPAK8b",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits/WD2vOUP2IR58QuBd2pCPAK8b/refunds",  
                "source": { 
                    "brand": "American Express",  
                    "card_type": "amex",  
                    "created_at": "2012-12-20T03:07:00.673117Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC2vHNaSFXpc9Z7yexC2E0bV",  
                    "is_valid": true,  
                    "last_four": "5100",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/cards/CC2vHNaSFXpc9Z7yexC2E0bV" 
                },  
                "transaction_number": "W968-609-9225",  
                "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits/WD2vOUP2IR58QuBd2pCPAK8b" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/cards",  
                    "created_at": "2012-12-20T03:07:00.668242Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/holds",  
                    "id": "AC2vHzZjPBb4dTDXlD5crvy3",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3" 
                },  
                "amount": 431,  
                "appears_on_statement_as": "PND*TESTS",  
                "available_at": "2012-12-20T03:07:00.804126Z",  
                "created_at": "2012-12-20T03:07:00.815758Z",  
                "description": "abc123",  
                "fee": null,  
                "hold": { 
                    "account_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3",  
                    "amount": 431,  
                    "created_at": "2012-12-20T03:07:00.819190Z",  
                    "description": null,  
                    "expires_at": "2012-12-21T03:07:00.798330Z",  
                    "fee": null,  
                    "id": "HL2vS5zkTXBzZJVQwAoFJzPR",  
                    "is_void": false,  
                    "meta": {},  
                    "source_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/cards/CC2vHNaSFXpc9Z7yexC2E0bV",  
                    "transaction_number": "HL772-538-9004",  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/holds/HL2vS5zkTXBzZJVQwAoFJzPR" 
                },  
                "id": "WD2vRPurKyuGaLPCAzEcDJyb",  
                "meta": {},  
                "refunds_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits/WD2vRPurKyuGaLPCAzEcDJyb/refunds",  
                "source": { 
                    "brand": "American Express",  
                    "card_type": "amex",  
                    "created_at": "2012-12-20T03:07:00.673117Z",  
                    "expiration_month": 10,  
                    "expiration_year": 2016,  
                    "hash": "handcock",  
                    "id": "CC2vHNaSFXpc9Z7yexC2E0bV",  
                    "is_valid": true,  
                    "last_four": "5100",  
                    "meta": {},  
                    "name": null,  
                    "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/accounts/AC2vHzZjPBb4dTDXlD5crvy3/cards/CC2vHNaSFXpc9Z7yexC2E0bV" 
                },  
                "transaction_number": "W834-567-4881",  
                "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits/WD2vRPurKyuGaLPCAzEcDJyb" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 3,  
        "uri": "/v1/marketplaces/TEST-MP2vBqxwP9DlOJSsxB8IgCnp/debits?limit=10&offset=0" 
    } 
 

Update a Debit
--------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id/debits/:debit_id 
    PUT /v1/marketplaces/:marketplace_id/holds/:hold_id/debits/:debit_id 
    PUT /v1/marketplaces/:marketplace_id/debits/:debit_id 
 

Request
~~~~~~~

``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/cards",  
            "created_at": "2012-12-20T03:07:05.866577Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/holds",  
            "id": "AC2By4LEBGoEx4iLU9eCezlN",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/transactions",  
            "uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "available_at": "2012-12-20T03:07:05.958018Z",  
        "created_at": "2012-12-20T03:07:05.967283Z",  
        "description": "my new description",  
        "fee": null,  
        "hold": { 
            "account_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN",  
            "amount": 1254,  
            "created_at": "2012-12-20T03:07:05.969946Z",  
            "description": null,  
            "expires_at": "2012-12-21T03:07:05.953011Z",  
            "fee": null,  
            "id": "HL2BFhgzv69IpgJELycp4BvZ",  
            "is_void": false,  
            "meta": {},  
            "source_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/cards/CC2BypGLmOsOtX5YX6XwD1IL",  
            "transaction_number": "HL245-807-7821",  
            "uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/holds/HL2BFhgzv69IpgJELycp4BvZ" 
        },  
        "id": "WD2BEZTxbeBmYqtozMVwx9nR",  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "refunds_uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/debits/WD2BEZTxbeBmYqtozMVwx9nR/refunds",  
        "source": { 
            "brand": "American Express",  
            "card_type": "amex",  
            "created_at": "2012-12-20T03:07:05.873908Z",  
            "expiration_month": 10,  
            "expiration_year": 2016,  
            "hash": "handcock",  
            "id": "CC2BypGLmOsOtX5YX6XwD1IL",  
            "is_valid": true,  
            "last_four": "1117",  
            "meta": {},  
            "name": null,  
            "uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/accounts/AC2By4LEBGoEx4iLU9eCezlN/cards/CC2BypGLmOsOtX5YX6XwD1IL" 
        },  
        "transaction_number": "W953-465-3513",  
        "uri": "/v1/marketplaces/TEST-MP2BrHuTIDOpd6NXLythnehR/debits/WD2BEZTxbeBmYqtozMVwx9nR" 
    } 
 

Refund a Debit
--------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/debits/:debit_id/refunds 
 

Request
~~~~~~~

``amount`` 
    *optional* **integer**. Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original 
    ``debit``. 
 
``description`` 
    *optional* **string**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    {} 
 

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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf/cards",  
            "created_at": "2012-12-20T03:07:10.866884Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf/holds",  
            "id": "AC2HaLtkml8tjFXe8UHfd9cf",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf/transactions",  
            "uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf" 
        },  
        "amount": 1254,  
        "appears_on_statement_as": "PND*TESTS",  
        "created_at": "2012-12-20T03:07:11.035847Z",  
        "debit": { 
            "account_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf",  
            "amount": 1254,  
            "appears_on_statement_as": "PND*TESTS",  
            "available_at": "2012-12-20T03:07:10.947814Z",  
            "created_at": "2012-12-20T03:07:10.957197Z",  
            "description": "abc123",  
            "fee": null,  
            "hold_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/holds/HL2Hheb1HnR6rn5x7cQeTETF",  
            "id": "WD2HgW4GIz5WmfGU5pxdmLZ1",  
            "meta": {},  
            "refunds_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/debits/WD2HgW4GIz5WmfGU5pxdmLZ1/refunds",  
            "source_uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/accounts/AC2HaLtkml8tjFXe8UHfd9cf/cards/CC2HaXKB9v3JR1VvOTFvihcn",  
            "transaction_number": "W994-187-4168",  
            "uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/debits/WD2HgW4GIz5WmfGU5pxdmLZ1" 
        },  
        "description": "abc123",  
        "fee": null,  
        "id": "RF2HmwLBe5Qbj3xw62Y6zJGr",  
        "meta": {},  
        "transaction_number": "RF865-091-4711",  
        "uri": "/v1/marketplaces/TEST-MP2H4Y5Ge0WOr2GSzJoAOLS3/refunds/RF2HmwLBe5Qbj3xw62Y6zJGr" 
    } 
 

