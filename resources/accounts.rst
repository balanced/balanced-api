Accounts
========

- `Create a Buyer`_
- `Create a Person Merchant`_
- `Create a Business Merchant`_
- `Retrieve an Account`_
- `List all Accounts`_
- `Update an Account`_
- `Promote a Buyer Account to a Merchant`_

Fields
------

``id`` 
    **string**.  
 
``uri`` 
    **string**. The URI of the account. 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    account was created. 
 
``name`` 
    **string**. The name of the account. 
 
``email_address`` 
    **string**. The email address of the account. 
 
``roles`` 
    **list**. A list of roles the account has. Can be zero, one, or both of 
    ``buyer``, ``merchant`` 
 
``debits_uri`` 
    **string**. URI for all debits associated with the account. 
 
``credits_uri`` 
    **string**. URI for all credits associated with the account. 
 
``refunds_uri`` 
    **string**. URI for all refunds associated with the account. 
 
``holds_uri`` 
    **string**. URI for all holds associated with the account. 
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 
``transactions_uri`` 
    **string**. URI for all transactions associated with the account. 
 
``bank_accounts_uri`` 
    **string**. URI for all bank accounts associated with the account. 
 
``cards_uri`` 
    **string**. URI for all cards associated with the account. 
 

Create a Buyer
--------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts 
 

Request
~~~~~~~

``name`` 
    *optional* **string**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``card_uri`` 
    *optional* **string**. The URI of the tokenized card. 
 
``card`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `Create a Card <./cards.rst#create-a-card>`_. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "card_uri": "/v1/marketplaces/TEST-MP5M4nHP6iiDtbkDXVkjiusq/cards/CCbdcd92d9474c11e2914d68a86d3cb93a",  
        "email_address": "b@m.com",  
        "name": "Benny Riemann" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP5NyJ2vjLRbv4BGX5HFcBS2/accounts/AC5NFYVfNjOdqwyelUZi4XPk/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP5NyJ2vjLRbv4BGX5HFcBS2/accounts/AC5NFYVfNjOdqwyelUZi4XPk/cards",  
        "created_at": "2012-12-15T22:49:31.554194Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP5NyJ2vjLRbv4BGX5HFcBS2/accounts/AC5NFYVfNjOdqwyelUZi4XPk/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP5NyJ2vjLRbv4BGX5HFcBS2/accounts/AC5NFYVfNjOdqwyelUZi4XPk/debits",  
        "email_address": "b@m.com",  
        "holds_uri": "/v1/marketplaces/TEST-MP5NyJ2vjLRbv4BGX5HFcBS2/accounts/AC5NFYVfNjOdqwyelUZi4XPk/holds",  
        "id": "AC5NFYVfNjOdqwyelUZi4XPk",  
        "meta": {},  
        "name": "Benny Riemann",  
        "refunds_uri": "/v1/marketplaces/TEST-MP5NyJ2vjLRbv4BGX5HFcBS2/accounts/AC5NFYVfNjOdqwyelUZi4XPk/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP5NyJ2vjLRbv4BGX5HFcBS2/accounts/AC5NFYVfNjOdqwyelUZi4XPk/transactions",  
        "uri": "/v1/marketplaces/TEST-MP5NyJ2vjLRbv4BGX5HFcBS2/accounts/AC5NFYVfNjOdqwyelUZi4XPk" 
    } 
 

Create a Business Merchant
--------------------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts 
 

Request
~~~~~~~

``name`` 
    *optional* **string**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``bank_account_uri`` 
    *optional* **string**. The URI of the bank account created via *balanced.js*. 
 
``bank_account`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 
``merchant_uri`` 
    *optional* **string**. The URI of the merchant account created during a request for more 
    information. 
 
``merchant`` 
    .. cssclass:: nested1 
 
    *optional* **object**.  
        ``type`` 
            *required* **string**. Merchant type. It should be one of: ``person`` or ``business``. 
 
        ``phone_number`` 
            *required* **string**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
        ``email_address`` 
            *optional* **string** or **null**. RFC-2822 formatted email address. 
 
        ``meta`` 
            *optional* **object**. Single level mapping from string keys to string values. 
 
        ``tax_id`` 
            *optional* **string**. Length must be **between** ``4`` and ``9``. 
 
        ``person`` 
            .. cssclass:: nested2 
 
            *optional* **object**.  
                ``name`` 
                    *required* **string**. Sequence of characters. 
 
                ``dob`` 
                    *required* **string**. Date-of-birth formatted as ``YYYY-MM-DD``. 
 
                ``city`` 
                    *optional* **string**. City. 
 
                ``postal_code`` 
                    *required* **string**. Postal code. This is known as a zip code in the USA. 
                    *requires* ``country_code``. 
 
                ``street_address`` 
                    *required* **string**. Street address. 
                    *requires* ``postal_code``. 
 
                ``country_code`` 
                    *optional* **string**. `ISO-3166-3 
                    <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ 
                    three character country code. 
 
                ``tax_id`` 
                    *optional* **string**. Length must be **between** ``4`` and ``9``. 
 
 
        ``name`` 
            *optional* **string**. Sequence of characters. Length must be **<=** ``128``. 
 
        ``production`` 
            *optional* **boolean**. Flag value, should be ``true`` or ``false``. 
 
        ``city`` 
            *optional* **string**. City. 
 
        ``postal_code`` 
            *required* **string**. Postal code. This is known as a zip code in the USA. 
            *requires* ``country_code``. 
 
        ``street_address`` 
            *required* **string**. Street address. 
            *requires* ``postal_code``. 
 
        ``country_code`` 
            *optional* **string**. `ISO-3166-3 
            <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ 
            three character country code. 
 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "merchant": { 
            "phone_number": "+19046281796",  
            "city": "San Francisco",  
            "name": "jo",  
            "person": { 
                "city": "San Francisco",  
                "state": "CA",  
                "postal_code": "94110",  
                "name": "jo",  
                "dob": "1984-01",  
                "street_address": "Somewhere over the rainbow",  
                "tax_id": "066038800" 
            },  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "business",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "147826600" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP5QJsNpY7YYODYdKMFsNpEe/accounts/AC5QPL6Xu6vy465OjHoTEBSy/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP5QJsNpY7YYODYdKMFsNpEe/accounts/AC5QPL6Xu6vy465OjHoTEBSy/cards",  
        "created_at": "2012-12-15T22:49:34.361859Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP5QJsNpY7YYODYdKMFsNpEe/accounts/AC5QPL6Xu6vy465OjHoTEBSy/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP5QJsNpY7YYODYdKMFsNpEe/accounts/AC5QPL6Xu6vy465OjHoTEBSy/debits",  
        "email_address": null,  
        "holds_uri": "/v1/marketplaces/TEST-MP5QJsNpY7YYODYdKMFsNpEe/accounts/AC5QPL6Xu6vy465OjHoTEBSy/holds",  
        "id": "AC5QPL6Xu6vy465OjHoTEBSy",  
        "meta": {},  
        "name": "jo",  
        "refunds_uri": "/v1/marketplaces/TEST-MP5QJsNpY7YYODYdKMFsNpEe/accounts/AC5QPL6Xu6vy465OjHoTEBSy/refunds",  
        "roles": [ 
            "merchant" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP5QJsNpY7YYODYdKMFsNpEe/accounts/AC5QPL6Xu6vy465OjHoTEBSy/transactions",  
        "uri": "/v1/marketplaces/TEST-MP5QJsNpY7YYODYdKMFsNpEe/accounts/AC5QPL6Xu6vy465OjHoTEBSy" 
    } 
 

Create a Person Merchant
------------------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/accounts 
 

Request
~~~~~~~

``name`` 
    *optional* **string**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. Email address of the account. It must be **unique** among all accounts 
    on your marketplace. 
 
``bank_account_uri`` 
    *optional* **string**. The URI of the bank account created via *balanced.js*. 
 
``bank_account`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 
``merchant_uri`` 
    *optional* **string**. The URI of the merchant account created during a request for more 
    information. 
 
``merchant`` 
    .. cssclass:: nested1 
 
    *optional* **object**.  
        ``type`` 
            *required* **string**. Merchant type. It should be one of: ``person`` or ``business``. 
 
        ``phone_number`` 
            *required* **string**. E.164 formatted phone number. Length must be **<=** ``15``. 
 
        ``email_address`` 
            *optional* **string** or **null**. RFC-2822 formatted email address. 
 
        ``meta`` 
            *optional* **object**. Single level mapping from string keys to string values. 
 
        ``tax_id`` 
            *optional* **string**. Length must be **between** ``4`` and ``9``. 
 
        ``dob`` 
            *optional* **string**. Date-of-birth formatted as ``YYYY-MM-DD``. 
 
        ``name`` 
            *optional* **string**. Sequence of characters. Length must be **<=** ``128``. 
 
        ``production`` 
            *optional* **boolean**. Flag value, should be ``true`` or ``false``. 
 
        ``city`` 
            *optional* **string**. City. 
 
        ``postal_code`` 
            *required* **string**. Postal code. This is known as a zip code in the USA. 
            *requires* ``country_code``. 
 
        ``street_address`` 
            *required* **string**. Street address. 
            *requires* ``postal_code``. 
 
        ``country_code`` 
            *optional* **string**. `ISO-3166-3 
            <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ 
            three character country code. 
 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "merchant": { 
            "phone_number": "+19046281796",  
            "city": "San Francisco",  
            "name": "jo",  
            "dob": "1984-01",  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "person",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "202642300" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP5THB5asyoKgpqypMnYCxHs/accounts/AC5TNNGqfTxuGNBsdYmI53se/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP5THB5asyoKgpqypMnYCxHs/accounts/AC5TNNGqfTxuGNBsdYmI53se/cards",  
        "created_at": "2012-12-15T22:49:37.000905Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP5THB5asyoKgpqypMnYCxHs/accounts/AC5TNNGqfTxuGNBsdYmI53se/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP5THB5asyoKgpqypMnYCxHs/accounts/AC5TNNGqfTxuGNBsdYmI53se/debits",  
        "email_address": null,  
        "holds_uri": "/v1/marketplaces/TEST-MP5THB5asyoKgpqypMnYCxHs/accounts/AC5TNNGqfTxuGNBsdYmI53se/holds",  
        "id": "AC5TNNGqfTxuGNBsdYmI53se",  
        "meta": {},  
        "name": "jo",  
        "refunds_uri": "/v1/marketplaces/TEST-MP5THB5asyoKgpqypMnYCxHs/accounts/AC5TNNGqfTxuGNBsdYmI53se/refunds",  
        "roles": [ 
            "merchant" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP5THB5asyoKgpqypMnYCxHs/accounts/AC5TNNGqfTxuGNBsdYmI53se/transactions",  
        "uri": "/v1/marketplaces/TEST-MP5THB5asyoKgpqypMnYCxHs/accounts/AC5TNNGqfTxuGNBsdYmI53se" 
    } 
 

Retrieve an Account
-------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts/:account_id 
 

Body 
~~~~ 
 
Headers 
~~~~~~~ 
 
.. code::  
 
    Status: 200 OK 
 
Body 
~~~~ 
 
.. code:: javascript 
 
    { 
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP5VaigUeVxlQfukExkQbj9o/accounts/AC5Vfcm7X1YJQqLNYyYxhqye/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP5VaigUeVxlQfukExkQbj9o/accounts/AC5Vfcm7X1YJQqLNYyYxhqye/cards",  
        "created_at": "2012-12-15T22:49:38.283006Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP5VaigUeVxlQfukExkQbj9o/accounts/AC5Vfcm7X1YJQqLNYyYxhqye/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP5VaigUeVxlQfukExkQbj9o/accounts/AC5Vfcm7X1YJQqLNYyYxhqye/debits",  
        "email_address": "email.6@y.com",  
        "holds_uri": "/v1/marketplaces/TEST-MP5VaigUeVxlQfukExkQbj9o/accounts/AC5Vfcm7X1YJQqLNYyYxhqye/holds",  
        "id": "AC5Vfcm7X1YJQqLNYyYxhqye",  
        "meta": {},  
        "name": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP5VaigUeVxlQfukExkQbj9o/accounts/AC5Vfcm7X1YJQqLNYyYxhqye/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP5VaigUeVxlQfukExkQbj9o/accounts/AC5Vfcm7X1YJQqLNYyYxhqye/transactions",  
        "uri": "/v1/marketplaces/TEST-MP5VaigUeVxlQfukExkQbj9o/accounts/AC5Vfcm7X1YJQqLNYyYxhqye" 
    } 
 

List all Accounts
-----------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/accounts 
 

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
        "first_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WEpkqe7ZlWWqTx2D6gJey/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WEpkqe7ZlWWqTx2D6gJey/cards",  
                "created_at": "2012-12-15T22:49:39.533841Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WEpkqe7ZlWWqTx2D6gJey/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WEpkqe7ZlWWqTx2D6gJey/debits",  
                "email_address": "email.1@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WEpkqe7ZlWWqTx2D6gJey/holds",  
                "id": "AC5WEpkqe7ZlWWqTx2D6gJey",  
                "meta": {},  
                "name": "Merchants, Inc.",  
                "refunds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WEpkqe7ZlWWqTx2D6gJey/refunds",  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WEpkqe7ZlWWqTx2D6gJey/transactions",  
                "uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WEpkqe7ZlWWqTx2D6gJey" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFTOnbV8Apvw0FLfGohIe/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFTOnbV8Apvw0FLfGohIe/cards",  
                "created_at": "2012-12-15T22:49:39.554866Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFTOnbV8Apvw0FLfGohIe/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFTOnbV8Apvw0FLfGohIe/debits",  
                "email_address": "email.3@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFTOnbV8Apvw0FLfGohIe/holds",  
                "id": "AC5WFTOnbV8Apvw0FLfGohIe",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFTOnbV8Apvw0FLfGohIe/refunds",  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFTOnbV8Apvw0FLfGohIe/transactions",  
                "uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFTOnbV8Apvw0FLfGohIe" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFVYW4NWoHWdyi0kfKss2/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFVYW4NWoHWdyi0kfKss2/cards",  
                "created_at": "2012-12-15T22:49:39.555371Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFVYW4NWoHWdyi0kfKss2/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFVYW4NWoHWdyi0kfKss2/debits",  
                "email_address": "email.4@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFVYW4NWoHWdyi0kfKss2/holds",  
                "id": "AC5WFVYW4NWoHWdyi0kfKss2",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFVYW4NWoHWdyi0kfKss2/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFVYW4NWoHWdyi0kfKss2/transactions",  
                "uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WFVYW4NWoHWdyi0kfKss2" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WH760BHgAEQN6Q2Bfa3Me/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WH760BHgAEQN6Q2Bfa3Me/cards",  
                "created_at": "2012-12-15T22:49:39.572323Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WH760BHgAEQN6Q2Bfa3Me/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WH760BHgAEQN6Q2Bfa3Me/debits",  
                "email_address": "email.5@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WH760BHgAEQN6Q2Bfa3Me/holds",  
                "id": "AC5WH760BHgAEQN6Q2Bfa3Me",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WH760BHgAEQN6Q2Bfa3Me/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WH760BHgAEQN6Q2Bfa3Me/transactions",  
                "uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WH760BHgAEQN6Q2Bfa3Me" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ1hvBL5XCdYSuvj4eQWK/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ1hvBL5XCdYSuvj4eQWK/cards",  
                "created_at": "2012-12-15T22:49:39.599625Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ1hvBL5XCdYSuvj4eQWK/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ1hvBL5XCdYSuvj4eQWK/debits",  
                "email_address": "email.7@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ1hvBL5XCdYSuvj4eQWK/holds",  
                "id": "AC5WJ1hvBL5XCdYSuvj4eQWK",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ1hvBL5XCdYSuvj4eQWK/refunds",  
                "roles": [ 
                    "merchant" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ1hvBL5XCdYSuvj4eQWK/transactions",  
                "uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ1hvBL5XCdYSuvj4eQWK" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ3nxCWMi2XKpKp7msOaC/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ3nxCWMi2XKpKp7msOaC/cards",  
                "created_at": "2012-12-15T22:49:39.600089Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ3nxCWMi2XKpKp7msOaC/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ3nxCWMi2XKpKp7msOaC/debits",  
                "email_address": "email.8@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ3nxCWMi2XKpKp7msOaC/holds",  
                "id": "AC5WJ3nxCWMi2XKpKp7msOaC",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ3nxCWMi2XKpKp7msOaC/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ3nxCWMi2XKpKp7msOaC/transactions",  
                "uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WJ3nxCWMi2XKpKp7msOaC" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WK0BOCzO5caAbzjyA5Oum/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WK0BOCzO5caAbzjyA5Oum/cards",  
                "created_at": "2012-12-15T22:49:39.613773Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WK0BOCzO5caAbzjyA5Oum/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WK0BOCzO5caAbzjyA5Oum/debits",  
                "email_address": "email.10@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WK0BOCzO5caAbzjyA5Oum/holds",  
                "id": "AC5WK0BOCzO5caAbzjyA5Oum",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WK0BOCzO5caAbzjyA5Oum/refunds",  
                "roles": [ 
                    "merchant" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WK0BOCzO5caAbzjyA5Oum/transactions",  
                "uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts/AC5WK0BOCzO5caAbzjyA5Oum" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 7,  
        "uri": "/v1/marketplaces/TEST-MP5WDqqEwx35T5gDRaVjdmtQ/accounts?limit=10&offset=0" 
    } 
 

Update an Account
-----------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id 
 

Request
~~~~~~~

``name`` 
    *optional* **string**. The display ``name`` of the account. Length must be **<=** ``128``. 
 
``email_address`` 
    *optional* **string** or **null**. RFC-2822 formatted email address. 
 
``meta`` 
    *optional* **object**. Single level mapping from string keys to string values. 
 
``card_uri`` 
    *optional* **string**. Tokenized card URI. 
 
``card`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `Card <./cards.rst>`_. 
 
``bank_account_uri`` 
    *optional* **string**. Tokenized bank account URI. 
 
``bank_account`` 
    .. cssclass:: nested1 
 
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "card_uri": "/v1/marketplaces/TEST-MP5YbxIiVo9DeeqeqvaUgyhk/cards/CCc438d20f474c11e2952668a86d3cb93a",  
        "meta": { 
            "more-data": "here" 
        },  
        "email_address": "new@email.com",  
        "name": "my new name" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP5ZKonhsltLtGIPm2cdBd1w/accounts/AC5ZPGuGNWYhPskAMZ2PCHiO/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP5ZKonhsltLtGIPm2cdBd1w/accounts/AC5ZPGuGNWYhPskAMZ2PCHiO/cards",  
        "created_at": "2012-12-15T22:49:42.362531Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP5ZKonhsltLtGIPm2cdBd1w/accounts/AC5ZPGuGNWYhPskAMZ2PCHiO/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP5ZKonhsltLtGIPm2cdBd1w/accounts/AC5ZPGuGNWYhPskAMZ2PCHiO/debits",  
        "email_address": "new@email.com",  
        "holds_uri": "/v1/marketplaces/TEST-MP5ZKonhsltLtGIPm2cdBd1w/accounts/AC5ZPGuGNWYhPskAMZ2PCHiO/holds",  
        "id": "AC5ZPGuGNWYhPskAMZ2PCHiO",  
        "meta": { 
            "more-data": "here" 
        },  
        "name": "my new name",  
        "refunds_uri": "/v1/marketplaces/TEST-MP5ZKonhsltLtGIPm2cdBd1w/accounts/AC5ZPGuGNWYhPskAMZ2PCHiO/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP5ZKonhsltLtGIPm2cdBd1w/accounts/AC5ZPGuGNWYhPskAMZ2PCHiO/transactions",  
        "uri": "/v1/marketplaces/TEST-MP5ZKonhsltLtGIPm2cdBd1w/accounts/AC5ZPGuGNWYhPskAMZ2PCHiO" 
    } 
 

Promote a Buyer Account to a Merchant
-------------------------------------

.. code:: 
 
    PUT /v1/marketplaces/:marketplace_id/accounts/:account_id 
 

Request
~~~~~~~

``merchant_uri`` 
    *optional* **string**. See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_. 
 
``merchant`` 
    .. cssclass:: nested2 
 
    *optional* **object**. See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_. 
 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "merchant": { 
            "phone_number": "+19046281796",  
            "city": "San Francisco",  
            "name": "jo",  
            "dob": "1984-01",  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "person",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "303112200" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP62PRebLxMEXPSzBbCrOuFQ/accounts/AC62UHRPdY95uhWuF8VV0yrU/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP62PRebLxMEXPSzBbCrOuFQ/accounts/AC62UHRPdY95uhWuF8VV0yrU/cards",  
        "created_at": "2012-12-15T22:49:45.101981Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP62PRebLxMEXPSzBbCrOuFQ/accounts/AC62UHRPdY95uhWuF8VV0yrU/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP62PRebLxMEXPSzBbCrOuFQ/accounts/AC62UHRPdY95uhWuF8VV0yrU/debits",  
        "email_address": "email.6@y.com",  
        "holds_uri": "/v1/marketplaces/TEST-MP62PRebLxMEXPSzBbCrOuFQ/accounts/AC62UHRPdY95uhWuF8VV0yrU/holds",  
        "id": "AC62UHRPdY95uhWuF8VV0yrU",  
        "meta": {},  
        "name": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP62PRebLxMEXPSzBbCrOuFQ/accounts/AC62UHRPdY95uhWuF8VV0yrU/refunds",  
        "roles": [ 
            "merchant",  
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP62PRebLxMEXPSzBbCrOuFQ/accounts/AC62UHRPdY95uhWuF8VV0yrU/transactions",  
        "uri": "/v1/marketplaces/TEST-MP62PRebLxMEXPSzBbCrOuFQ/accounts/AC62UHRPdY95uhWuF8VV0yrU" 
    } 
 

