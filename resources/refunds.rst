=======
Refunds
=======

A refund represents a reversal of funds associated with a debit. A
debit can have many refunds associated with it up to the total amount
of the original debit. Funds are returned to your Marketplace's
escrow account.

Any fees associated with the original debit are refunded proportionally
to the amount refunded.

.. _refund-view:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account``
     - ``account``
     - Account receiving the refund

       See `account view
       <./accounts.rst#account-view>`_.


   * - ``fee``
     - integer
     - The fee charged by Balanced for this refund

   * - ``description``
     - string
     - Free-text description of the refund

   * - ``created_at``
     - datetime
     - When the refund was created

   * - ``uri``
     - string
     - A URI for a Balanced entity

   * - ``transaction_number``
     - string
     - 
   * - ``amount``
     - integer
     - The amount of the refund

   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``debit``
     - ``debit``
     - The original debit associated with the refund.

       See `debit view
       <./debits.rst#debit-view>`_.


   * - ``appears_on_statement_as``
     - string
     - Text that will appear on the statement describing this refund

   * - ``id``
     - string
     - 

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_
     - POST
     - `Create <./refunds.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_
     - POST
     - `Create <./refunds.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_
     - HEAD,GET
     - `Index <./refunds.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_
     - HEAD,GET
     - `Index <./refunds.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
     - PUT
     - `Update <./refunds.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
     - HEAD,GET
     - `Show <./refunds.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_/<*refund*>
     - PUT
     - `Update <./refunds.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_/<*refund*>
     - PUT
     - `Update <./refunds.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_/<*refund*>
     - HEAD,GET
     - `Show <./refunds.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_/<*refund*>
     - HEAD,GET
     - `Show <./refunds.rst#show>`_

======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_
:methods: POST
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_
:methods: POST

.. _refund-create-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``amount``
     - integer
     - Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original
       ``debit``.

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

   * - ``description``
     - string
     - Sequence of characters.

       This field is **optional**, it defaults to ``null``.

   * - ``debit_uri``
     - string
     - URI.

       If the resolving URI references a ``debit`` then that is used as the
       default. Otherwise no default is provided and this field is
       **required**.



=====
Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_
:methods: HEAD,GET
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_
:methods: HEAD,GET

.. _refund-index-query:


.. _refunds-view:


======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: PUT

.. _debit-refund-update-form:

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

   * - ``description``
     - string
     - Sequence of characters.

       This field is **optional**, it defaults to ``null``.



====
Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: HEAD,GET

Click `here <./refunds.rst#refund-view>`_ for the ``refund`` schema.


======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: PUT
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: PUT

.. _refund-update-form:

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

   * - ``description``
     - string
     - Sequence of characters.

       This field is **optional**, it defaults to ``null``.



====
Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: HEAD,GET
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: HEAD,GET

Click `here <./refunds.rst#refund-view>`_ for the ``refund`` schema.



