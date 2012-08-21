========
Api_keys
========

API keys identify users of the API. A valid API key must be passed with most
requests in order to authenticate the request.

.. _api-key-view:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``merchant``
     - ``merchant``
     - The merchant owning this API key

       See `merchant view
       <./merchants.rst#merchant-view>`_.


   * - ``created_at``
     - datetime
     - Time of creation

   * - ``uri``
     - string
     - A URI for a Balanced entity

   * - ``secret``
     - string
     - The secret associated with this API key. Will only be shown if passed
       in the original request.


   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``id``
     - string
     - 

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
     - HEAD,GET
     - `Show <./api_keys.rst#show>`_
   * - /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
     - HEAD,GET
     - `Show <./api_keys.rst#show>`_
   * - /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
     - DELETE
     - `Delete <./api_keys.rst#delete>`_
   * - /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
     - DELETE
     - `Delete <./api_keys.rst#delete>`_
   * - /v1/`api_keys <./api_keys.rst>`_
     - POST
     - `Create <./api_keys.rst#create>`_
   * - /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_
     - POST
     - `Create <./api_keys.rst#create>`_
   * - /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
     - PUT
     - `Update <./api_keys.rst#update>`_
   * - /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
     - PUT
     - `Update <./api_keys.rst#update>`_

====
Show
====

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: HEAD,GET
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: HEAD,GET

Click `here <./api_keys.rst#api-key-view>`_ for the ``api_key`` schema.


======
Delete
======

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: DELETE
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: DELETE

Deactivates an API key. Once deactivated this key cannot be used again.


======
Create
======

:uri: /v1/`api_keys <./api_keys.rst>`_
:methods: POST
:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_
:methods: POST

Creates a new API key. If created with an authenticated request, the
API key will be associated with, and will be able to access the same
marketplace associated with, the original API key.

.. _api-key-create-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``secret``
     - string
     - Sequence of characters.

       This field is **optional**, it defaults to ``null``.

   * - ``meta``
     - map
     - Mapping from string keys to string values.

       Each key maps to:

       .. list-table::
          :widths: 20 80 
          :header-rows: 1

          * - Type
            - Description
          * - string
            - Sequence of characters.

              Length must be **<=** ``1024``.

       This field is **optional**, it defaults to ``{   }``.



======
Update
======

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: PUT
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: PUT

.. _api-key-update-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``meta``
     - map
     - Mapping from string keys to string values.

       Each key maps to:

       .. list-table::
          :widths: 20 80 
          :header-rows: 1

          * - Type
            - Description
          * - string
            - Sequence of characters.

              Length must be **<=** ``1024``.

       This field is **optional**, it defaults to ``null``.




