=======
Credits
=======

A credit represents a transfer of money from your marketplace to a
merchant's account.

By default a credit will be sent to the most recently added funding
destination associated with an account but you may specify a specific
funding destination when creating a credit.

A credit is not refundable, to transfer money back to your marketplace
you must create a debit.

.. _credit-view:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account``
     - ``account``
     - The account to which the credit is associated

       See `account view
       <./accounts.rst#account-view>`_.


   * - ``fee``
     - integer
     - The fee charged by Balanced for this credit

   * - ``description``
     - string
     - A description of the credit, used for display purposes

   * - ``uri``
     - string
     - A URI for a Balanced entity

   * - ``created_at``
     - datetime
     - Time of creation

   * - ``destination``
     - ``bank_account``
     - The funding destination for this credit (i.e., a bank account)

       See `bank account view
       <./bank_accounts.rst#bank-account-view>`_.


   * - ``transaction_number``
     - string
     - 
   * - ``amount``
     - integer
     - Amount of the credit

   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``id``
     - string
     - 
   * - ``available_at``
     - datetime
     - The date on which the credit will be available to the merchant


.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_/<*credit*>
     - HEAD,GET
     - `Show <./credits.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_/<*credit*>
     - HEAD,GET
     - `Show <./credits.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_/<*credit*>
     - PUT
     - `Update <./credits.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_/<*credit*>
     - PUT
     - `Update <./credits.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_
     - POST
     - `Create <./credits.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_
     - POST
     - `Create <./credits.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_
     - HEAD,GET
     - `Index <./credits.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_
     - HEAD,GET
     - `Index <./credits.rst#index>`_

====
Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_/<*credit*>
:methods: HEAD,GET
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_/<*credit*>
:methods: HEAD,GET

Click `here <./credits.rst#credit-view>`_ for the ``credit`` schema.


======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_/<*credit*>
:methods: PUT
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_/<*credit*>
:methods: PUT

.. _credit-update-form:

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



======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_
:methods: POST
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_
:methods: POST

.. _credit-create-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account_uri``
     - string
     - URI.

       If the resolving URI contain an account then that is used as the
       default otherwise no default is provided and this field is
       **required**.

   * - ``description``
     - string
     - Sequence of characters.

       This field is **optional**, it defaults to ``null``.

   * - ``destination_uri``
     - string
     - URI.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``bank_account_uri``
     - string
     - URI.

       This field is **optional**, it defaults to ``null``.

   * - ``amount``
     - integer
     - ``amount`` must be >= the minimum credit amount allowed for your
       marketplace. ``amount`` must be <= the maximum credit amount allowed for your
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

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_
:methods: HEAD,GET
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_
:methods: HEAD,GET

.. _credit-index:


.. _credits-view:



