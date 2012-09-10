=======
CREDITS
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
    *string*.

    The resource identifier.

``uri``
    *string*.

    A URI for a Balanced entity

``amount``
    *integer*.

    Amount of the credit.

``created_at``
    *string*.

    Time of creation.

``description``
    *string*.

    A description of the credit, used for display purposes.

``account``
    *object*.

    The account to which the credit is associated.
    See `account view
    <./accounts.rst#account-view>`_.

``meta``
    *object*.

    A single-level dictionary of string-type key/value pairs.

``transaction_number``
    *string*.

    An identifier for this transaction.

``available_at``
    *string*.

    The date on which the credit will be available to the merchant.

``fee``
    *integer*.

    The fee charged by Balanced for this credit.

``destination``
    *object*.

    The funding destination for this credit (i.e., a bank account).
    See `bank account view
    <./bank_accounts.rst#bank-account-view>`_.



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`credits <./credits.rst>`_/<*credit*>
:methods: ``PUT``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`credits <./credits.rst>`_/<*credit*>
:methods: ``PUT``

