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



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>/`refunds <./refunds.rst>`_/<*refund*>
:methods: ``PUT``

