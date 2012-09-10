=======
REFUNDS
=======

A refund represents a reversal of funds associated with a debit. A
debit can have many refunds associated with it up to the total amount
of the original debit. Funds are returned to your Marketplace's
escrow account.

Any fees associated with the original debit are refunded proportionally
to the amount refunded.

.. _refund-view:

``id``
    *string*.

    The resource identifier.

``uri``
    *string*.

    A URI for a Balanced entity

``created_at``
    *string*.

    When the refund was created.

``amount``
    *integer*.

    The amount of the refund.

``fee``
    *integer*.

    The fee charged by Balanced for this refund.

``description``
    *string*.

    Free-text description of the refund.

``account``
    *object*.

    Account receiving the refund.
    See `account view
    <./accounts.rst#account-view>`_.

``appears_on_statement_as``
    *string*.

    Text that will appear on the statement describing this refund.

``transaction_number``
    *string*.

    An identifier for this transaction.

``debit``
    *object*.

    The original debit associated with the refund.
    See `debit view
    <./debits.rst#debit-view>`_.

``meta``
    *object*.

    A single-level dictionary of string-type key/value pairs.



Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_
:methods: ``POST``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_
:methods: ``POST``

.. _refund-create-form:

``amount``
    *integer*. Value must be **>=** ``1``. Value must be <= the remaining un-refunded amount on the original
    ``debit``.


``description``
    *string*. Sequence of characters.

    Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values.

    Defaults to ``{   }``.


``debit_uri``
    *string*. URI.

    If the resolving URI references a ``debit`` then that is used as the
    default. Otherwise no default is provided and this field is
    **required**.


.. _refund-create-errors:

Errors
------

`invalid-amount <'../errors.rst'#invalid-amount>`_
    :status code: 400
    :category type: request

`insufficient-funds <'../errors.rst'#insufficient-funds>`_
    :status code: 409
    :category type: logical



Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``HEAD``, ``GET``

Click `here <./refunds.rst#refund-view>`_ for the ``refund`` schema.


Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_
:methods: ``POST``

.. _debit-refund-create-errors:

Errors
------

`invalid-amount <'../errors.rst'#invalid-amount>`_
    :status code: 400
    :category type: request

`insufficient-funds <'../errors.rst'#insufficient-funds>`_
    :status code: 409
    :category type: logical



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``PUT``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``PUT``

.. _refund-update-form:

``description``
    *string*. Sequence of characters.

    Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values.

    Defaults to ``null``.




Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``HEAD``, ``GET``

Click `here <./refunds.rst#refund-view>`_ for the ``refund`` schema.


Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_
:methods: ``HEAD``, ``GET``

.. _refund-index-query:


.. _refunds-view:


Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``PUT``

.. _debit-refund-update-form:

``description``
    *string*. Sequence of characters.

    Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values.

    Defaults to ``null``.





