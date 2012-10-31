Merchants
========

- `List all Merchants`_.
- `Retrieve a Merchant`_.
- `Update a Merchant`_.

Fields
------

``id`` 
    **string**. The resource identifier.  
 
``uri`` 
    **string**. The URI of this merchant.  
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    merchant was underwritten. 
 
``type`` 
    **string**. Merchant type. It will be one of: ``person`` or ``business`` 
 
``name`` 
    **string**. The name of the business, for a business-type merchant. 
    The name of the person, for a person-type merchant. 
 
``email_address`` 
    **string**. Email address of the business, for a business-type merchant. 
    Email address of the person, for a person-type merchant. 
 
``phone_number`` 
    **string**. The merchant's phone number. 
 
``balance`` 
    **integer**. Merchant's account balance. 
 
``marketplace`` 
    **object**.  See `Marketplaces <./marketplaces.rst#marketplace-view>`_. 
 
``accounts_uri`` 
    **string**. Accounts belonging to this merchant. 
 
``api_keys_uri`` 
    **string**. URI for this merchant's API keys. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``street_address`` 
    **string**.  
``city`` 
    **string**.  
``postal_code`` 
    **string**.  
``country_code`` 
    **string**.  

List all Merchants
------------------

.. code:: 
 
    GET /v1/merchants 
 

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
        "first_uri": "/v1/merchants?limit=10&offset=0",  
        "items": [ 
            { 
                "phone_number": "+19046281796",  
                "city": "San Francisco",  
                "marketplace": { 
                    "in_escrow": 9999999,  
                    "domain_url": "hiya.bom",  
                    "name": "Some",  
                    "owner_account_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/accounts/ACFqhLspWl34746WywRDz0w",  
                    "support_email_address": "email.0@y.com",  
                    "uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu",  
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/bank_accounts",  
                    "support_phone_number": "1234321234",  
                    "refunds_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/refunds",  
                    "meta": {},  
                    "debits_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/debits",  
                    "holds_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/holds",  
                    "transactions_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/transactions",  
                    "accounts_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/accounts",  
                    "id": "TEST-MPFoj8W1ovDQmjQ7KmS3bDu",  
                    "credits_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/credits",  
                    "cards_uri": "/v1/marketplaces/TEST-MPFoj8W1ovDQmjQ7KmS3bDu/cards" 
                },  
                "name": "Merchants, Inc.",  
                "email_address": "email.1@y.com",  
                "created_at": "2012-10-30T18:27:07.997669Z",  
                "uri": "/v1/merchants/TEST-MRFpRp8ApzzMBvhABr17AVK",  
                "accounts_uri": "/v1/merchants/TEST-MRFpRp8ApzzMBvhABr17AVK/accounts",  
                "meta": {},  
                "postal_code": "94110",  
                "country_code": "USA",  
                "balance": -350029,  
                "type": "business",  
                "id": "TEST-MRFpRp8ApzzMBvhABr17AVK",  
                "street_address": "Somewhere over the rainbow",  
                "api_keys_uri": "/v1/merchants/TEST-MRFpRp8ApzzMBvhABr17AVK/api_keys" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/merchants?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 1,  
        "next_uri": null,  
        "last_uri": "/v1/merchants?limit=10&offset=0" 
    } 
 

Retrieve a Merchant
-------------------

.. code:: 
 
    GET /v1/merchants/:merchant_id 
 

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
        "phone_number": "+19046281796",  
        "city": "San Francisco",  
        "marketplace": { 
            "in_escrow": 9999999,  
            "domain_url": "hiya.bom",  
            "name": "Some",  
            "owner_account_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/accounts/ACH9kODXIJzMEf9kRhuTZkM",  
            "support_email_address": "email.0@y.com",  
            "uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo",  
            "bank_accounts_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/bank_accounts",  
            "support_phone_number": "1234321234",  
            "refunds_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/refunds",  
            "meta": {},  
            "debits_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/debits",  
            "holds_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/holds",  
            "transactions_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/transactions",  
            "accounts_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/accounts",  
            "id": "TEST-MPH7jfQrLPbQeqVgL1Oawyo",  
            "credits_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/credits",  
            "cards_uri": "/v1/marketplaces/TEST-MPH7jfQrLPbQeqVgL1Oawyo/cards" 
        },  
        "name": "Merchants, Inc.",  
        "api_keys_uri": "/v1/merchants/TEST-MRH8UrfEBIonA9Q5KexcEYI/api_keys",  
        "created_at": "2012-10-30T18:27:09.532875Z",  
        "uri": "/v1/merchants/TEST-MRH8UrfEBIonA9Q5KexcEYI",  
        "accounts_uri": "/v1/merchants/TEST-MRH8UrfEBIonA9Q5KexcEYI/accounts",  
        "meta": {},  
        "postal_code": "94110",  
        "country_code": "USA",  
        "type": "business",  
        "balance": -350029,  
        "email_address": "email.1@y.com",  
        "id": "TEST-MRH8UrfEBIonA9Q5KexcEYI",  
        "street_address": "Somewhere over the rainbow" 
    } 
 

Update a Merchant
-----------------

.. code:: 
 
    PUT /v1/merchants/:merchant_id 
 

Request
~~~~~~~
   
``name`` 
    *optional* **string** or **null**. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. RFC-2822 formatted email address. 
 
``phone_number`` 
    *optional* **string** or **null**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
``bank_account`` 
    *optional* **object** or **null**.  
        ``name`` 
            *required* **string** or **null**. Name on the bank account. Length must be **>=** ``2``. 
 
        ``account_number`` 
            *required* **string** or **null**. Bank account number. Length must be **>=** ``1``. 
 
        ``bank_code`` 
            #. If not a *production* bank account then `bank_code` is a: 
 
               ``bank_code`` 
                   *required* **string** or **null**. Length must be **>=** ``1``. 
 
 
        ``account_type`` 
            *optional* **string** or **null**. Bank account type. It should be one of: ``checking``, ``savings`` 
 
        ``meta`` 
            *optional* **object** or **null**. Single level mapping from string keys to string values. 
 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "phone_number": "+16501112222",  
        "meta": { 
            "location": "121.121" 
        },  
        "email_address": "will@ie.com",  
        "name": "Willie",  
        "bank_account": { 
            "account_type": "savings",  
            "account_number": "345345345",  
            "name": "Willie",  
            "bank_code": "325182797" 
        } 
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
        "phone_number": "+16501112222",  
        "city": "San Francisco",  
        "marketplace": null,  
        "name": "Willie",  
        "api_keys_uri": "/v1/merchants/TEST-MRM8NOUGLBFcZYNiktcSmDa/api_keys",  
        "created_at": "2012-10-30T18:27:13.974890Z",  
        "uri": "/v1/merchants/TEST-MRM8NOUGLBFcZYNiktcSmDa",  
        "accounts_uri": "/v1/merchants/TEST-MRM8NOUGLBFcZYNiktcSmDa/accounts",  
        "meta": { 
            "location": "121.121" 
        },  
        "postal_code": "94110",  
        "country_code": "USA",  
        "type": "business",  
        "balance": 0,  
        "email_address": "will@ie.com",  
        "id": "TEST-MRM8NOUGLBFcZYNiktcSmDa",  
        "street_address": "Somewhere over the rainbow" 
    } 
 

