========
Accounts
========

Accounts have roles, the ``buyer`` role is assigned to an account that may have
debits created against it, the ``merchant`` role is assigned to accounts that
may have credits created against it. For an account to have the ``merchant``
role assigned you must pass identifying information, to create a ``buyer`` role
you simply provide a funding source that may be debited.

.. _account-view:

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``holds_uri``
     - string
     - URI for all holds associated with the account

   * - ``name``
     - string
     - The name of the account

   * - ``roles``
     - list
     - A list of roles the account has. Can be zero, one, or both of:

           - ``buyer``
           - ``merchant``

   * - ``created_at``
     - datetime
     - When the account was created

   * - ``uri``
     - string
     - The URI of the account

   * - ``bank_accounts_uri``
     - string
     - URI for all bank accounts associated with the account

   * - ``refunds_uri``
     - string
     - URI for all refunds associated with the account

   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``debits_uri``
     - string
     - URI for all debits associated with the account

   * - ``transactions_uri``
     - string
     - URI for all transactions associated with the account

   * - ``email_address``
     - string
     - The email address of the account

   * - ``id``
     - string
     -
   * - ``credits_uri``
     - string
     - URI for all credits associated with the account

   * - ``cards_uri``
     - string
     - URI for all cards associated with the account


.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>
     - HEAD,GET
     - `Show <./accounts.rst#show>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_
     - POST
     - `Create <./accounts.rst#create>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_
     - HEAD,GET
     - `Index <./accounts.rst#index>`_
   * - /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>
     - PUT
     - `Update <./accounts.rst#update>`_

====
Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>
:methods: HEAD,GET

Click `here <./accounts.rst#account-view>`_ for the ``account`` schema.


======
Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_
:methods: POST

Creating a buyer
----------------

To become a buyer, you must pass a tokenized card via the ``card_uri`` param or
the full credit card via the ``card`` param.

.. _buyer-account-create-form:

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``name``
     - string
     - The display ``name`` of the account.

       Length must be **<=** ``128``.

       If a ``card`` is provided with a ``name`` then that is used as the
       default. Otherwise no default is provided and this field is
       **required**.

   * - ``type``
     - string
     - Sequence of characters.

   * - ``email_address``
     - string
     - Email address of the account. It must be **unique** among all accounts
       on your marketplace.

   * - ``card_uri``
     - string
     - The URI of the tokenized card.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``card``
     - map
     - If you are not tokenizing the card you may pass the data straight
       through as a map.

       See `card create form <./cards.rst#card-create-form>`_.


       This field is **optional**, it defaults to ``null``.

Creating a merchant
-------------------

To create a merchant, you must pass a tokenized merchant identity via the
``merchant_uri`` param or full merchant information via the ``merchant`` param.
A merchant can be represented as a business or a person depending on the entity
being represented by the account.

*Note* If Balanced cannot identify the merchant being created the API will
respond with a **300** status code. A 300 represents multiple choices, you may
re-submit the original request along with more identifying information (e.g.
``tax_id``) **or** you may redirect the user to the location specified in the
redirect where Balanced will identify the user. See
`requests for more information`__

__ #requests-for-more-information

Payload to create a person

.. _person-merchant-account-create-form:


.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``merchant_uri``
     - string
     - The URI of the merchant account created during a request for more
       information.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``merchant``
     - map
     - Merchant account information.

       See `merchant create form <./accounts.rst#merchant-account-create-form>`_.


       This field is **optional**, it defaults to ``null``.

   * - ``name``
     - string
     - The display ``name`` of the account.

       Length must be **<=** ``128``.

       If a ``card`` is provided with a ``name`` then that is used as the
       default. Otherwise no default is provided and this field is
       **required**.

   * - ``bank_account_uri``
     - string
     - The URI of the bank account created via *balanced.js*.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``bank_account``
     - map
     - Bank account information:

       See `bank account create form
       <./bank_accounts.rst#bank-account-create-form>`_.

       This field is **optional**, it defaults to ``null``.

   * - ``email_address``
     - string
     - Email address of the account. It must be **unique** among all accounts
       on your marketplace.

Creating a business
-------------------

When creating a business merchant, you must also specify the principal
representing the business, this payload is the same as for creating a person
based merchant but also includes the registered business information.


.. _business-merchant-account-create-form:

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``merchant_uri``
     - string
     - The URI of the merchant account created during a request for more
       information.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``merchant``
     - map
     - Merchant account information.

       See `merchant create form <./accounts.rst#merchant-account-create-form>`_.


       This field is **optional**, it defaults to ``null``.

   * - ``name``
     - string
     - The display ``name`` of the account.

       Length must be **<=** ``128``.

       If a ``card`` is provided with a ``name`` then that is used as the
       default. Otherwise no default is provided and this field is
       **required**.

   * - ``bank_account_uri``
     - string
     - The URI of the bank account created via *balanced.js*.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``bank_account``
     - map
     - Bank account information:

       See `bank account create form
       <./bank_accounts.rst#bank-account-create-form>`_.

       This field is **optional**, it defaults to ``null``.

   * - ``email_address``
     - string
     - Email address of the account. It must be **unique** among all accounts
       on your marketplace.

.. _merchant-account-create-form:

Merchant Create Form
--------------------

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``phone_number``
     - string
     - E.164 formatted phone number.

       Length must be **<=** ``15``.

   * - ``name``
     - string
     - Sequence of characters.

       Length must be **<=** ``128``.

       If an account is referenced in the resolving URI then the default is
       null. If this is nested in an account creation then the account
       ``name`` is used. Otherwise no default is provided and this field is
       required.

   * - ``dob``
     - string
     - Date-of-birth formatted as YYYY-MM-DD.

       null

   * - ``type``
     - string
     - Merchant type. It should be one of:

           - ``person``
           - ``business``

   * - ``tax_id``
     - string
     - Length must be **=** ``9``.

       If `type` is person then null otherwise no default is provided
       and this field is required.

   * - ``production``
     - boolean
     - Flag value, should be ``true`` or ``false``.

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

   * - ``email_address``
     - string
     - RFC-2822 formatted email address.

       This field is **optional**, it defaults to ``null``.

   * - ``person``
     - map
     - See `person create form <./accounts.rst#person-create-form>`_.


Person Create Form
------------------

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``dob``
     - string
     - Date-of-birth formatted as YYYY-MM-DD.

   * - ``tax_id``
     - string
     - Length must be **=** ``9``.

       This field is **optional**, it defaults to ``null``.

   * - ``name``
     - string
     - Sequence of characters.

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

.. _account-create-errors:

Errors
------

.. list-table::
   :widths: 10 20 20 80
   :header-rows: 1

   * - Status Code
     - Category Type
     - Category Code
     - Description
   * - **400**
     - request
     - incomplete-account-info
     - TODO
   * - **409**
     - logical
     - cannot-associate-merchant-with-account
     - TODO
   * - **409**
     - logical
     - duplicate-email-address
     - TODO
   * - **400**
     - request
     - invalid-account-info
     - TODO


=====
Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_
:methods: HEAD,GET

Returns a paginated representation of account resources.

.. _accounts-index-query:


.. _accounts-index-view:


======
Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>
:methods: PUT

Allows partial updates to accounts within your marketplace.

.. _account-update-form:

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``dependent``
     - *depenent*
     - #. If `account` is a merchant.

          .. list-table::
             :widths: 20 80
             :header-rows: 1

             * - Type
               - Description
             * - string
               - URI.

                 This field is **optional**, it defaults to ``null``.

                 **or**
             * - map
               - See `merchant create form
                 <./accounts.rst#merchant-account-create-form>`_.

                 This field is **optional**, it defaults to ``null``.

       #. If `account` is not a merchant.

          .. list-table::
             :widths: 20 80
             :header-rows: 1

             * - Type
               - Description
             * - string
               - URI.

                 This field is **optional**, it defaults to ``null``.

                 **or**
             * - map
               - See `merchant update form
                 <./accounts.rst#merchant-update-form>`_.


                 This field is **optional**, it defaults to ``null``.

   * - ``name``
     - string
     - The display ``name`` of the account.

       Length must be **<=** ``128``.

       This field is **optional**, it defaults to ``null``.

   * - ``bank_account_uri``
     - string
     - Tokenized bank account URI.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``bank_account``
     - map
     - Bank account information:

       See `bank account create form
       <./bank_accounts.rst#bank-account-create-form>`_.

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

   * - ``email_address``
     - string
     - RFC-2822 formatted email address.

       This field is **optional**, it defaults to ``null``.

   * - ``card_uri``
     - string
     - Tokenized card URI.

       This field is **optional**, it defaults to ``null``.

       **or**
   * - ``card``
     - map
     - Card information mapping:

       See `card create form
       <./cards.rst#card-create-form>`_.

       This field is **optional**, it defaults to ``null``.

.. _merchant-update-form:

Merchant Update Form
--------------------

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``phone_number``
     - string
     - E.164 formatted phone number.

       Length must be **<=** ``15``.

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

   * - ``email_address``
     - string
     - RFC-2822 formatted email address.

       This field is **optional**, it defaults to ``null``.

   * - ``name``
     - string
     - Sequence of characters.

       Length must be **<=** ``128``.

       This field is **optional**, it defaults to ``null``.

   * - ``bank_account``
     - map
     - See `bank account create form
       <./bank_accounts.rst#bank-account-create-form>`_.

       This field is **optional**, it defaults to ``null``.
