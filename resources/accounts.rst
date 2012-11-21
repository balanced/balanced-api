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
    **string**. The resource identifier. 
 
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
    *optional* **object**. See `Create a Card <./cards.rst#create-a-card>`_. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "card_uri": "/v1/marketplaces/TEST-MPB8gGrtXdsHzQR892SNv3R/cards/CC13c391a628b711e2baec80ee7316ae43",  
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
        "holds_uri": "/v1/marketplaces/TEST-MPCodcxVeURgnrBjaEYx2Lx/accounts/ACCB99IDfl2lOdoMju7aSX1/holds",  
        "name": "Benny Riemann",  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-11-07T00:42:36.185562Z",  
        "uri": "/v1/marketplaces/TEST-MPCodcxVeURgnrBjaEYx2Lx/accounts/ACCB99IDfl2lOdoMju7aSX1",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPCodcxVeURgnrBjaEYx2Lx/accounts/ACCB99IDfl2lOdoMju7aSX1/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MPCodcxVeURgnrBjaEYx2Lx/accounts/ACCB99IDfl2lOdoMju7aSX1/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MPCodcxVeURgnrBjaEYx2Lx/accounts/ACCB99IDfl2lOdoMju7aSX1/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPCodcxVeURgnrBjaEYx2Lx/accounts/ACCB99IDfl2lOdoMju7aSX1/transactions",  
        "email_address": "b@m.com",  
        "id": "ACCB99IDfl2lOdoMju7aSX1",  
        "credits_uri": "/v1/marketplaces/TEST-MPCodcxVeURgnrBjaEYx2Lx/accounts/ACCB99IDfl2lOdoMju7aSX1/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPCodcxVeURgnrBjaEYx2Lx/accounts/ACCB99IDfl2lOdoMju7aSX1/cards" 
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
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 
``merchant_uri`` 
    *optional* **string**. The URI of the merchant account created during a request for more 
    information. 
 
``merchant`` 
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
            *optional* **object**.  
                ``name`` 
                    *required* **string**.  
 
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
            *optional* **string**. Length must be **<=** ``128``. 
 
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
                "tax_id": "780514300" 
            },  
            "state": "CA",  
            "postal_code": "94110",  
            "type": "business",  
            "street_address": "Somewhere over the rainbow",  
            "tax_id": "273644200" 
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
        "holds_uri": "/v1/marketplaces/TEST-MPF6Nh8WZaxlCA3mjTG7Xt9/accounts/ACFgAZe3hfxqEQZShduTJjJ/holds",  
        "name": "jo",  
        "roles": [ 
            "merchant" 
        ],  
        "created_at": "2012-11-07T00:42:38.558188Z",  
        "uri": "/v1/marketplaces/TEST-MPF6Nh8WZaxlCA3mjTG7Xt9/accounts/ACFgAZe3hfxqEQZShduTJjJ",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPF6Nh8WZaxlCA3mjTG7Xt9/accounts/ACFgAZe3hfxqEQZShduTJjJ/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MPF6Nh8WZaxlCA3mjTG7Xt9/accounts/ACFgAZe3hfxqEQZShduTJjJ/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MPF6Nh8WZaxlCA3mjTG7Xt9/accounts/ACFgAZe3hfxqEQZShduTJjJ/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPF6Nh8WZaxlCA3mjTG7Xt9/accounts/ACFgAZe3hfxqEQZShduTJjJ/transactions",  
        "email_address": null,  
        "id": "ACFgAZe3hfxqEQZShduTJjJ",  
        "credits_uri": "/v1/marketplaces/TEST-MPF6Nh8WZaxlCA3mjTG7Xt9/accounts/ACFgAZe3hfxqEQZShduTJjJ/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPF6Nh8WZaxlCA3mjTG7Xt9/accounts/ACFgAZe3hfxqEQZShduTJjJ/cards" 
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
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 
``merchant_uri`` 
    *optional* **string**. The URI of the merchant account created during a request for more 
    information. 
 
``merchant`` 
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
            *optional* **string**. Length must be **<=** ``128``. 
 
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
            "tax_id": "647311400" 
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
        "holds_uri": "/v1/marketplaces/TEST-MPHHpq0ON72L9NObfHrS1i3/accounts/ACHTKa3gQKH5aggwcCxwUp5/holds",  
        "name": "jo",  
        "roles": [ 
            "merchant" 
        ],  
        "created_at": "2012-11-07T00:42:40.897795Z",  
        "uri": "/v1/marketplaces/TEST-MPHHpq0ON72L9NObfHrS1i3/accounts/ACHTKa3gQKH5aggwcCxwUp5",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPHHpq0ON72L9NObfHrS1i3/accounts/ACHTKa3gQKH5aggwcCxwUp5/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MPHHpq0ON72L9NObfHrS1i3/accounts/ACHTKa3gQKH5aggwcCxwUp5/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MPHHpq0ON72L9NObfHrS1i3/accounts/ACHTKa3gQKH5aggwcCxwUp5/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPHHpq0ON72L9NObfHrS1i3/accounts/ACHTKa3gQKH5aggwcCxwUp5/transactions",  
        "email_address": null,  
        "id": "ACHTKa3gQKH5aggwcCxwUp5",  
        "credits_uri": "/v1/marketplaces/TEST-MPHHpq0ON72L9NObfHrS1i3/accounts/ACHTKa3gQKH5aggwcCxwUp5/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPHHpq0ON72L9NObfHrS1i3/accounts/ACHTKa3gQKH5aggwcCxwUp5/cards" 
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
        "holds_uri": "/v1/marketplaces/TEST-MPIWGetyuHOoDjcibqRafez/accounts/ACJ7gyhn4zjz39bf804ELVV/holds",  
        "name": null,  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-11-07T00:42:41.981011Z",  
        "uri": "/v1/marketplaces/TEST-MPIWGetyuHOoDjcibqRafez/accounts/ACJ7gyhn4zjz39bf804ELVV",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPIWGetyuHOoDjcibqRafez/accounts/ACJ7gyhn4zjz39bf804ELVV/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MPIWGetyuHOoDjcibqRafez/accounts/ACJ7gyhn4zjz39bf804ELVV/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MPIWGetyuHOoDjcibqRafez/accounts/ACJ7gyhn4zjz39bf804ELVV/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPIWGetyuHOoDjcibqRafez/accounts/ACJ7gyhn4zjz39bf804ELVV/transactions",  
        "email_address": "email.6@y.com",  
        "id": "ACJ7gyhn4zjz39bf804ELVV",  
        "credits_uri": "/v1/marketplaces/TEST-MPIWGetyuHOoDjcibqRafez/accounts/ACJ7gyhn4zjz39bf804ELVV/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPIWGetyuHOoDjcibqRafez/accounts/ACJ7gyhn4zjz39bf804ELVV/cards" 
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
        "first_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts?limit=10&offset=0",  
        "items": [ 
            { 
                "holds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKdXKVO6eatjpTYSIkQsKf/holds",  
                "name": "Merchants, Inc.",  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-11-07T00:42:42.966659Z",  
                "uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKdXKVO6eatjpTYSIkQsKf",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKdXKVO6eatjpTYSIkQsKf/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKdXKVO6eatjpTYSIkQsKf/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKdXKVO6eatjpTYSIkQsKf/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKdXKVO6eatjpTYSIkQsKf/transactions",  
                "email_address": "email.1@y.com",  
                "id": "ACKdXKVO6eatjpTYSIkQsKf",  
                "credits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKdXKVO6eatjpTYSIkQsKf/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKdXKVO6eatjpTYSIkQsKf/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgTps285gKkvNfc5jkW3N/holds",  
                "name": null,  
                "roles": [ 
                    "merchant",  
                    "buyer" 
                ],  
                "created_at": "2012-11-07T00:42:43.008088Z",  
                "uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgTps285gKkvNfc5jkW3N",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgTps285gKkvNfc5jkW3N/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgTps285gKkvNfc5jkW3N/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgTps285gKkvNfc5jkW3N/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgTps285gKkvNfc5jkW3N/transactions",  
                "email_address": "email.3@y.com",  
                "id": "ACKgTps285gKkvNfc5jkW3N",  
                "credits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgTps285gKkvNfc5jkW3N/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgTps285gKkvNfc5jkW3N/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgYTliupRnQACh5l2pQsP/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-11-07T00:42:43.009274Z",  
                "uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgYTliupRnQACh5l2pQsP",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgYTliupRnQACh5l2pQsP/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgYTliupRnQACh5l2pQsP/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgYTliupRnQACh5l2pQsP/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgYTliupRnQACh5l2pQsP/transactions",  
                "email_address": "email.4@y.com",  
                "id": "ACKgYTliupRnQACh5l2pQsP",  
                "credits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgYTliupRnQACh5l2pQsP/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKgYTliupRnQACh5l2pQsP/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKjz7VxPq5HIPra4k1uMoj/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-11-07T00:42:43.046519Z",  
                "uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKjz7VxPq5HIPra4k1uMoj",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKjz7VxPq5HIPra4k1uMoj/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKjz7VxPq5HIPra4k1uMoj/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKjz7VxPq5HIPra4k1uMoj/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKjz7VxPq5HIPra4k1uMoj/transactions",  
                "email_address": "email.5@y.com",  
                "id": "ACKjz7VxPq5HIPra4k1uMoj",  
                "credits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKjz7VxPq5HIPra4k1uMoj/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKjz7VxPq5HIPra4k1uMoj/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnb7uvGcdSLzBQFNTNfsT/holds",  
                "name": null,  
                "roles": [ 
                    "merchant" 
                ],  
                "created_at": "2012-11-07T00:42:43.098321Z",  
                "uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnb7uvGcdSLzBQFNTNfsT",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnb7uvGcdSLzBQFNTNfsT/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnb7uvGcdSLzBQFNTNfsT/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnb7uvGcdSLzBQFNTNfsT/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnb7uvGcdSLzBQFNTNfsT/transactions",  
                "email_address": "email.7@y.com",  
                "id": "ACKnb7uvGcdSLzBQFNTNfsT",  
                "credits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnb7uvGcdSLzBQFNTNfsT/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnb7uvGcdSLzBQFNTNfsT/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnhYCI1FTd3iL6PmkWe2v/holds",  
                "name": null,  
                "roles": [ 
                    "buyer" 
                ],  
                "created_at": "2012-11-07T00:42:43.099873Z",  
                "uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnhYCI1FTd3iL6PmkWe2v",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnhYCI1FTd3iL6PmkWe2v/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnhYCI1FTd3iL6PmkWe2v/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnhYCI1FTd3iL6PmkWe2v/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnhYCI1FTd3iL6PmkWe2v/transactions",  
                "email_address": "email.8@y.com",  
                "id": "ACKnhYCI1FTd3iL6PmkWe2v",  
                "credits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnhYCI1FTd3iL6PmkWe2v/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKnhYCI1FTd3iL6PmkWe2v/cards" 
            },  
            { 
                "holds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKpojlVmwGN9I2JeM0eRN1/holds",  
                "name": null,  
                "roles": [ 
                    "merchant" 
                ],  
                "created_at": "2012-11-07T00:42:43.129937Z",  
                "uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKpojlVmwGN9I2JeM0eRN1",  
                "bank_accounts_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKpojlVmwGN9I2JeM0eRN1/bank_accounts",  
                "refunds_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKpojlVmwGN9I2JeM0eRN1/refunds",  
                "meta": {},  
                "debits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKpojlVmwGN9I2JeM0eRN1/debits",  
                "transactions_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKpojlVmwGN9I2JeM0eRN1/transactions",  
                "email_address": "email.10@y.com",  
                "id": "ACKpojlVmwGN9I2JeM0eRN1",  
                "credits_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKpojlVmwGN9I2JeM0eRN1/credits",  
                "cards_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts/ACKpojlVmwGN9I2JeM0eRN1/cards" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 7,  
        "next_uri": null,  
        "last_uri": "/v1/marketplaces/TEST-MPKaV0gHxlradg70ariDYX1/accounts?limit=10&offset=0" 
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
    *optional* **object**. See `Card <./cards.rst>`_. 
 
``bank_account_uri`` 
    *optional* **string**. Tokenized bank account URI. 
 
``bank_account`` 
    *optional* **object**. See `BankAccount <./bank_accounts.rst>`_. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "card_uri": "/v1/marketplaces/TEST-MPLAe1B1VWuygjqlOFHiLv5/cards/CC19496a9228b711e28c7280ee7316ae43",  
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
        "holds_uri": "/v1/marketplaces/TEST-MPMUAVqiAiOVQMZ0f0mY3kv/accounts/ACN3oOlvsqHhc6rTgCZKccb/holds",  
        "name": "my new name",  
        "roles": [ 
            "buyer" 
        ],  
        "created_at": "2012-11-07T00:42:45.481894Z",  
        "uri": "/v1/marketplaces/TEST-MPMUAVqiAiOVQMZ0f0mY3kv/accounts/ACN3oOlvsqHhc6rTgCZKccb",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPMUAVqiAiOVQMZ0f0mY3kv/accounts/ACN3oOlvsqHhc6rTgCZKccb/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MPMUAVqiAiOVQMZ0f0mY3kv/accounts/ACN3oOlvsqHhc6rTgCZKccb/refunds",  
        "meta": { 
            "more-data": "here" 
        },  
        "debits_uri": "/v1/marketplaces/TEST-MPMUAVqiAiOVQMZ0f0mY3kv/accounts/ACN3oOlvsqHhc6rTgCZKccb/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPMUAVqiAiOVQMZ0f0mY3kv/accounts/ACN3oOlvsqHhc6rTgCZKccb/transactions",  
        "email_address": "new@email.com",  
        "id": "ACN3oOlvsqHhc6rTgCZKccb",  
        "credits_uri": "/v1/marketplaces/TEST-MPMUAVqiAiOVQMZ0f0mY3kv/accounts/ACN3oOlvsqHhc6rTgCZKccb/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPMUAVqiAiOVQMZ0f0mY3kv/accounts/ACN3oOlvsqHhc6rTgCZKccb/cards" 
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
            "tax_id": "013825400" 
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
        "holds_uri": "/v1/marketplaces/TEST-MPPufTZ8CKRQB5LJJGhvQMX/accounts/ACPCrROwzI2qGC80Zj6Nj9h/holds",  
        "name": null,  
        "roles": [ 
            "merchant",  
            "buyer" 
        ],  
        "created_at": "2012-11-07T00:42:47.762697Z",  
        "uri": "/v1/marketplaces/TEST-MPPufTZ8CKRQB5LJJGhvQMX/accounts/ACPCrROwzI2qGC80Zj6Nj9h",  
        "bank_accounts_uri": "/v1/marketplaces/TEST-MPPufTZ8CKRQB5LJJGhvQMX/accounts/ACPCrROwzI2qGC80Zj6Nj9h/bank_accounts",  
        "refunds_uri": "/v1/marketplaces/TEST-MPPufTZ8CKRQB5LJJGhvQMX/accounts/ACPCrROwzI2qGC80Zj6Nj9h/refunds",  
        "meta": {},  
        "debits_uri": "/v1/marketplaces/TEST-MPPufTZ8CKRQB5LJJGhvQMX/accounts/ACPCrROwzI2qGC80Zj6Nj9h/debits",  
        "transactions_uri": "/v1/marketplaces/TEST-MPPufTZ8CKRQB5LJJGhvQMX/accounts/ACPCrROwzI2qGC80Zj6Nj9h/transactions",  
        "email_address": "email.6@y.com",  
        "id": "ACPCrROwzI2qGC80Zj6Nj9h",  
        "credits_uri": "/v1/marketplaces/TEST-MPPufTZ8CKRQB5LJJGhvQMX/accounts/ACPCrROwzI2qGC80Zj6Nj9h/credits",  
        "cards_uri": "/v1/marketplaces/TEST-MPPufTZ8CKRQB5LJJGhvQMX/accounts/ACPCrROwzI2qGC80Zj6Nj9h/cards" 
    } 
 

