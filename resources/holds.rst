=====
Holds
=====

A hold represents a reservation of money from a buyer's account to your
marketplace.

A hold is guaranteed valid for seven days from the date of creation as
represented by the ``expires_at`` field. To capture the funds and
transfer them to your marketplace you must create a debit from the
hold.

When you capture a hold, you may capture any fraction of the original
amount up to the full amount. Once a hold has been captured it is
marked as expired and you cannot capture any remaining value.

.. _hold-view:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account``
     - ``account``
     - The account against which this hold was created

       See `account view
       <./accounts.rst#account-view>`_.


   * - ``fee``
     - integer
     - Fee charged by Balanced for this hold

   * - ``description``
     - string
     - A description of the hold, used for display purposes

   * - ``transaction_number``
     - string
     - 
   * - ``created_at``
     - datetime
     - Time of creation

   * - ``uri``
     - string
     - A URI for a Balanced entity

   * - ``is_void``
     - boolean
     - A boolean flag indicating if the hold has been voided or not


   * - ``expires_at``
     - datetime
     - Date at which this hold expires and can no longer be captured

   * - ``source``
     - ``funding_source``
     - The funding source for this hold

       See `card view
       <./cards.rst#card-view>`_.


   * - ``amount``
     - integer
     - Amount of the hold

   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``debit``
     - ``debit``
     - The captured debit associated with this hold

       See `debit view
       <./debits.rst#debit-view>`_.


   * - ``id``
     - string
     - 

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_
     - POST
     - `Create <./holds.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_
     - POST
     - `Create <./holds.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_
     - HEAD,GET
     - `Index <./holds.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_
     - HEAD,GET
     - `Index <./holds.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_/<*hold*>
     - PUT
     - `Update <./holds.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>
     - PUT
     - `Update <./holds.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_/<*hold*>
     - HEAD,GET
     - `Show <./holds.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>
     - HEAD,GET
     - `Show <./holds.rst#show>`_

======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_
:methods: POST
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_
:methods: POST

.. _hold-create-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account_uri``
     - string
     - URI.

       If the resolving URI references an ``account`` then that is used as the
       default. Otherwise no default is provided and this field is
       **required**.

   * - ``source_uri``
     - string
     - URI.

       If the resolving URI references an ``account`` then account's primary
       funding source  is used. Otherwise no default is provided and this
       field is required.

       **or**
   * - ``card_uri``
     - string
     - URI.

       If the resolving URI references an ``account`` then account's primary
       funding source  is used. Otherwise no default is provided and this
       field is required.

   * - ``description``
     - string
     - Sequence of characters.

       This field is **optional**, it defaults to ``null``.

   * - ``amount``
     - integer
     - Value must be >= to the minimum debit amount allowed for *your*
       marketplace. Value must be <= to the maximum debit amount allowed for *your*
       marketplace.

   * - ``appears_on_statement_as``
     - string
     - Length must be **<=** ``22``.

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



=====
Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_
:methods: HEAD,GET
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_
:methods: HEAD,GET



======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_/<*hold*>
:methods: PUT
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>
:methods: PUT

.. _hold-update-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``appears_on_statement_as``
     - string
     - Length must be **<=** ``22``.

       This field is **optional**, it defaults to ``null``.

   * - ``is_void``
     - boolean
     - Flag value, should be ``true`` or ``false``.

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

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_/<*hold*>
:methods: HEAD,GET
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>
:methods: HEAD,GET

Click `here <./holds.rst#hold-view>`_ for the ``hold`` schema.



