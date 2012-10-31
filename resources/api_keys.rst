API Keys
========

- `Create an API Key`_
- `Retrieve an API Key`_
- `List all API Keys`_
- `Update an API Key`_
- `Deactivate an API Key`_


Fields
------
``id`` 
    **string**. The resource identifier. 
 
``uri`` 
    **string**. A URI for a Balanced entity 
 
``created_at`` 
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this 
    api key was created. 
 
``merchant`` 
    **object**. The merchant owning this API key. See `Merchant <./merchants.rst>`_. 
 
``secret`` 
    **string**. The secret associated with this API key. Will only be shown if passed 
    in the original request.  
 
``meta`` 
    **object**. A single-level dictionary of string-type key/value pairs. 
 

Create an API Key
-----------------

.. code:: 
 
    POST /v1/merchants/:merchant_id/api_keys 
    POST /v1/api_keys 
 

Request
~~~~~~~

``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "meta": { 
            "some": "data" 
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
        "id": "AK6O4KQLZx9S7sBL7FoIbWde",  
        "created_at": "2012-10-30T18:25:36.946122Z",  
        "meta": { 
            "some": "data" 
        },  
        "secret": "dfad69c222f911e2a90780ee7316ae44",  
        "uri": "/v1/api_keys/AK6O4KQLZx9S7sBL7FoIbWde" 
    } 
 

Retrieve an API Key
-------------------

.. code:: 
 
    GET /v1/merchants/:merchant_id/api_keys/:api_key_id 
    GET /v1/api_keys/:api_key_id 
 

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
        "created_at": "2012-10-30T18:25:38.199743Z",  
        "meta": {},  
        "id": "AK6PubKe3nCEuIoq6a4aQAUA",  
        "uri": "/v1/api_keys/AK6PubKe3nCEuIoq6a4aQAUA" 
    } 
 

List all API Keys
-----------------

.. code:: 
 
    GET /v1/merchants/:merchant_id/api_keys 
    GET /v1/api_keys 
 

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
        "first_uri": "/v1/api_keys?limit=10&offset=0",  
        "items": [ 
            { 
                "id": "AK6QLoMYIxvH0f5GsTBRCAHa",  
                "created_at": "2012-10-30T18:25:39.336880Z",  
                "meta": {},  
                "secret": "e119a74e22f911e29dc880ee7316ae44",  
                "uri": "/v1/api_keys/AK6QLoMYIxvH0f5GsTBRCAHa" 
            },  
            { 
                "created_at": "2012-10-30T18:25:39.487589Z",  
                "meta": {},  
                "uri": "/v1/api_keys/AK6QW0dFGW9FvbADPpbM8sjq",  
                "id": "AK6QW0dFGW9FvbADPpbM8sjq" 
            },  
            { 
                "created_at": "2012-10-30T18:25:39.488541Z",  
                "meta": {},  
                "uri": "/v1/api_keys/AK6QW4p9artSZWnj8fVOtpNG",  
                "id": "AK6QW4p9artSZWnj8fVOtpNG" 
            },  
            { 
                "created_at": "2012-10-30T18:25:39.489412Z",  
                "meta": {},  
                "uri": "/v1/api_keys/AK6QW8ubMrhPLm1568X9IdCc",  
                "id": "AK6QW8ubMrhPLm1568X9IdCc" 
            } 
        ],  
        "previous_uri": null,  
        "uri": "/v1/api_keys?limit=10&offset=0",  
        "limit": 10,  
        "offset": 0,  
        "total": 4,  
        "next_uri": null,  
        "last_uri": "/v1/api_keys?limit=10&offset=0" 
    } 
 

Update an API Key
-----------------

.. code:: 
 
    PUT /v1/merchants/:merchant_id/api_keys/:api_key_id 
    PUT /v1/api_keys/:api_key_id 
 

Request
~~~~~~~
   
``meta`` 
    *optional* **object** or **null**. Single level mapping from string keys to string values. 
 

Body 
^^^^ 
 
.. code:: javascript 
 
    { 
        "meta": { 
            "some": "different data" 
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
        "created_at": "2012-10-30T18:25:42.260276Z",  
        "meta": { 
            "some": "different data" 
        },  
        "id": "AK6U3lfapzLwKqwFtqilvsnG",  
        "uri": "/v1/api_keys/AK6U3lfapzLwKqwFtqilvsnG" 
    } 
 

Deactivate an API Key
---------------------

.. code:: 
 
    DELETE /v1/merchants/:merchant_id/api_keys/:api_key_id 
    DELETE /v1/api_keys/:api_key_id 
 

Headers 
~~~~~~~ 
 
.. code::  
 
    Status: 204 NO CONTENT 
 

