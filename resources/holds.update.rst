============
holds.update
============

:uri: /v1/marketplaces/(marketplace:marketplace)/holds/(hold:hold)
:methods: PUT


Fields
******


.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``description``
     - Optional, free text, used for display purposes.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
   * - ``is_valid``
     - Boolean, set to False to void the hold. Once a hold has been voided it
       cannot be captured.
        

