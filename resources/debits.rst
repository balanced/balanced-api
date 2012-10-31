Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_

Fields
------

``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**. The URI of the debit. 
 
``amount`` 
    **integer**. The amount of the debit. 
 
``fee`` 
    **integer**. The fee charged by Balanced for this debit. 
 
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
 

Debit an Account
----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/debits 
    POST /v1/marketplaces/:marketplace_id/holds/:hold_id/debits 
    POST /v1/marketplaces/:marketplace_id/debits 
 

Request
~~~~~~~

``amount`` 
    *optional* **integer** or **null**. If the resolving URI references a hold then this is hold amount. You can 
    always capture less than the hold amount (e.g. a partial capture). 
    Otherwise its the maximum per debit amount for your marketplace. Value must be >= the minimum per debit ``amount`` for *your* 
    marketplace. Value must be <= the maximum per debit ``amount`` for *your* 
    marketplace. 
 
``appears_on_statement_as`` 
    *optional* **string** or **null**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``description`` 
    *optional* **string** or **null**.  
 
``merchant_uri`` 
    *optional* **string** or **null**. URI referencing the merchant account on behalf of whom the 
    debit is being done. This is different from marketplace. 
    In a peer-to-peer transaction, there are three parties: 
 
    1. Marketplace 
    2. Seller/Service provider 
    3. Buyer 
 
    This merchant account represents 2. 
 
``hold_uri`` 
    *optional* **string** or **null**. If no ``hold`` is provided one my be generated and captured if the 
    source is a card. 
 
``source_uri`` 
    *optional* **string** or **null**.  
 
``bank_account_uri`` 
    *optional* **string** or **null**.  
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:28.293157Z",  
            "uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC7JPlIdloAUV5uKBNv2ZlVa",  
            "credits_uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa/cards" 
        },  
        "fee": 43,  
        "description": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/debits/WD7JYEc9i3zCpmJ9P6OUavbK/refunds",  
        "created_at": "2012-10-30T18:26:28.437560Z",  
        "transaction_number": "W301-379-9427",  
        "uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/debits/WD7JYEc9i3zCpmJ9P6OUavbK",  
        "source": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-30T18:26:28.288688Z",  
            "uri": "/v1/marketplaces/TEST-MP7JI0jnkeThO0nI20tS5BcM/accounts/AC7JPlIdloAUV5uKBNv2ZlVa/bank_accounts/BA7JP1TZK5jeiJmvYoMPCet6",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA7JP1TZK5jeiJmvYoMPCet6" 
        },  
        "amount": 1234,  
        "meta": {},  
        "appears_on_statement_as": "hiya.bom",  
        "hold": null,  
        "id": "WD7JYEc9i3zCpmJ9P6OUavbK",  
        "available_at": "2012-10-31T01:26:28.425707Z" 
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
            "holds_uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:29.858975Z",  
            "uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC7LAxzbIJw57tOOQCl8AcfO",  
            "credits_uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO/cards" 
        },  
        "fee": 43,  
        "description": "abc123",  
        "refunds_uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/debits/WD7LFhyx2MZ5CP4g2vxrWA4Y/refunds",  
        "created_at": "2012-10-30T18:26:29.933604Z",  
        "transaction_number": "W358-874-6060",  
        "uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/debits/WD7LFhyx2MZ5CP4g2vxrWA4Y",  
        "source": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-30T18:26:29.854780Z",  
            "uri": "/v1/marketplaces/TEST-MP7Luukk1cWQte8ordHfbjco/accounts/AC7LAxzbIJw57tOOQCl8AcfO/bank_accounts/BA7LAeRRhf0RPElyCMDCepIE",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA7LAeRRhf0RPElyCMDCepIE" 
        },  
        "amount": 1254,  
        "meta": {},  
        "appears_on_statement_as": "PND*TESTS",  
        "hold": null,  
        "id": "WD7LFhyx2MZ5CP4g2vxrWA4Y",  
        "available_at": "2012-10-31T01:26:29.927208Z" 
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
        "first_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:31.342537Z",  
                    "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "ACbXnk2VnLTLrrL8EySDfm",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/cards" 
                },  
                "fee": 15,  
                "description": "abc123",  
                "source": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-10-30T18:26:31.338402Z",  
                    "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/bank_accounts/BAbF3A6isdibuN6PVAyKQA",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BAbF3A6isdibuN6PVAyKQA" 
                },  
                "created_at": "2012-10-30T18:26:31.441705Z",  
                "transaction_number": "W217-210-6679",  
                "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits/WDhLczY3B0pZccZcKWK0KM",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits/WDhLczY3B0pZccZcKWK0KM/refunds",  
                "amount": 431,  
                "meta": {},  
                "appears_on_statement_as": "PND*TESTS",  
                "hold": null,  
                "id": "WDhLczY3B0pZccZcKWK0KM",  
                "available_at": "2012-10-31T01:26:31.426442Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/holds",  
                    "name": null,  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:31.342537Z",  
                    "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/transactions",  
                    "email_address": "email.7@y.com",  
                    "id": "ACbXnk2VnLTLrrL8EySDfm",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/cards" 
                },  
                "fee": 43,  
                "description": "abc123",  
                "source": { 
                    "bank_name": null,  
                    "name": "Fit Finlay",  
                    "bank_code": "325182797",  
                    "created_at": "2012-10-30T18:26:31.338402Z",  
                    "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACbXnk2VnLTLrrL8EySDfm/bank_accounts/BAbF3A6isdibuN6PVAyKQA",  
                    "is_valid": true,  
                    "meta": {},  
                    "last_four": "1234",  
                    "id": "BAbF3A6isdibuN6PVAyKQA" 
                },  
                "created_at": "2012-10-30T18:26:31.440955Z",  
                "transaction_number": "W309-254-7468",  
                "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits/WDhDnp2XVugw83U3O1kUyU",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits/WDhDnp2XVugw83U3O1kUyU/refunds",  
                "amount": 1254,  
                "meta": {},  
                "appears_on_statement_as": "PND*TESTS",  
                "hold": null,  
                "id": "WDhDnp2XVugw83U3O1kUyU",  
                "available_at": "2012-10-31T01:26:31.424770Z" 
            },  
            { 
                "account": { 
                    "holds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/holds",  
                    "name": null,  
                    "roles": [ 
                        "buyer" 
                    ],  
                    "created_at": "2012-10-30T18:26:31.343667Z",  
                    "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/bank_accounts",  
                    "refunds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/debits",  
                    "transactions_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/transactions",  
                    "email_address": "email.8@y.com",  
                    "id": "ACc2sykPSZJttbkkYCKheI",  
                    "credits_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/cards" 
                },  
                "fee": 349999,  
                "description": null,  
                "source": { 
                    "expiration_month": 1,  
                    "hash": null,  
                    "last_four": "1111",  
                    "expiration_year": 2015,  
                    "created_at": "2012-10-30T18:26:31.359805Z",  
                    "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/cards/CC001b040822fa11e29d7880ee7316ae44",  
                    "id": "CC001b040822fa11e29d7880ee7316ae44",  
                    "card_type": "visa",  
                    "is_valid": true,  
                    "meta": {},  
                    "country_code": "USA",  
                    "postal_code": "94110",  
                    "brand": "Visa",  
                    "street_address": "Somewhere over the rainbow",  
                    "name": "Jet Li" 
                },  
                "created_at": "2012-10-30T18:26:31.394991Z",  
                "transaction_number": "W402-679-5295",  
                "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits/WDe50t37eWCD8T6AzUVdUE",  
                "refunds_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits/WDe50t37eWCD8T6AzUVdUE/refunds",  
                "amount": 9999999,  
                "meta": {},  
                "appears_on_statement_as": "hiya.bom",  
                "hold": { 
                    "fee": 30,  
                    "description": null,  
                    "created_at": "2012-10-30T18:26:31.401977Z",  
                    "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/holds/HLg07BcmbODeFpN6aFBZK4",  
                    "expires_at": "2012-11-07T01:26:31.371317Z",  
                    "transaction_number": "HL741-511-7068",  
                    "amount": 9999999,  
                    "meta": {},  
                    "is_void": false,  
                    "account_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI",  
                    "source_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/accounts/ACc2sykPSZJttbkkYCKheI/cards/CC001b040822fa11e29d7880ee7316ae44",  
                    "id": "HLg07BcmbODeFpN6aFBZK4" 
                },  
                "id": "WDe50t37eWCD8T6AzUVdUE",  
                "available_at": "2012-10-31T01:26:31.372075Z" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 3,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MP4fKGRo2Ga96UW3pvy8aU/debits?limit=10&offset=0" 
    } 
 

Update a Debit
--------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/debits 
    GET /v1/marketplaces/:marketplace_id/holds/:hold_id/debits 
    GET /v1/marketplaces/:marketplace_id/debits 
 

Request
~~~~~~~

``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``description`` 
    *optional* **string** or **null**.  
 

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
            "holds_uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa/holds",  
            "name": null,  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "created_at": "2012-10-30T18:26:34.883668Z",  
            "uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa/bank_accounts",  
            "refunds_uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa/debits",  
            "transactions_uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa/transactions",  
            "email_address": "email.7@y.com",  
            "id": "AC4aTfkwrgld0rSYS5mssHa",  
            "credits_uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa/cards" 
        },  
        "fee": 43,  
        "description": "my new description",  
        "refunds_uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/debits/WD4gs4ruODIZFIqUaxJSChe/refunds",  
        "created_at": "2012-10-30T18:26:34.978979Z",  
        "transaction_number": "W085-140-5833",  
        "uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/debits/WD4gs4ruODIZFIqUaxJSChe",  
        "source": { 
            "bank_name": null,  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "created_at": "2012-10-30T18:26:34.879703Z",  
            "uri": "/v1/marketplaces/TEST-MP43mjkegx2NvThZ05Um1Y8/accounts/AC4aTfkwrgld0rSYS5mssHa/bank_accounts/BA4aBxV8sTtsAesT3Hhrbgw",  
            "is_valid": true,  
            "meta": {},  
            "last_four": "1234",  
            "id": "BA4aBxV8sTtsAesT3Hhrbgw" 
        },  
        "amount": 1254,  
        "meta": { 
            "my-id": "0987654321" 
        },  
        "appears_on_statement_as": "PND*TESTS",  
        "hold": null,  
        "id": "WD4gs4ruODIZFIqUaxJSChe",  
        "available_at": "2012-10-31T01:26:34.964074Z" 
    } 
 

