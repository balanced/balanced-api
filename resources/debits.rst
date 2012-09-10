======
DEBITS
======

A debit represents a transfer of funds from a buyer's account to your
marketplace.

A debit may have a hold associated with it if it was created using an
authorizable funding source such as a credit card. Once a debit is
created, you may refund the debit or any fractional amount up to the
entire amount of the original debit. Fees associated with the debit are
refunded proportionally to the amount refunded.

.. _debit-view:

``id``
    *string*.

    The resource identifier.

``uri``
    *string*.

    The URI of the debit.

``amount``
    *integer*.

    The amount of the debit.

``description``
    *string*.

    Free-text description of the debit.

``hold``
    *object*.

    The original hold for this debit, if this debit was to a card.
    If the debit was to a bank account, this field will be null.
    See `hold view
    <./holds.rst#hold-view>`_.

``refunds_uri``
    *string*.

    URI for any partial or complete refunds of this debit.

``appears_on_statement_as``
    *string*.

    The text that will appear on the buyer's statement.

``account``
    *object*.

    The account to which this debit is associated.
    See `account view
    <./accounts.rst#account-view>`_.

``created_at``
    *string*.

    When this debit was created.

``fee``
    *integer*.

    The fee Balanced charged for this debit.

``meta``
    *object*.

    A single-level dictionary of string-type key/value pairs.

``available_at``
    *string*.

    The date on which the transaction is guaranteed to be completed.

``transaction_number``
    *string*.

    An identifier for this transaction.

``source``
    *object*.

    The funding source (card or bank account) for this debit.
        See `card view
        <./cards.rst#card-view>`_.
            **or**
        See `bank account view
        <./bank_accounts.rst#bank-account-view>`_.



Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_/<*debit*>
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_/<*debit*>
:methods: ``HEAD``, ``GET``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>
:methods: ``HEAD``, ``GET``

Click `here <./debits.rst#debit-view>`_ for the ``debit`` schema.


Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_
:methods: ``POST``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_
:methods: ``POST``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_
:methods: ``POST``

.. _debit-create-form:

``amount``
    *integer*. If the resolving URI references a hold then this is hold amount. You can
    always capture less than the hold amount (e.g. a partial capture).
    Otherwise its the maximum per debit amount for your marketplace.

    Value must be >= the minimum per debit ``amount`` for *your*
    marketplace. Value must be <= the maximum per debit ``amount`` for *your*
    marketplace.

    If the resolving URI references a hold then the default ``amount``
    is the ``amount`` associated with that hold. Otherwise no default
    is provided and this field is **required**.


``appears_on_statement_as``
    *string*. Text that will appear on the buyer's statement. The characters what can be
    used in this text are limited to:

    - ASCII letters (a-z and A-Z)
    - Digits (0-9)
    - Special characters (.<>(){}[]+&!$*;-%_?:#@~='" ^\`|)

    Any other characters will be rejected.

    Length must be **<=** ``22``.

    Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values.

    Defaults to ``{   }``.


``description``
    *string*. Sequence of characters.

    Defaults to ``null``.


``account_uri``
    *string*. URI.

    If the resolved URI references an ``account`` then it is used as
    the default. If a ``hold`` or ``hold_uri`` field is present then the
    ``account`` associated with that hold is the default. Otherwise no
    default is provided and this field is **required**.


``merchant_uri``
    *string*. URI.

    URI referencing the merchant account on behalf of whom the
    debit is being done. This is different from marketplace.
    In a peer-to-peer transaction, there are three parties::
        1. Marketplace
        2. Seller/Service provider
        3. Buyer

    This merchant account represents 2.

    Defaults to ``null``.


``hold_uri``
    *string*. URI.

    .. note:
       If no ``hold`` is provided one my be generated and captured if the
       source is a card.

    If the resolved URI references a ``hold`` it will be used. Otherwise
    defaults to ``null``.


Exactly one of

    ``source_uri``
        *string*. URI.

        Defaults to ``null``.


    ``bank_account_uri``
        *string*. URI.

        Defaults to ``null``.


    ``card_uri``
        *string*. URI.

        Defaults to ``null``.


.. _debit-create-errors:

Errors
------

`authorization-failed <'../errors.rst'#authorization-failed>`_
    :status code: 402
    :category type: banking

`authorization-expired <'../errors.rst'#authorization-expired>`_
    :status code: 409
    :category type: logical

`cannot-capture-authorization <'../errors.rst'#cannot-capture-authorization>`_
    :status code: 409
    :category type: logical

`hold-not-associated <'../errors.rst'#hold-not-associated>`_
    :status code: 409
    :category type: logical

`hold-not-associated <'../errors.rst'#hold-not-associated>`_
    :status code: 409
    :category type: logical

`invalid-account-info <'../errors.rst'#invalid-account-info>`_
    :status code: 409
    :category type: logical



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`debits <./debits.rst>`_/<*debit*>
:methods: ``PUT``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`holds <./holds.rst>`_/<*hold*>/`debits <./debits.rst>`_/<*debit*>
:methods: ``PUT``
:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`debits <./debits.rst>`_/<*debit*>
:methods: ``PUT``

.. _debit-update-form:

``meta``
    *object*. Single level mapping from string keys to string values.

    Defaults to ``{   }``.


``description``
    *string*. Sequence of characters.

    Defaults to ``null``.


.. _debit-update-errors:

Errors
------

`hold-not-associated <'../errors.rst'#hold-not-associated>`_
    :status code: 409
    :category type: logical

`hold-not-associated <'../errors.rst'#hold-not-associated>`_
    :status code: 409
    :category type: logical




