======
Debits
======

A debit represents a transfer of funds from a buyer's account to your
marketplace.

A debit may have a hold associated with it if it was created using an
authorizable funding source such as a credit card. Once a debit is
created, you may refund the debit or any fractional amount up to the
entire amount of the original debit. Fees associated with the debit are
refunded proportionally to the amount refunded.

.. _debit-view:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account``
     - ``account``
     - The account to which this debit is associated

       See `account view
       <./accounts.rst#account-view>`_.


   * - ``fee``
     - integer
     - The fee Balanced charged for this debit

   * - ``description``
     - string
     - Free-text description of the debit

   * - ``source``
     - ``card`` **or** ``bank_account``
     - The funding source (card or bank account) for this debit.

       See `card view
       <./cards.rst#card-view>`_.

           **or**

       See `bank account view
       <./bank_accounts.rst#bank-account-view>`_.


   * - ``created_at``
     - datetime
     - When this debit was created

   * - ``uri``
     - string
     - The URI of the debit

   * - ``transaction_number``
     - string
     - 
   * - ``refunds_uri``
     - string
     - URI for any partial or complete refunds of this debit.

   * - ``amount``
     - integer
     - The amount of the debit

   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``appears_on_statement_as``
     - string
     - The text that will appear on the buyer's statement

   * - ``hold``
     - ``hold``
     - The original hold for this debit, if this debit was to a card.
       If the debit was to a bank account, this field will be null.

       See `hold view
       <./holds.rst#hold-view>`_.


   * - ``id``
     - string
     - 
   * - ``available_at``
     - datetime
     - The date on which the transaction is guaranteed to be completed


.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_/<*debit*>
     - PUT
     - `Update <./debits.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_/<*debit*>
     - PUT
     - `Update <./debits.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>
     - PUT
     - `Update <./debits.rst#update>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_
     - POST
     - `Create <./debits.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_
     - POST
     - `Create <./debits.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_
     - POST
     - `Create <./debits.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_/<*debit*>
     - HEAD,GET
     - `Show <./debits.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_/<*debit*>
     - HEAD,GET
     - `Show <./debits.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>
     - HEAD,GET
     - `Show <./debits.rst#show>`_

======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_/<*debit*>
:methods: PUT
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_/<*debit*>
:methods: PUT
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>
:methods: PUT

.. _debit-update-form:

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

   * - ``description``
     - string
     - Sequence of characters.

       This field is **optional**, it defaults to ``null``.



======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_
:methods: POST
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_
:methods: POST
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_
:methods: POST

.. _debit-create-form:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``account_uri``
     - string
     - URI.

       If the resolved URI references an ``account`` then it is used as
       the default. If a ``hold`` or ``hold_uri`` field is present then the
       ``account`` associated with that hold is the default. Otherwise no
       default is provided and this field is **required**.

   * - ``source_uri``
     - string
     - URI.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``bank_account_uri``
     - string
     - URI.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``card_uri``
     - string
     - URI.

       This field is **optional**, it defaults to ``null``.

   * - ``description``
     - string
     - Sequence of characters.

       This field is **optional**, it defaults to ``null``.

   * - ``merchant_uri``
     - string
     - URI.

       URI referencing the merchant account on behalf of whom the
       debit is being done. This is different from marketplace.
       In a peer-to-peer transaction, there are three parties::
           1. Marketplace
           2. Seller/Service provider
           3. Buyer

       This merchant account represents 2.

       This field is **optional**, it defaults to ``null``.

   * - ``amount``
     - integer
     - If the resolving URI references a hold then this is hold amount. You can
       always capture less than the hold amount (e.g. a partial capture).
       Otherwise its the maximum per debit amount for your marketplace.

       Value must be >= the minimum per debit ``amount`` for *your*
       marketplace. Value must be <= the maximum per debit ``amount`` for *your*
       marketplace.

       If the resolving URI references a hold then the default ``amount``
       is the ``amount`` associated with that hold. Otherwise no default
       is provided and this field is **required**.

   * - ``appears_on_statement_as``
     - string
     - Length must be **<=** ``22``.

       This field is **optional**, it defaults to ``null``.

   * - ``hold_uri``
     - string
     - URI.

       .. note:
          If no ``hold`` is provided one my be generated and captured if the
          source is a card.

       If the resolved URI references a ``hold`` it will be used. Otherwise
       defaults to ``null``.

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

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_/<*debit*>
:methods: HEAD,GET
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_/<*debit*>
:methods: HEAD,GET
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>
:methods: HEAD,GET

Click `here <./debits.rst#debit-view>`_ for the ``debit`` schema.



