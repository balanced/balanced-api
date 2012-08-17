===============
api_keys.create
===============

:uri: /v1/merchants/(merchant:merchant)/api_keys
:methods: POST


Creates a new API key. If created with an authenticated request, the
API key will be associated with, and will be able to access the same
marketplace associated with, the original API key.


Fields
******


.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

