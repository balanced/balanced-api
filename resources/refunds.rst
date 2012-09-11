=======
REFUNDS
=======

A refund represents a reversal of funds associated with a debit. A
debit can have many refunds associated with it up to the total amount
of the original debit. Funds are returned to your Marketplace's
escrow account.

Any fees associated with the original debit are refunded proportionally
to the amount refunded.

refund-view
-----------

.. _refund-view:

``id``
    *string*. The resource identifier.

``uri``
    *string*. A URI for a Balanced entity

``created_at``
    *string*. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
    refund was issued.

``amount``
    *integer*. The amount of the refund.

``fee``
    *integer*. The fee charged by Balanced for this refund.

``description``
    *string*. Free-text description of the refund.

``account``
    *object*. Account receiving the refund.
    See `account view
    <./accounts.rst#account-view>`_.

``appears_on_statement_as``
    *string*. Text that will appear on the statement describing this refund.

``transaction_number``
    *string*. An identifier for this transaction.

``debit``
    *object*. The original debit associated with the refund. See `debit view
    <./debits.rst#debit-view>`_.

``meta``
    *object*. A single-level dictionary of string-type key/value pairs.



Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_
:methods: ``POST``

debit-refund-create-errors
--------------------------

.. _debit-refund-create-errors:

Errors
------

`invalid-amount <'../errors.rst'#invalid-amount>`_
    :status code: 400
    :category type: request

`refund-insufficient-funds <'../errors.rst'#refund-insufficient-funds>`_
    :status code: 409
    :category type: logical



Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_
:methods: ``POST``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_
:methods: ``POST``

refund-create-form
------------------

.. _refund-create-form:

``amount``
    *integer*. 
``description``
    *string*. Sequence of characters. Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to ``{}``


``debit_uri``
    *string*. URI. If the resolving URI references a ``debit`` then that is used as the
    default. Otherwise no default is provided and this field is
    **required**.


refund-create-errors
--------------------

.. _refund-create-errors:

Errors
------

`invalid-amount <'../errors.rst'#invalid-amount>`_
    :status code: 400
    :category type: request

`refund-insufficient-funds <'../errors.rst'#refund-insufficient-funds>`_
    :status code: 409
    :category type: logical



Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``HEAD``, ``GET``

Refer to the `refund schema <./refunds.rst#refund-view>`_.


Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``HEAD``, ``GET``

Refer to the `refund schema <./refunds.rst#refund-view>`_.


Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``PUT``

debit-refund-update-form
------------------------

.. _debit-refund-update-form:

``description``
    *string*. Sequence of characters. Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to ``{}``




Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``PUT``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``PUT``

refund-update-form
------------------

.. _refund-update-form:

``description``
    *string*. Sequence of characters. Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to ``{}``




Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`refunds <./refunds.rst>`_
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`refunds <./refunds.rst>`_
:methods: ``HEAD``, ``GET``

refund-index-query
------------------

.. _refund-index-query:


refunds-view
------------

.. _refunds-view:



