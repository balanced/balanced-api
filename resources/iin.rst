IINs
====

- `Retrieve Card IIN`_

Fields
------

``uri`` 
    **string**.  
 
``card_type`` 
    **string**. One types defined by IIN (e.g. `CREDIT`, `CHARGE CARD`, etc). 
 
``card_category`` 
    **string**. One categories defined by IIN (e.g. `GIFT`, etc). 
 
``bank`` 
    **string**. Name of the issuing bank 
 
``bank_url`` 
    **string**. Web site of the issuing bank 
 
``bank_phone_number`` 
    **string**. Phone number of the issuing bank. 
 
``country_iso3`` 
    **string**. ISO3166-1 alpha-3 country code. 
 

Retrieve an IIN
---------------

.. code:: 
 
    GET /v1/cards/:card_id/iin 
 

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
        "bank": "",  
        "bank_phone_number": "\r",  
        "bank_url": "",  
        "card_category": "BUSINESS CARD",  
        "card_type": "CREDIT",  
        "country_iso3": "USA",  
        "uri": "/v1/cards/CC3nBVKfJHJTERr9PbRGfnsh/iin" 
    } 
 

