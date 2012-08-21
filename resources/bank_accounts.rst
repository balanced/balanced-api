=============
Bank_accounts
=============

A bank account represents both a source, and a destination of funds. It
must be associated with an account via a PUT on the account before you
can begin transferring with it.

.. _bank-account-view:
.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``bank_name``
     - string
     - The name of the bank

   * - ``account``
     - ``account``
     - The account to which this bank account is associated

       See `account view
       <./accounts.rst#account-view>`_.


   * - ``name``
     - string
     - The name on the bank account

   * - ``bank_code``
     - string
     - The bank code (routing number in the USA) of the bank account

   * - ``created_at``
     - datetime
     - Time of creation

   * - ``uri``
     - string
     - The URI of the bank account object


   * - ``is_valid``
     - boolean
     - Boolean flag indicating whether the bank account is currently valid

   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``last_four``
     - string
     - The last four digits of the bank account number

   * - ``id``
     - string
     - 

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_
     - HEAD,GET
     - `Index <./bank_accounts.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
     - PUT
     - `Update <./bank_accounts.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
     - HEAD,GET
     - `Show <./bank_accounts.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
     - PUT
     - `Update <./bank_accounts.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_
     - POST
     - `Create <./bank_accounts.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
     - HEAD,GET
     - `Show <./bank_accounts.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_
     - HEAD,GET
     - `Index <./bank_accounts.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_
     - POST
     - `Create <./bank_accounts.rst#create>`_

=====
Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_
:methods: HEAD,GET

.. _bank-accounts-view:


======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
:methods: PUT

.. _bank-account-update-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account_uri``
     - string
     - URI of an account with which to associate the bank account.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``account``
     - map
     - URI of an account with which to associate the bank account.

       .. list-table::
          :widths: 20 20 80 
          :header-rows: 1

          * - Name
            - Type
            - Description
          * - ``uri``
            - string
            - URI.

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

       This field is **optional**, it defaults to ``null``.

   * - ``is_valid``
     - boolean
     - Flag indicating whether the bank account is active (``true``) or not
       (``false``). Setting this to ``false`` will deactivate the bank account.



====
Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
:methods: HEAD,GET

Click `here <./bank_accounts.rst#bank-account-view>`_ for the
``bank_account`` schema.


======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
:methods: PUT

You may invalidate a bank account by passing ``is_valid`` with a False
value. Once a bank account has been invalidated it cannot be
re-activated, you must create a new bank account.

.. _bank-account-update-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account_uri``
     - string
     - URI of an account with which to associate the bank account.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``account``
     - map
     - URI of an account with which to associate the bank account.

       .. list-table::
          :widths: 20 20 80 
          :header-rows: 1

          * - Name
            - Type
            - Description
          * - ``uri``
            - string
            - URI.

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

       This field is **optional**, it defaults to ``null``.

   * - ``is_valid``
     - boolean
     - Flag indicating whether the bank account is active (``true``) or not
       (``false``). Setting this to ``false`` will deactivate the bank account.



======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_
:methods: POST

.. _account-bank-account-create-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``uri``
     - string
     - Tokenized bank account URI.

       **or**
   * - ``bank_account_uri``
     - string
     - Tokenized bank account URI.

       **or**
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

   * - ``bank_code``
     - *depenent*
     - #. For production bank accounts.

          .. list-table::
             :widths: 20 80 
             :header-rows: 1

             * - Type
               - Description
             * - string
               - Bank account code. This is commonly referred to as the routing number in
                 the ``USA``.

                 Length must be **=** ``9``.

       #. For non-production bank accounts.

          .. list-table::
             :widths: 20 80 
             :header-rows: 1

             * - Type
               - Description
             * - string
               - Sequence of characters.

                 Length must be **>=** ``1``.

   * - ``account_type``
     - string
     - Bank account type. It should be one of:

           - ``checking``
           - ``savings``

       This field is **optional**, it defaults to ``CHECKING``.

   * - ``name``
     - string
     - Name on the bank account.

       Length must be **>=** ``2``.

   * - ``account_number``
     - string
     - Bank account number.

       Length must be **>=** ``1``.



====
Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
:methods: HEAD,GET

Click `here <./bank_accounts.rst#bank-account-view>`_ for the
``bank_account`` schema.


=====
Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_
:methods: HEAD,GET



======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_
:methods: POST

.. _bank-account-create-form:

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

       This field is **optional**, it defaults to ``{   }``.

   * - ``bank_code``
     - *depenent*
     - #. For production bank accounts.

          .. list-table::
             :widths: 20 80 
             :header-rows: 1

             * - Type
               - Description
             * - string
               - Bank account code. This is commonly referred to as the routing number in
                 the ``USA``.

                 Length must be **=** ``9``.

       #. For non-production bank accounts.

          .. list-table::
             :widths: 20 80 
             :header-rows: 1

             * - Type
               - Description
             * - string
               - Sequence of characters.

                 Length must be **>=** ``1``.

   * - ``account_type``
     - string
     - Bank account type. It should be one of:

           - ``checking``
           - ``savings``

       This field is **optional**, it defaults to ``CHECKING``.

   * - ``name``
     - string
     - Name on the bank account.

       Length must be **>=** ``2``.

   * - ``account_number``
     - string
     - Bank account number.

       Length must be **>=** ``1``.




