============
MARKETPLACES
============

A marketplace is where buyers and merchants transact with each other.

Debits from buyers are credited to the marketplace's escrow account, and
credits to merchants are credited from this same account.

.. _marketplace-view:

``id``
    *string*. The resource identifier. 

``uri``
    *string*. The URI of this marketplace 

``name``
    *string*. Name of this marketplace.

``support_email_address``
    *string*. Email address on file for support for this marketplace.

``support_phone_number``
    *string*. Phone number on file for support for this marketplace.

``domain_url``
    *string*. 
``meta``
    *object*. A single-level dictionary of string-type key/value pairs.

``in_escrow``
    *integer*. Amount (in cents) in the escrow account for this marketplace.

``owner_account``
    *object*. The account owning this marketplace. See `account view
    <./accounts.rst#account-view>`_.

``debits_uri``
    *string*. URI for all debits for this marketplace.

``credits_uri``
    *string*. URI for all credits for this marketplace.

``refunds_uri``
    *string*. URI for all refunds for this marketplace.

``holds_uri``
    *string*. URI for all holds for this marketplace.

``accounts_uri``
    *string*. URI for all accounts on this marketplace.

``transactions_uri``
    *string*. URI for all transactions for this marketplace.

``bank_accounts_uri``
    *string*. A URI for a Balanced entity

``cards_uri``
    *string*. A URI for a Balanced entity



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>
:methods: ``PUT``

.. _marketplace-update-form:

``name``
    *string*. Sequence of characters. Length must be **<=** ``128``. Defaults to ``null``.


``support_email_address``
    *string*. RFC-2822 formatted email address. Defaults to ``null``.


``support_phone_number``
    *string*. E.164 formatted phone number. Length must be **<=** ``15``. Defaults to ``null``.


``domain_url``
    *string*. Defaults to ``null``.


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to ``{}``




Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>
:methods: ``HEAD``, ``GET``

Click `here <./marketplaces.rst#marketplace-view>`_
for the ``marketplace`` schema.


Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_
:methods: ``POST``

.. _marketplace-create-form:

``support_email_address``
    *string*. RFC-2822 formatted email address. Defaults to ``support@example.com``


``name``
    *string*. Sequence of characters. Length must be **<=** ``128``. Defaults to ``Test Marketplace``


``domain_url``
    *string*. Defaults to ``example.com``


``support_phone_number``
    *string*. E.164 formatted phone number. Length must be **<=** ``15``. Defaults to ``+16505551234``


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to ``{}``


``owner_account``
    *object*. 

    ``name``
        *string*. Sequence of characters. Length must be **<=** ``128``. Defaults to ``null``.


    ``email_address``
        *string*. RFC-2822 formatted email address. Defaults to ``null``.


    Defaults to: 

    .. code:: javascript

        {
            "email_address": null, 
            "name": null
        }



.. _marketplace-create-errors:

Errors
------

`marketplace-already-created <'../errors.rst'#marketplace-already-created>`_
    :status code: 409
    :category type: logical

`incomplete-account-info <'../errors.rst'#incomplete-account-info>`_
    :status code: 400
    :category type: request

`cannot-associate-merchant-with-account <'../errors.rst'#cannot-associate-merchant-with-account>`_
    :status code: 409
    :category type: logical

`duplicate-email-address <'../errors.rst'#duplicate-email-address>`_
    :status code: 409
    :category type: logical




