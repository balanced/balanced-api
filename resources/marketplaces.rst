Marketplaces
============

- `Create a Marketplace`_
- `Retrieve a Marketplace`_
- `List my Marketplaces`_
- `Update a Marketplace`_

Fields
------

``id`` 
    **string**. The resource identifier.  
 
``uri`` 
    **string**. The URI of this marketplace  
 
``name`` 
    **string**. Name of this marketplace. 
 
``support_email_address`` 
    **string**. Email address on file for support for this marketplace. 
 
``support_phone_number`` 
    **string**. Phone number on file for support for this marketplace. 
 
``domain_url`` 
    **string**.  
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``in_escrow`` 
    **integer**. Amount (in cents) in the escrow account for this marketplace. 
 
``owner_account`` 
    **object**. The account owning this marketplace. See `Accounts <./accounts.rst>`_. 
 
``debits_uri`` 
    **string**. URI for all debits for this marketplace. 
 
``credits_uri`` 
    **string**. URI for all credits for this marketplace. 
 
``refunds_uri`` 
    **string**. URI for all refunds for this marketplace. 
 
``holds_uri`` 
    **string**. URI for all holds for this marketplace. 
 
``accounts_uri`` 
    **string**. URI for all accounts on this marketplace. 
 
``transactions_uri`` 
    **string**. URI for all transactions for this marketplace. 
 
``bank_accounts_uri`` 
    **string**. A URI for a Balanced entity 
 
``cards_uri`` 
    **string**. A URI for a Balanced entity 
 

Create a Marketplace
--------------------

.. code:: 
 
    POST /v1/marketplaces 
 

Request
~~~~~~~

``support_email_address`` 
    *optional* **string** or **null**. RFC-2822 formatted email address. 
 
``name`` 
    *optional* **string** or **null**. Length must be **<=** ``128``. 
 
``domain_url`` 
    *optional* **string** or **null**.  
 
``support_phone_number`` 
    *optional* **string** or **null**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``owner_account`` 
    *optional* **object** or **null**.  
        ``name`` 
            *optional* **string** or **null**. Length must be **<=** ``128``. 
 
        ``email_address`` 
            *optional* **string** or **null**. RFC-2822 formatted email address. 
 
    Defaults to: 
 
    .. code:: javascript 
 
        { 
            "email_address": null, 
            "name": null 
        } 
 
 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "support_phone_number": "+12125551212",  
        "domain_url": "example.com",  
        "meta": { 
            "my-useful-data": "abc123" 
        },  
        "support_email_address": "support@example.com",  
        "name": "Seller of things" 
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
        "in_escrow": 0,  
        "support_phone_number": "+12125551212",  
        "holds_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/holds",  
        "name": "Seller of things",  
        "domain_url": "example.com",  
        "support_email_address": "support@example.com",  
        "uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC",  
        "accounts_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts",  
        "owner_account": { 
            "holds_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts/ACv4JedBEbFQVXlObc2oXnC/holds",  
            "name": "Merchants, Inc.",  
            "roles": [ 
                "merchant" 
            ],  
            "created_at": "2012-10-30T18:26:58.801263Z",  
            "uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts/ACv4JedBEbFQVXlObc2oXnC",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts/ACv4JedBEbFQVXlObc2oXnC/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts/ACv4JedBEbFQVXlObc2oXnC/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts/ACv4JedBEbFQVXlObc2oXnC/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts/ACv4JedBEbFQVXlObc2oXnC/transactions",  
            "email_address": "email.10@y.com",  
            "id": "ACv4JedBEbFQVXlObc2oXnC",  
            "credits_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts/ACv4JedBEbFQVXlObc2oXnC/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/accounts/ACv4JedBEbFQVXlObc2oXnC/cards" 
        },  
        "refunds_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/refunds",  
        "meta": { 
            "my-useful-data": "abc123" 
        },  
        "debits_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/transactions",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/bank_accounts",  
        "id": "TEST-MPv4j5PYIIs9FcN1juHgEVC",  
        "credits_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPv4j5PYIIs9FcN1juHgEVC/cards" 
    } 
 

Retrieve a Marketplace
----------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id 
 

Headers 
~~~~~~~ 
 
.. code::  
 
    Status: 201 CREATED 
 
Body 
~~~~ 
 
.. code:: javascript 
 
    { 
        "in_escrow": 0,  
        "support_phone_number": "+12125551212",  
        "holds_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/holds",  
        "name": "Seller of things",  
        "domain_url": "example.com",  
        "support_email_address": "support@example.com",  
        "uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W",  
        "accounts_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts",  
        "owner_account": { 
            "holds_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts/ACwWONq2Z681U5JMXhfle4I/holds",  
            "name": "Merchants, Inc.",  
            "roles": [ 
                "merchant" 
            ],  
            "created_at": "2012-10-30T18:27:00.466063Z",  
            "uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts/ACwWONq2Z681U5JMXhfle4I",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts/ACwWONq2Z681U5JMXhfle4I/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts/ACwWONq2Z681U5JMXhfle4I/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts/ACwWONq2Z681U5JMXhfle4I/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts/ACwWONq2Z681U5JMXhfle4I/transactions",  
            "email_address": "email.10@y.com",  
            "id": "ACwWONq2Z681U5JMXhfle4I",  
            "credits_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts/ACwWONq2Z681U5JMXhfle4I/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/accounts/ACwWONq2Z681U5JMXhfle4I/cards" 
        },  
        "refunds_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/refunds",  
        "meta": { 
            "my-useful-data": "abc123" 
        },  
        "debits_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/transactions",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/bank_accounts",  
        "id": "TEST-MPwWpngBqA0RlX3WXEW107W",  
        "credits_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPwWpngBqA0RlX3WXEW107W/cards" 
    } 
 

List my Marketplaces
--------------------

.. code:: 
 
    GET /v1/marketplaces 
 

Headers 
~~~~~~~ 
 
.. code::  
 
    Status: 200 OK 
 
Body 
~~~~ 
 
.. code:: javascript 
 
    { 
        "first_uri": "/v1/marketplaces?limit=10&offset=0",  
        "items": [ 
            { 
                "in_escrow": 9999999,  
                "support_phone_number": "1234321234",  
                "domain_url": "hiya.bom",  
                "name": "Some",  
                "support_email_address": "email.0@y.com",  
                "uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2",  
                "holds_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/holds",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/bank_accounts",  
                "owner_account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts/ACyBVFLLwZ2kANdBZZQE8x6/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:27:01.945303Z",  
                    "uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts/ACyBVFLLwZ2kANdBZZQE8x6",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts/ACyBVFLLwZ2kANdBZZQE8x6/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts/ACyBVFLLwZ2kANdBZZQE8x6/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts/ACyBVFLLwZ2kANdBZZQE8x6/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts/ACyBVFLLwZ2kANdBZZQE8x6/transactions",  
                    "email_address": "email.2@y.com",  
                    "id": "ACyBVFLLwZ2kANdBZZQE8x6",  
                    "credits_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts/ACyBVFLLwZ2kANdBZZQE8x6/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts/ACyBVFLLwZ2kANdBZZQE8x6/cards" 
                },  
                "refunds_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/transactions",  
                "accounts_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/accounts",  
                "id": "TEST-MPyzWVK1TnEfWnzz4a2Mfd2",  
                "credits_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MPyzWVK1TnEfWnzz4a2Mfd2/cards" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 1,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces?limit=10&offset=0" 
    } 
 

Update a Marketplace
--------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id 
 

Request
~~~~~~~

``name`` 
    *optional* **string** or **null**. Length must be **<=** ``128``. 
 
``support_email_address`` 
    *optional* **string** or **null**. RFC-2822 formatted email address. 
 
``support_phone_number`` 
    *optional* **string** or **null**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
``domain_url`` 
    *optional* **string** or **null**.  
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "support_phone_number": "+18185551212",  
        "meta": { 
            "even-more-useful-data": "321cba" 
        },  
        "support_email_address": "faster-support@example.com",  
        "name": "Seller of thingz" 
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
        "in_escrow": 9999999,  
        "support_phone_number": "+18185551212",  
        "holds_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/holds",  
        "name": "Seller of thingz",  
        "domain_url": "hiya.bom",  
        "support_email_address": "faster-support@example.com",  
        "uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs",  
        "accounts_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts",  
        "owner_account": { 
            "holds_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts/ACC0Ks8JooiLSe6yufcmCsQ/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:27:04.968569Z",  
            "uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts/ACC0Ks8JooiLSe6yufcmCsQ",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts/ACC0Ks8JooiLSe6yufcmCsQ/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts/ACC0Ks8JooiLSe6yufcmCsQ/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts/ACC0Ks8JooiLSe6yufcmCsQ/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts/ACC0Ks8JooiLSe6yufcmCsQ/transactions",  
            "email_address": "email.2@y.com",  
            "id": "ACC0Ks8JooiLSe6yufcmCsQ",  
            "credits_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts/ACC0Ks8JooiLSe6yufcmCsQ/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/accounts/ACC0Ks8JooiLSe6yufcmCsQ/cards" 
        },  
        "refunds_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/refunds",  
        "meta": { 
            "even-more-useful-data": "321cba" 
        },  
        "debits_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/transactions",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/bank_accounts",  
        "id": "TEST-MPBYLiUMvPGPDv86hvaGMAs",  
        "credits_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPBYLiUMvPGPDv86hvaGMAs/cards" 
    } 
 

