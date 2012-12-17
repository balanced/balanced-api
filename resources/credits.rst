Credits
=======

- `Credit a New Bank Account`_
- `Credit an Existing Bank Account`_
- `Credit a Merchant`_
- `Retrieve a Credit`_
- `List All Credits`_
- `List All Credits for a Bank Account`_
- `List All Credits for a Merchant`_

Fields
------

``id`` 
    **string**.  
 
``uri`` 
    **string**.  
 
``amount`` 
    **integer**. Amount of the credit. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_. 
 
``description`` 
    **string**.  
 
``account`` 
    **object**. `Accounts <./accounts.rst>`_. Present if the credit went to a merchant instead of directly to a bank account. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``bank_account`` 
    **object**. `Bank Account <./bank_accounts.rst>`_. 
 
``status`` 
    **string**. One of ``pending``, ``paid``, ``failed``. 
 

Deprecated
~~~~~~~~~~

``destination`` 
    **object**. The funding destination for this credit (i.e., a bank account). 
 
``state`` 
    **string**. Use ``status`` instead. 
 
``transaction_number`` 
    **string**. An identifier for this transaction. 
 
``available_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    credit will be available to the merchant. 
 
``fee`` 
    **integer**. The fee charged by Balanced for this credit. 
 

Credit a New Bank Account
-------------------------

.. code:: 
 
    POST /v1/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. You must have ``amount`` funds transferred to cover the 
    credit. 
 
``bank_account`` 
    .. cssclass:: nested1 
 
    *required* **object**. `BankAccount <./bank_accounts.rst>`_. 
 
``description`` 
    *optional* **string** or **null**. Sequence of characters. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 1234,  
        "description": "Something descriptive",  
        "bank_account": { 
            "account_number": "12341234",  
            "name": "Fit Finlay",  
            "bank_code": "325182797",  
            "type": "checking" 
        } 
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
        "amount": 1234,  
        "bank_account": { 
            "account_number": "xxxx1234",  
            "bank_name": "Banko De Ismus",  
            "fingerprint": "brown",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking" 
        },  
        "created_at": "2012-12-15T22:50:13.664960Z",  
        "description": "Something descriptive",  
        "id": "CR6z2tS56sViutIkmtYrgdxo",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR6z2tS56sViutIkmtYrgdxo" 
    } 
 

Credit an Existing Bank Account
-------------------------------

.. code:: 
 
    POST /v1/bank_accounts/:bank_account_id/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. You must have ``amount`` funds transferred to cover the 
    credit. 
 
``description`` 
    *optional* **string** or **null**. Sequence of characters. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "amount": 1234,  
        "description": "A description" 
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
        "amount": 1234,  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-12-15T22:50:16.358959Z",  
            "credits_uri": "/v1/bank_accounts/BA6C4ir7gtLDgX352jMKCfLI/credits",  
            "fingerprint": "12341234",  
            "id": "BA6C4ir7gtLDgX352jMKCfLI",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA6C4ir7gtLDgX352jMKCfLI" 
        },  
        "created_at": "2012-12-15T22:50:16.381047Z",  
        "description": "A description",  
        "id": "CR6C5SrUiZrFcMsBMjzcqcnE",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR6C5SrUiZrFcMsBMjzcqcnE" 
    } 
 

Credit a Merchant
-----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
 

Request
~~~~~~~

``amount`` 
    *required* **integer**. USD cents. Must be **>=** your minimum credit amount but **<=** your maximum credit amount. 
 
``description`` 
    *optional* **string** or **null**. Sequence of characters. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``appears_on_statement_as`` 
    *optional* **string**. Text that will appear on the buyer's statement. Characters that can be 
    used are limited to: 
 
    - ASCII letters (``a-z`` and ``A-Z``) 
    - Digits (``0-9``) 
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``) 
 
    Any other characters will be rejected. Length must be **<=** ``22``. 
 
``destination_uri`` 
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
            "bank_accounts_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/bank_accounts",  
            "cards_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/cards",  
            "created_at": "2012-12-15T22:50:18.986312Z",  
            "credits_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/credits",  
            "debits_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/debits",  
            "email_address": "email.3@y.com",  
            "holds_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/holds",  
            "id": "AC6F1yF8720NI1iWOUNI5pdU",  
            "meta": {},  
            "name": null,  
            "refunds_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/refunds",  
            "roles": [ 
                "merchant",  
                "buyer" 
            ],  
            "transactions_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/transactions",  
            "uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU" 
        },  
        "amount": 1234,  
        "available_at": "2012-12-16T06:50:19.043538Z",  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "account_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU",  
            "bank_code": "325182797",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-12-15T22:50:18.988077Z",  
            "credits_uri": "/v1/bank_accounts/BA6F1DU2mffINacFfjdOvSYi/credits",  
            "fingerprint": "12341234",  
            "id": "BA6F1DU2mffINacFfjdOvSYi",  
            "is_valid": true,  
            "last_four": "1234",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/bank_accounts/BA6F1DU2mffINacFfjdOvSYi" 
        },  
        "created_at": "2012-12-15T22:50:19.048902Z",  
        "description": null,  
        "destination": { 
            "account_number": "xxxxx1234",  
            "account_uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU",  
            "bank_code": "325182797",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-12-15T22:50:18.988077Z",  
            "credits_uri": "/v1/bank_accounts/BA6F1DU2mffINacFfjdOvSYi/credits",  
            "fingerprint": "12341234",  
            "id": "BA6F1DU2mffINacFfjdOvSYi",  
            "is_valid": true,  
            "last_four": "1234",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/bank_accounts/BA6F1DU2mffINacFfjdOvSYi" 
        },  
        "fee": 25,  
        "id": "CR6F5Ta25bWQyz6uzxe793VU",  
        "meta": {},  
        "state": "cleared",  
        "status": "paid",  
        "transaction_number": "CR244-518-7650",  
        "uri": "/v1/marketplaces/TEST-MP6EZaJZh3Tyk3EBaXIttRy2/accounts/AC6F1yF8720NI1iWOUNI5pdU/credits/CR6F5Ta25bWQyz6uzxe793VU" 
    } 
 

Retrieve a Credit
-----------------

.. code:: 
 
    GET /v1/credits/:credit_id 
 

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
        "amount": 1254,  
        "bank_account": { 
            "account_number": "xxxxx1234",  
            "bank_name": "Banko De Ismus",  
            "created_at": "2012-12-15T22:50:20.305670Z",  
            "credits_uri": "/v1/bank_accounts/BA6GvwboVn4I3yWHiXGupGsO/credits",  
            "fingerprint": "12341234",  
            "id": "BA6GvwboVn4I3yWHiXGupGsO",  
            "meta": {},  
            "name": "Fit Finlay",  
            "routing_number": "325182797",  
            "type": "checking",  
            "uri": "/v1/bank_accounts/BA6GvwboVn4I3yWHiXGupGsO" 
        },  
        "created_at": "2012-12-15T22:50:20.347801Z",  
        "description": "hiya",  
        "id": "CR6GyrFe2AQZgy2IRofcXu54",  
        "meta": {},  
        "status": "paid",  
        "uri": "/v1/credits/CR6GyrFe2AQZgy2IRofcXu54" 
    } 
 

List All Credits
----------------

.. code:: 
 
    GET /v1/credits 
 

Request
~~~~~~~

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
        "items": [ 
            { 
                "amount": 1254,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:21.609504Z",  
                    "credits_uri": "/v1/bank_accounts/BA6HYrn4jxTB9dO138EMuOEO/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6HYrn4jxTB9dO138EMuOEO",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA6HYrn4jxTB9dO138EMuOEO" 
                },  
                "created_at": "2012-12-15T22:50:21.648593Z",  
                "description": "hiya",  
                "id": "CR6I19RSmX0M2TdvQMRps9kK",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR6I19RSmX0M2TdvQMRps9kK" 
            },  
            { 
                "amount": 431,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:21.609504Z",  
                    "credits_uri": "/v1/bank_accounts/BA6HYrn4jxTB9dO138EMuOEO/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6HYrn4jxTB9dO138EMuOEO",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA6HYrn4jxTB9dO138EMuOEO" 
                },  
                "created_at": "2012-12-15T22:50:21.657554Z",  
                "description": "hiya",  
                "id": "CR6I1PpzuPOMbPcIEivZUOw2",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR6I1PpzuPOMbPcIEivZUOw2" 
            } 
        ],  
        "limit": 10,  
        "offset": 0,  
        "total": 2 
    } 
 

List All Credits for a Bank Account
-----------------------------------

.. code:: 
 
    GET /v1/bank_accounts/:bank_account_id/credits 
 

Request
~~~~~~~

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
        "items": [ 
            { 
                "amount": 1254,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:22.987463Z",  
                    "credits_uri": "/v1/bank_accounts/BA6Jwy7SQRZt0skGO5anz2Ay/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6Jwy7SQRZt0skGO5anz2Ay",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA6Jwy7SQRZt0skGO5anz2Ay" 
                },  
                "created_at": "2012-12-15T22:50:22.991965Z",  
                "description": "A description",  
                "id": "CR6JwSiWpW4C1okWxEmwcjTY",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR6JwSiWpW4C1okWxEmwcjTY" 
            },  
            { 
                "amount": 431,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:22.987463Z",  
                    "credits_uri": "/v1/bank_accounts/BA6Jwy7SQRZt0skGO5anz2Ay/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6Jwy7SQRZt0skGO5anz2Ay",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA6Jwy7SQRZt0skGO5anz2Ay" 
                },  
                "created_at": "2012-12-15T22:50:22.997941Z",  
                "description": "Another description",  
                "id": "CR6Jxiw5RULWXFbSAoaI0Bh8",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR6Jxiw5RULWXFbSAoaI0Bh8" 
            },  
            { 
                "amount": 5452,  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:22.987463Z",  
                    "credits_uri": "/v1/bank_accounts/BA6Jwy7SQRZt0skGO5anz2Ay/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6Jwy7SQRZt0skGO5anz2Ay",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/bank_accounts/BA6Jwy7SQRZt0skGO5anz2Ay" 
                },  
                "created_at": "2012-12-15T22:50:23.002877Z",  
                "description": "Yet another description",  
                "id": "CR6JxDDguSbRMDZAgJduAbMe",  
                "meta": {},  
                "status": "paid",  
                "uri": "/v1/credits/CR6JxDDguSbRMDZAgJduAbMe" 
            } 
        ],  
        "limit": 10,  
        "offset": 0,  
        "total": 3 
    } 
 

List All Credits for a Merchant
-------------------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id/credits 
 

Request
~~~~~~~

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
        "first_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/credits?limit=10&offset=0",  
        "items": [ 
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/cards",  
                    "created_at": "2012-12-15T22:50:24.282743Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/holds",  
                    "id": "AC6KYU2ZliCNJSfqJUhJwlYK",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK" 
                },  
                "amount": 1254,  
                "available_at": "2012-12-16T06:50:24.316461Z",  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "account_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:24.284428Z",  
                    "credits_uri": "/v1/bank_accounts/BA6KYY6GRjC6QRAjuKfOSEv8/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6KYY6GRjC6QRAjuKfOSEv8",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/bank_accounts/BA6KYY6GRjC6QRAjuKfOSEv8" 
                },  
                "created_at": "2012-12-15T22:50:24.324030Z",  
                "description": "hiya",  
                "destination": { 
                    "account_number": "xxxxx1234",  
                    "account_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:24.284428Z",  
                    "credits_uri": "/v1/bank_accounts/BA6KYY6GRjC6QRAjuKfOSEv8/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6KYY6GRjC6QRAjuKfOSEv8",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/bank_accounts/BA6KYY6GRjC6QRAjuKfOSEv8" 
                },  
                "fee": 25,  
                "id": "CR6L1IYpWRU4Bg0O2upKAkUW",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR664-623-5503",  
                "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/credits/CR6L1IYpWRU4Bg0O2upKAkUW" 
            },  
            { 
                "account": { 
                    "bank_accounts_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/bank_accounts",  
                    "cards_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/cards",  
                    "created_at": "2012-12-15T22:50:24.282743Z",  
                    "credits_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/credits",  
                    "debits_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/debits",  
                    "email_address": "email.3@y.com",  
                    "holds_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/holds",  
                    "id": "AC6KYU2ZliCNJSfqJUhJwlYK",  
                    "meta": {},  
                    "name": null,  
                    "refunds_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/refunds",  
                    "roles": [ 
                        "merchant",  
                        "buyer" 
                    ],  
                    "transactions_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/transactions",  
                    "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK" 
                },  
                "amount": 431,  
                "available_at": "2012-12-16T06:50:24.319241Z",  
                "bank_account": { 
                    "account_number": "xxxxx1234",  
                    "account_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:24.284428Z",  
                    "credits_uri": "/v1/bank_accounts/BA6KYY6GRjC6QRAjuKfOSEv8/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6KYY6GRjC6QRAjuKfOSEv8",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/bank_accounts/BA6KYY6GRjC6QRAjuKfOSEv8" 
                },  
                "created_at": "2012-12-15T22:50:24.333073Z",  
                "description": "hiya",  
                "destination": { 
                    "account_number": "xxxxx1234",  
                    "account_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK",  
                    "bank_code": "325182797",  
                    "bank_name": "Banko De Ismus",  
                    "created_at": "2012-12-15T22:50:24.284428Z",  
                    "credits_uri": "/v1/bank_accounts/BA6KYY6GRjC6QRAjuKfOSEv8/credits",  
                    "fingerprint": "12341234",  
                    "id": "BA6KYY6GRjC6QRAjuKfOSEv8",  
                    "is_valid": true,  
                    "last_four": "1234",  
                    "meta": {},  
                    "name": "Fit Finlay",  
                    "routing_number": "325182797",  
                    "type": "checking",  
                    "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/bank_accounts/BA6KYY6GRjC6QRAjuKfOSEv8" 
                },  
                "fee": 25,  
                "id": "CR6L2oTOdM6U2ny57Ix7u2lY",  
                "meta": {},  
                "state": "cleared",  
                "status": "paid",  
                "transaction_number": "CR709-005-9479",  
                "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/credits/CR6L2oTOdM6U2ny57Ix7u2lY" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/credits?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 2,  
        "uri": "/v1/marketplaces/TEST-MP6KWpmyBCvIodC29ejGyz6a/accounts/AC6KYU2ZliCNJSfqJUhJwlYK/credits?limit=10&offset=0" 
    } 
 

