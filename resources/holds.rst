=====
HOLDS
=====

A hold represents a reservation of money from a buyer's account to your
marketplace.

A hold is guaranteed capture-able until it has expired, which is represented
by the ``expires_at`` field. To capture the funds and transfer them to your
marketplace you must create a debit from the hold.

When you capture a hold, you may capture any fraction of the original
amount up to the full amount. Once a hold has been captured it is
marked as expired and you cannot capture any remaining value.

.. _hold-view:

``id``
    *string*.

    The resource identifier.

``created_at``
    *string*.

    Time of creation.

``amount``
    *integer*.

    Amount of the hold.

``fee``
    *integer*.

    Fee charged by Balanced for this hold.

``expires_at``
    *string*.

    Date at which this hold expires and can no longer be captured.

``description``
    *string*.

    A description of the hold, used for display purposes.

``meta``
    *object*.

    A single-level dictionary of string-type key/value pairs.

``debit``
    *object*.

    The captured debit associated with this hold.
    See `debit view
    <./debits.rst#debit-view>`_.

``transaction_number``
    *string*.

    An identifier for this transaction.

``account``
    *object*.

    The account against which this hold was created.
    See `account view
    <./accounts.rst#account-view>`_.

``uri``
    *string*.

    A URI for a Balanced entity

``is_void``
    *boolean*.

    A boolean flag indicating if the hold has been voided or not.

``source``
    *object*.

    The funding source for this hold.
    See `card view
    <./cards.rst#card-view>`_.



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_/<*hold*>
:methods: ``PUT``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>
:methods: ``PUT``

.. _hold-update-form:

``description``
    *string*. Sequence of characters. Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to {}


``is_void``
    *boolean*. Flag value, should be ``true`` or ``false``.


``appears_on_statement_as``
    *string*. Text that will appear on the buyer's statement. Characters that can be
    used are limited to:

    - ASCII letters (``a-z`` and ``A-Z``)
    - Digits (``0-9``)
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

    Any other characters will be rejected. Length must be **<=** ``22``. Defaults to ``null``.


.. _hold-update-errors:

Errors
------

`hold-not-associated-marketplace <'../errors.rst'#hold-not-associated-marketplace>`_
    :status code: 409
    :category type: logical

`hold-not-associated-account <'../errors.rst'#hold-not-associated-account>`_
    :status code: 409
    :category type: logical



Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_
:methods: ``POST``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_
:methods: ``POST``

.. _hold-create-form:

``amount``
    *integer*. 
``account_uri``
    *string*. URI. If the resolving URI references an ``account`` then that is used as the
    default. Otherwise no default is provided and this field is
    **required**.


``appears_on_statement_as``
    *string*. Text that will appear on the buyer's statement. Characters that can be
    used are limited to:

    - ASCII letters (``a-z`` and ``A-Z``)
    - Digits (``0-9``)
    - Special characters (``.<>(){}[]+&!$*;-%_?:#@~='" ^\`|``)

    Any other characters will be rejected. Length must be **<=** ``22``. Defaults to ``null``.


``description``
    *string*. Sequence of characters. Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to {}


Exactly one of

    ``source_uri``
        *string*. URI. If the resolving URI references an ``account`` then account's primary
        funding source  is used. Otherwise no default is provided and this
        field is required.


    ``card_uri``
        *string*. URI. If the resolving URI references an ``account`` then account's primary
        funding source  is used. Otherwise no default is provided and this
        field is required.


.. _hold-create-errors:

Errors
------

`authorization-failed <'../errors.rst'#authorization-failed>`_
    :status code: 402
    :category type: banking

`no-funding-source <'../errors.rst'#no-funding-source>`_
    :status code: 409
    :category type: logical



Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_
:methods: ``HEAD``, ``GET``



Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`holds <./holds.rst>`_/<*hold*>
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>
:methods: ``HEAD``, ``GET``

Click `here <./holds.rst#hold-view>`_ for the ``hold`` schema.



