=============
Bank_accounts
=============

A bank account represents both a source, and a destination of funds. It
must be associated with an account via a PUT on the account before you
can begin transferring with it.

.. _bank-account-view:
    ``id``
        *string*. The resource identifier

    ``uri``
        *string*. The URI of the bank account object

    ``name``
        *string*. The name on the bank account

    ``last_four``
        *string*. The last four digits of the bank account number

    ``bank_code``
        *string*. The bank code (routing number in the USA) of the bank account

    ``bank_name``
        *string*. The name of the bank

    ``created_at``
        *string*. Time of creation

    ``account``
        *object*. The account to which this bank account is associated
        See `account view
        <./accounts.rst#account-view>`_.

    ``is_valid``
        *boolean*. Boolean flag indicating whether the bank account is currently valid

    ``meta``
        *object*. A single-level dictionary of string-type key/value pairs



Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_
:methods: ``HEAD``, ``GET``



Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_
:methods: ``POST``

.. _account-bank-account-create-form:

Request
-------

    Exactly one of

        ``uri``
            *string*. Tokenized bank account URI.

        ``bank_account_uri``
            *string*. Tokenized bank account URI.

        ``meta``
            *object*. Single level mapping from string keys to string values.
            Defaults to ``{   }``.

        ``bank_code``
            **dependent**. #. For production bank accounts.
                       *string*. Bank account code. This is commonly referred to as the routing number in
                       the ``USA``.
                       Length must be **=** ``9``.

            #. For non-production bank accounts.
                       *string*. Sequence of characters.
                       Length must be **>=** ``1``.


        ``account_type``
            *string*. Bank account type. It should be one of:
                - ``checking``
                - ``savings``
            Defaults to ``CHECKING``.

        ``name``
            *string*. Name on the bank account.
            Length must be **>=** ``2``.

        ``account_number``
            *string*. Bank account number.
            Length must be **>=** ``1``.

Response
--------

`bank-account-not-valid <../errors.rst#bank-account-not-valid>`_
    :status code: 409
    :category type: logical

`bank-account-already-associated <../errors.rst#bank-account-already-associated>`_
    :status code: 409
    :category type: logical

`cannot-associate-bank-account <../errors.rst#cannot-associate-bank-account>`_
    :status code: 409
    :category type: logical

`invalid-routing-number <../errors.rst#invalid-routing-number>`_
    :status code: 400
    :category type: request

`bank-account-already-invalidated <../errors.rst#bank-account-already-invalidated>`_
    :status code: 409
    :category type: logical



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
:methods: ``PUT``

You may invalidate a bank account by passing ``is_valid`` with a False
value. Once a bank account has been invalidated it cannot be
re-activated, you must create a new bank account.

.. _bank-account-update-form:

Request
-------

    ``is_valid``
        *boolean*. Flag indicating whether the bank account is active (``true``) or not
        (``false``). Setting this to ``false`` will deactivate the bank account.

    Exactly one of

        ``account_uri``
            *string*. URI of an account with which to associate the bank account.
            Defaults to ``null``.

        ``account``
            *map*. URI of an account with which to associate the bank account.
                ``uri``
                    *string*. URI.
                    Defaults to ``null``.


    ``meta``
        *object*. Single level mapping from string keys to string values.
        Defaults to ``null``.

Response
--------

`invalid-routing-number <../errors.rst#invalid-routing-number>`_
    :status code: 400
    :category type: request

`bank-account-already-valid <../errors.rst#bank-account-already-valid>`_
    :status code: 409
    :category type: logical

`bank-account-already-associated <../errors.rst#bank-account-already-associated>`_
    :status code: 409
    :category type: logical

`cannot-associate-bank-account <../errors.rst#cannot-associate-bank-account>`_
    :status code: 409
    :category type: logical

`bank-account-already-invalidated <../errors.rst#bank-account-already-invalidated>`_
    :status code: 409
    :category type: logical



Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
:methods: ``HEAD``, ``GET``

Click `here <./bank_accounts.rst#bank-account-view>`_ for the ``bank_account``
schema.


Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
:methods: ``HEAD``, ``GET``

Click `here <./bank_accounts.rst#bank-account-view>`_ for the
``bank_account`` schema.


Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_
:methods: ``HEAD``, ``GET``

.. _bank-accounts-view:


Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`bank_accounts <./bank_accounts.rst>`_/<*bank_account*>
:methods: ``PUT``

.. _bank-account-update-form:

Request
-------

    ``is_valid``
        *boolean*. Flag indicating whether the bank account is active (``true``) or not
        (``false``). Setting this to ``false`` will deactivate the bank account.

    Exactly one of

        ``account_uri``
            *string*. URI of an account with which to associate the bank account.
            Defaults to ``null``.

        ``account``
            *map*. URI of an account with which to associate the bank account.
                ``uri``
                    *string*. URI.
                    Defaults to ``null``.


    ``meta``
        *object*. Single level mapping from string keys to string values.
        Defaults to ``null``.

Response
--------

`bank-account-already-valid <../errors.rst#bank-account-already-valid>`_
    :status code: 409
    :category type: logical

`bank-account-already-invalidated <../errors.rst#bank-account-already-invalidated>`_
    :status code: 409
    :category type: logical



Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`bank_accounts <./bank_accounts.rst>`_
:methods: ``POST``

.. _bank-account-create-form:

    ``name``
        *string*. Name on the bank account.
        Length must be **>=** ``2``.

    ``account_number``
        *string*. Bank account number.
        Length must be **>=** ``1``.

    ``bank_code``
        **dependent**. #. For production bank accounts.
                   *string*. Bank account code. This is commonly referred to as the routing number in
                   the ``USA``.
                   Length must be **=** ``9``.

        #. For non-production bank accounts.
                   *string*. Sequence of characters.
                   Length must be **>=** ``1``.


    ``account_type``
        *string*. Bank account type. It should be one of:
            - ``checking``
            - ``savings``
        Defaults to ``CHECKING``.

    ``meta``
        *object*. Single level mapping from string keys to string values.
        Defaults to ``{   }``.

Response
--------

`invalid-routing-number <../errors.rst#invalid-routing-number>`_
    :status code: 400
    :category type: request




