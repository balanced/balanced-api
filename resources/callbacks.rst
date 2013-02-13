Callbacks
=========

Callbacks are publicly accessible endpoints that you can create to receive Events.

- `Create a Callback`_
- `Retrieve a Callback`_
- `List All Callbacks`_
- `Delete a Callback`_

Fields
------

``url`` 
    **string**. The URL that will receive events 
 
``id`` 
    **string**.  
 
``uri`` 
    **string**.  
 

Create a Callback
-----------------

.. code:: 
 
    POST /v1/marketplaces/:marketplace_id/callbacks 
 

Request
~~~~~~~

``url`` 
    *required* **string**.  
 

Body 
^^^^ 
 

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
        "id": "CBqJ6QXSYUaseKYIJynZhqH",  
        "method": "post",  
        "uri": "/v1/marketplaces/TEST-MPqA9YYsLdvu88mLBmCL1KP/callbacks/CBqJ6QXSYUaseKYIJynZhqH",  
        "url": "https://www.example.com" 
    } 
 

Retrieve a Callback
-------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/callbacks/:callback_id 
 

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
        "id": "CBtBlHekAR39dnDBNGYeflx",  
        "method": "post",  
        "uri": "/v1/marketplaces/TEST-MPtrLFxidMT0rzpjIv2FkqL/callbacks/CBtBlHekAR39dnDBNGYeflx",  
        "url": "http://www.example.com/callback" 
    } 
 

List all Callbacks
------------------

.. code:: 
 
    GET /v1/marketplaces/:marketplace_id/callbacks 
 

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
        "first_uri": "/v1/marketplaces/TEST-MPxc2MaK6vPfm9UiRxduIiT/callbacks?limit=10&offset=0",  
        "items": [ 
            { 
                "id": "CBxjKWhG7OC8CPyfTA0mrAf",  
                "method": "post",  
                "uri": "/v1/marketplaces/TEST-MPxc2MaK6vPfm9UiRxduIiT/callbacks/CBxjKWhG7OC8CPyfTA0mrAf",  
                "url": "http://www.example.com/callback" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MPxc2MaK6vPfm9UiRxduIiT/callbacks?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 1,  
        "uri": "/v1/marketplaces/TEST-MPxc2MaK6vPfm9UiRxduIiT/callbacks?limit=10&offset=0" 
    } 
 

Delete a Callback
-----------------

.. code:: 
 
    DELETE /v1/marketplaces/:marketplace_id/callbacks/:callback_id 
 

Response 
~~~~~~~~ 
 
Headers 
^^^^^^^ 
 
.. code::  
 
    Status: 204 NO CONTENT 
 

