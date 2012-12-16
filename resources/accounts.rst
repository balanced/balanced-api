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
        "card_uri": "/v1/marketplaces/TEST-MP5ThwXuyab1uOw6ZdBAcVCy/cards/CCc19f98bd473211e2812668a86d3cb93a",  
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP5UJSdDC3wYn5JJtbo8IZ7Q/accounts/AC5UR0Blhgwn5hYn1dn6Xw9A/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP5UJSdDC3wYn5JJtbo8IZ7Q/accounts/AC5UR0Blhgwn5hYn1dn6Xw9A/cards",  
        "created_at": "2012-12-15T19:43:31.021202Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP5UJSdDC3wYn5JJtbo8IZ7Q/accounts/AC5UR0Blhgwn5hYn1dn6Xw9A/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP5UJSdDC3wYn5JJtbo8IZ7Q/accounts/AC5UR0Blhgwn5hYn1dn6Xw9A/debits",  
        "email_address": "b@m.com",  
        "holds_uri": "/v1/marketplaces/TEST-MP5UJSdDC3wYn5JJtbo8IZ7Q/accounts/AC5UR0Blhgwn5hYn1dn6Xw9A/holds",  
        "id": "AC5UR0Blhgwn5hYn1dn6Xw9A",  
        "meta": {},  
        "name": "Benny Riemann",  
        "refunds_uri": "/v1/marketplaces/TEST-MP5UJSdDC3wYn5JJtbo8IZ7Q/accounts/AC5UR0Blhgwn5hYn1dn6Xw9A/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP5UJSdDC3wYn5JJtbo8IZ7Q/accounts/AC5UR0Blhgwn5hYn1dn6Xw9A/transactions",  
        "uri": "/v1/marketplaces/TEST-MP5UJSdDC3wYn5JJtbo8IZ7Q/accounts/AC5UR0Blhgwn5hYn1dn6Xw9A" 
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
 
        ``ssn_last_4`` 
            *optional* **string**. Length must be **=** ``4``. 
 
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
 
                ``ssn_last_4`` 
                    *optional* **string**. Length must be **=** ``4``. 
 
 
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
                "tax_id": "484067400" 
            },  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "business",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "612280400" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP5XSr8ZEY0m6R8MSMetIUzM/accounts/AC5XZ35y5H4e0ifLir2zMQlA/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP5XSr8ZEY0m6R8MSMetIUzM/accounts/AC5XZ35y5H4e0ifLir2zMQlA/cards",  
        "created_at": "2012-12-15T19:43:33.803745Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP5XSr8ZEY0m6R8MSMetIUzM/accounts/AC5XZ35y5H4e0ifLir2zMQlA/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP5XSr8ZEY0m6R8MSMetIUzM/accounts/AC5XZ35y5H4e0ifLir2zMQlA/debits",  
        "email_address": null,  
        "holds_uri": "/v1/marketplaces/TEST-MP5XSr8ZEY0m6R8MSMetIUzM/accounts/AC5XZ35y5H4e0ifLir2zMQlA/holds",  
        "id": "AC5XZ35y5H4e0ifLir2zMQlA",  
        "meta": {},  
        "name": "jo",  
        "refunds_uri": "/v1/marketplaces/TEST-MP5XSr8ZEY0m6R8MSMetIUzM/accounts/AC5XZ35y5H4e0ifLir2zMQlA/refunds",  
        "roles": [ 
            "merchant" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP5XSr8ZEY0m6R8MSMetIUzM/accounts/AC5XZ35y5H4e0ifLir2zMQlA/transactions",  
        "uri": "/v1/marketplaces/TEST-MP5XSr8ZEY0m6R8MSMetIUzM/accounts/AC5XZ35y5H4e0ifLir2zMQlA" 
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
 
        ``ssn_last_4`` 
            *optional* **string**. Length must be **=** ``4``. 
 
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
            "tax_id": "206527400" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP60S2wsGJxrFk1nI5KJPk0O/accounts/AC60YhB13EsFmN0Pq1AK8CWS/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP60S2wsGJxrFk1nI5KJPk0O/accounts/AC60YhB13EsFmN0Pq1AK8CWS/cards",  
        "created_at": "2012-12-15T19:43:36.460089Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP60S2wsGJxrFk1nI5KJPk0O/accounts/AC60YhB13EsFmN0Pq1AK8CWS/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP60S2wsGJxrFk1nI5KJPk0O/accounts/AC60YhB13EsFmN0Pq1AK8CWS/debits",  
        "email_address": null,  
        "holds_uri": "/v1/marketplaces/TEST-MP60S2wsGJxrFk1nI5KJPk0O/accounts/AC60YhB13EsFmN0Pq1AK8CWS/holds",  
        "id": "AC60YhB13EsFmN0Pq1AK8CWS",  
        "meta": {},  
        "name": "jo",  
        "refunds_uri": "/v1/marketplaces/TEST-MP60S2wsGJxrFk1nI5KJPk0O/accounts/AC60YhB13EsFmN0Pq1AK8CWS/refunds",  
        "roles": [ 
            "merchant" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP60S2wsGJxrFk1nI5KJPk0O/accounts/AC60YhB13EsFmN0Pq1AK8CWS/transactions",  
        "uri": "/v1/marketplaces/TEST-MP60S2wsGJxrFk1nI5KJPk0O/accounts/AC60YhB13EsFmN0Pq1AK8CWS" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP62n6D9Da61yL25xWQ9cdm2/accounts/AC62s0T6774wMwWONwEEGtWa/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP62n6D9Da61yL25xWQ9cdm2/accounts/AC62s0T6774wMwWONwEEGtWa/cards",  
        "created_at": "2012-12-15T19:43:37.775487Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP62n6D9Da61yL25xWQ9cdm2/accounts/AC62s0T6774wMwWONwEEGtWa/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP62n6D9Da61yL25xWQ9cdm2/accounts/AC62s0T6774wMwWONwEEGtWa/debits",  
        "email_address": "email.6@y.com",  
        "holds_uri": "/v1/marketplaces/TEST-MP62n6D9Da61yL25xWQ9cdm2/accounts/AC62s0T6774wMwWONwEEGtWa/holds",  
        "id": "AC62s0T6774wMwWONwEEGtWa",  
        "meta": {},  
        "name": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP62n6D9Da61yL25xWQ9cdm2/accounts/AC62s0T6774wMwWONwEEGtWa/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP62n6D9Da61yL25xWQ9cdm2/accounts/AC62s0T6774wMwWONwEEGtWa/transactions",  
        "uri": "/v1/marketplaces/TEST-MP62n6D9Da61yL25xWQ9cdm2/accounts/AC62s0T6774wMwWONwEEGtWa" 
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
        "first_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63QkKzA8VEhgtj23AR6tPc/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63QkKzA8VEhgtj23AR6tPc/cards",  
                "created_at": "2012-12-15T19:43:39.013639Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63QkKzA8VEhgtj23AR6tPc/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63QkKzA8VEhgtj23AR6tPc/debits",  
                "email_address": "email.1@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63QkKzA8VEhgtj23AR6tPc/holds",  
                "id": "AC63QkKzA8VEhgtj23AR6tPc",  
                "meta": {},  
                "name": "Merchants, Inc.",  
                "refunds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63QkKzA8VEhgtj23AR6tPc/refunds",  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63QkKzA8VEhgtj23AR6tPc/transactions",  
                "uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63QkKzA8VEhgtj23AR6tPc" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RJkQvsKCRXOpd919hPw6/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RJkQvsKCRXOpd919hPw6/cards",  
                "created_at": "2012-12-15T19:43:39.033287Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RJkQvsKCRXOpd919hPw6/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RJkQvsKCRXOpd919hPw6/debits",  
                "email_address": "email.3@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RJkQvsKCRXOpd919hPw6/holds",  
                "id": "AC63RJkQvsKCRXOpd919hPw6",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RJkQvsKCRXOpd919hPw6/refunds",  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RJkQvsKCRXOpd919hPw6/transactions",  
                "uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RJkQvsKCRXOpd919hPw6" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RLaypwwE60oUHhXX3jNo/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RLaypwwE60oUHhXX3jNo/cards",  
                "created_at": "2012-12-15T19:43:39.033726Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RLaypwwE60oUHhXX3jNo/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RLaypwwE60oUHhXX3jNo/debits",  
                "email_address": "email.4@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RLaypwwE60oUHhXX3jNo/holds",  
                "id": "AC63RLaypwwE60oUHhXX3jNo",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RLaypwwE60oUHhXX3jNo/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RLaypwwE60oUHhXX3jNo/transactions",  
                "uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63RLaypwwE60oUHhXX3jNo" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63SVrOqPKScNkMPTYGcxIe/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63SVrOqPKScNkMPTYGcxIe/cards",  
                "created_at": "2012-12-15T19:43:39.050488Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63SVrOqPKScNkMPTYGcxIe/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63SVrOqPKScNkMPTYGcxIe/debits",  
                "email_address": "email.5@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63SVrOqPKScNkMPTYGcxIe/holds",  
                "id": "AC63SVrOqPKScNkMPTYGcxIe",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63SVrOqPKScNkMPTYGcxIe/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63SVrOqPKScNkMPTYGcxIe/transactions",  
                "uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63SVrOqPKScNkMPTYGcxIe" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UU8RH4HLiaTeda7SEYJA/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UU8RH4HLiaTeda7SEYJA/cards",  
                "created_at": "2012-12-15T19:43:39.078857Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UU8RH4HLiaTeda7SEYJA/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UU8RH4HLiaTeda7SEYJA/debits",  
                "email_address": "email.7@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UU8RH4HLiaTeda7SEYJA/holds",  
                "id": "AC63UU8RH4HLiaTeda7SEYJA",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UU8RH4HLiaTeda7SEYJA/refunds",  
                "roles": [ 
                    "merchant" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UU8RH4HLiaTeda7SEYJA/transactions",  
                "uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UU8RH4HLiaTeda7SEYJA" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UX0AhKcXZKWK4PCd3Uro/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UX0AhKcXZKWK4PCd3Uro/cards",  
                "created_at": "2012-12-15T19:43:39.079507Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UX0AhKcXZKWK4PCd3Uro/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UX0AhKcXZKWK4PCd3Uro/debits",  
                "email_address": "email.8@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UX0AhKcXZKWK4PCd3Uro/holds",  
                "id": "AC63UX0AhKcXZKWK4PCd3Uro",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UX0AhKcXZKWK4PCd3Uro/refunds",  
                "roles": [ 
                    "buyer" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UX0AhKcXZKWK4PCd3Uro/transactions",  
                "uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63UX0AhKcXZKWK4PCd3Uro" 
            },  
            { 
                "bank_accounts_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63VX7Yi6tbNQNIcQfW62aS/bank_accounts",  
                "cards_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63VX7Yi6tbNQNIcQfW62aS/cards",  
                "created_at": "2012-12-15T19:43:39.093903Z",  
                "credits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63VX7Yi6tbNQNIcQfW62aS/credits",  
                "debits_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63VX7Yi6tbNQNIcQfW62aS/debits",  
                "email_address": "email.10@y.com",  
                "holds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63VX7Yi6tbNQNIcQfW62aS/holds",  
                "id": "AC63VX7Yi6tbNQNIcQfW62aS",  
                "meta": {},  
                "name": null,  
                "refunds_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63VX7Yi6tbNQNIcQfW62aS/refunds",  
                "roles": [ 
                    "merchant" 
                ],  
                "transactions_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63VX7Yi6tbNQNIcQfW62aS/transactions",  
                "uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts/AC63VX7Yi6tbNQNIcQfW62aS" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 7,  
        "uri": "/v1/marketplaces/TEST-MP63PkfiNu4y6rM5RfqfAxsu/accounts?limit=10&offset=0" 
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
        "card_uri": "/v1/marketplaces/TEST-MP65mnY8UxzF4IAquNNn9Jhw/cards/CCc8074073473211e28ec468a86d3cb93a",  
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP66R89PMDotDcyB05a3FoVA/accounts/AC66WghtFdXnnzxRNDxyNR6W/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP66R89PMDotDcyB05a3FoVA/accounts/AC66WghtFdXnnzxRNDxyNR6W/cards",  
        "created_at": "2012-12-15T19:43:41.765639Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP66R89PMDotDcyB05a3FoVA/accounts/AC66WghtFdXnnzxRNDxyNR6W/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP66R89PMDotDcyB05a3FoVA/accounts/AC66WghtFdXnnzxRNDxyNR6W/debits",  
        "email_address": "new@email.com",  
        "holds_uri": "/v1/marketplaces/TEST-MP66R89PMDotDcyB05a3FoVA/accounts/AC66WghtFdXnnzxRNDxyNR6W/holds",  
        "id": "AC66WghtFdXnnzxRNDxyNR6W",  
        "meta": { 
            "more-data": "here" 
        },  
        "name": "my new name",  
        "refunds_uri": "/v1/marketplaces/TEST-MP66R89PMDotDcyB05a3FoVA/accounts/AC66WghtFdXnnzxRNDxyNR6W/refunds",  
        "roles": [ 
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP66R89PMDotDcyB05a3FoVA/accounts/AC66WghtFdXnnzxRNDxyNR6W/transactions",  
        "uri": "/v1/marketplaces/TEST-MP66R89PMDotDcyB05a3FoVA/accounts/AC66WghtFdXnnzxRNDxyNR6W" 
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
            "tax_id": "203320500" 
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
        "bank_accounts_uri": "/v1/marketplaces/TEST-MP69RqMPeHlvyNAg8RNn9Txo/accounts/AC69Wv6gcaGkERkhmv9gczH4/bank_accounts",  
        "cards_uri": "/v1/marketplaces/TEST-MP69RqMPeHlvyNAg8RNn9Txo/accounts/AC69Wv6gcaGkERkhmv9gczH4/cards",  
        "created_at": "2012-12-15T19:43:44.436492Z",  
        "credits_uri": "/v1/marketplaces/TEST-MP69RqMPeHlvyNAg8RNn9Txo/accounts/AC69Wv6gcaGkERkhmv9gczH4/credits",  
        "debits_uri": "/v1/marketplaces/TEST-MP69RqMPeHlvyNAg8RNn9Txo/accounts/AC69Wv6gcaGkERkhmv9gczH4/debits",  
        "email_address": "email.6@y.com",  
        "holds_uri": "/v1/marketplaces/TEST-MP69RqMPeHlvyNAg8RNn9Txo/accounts/AC69Wv6gcaGkERkhmv9gczH4/holds",  
        "id": "AC69Wv6gcaGkERkhmv9gczH4",  
        "meta": {},  
        "name": null,  
        "refunds_uri": "/v1/marketplaces/TEST-MP69RqMPeHlvyNAg8RNn9Txo/accounts/AC69Wv6gcaGkERkhmv9gczH4/refunds",  
        "roles": [ 
            "merchant",  
            "buyer" 
        ],  
        "transactions_uri": "/v1/marketplaces/TEST-MP69RqMPeHlvyNAg8RNn9Txo/accounts/AC69Wv6gcaGkERkhmv9gczH4/transactions",  
        "uri": "/v1/marketplaces/TEST-MP69RqMPeHlvyNAg8RNn9Txo/accounts/AC69Wv6gcaGkERkhmv9gczH4" 
    } 
 

