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

    ``id``
        *string*. The resource identifier

    ``uri``
        *string*. A URI for a Balanced entity

    ``amount``
        *integer*. Amount of the credit

    ``created_at``
        *string*. Time of creation

    ``description``
        *string*. A description of the credit, used for display purposes

    ``account``
        *object*. The account to which the credit is associated
        See `account view
        <./accounts.rst#account-view>`_.

    ``meta``
        *object*. A single-level dictionary of string-type key/value pairs

    ``transaction_number``
        *string*. 
    ``available_at``
        *string*. The date on which the credit will be available to the merchant

    ``fee``
        *integer*. The fee charged by Balanced for this credit

    ``destination``
        *object*. The funding destination for this credit (i.e., a bank account)
        See `bank account view
        <./bank_accounts.rst#bank-account-view>`_.



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_/<*credit*>
:methods: ``PUT``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_/<*credit*>
:methods: ``PUT``

Request
-------

.. _credit-update-form:

    ``description``
        *string*. Sequence of characters.
        Defaults to ``null``.

    ``meta``
        *object*. Single level mapping from string keys to string values.
        Defaults to ``null``.

Response
--------


Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_
:methods: ``POST``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_
:methods: ``POST``

Request
-------

.. _credit-create-form:

    ``amount``
        *integer*. ``amount`` must be >= the minimum credit amount allowed for your
        marketplace. ``amount`` must be <= the maximum credit amount allowed for your
        marketplace.

    ``description``
        *string*. Sequence of characters.
        Defaults to ``null``.

    ``meta``
        *object*. Single level mapping from string keys to string values.
        Defaults to ``{   }``.

    ``appears_on_statement_as``
        *string*. Length must be **<=** ``22``.
        Defaults to ``null``.

    ``account_uri``
        *string*. URI.
        If the resolving URI contain an account then that is used as the
        default otherwise no default is provided and this field is
        **required**.

    Exactly one of

        ``destination_uri``
            *string*. URI.
            Defaults to ``null``.

        ``bank_account_uri``
            *string*. URI.
            Defaults to ``null``.

Response
--------

`no-funding-destination <../errors.rst#no-funding-destination>`_
    :status code: 409
    :category type: logical

`illegal-credit <../errors.rst#illegal-credit>`_
    :status code: 409
    :category type: logical

`insufficient-funds <../errors.rst#insufficient-funds>`_
    :status code: 409
    :category type: logical



Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_/<*credit*>
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_/<*credit*>
:methods: ``HEAD``, ``GET``

Click `here <./credits.rst#credit-view>`_ for the ``credit`` schema.


Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_
:methods: ``HEAD``, ``GET``

.. _credit-index:


.. _credits-view:



