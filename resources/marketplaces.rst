============
Marketplaces
============

A marketplace is where buyers and merchants transact with each other.

Debits from buyers are credited to the marketplace's escrow account, and
credits to merchants are credited from this same account.

.. _marketplace-view:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``in_escrow``
     - integer
     - Amount (in cents) in the escrow account for this marketplace

   * - ``support_phone_number``
     - string
     - Phone number on file for support for this marketplace

   * - ``domain_url``
     - string
     - 
   * - ``name``
     - string
     - Name of this marketplace

   * - ``refunds_uri``
     - string
     - URI for all refunds for this marketplace

   * - ``uri``
     - string
     - The URI of this marketplace


   * - ``support_email_address``
     - string
     - Email address on file for support for this marketplace

   * - ``bank_accounts_uri``
     - string
     - A URI for a Balanced entity

   * - ``owner_account``
     - ``account``
     - The account owning this marketplace

       See `account view
       <./accounts.rst#account-view>`_.


   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``debits_uri``
     - string
     - URI for all debits for this marketplace

   * - ``holds_uri``
     - string
     - URI for all holds for this marketplace

   * - ``transactions_uri``
     - string
     - URI for all transactions for this marketplace

   * - ``accounts_uri``
     - string
     - URI for all accounts on this marketplace

   * - ``id``
     - string
     - The id of this marketplace


   * - ``credits_uri``
     - string
     - URI for all credits for this marketplace

   * - ``cards_uri``
     - string
     - A URI for a Balanced entity


.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>
     - PUT
     - `Update <./marketplaces.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_
     - POST
     - `Create <./marketplaces.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>
     - HEAD,GET
     - `Show <./marketplaces.rst#show>`_

======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>
:methods: PUT

.. _marketplace-update-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``support_phone_number``
     - string
     - E.164 formatted phone number.

       Length must be **<=** ``15``.

       This field is **optional**, it defaults to ``null``.

   * - ``support_email_address``
     - string
     - RFC-2822 formatted email address.

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

   * - ``domain_url``
     - string
     - This field is **optional**, it defaults to ``null``.

   * - ``name``
     - string
     - Sequence of characters.

       Length must be **<=** ``128``.

       This field is **optional**, it defaults to ``null``.



======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_
:methods: POST

.. _marketplace-create-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``support_phone_number``
     - string
     - E.164 formatted phone number.

       Length must be **<=** ``15``.

       This field is **optional**, it defaults to ``+16505551234``.

   * - ``domain_url``
     - string
     - This field is **optional**, it defaults to ``example.com``.

   * - ``name``
     - string
     - Sequence of characters.

       Length must be **<=** ``128``.

       This field is **optional**, it defaults to ``Test Marketplace``.

   * - ``support_email_address``
     - string
     - RFC-2822 formatted email address.

       This field is **optional**, it defaults to ``support@example.com``.

   * - ``owner_account``
     - map
     - .. list-table::
          :widths: 20 20 80 
          :header-rows: 1

          * - Name
            - Type
            - Description
          * - ``email_address``
            - string
            - RFC-2822 formatted email address.

              This field is **optional**, it defaults to ``null``.

          * - ``name``
            - string
            - Sequence of characters.

              Length must be **<=** ``128``.

              This field is **optional**, it defaults to ``null``.

       This field is **optional**, it defaults to ``{   'email_address': None, 'name': None}``.

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



====
Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>
:methods: HEAD,GET

Click `here <./marketplaces.rst#marketplace-view>`_
for the ``marketplace`` schema.



