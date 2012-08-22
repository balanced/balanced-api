=====
Cards
=====

A card represents a source of funds, such as a debit or credit card. It must be
associated with an account via a PUT on the account before transactions can be
made with it.

.. _card-view:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``id``
     - string
     - 
   * - ``uri``
     - object
     - The URI of the card


   * - ``account``
     - object
     - The account this card is associated with

       See `account view
       <./accounts.rst#account-view>`_.


   * - ``created_at``
     - datetime
     - When this card was created

   * - ``street_address``
     - string
     - Street address

   * - ``postal_code``
     - string
     - Postal code (zip code in the USA)

   * - ``country_code``
     - string
     - ISO-3166-3 three-character country code

   * - ``name``
     - string
     - The name on the card

   * - ``expiration_month``
     - string
     - Card's expiration month

   * - ``expiration_year``
     - string
     - Card's expiration year

   * - ``card_type``
     - string
     - **Deprecated**
       The type of the card. This field has been deprecated in favor of
       ``brand``

   * - ``meta``
     - object
     - A single-level dictionary of string-type key/value pairs

   * - ``last_four``
     - string
     - Last four digits of the card

   * - ``brand``
     - object
     - The brand of the card. One of:
         - Visa
         - MasterCard
         - American Express
         - Discover


   * - ``is_valid``
     - boolean
     - A boolean value indicating whether or not the card is valid. Once
       invalidated, ``is_valid`` can not be set to True again.


.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_/<*card*>
     - HEAD,GET
     - `Show <./cards.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_/<*card*>
     - PUT
     - `Update <./cards.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_
     - POST
     - `Create <./cards.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_/<*card*>
     - HEAD,GET
     - `Show <./cards.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_
     - POST
     - `Create <./cards.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_
     - HEAD,GET
     - `Index <./cards.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_/<*card*>
     - PUT
     - `Update <./cards.rst#update>`_

====
Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_/<*card*>
:methods: HEAD,GET

Click `here <./cards.rst#card-view>`_ for the ``card`` schema.


======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_/<*card*>
:methods: PUT

You may invalidate a card by passing ``is_valid`` with a False
value. Once a card has been invalidated it cannot be re-activated, you
must create a new card.

.. _card-update-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``is_valid``
     - boolean
     - Indicates whether the card is active (``true``) or has been deactivated
       (``false``). Setting this to false will deactivate the card.

   * - ``account_uri``
     - string
     - URI.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``account``
     - map
     - .. list-table::
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



======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_
:methods: POST

.. _account-card-create-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``uri``
     - string
     - Tokenized card URI.

       **or**
   * - ``card_uri``
     - string
     - Tokenized card URI.

       **or**
   * - ``phone_number``
     - string
     - E.164 formatted phone number.

       Length must be **<=** ``15``.

       This field is **optional**, it defaults to ``null``.

   * - ``security_code``
     - string
     - The 3-4 digit security code for the card.

       This field is **optional**, it defaults to ``null``.

   * - ``name``
     - string
     - Sequence of characters.

       Length must be **<=** ``128``.

       This field is **optional**, it defaults to ``null``.

   * - ``expiration_year``
     - integer
     - Expiration year.

       The current year or later. Value must be **<=** ``9999``.

   * - ``card_number``
     - string
     - The digits of the credit card number.

   * - ``expiration_month``
     - integer
     - Expiration month (e.g. 1 for January).

       If ``expiration_year`` is the current year then current month or later,
       otherwise 1. Value must be **<=** ``12``.

   * - ``is_valid``
     - boolean
     - Indicates whether the card is active (``true``) or has been deactivated
       (``false``).

       This field is **optional**, it defaults to ``true``.

   * - ``city``
     - string
     - City.

       This field is **optional**, it defaults to ``null``.

   * - ``region``
     - string
     - Region (e.g. state, province, etc). This field has been
       **deprecated**.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``state``
     - string
     - US state. This field has been **deprecated**.

       This field is **optional**, it defaults to ``null``.

   * - ``postal_code``
     - string
     - Postal code. This is known as a zip code in the USA.

   * - ``street_address``
     - string
     - Street address.

   * - ``country_code``
     - string
     - ISO-3166-3 three character country code.

       This field is **optional**, it defaults to ``USA``.

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

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_/<*card*>
:methods: HEAD,GET

Click `here <./cards.rst#card-view>`_ for the ``card`` schema.


======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_
:methods: POST

A card represents a source of funds. It must be associated with an
account via a PUT on the account before you can begin transferring
with it.


.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``card_number``
     - string
     - The digits of the credit card number.

   * - ``security_code``
     - string
     - The 3-4 digit security code for the card.

       This field is **optional**, it defaults to ``null``.

   * - ``name``
     - string
     - Sequence of characters.

       Length must be **<=** ``128``.

       This field is **optional**, it defaults to ``null``.

   * - ``phone_number``
     - string
     - E.164 formatted phone number.

       Length must be **<=** ``15``.

       This field is **optional**, it defaults to ``null``.

   * - ``expiration_year``
     - integer
     - Expiration year.

       The current year or later. Value must be **<=** ``9999``.

   * - ``expiration_month``
     - integer
     - Expiration month (e.g. 1 for January).

       If ``expiration_year`` is the current year then current month or later,
       otherwise 1. Value must be **<=** ``12``.

   * - ``city``
     - string
     - City.

       This field is **optional**, it defaults to ``null``.

   * - ``region``
     - string
     - Region (e.g. state, province, etc). This field has been
       **deprecated**.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``state``
     - string
     - US state. This field has been **deprecated**.

       This field is **optional**, it defaults to ``null``.

   * - ``postal_code``
     - string
     - Postal code. This is known as a zip code in the USA.

   * - ``street_address``
     - string
     - Street address.

   * - ``country_code``
     - string
     - ISO-3166-3 three character country code.

       This field is **optional**, it defaults to ``USA``.

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

   * - ``is_valid``
     - boolean
     - Indicates whether the card is active (``true``) or has been deactivated
       (``false``).

       This field is **optional**, it defaults to ``true``.

Errors
------

.. list-table::
   :widths: 10 20 20 80 
   :header-rows: 1

   * - Status Code
     - Category Type
     - Category Code
     - Description
   * - **409**
     - logical
     - card-not-valid
     - This card has already been marked as invalid/deactivated. It cannot be used
       again.
   * - **409**
     - logical
     - card-not-validated
     - The card could not be validated -- either the card number or security code
       may be wrong.
   * - **409**
     - logical
     - card-not-associated
     - The card is not associated with the given account.
   * - **409**
     - logical
     - card-already-funding-src
     - The card is already associated with an account -- it cannot be associated
       again.
   * - **409**
     - logical
     - cannot-associate-card
     - The card was tokenized on a different marketplace than the one used for
       this request.
   * - **402**
     - banking
     - card-declined
     - This card was declined by the processor.


=====
Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_
:methods: HEAD,GET

.. _card-index:


.. _cards-view:


======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_/<*card*>
:methods: PUT

.. _card-update-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``is_valid``
     - boolean
     - Indicates whether the card is active (``true``) or has been deactivated
       (``false``). Setting this to false will deactivate the card.

   * - ``account_uri``
     - string
     - URI.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``account``
     - map
     - .. list-table::
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




