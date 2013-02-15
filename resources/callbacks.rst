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
        "id": "CB3U0h8wZHehhXYvBE2CMrjt",  
        "method": "post",  
        "uri": "/v1/marketplaces/TEST-MP3TQqJx3Hy4bkMbtf89BlOH/callbacks/CB3U0h8wZHehhXYvBE2CMrjt",  
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
        "id": "CB3WSqdnh2p5fym1I3hu6h2P",  
        "method": "post",  
        "uri": "/v1/marketplaces/TEST-MP3WJzqieTfmhbE1xfqjG9Kr/callbacks/CB3WSqdnh2p5fym1I3hu6h2P",  
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
        "first_uri": "/v1/marketplaces/TEST-MP3ZMHn9YEEGE75KAfZY1jcT/callbacks?limit=10&offset=0",  
        "items": [ 
            { 
                "id": "CB3ZU2HELoqSY0yUrpNydif1",  
                "method": "post",  
                "uri": "/v1/marketplaces/TEST-MP3ZMHn9YEEGE75KAfZY1jcT/callbacks/CB3ZU2HELoqSY0yUrpNydif1",  
                "url": "http://www.example.com/callback" 
            } 
        ],  
        "last_uri": "/v1/marketplaces/TEST-MP3ZMHn9YEEGE75KAfZY1jcT/callbacks?limit=10&offset=0",  
        "limit": 10,  
        "next_uri": null,  
        "offset": 0,  
        "previous_uri": null,  
        "total": 1,  
        "uri": "/v1/marketplaces/TEST-MP3ZMHn9YEEGE75KAfZY1jcT/callbacks?limit=10&offset=0" 
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
 

