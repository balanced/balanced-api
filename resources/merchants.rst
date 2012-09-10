=========
Merchants
=========

In order to create a merchant (a provider of goods or services in a
marketplace), you must pass identitfying information when creating an
account. Upon verification, the account will acquire the ``merchant`` role, and
will be able to have credits created against it.

.. _merchant-view:

``id``
    *string*.

    The resource identifier.

``uri``
    *string*.

    The URI of this merchant.

``created_at``
    *string*.

    When this merchant was created.

``type``
    *string*.

    Merchant type. It will be one of:
        - ``person``
        - ``business``

``name``
    *string*.

    The name of the business, for a business-type merchant.
    The name of the person, for a person-type merchant.

``email_address``
    *string*.

    Email address of the business, for a business-type merchant.
    Email address of the person, for a person-type merchant.

``phone_number``
    *string*.

    The merchant's phone number.

``balance``
    *integer*.

    Merchant's account balance.

``marketplace``
    *object*.

    See `marketplace view
    <./marketplaces.rst#marketplace-view>`_.

``accounts_uri``
    *string*.

    Accounts belonging to this merchant.

``api_keys_uri``
    *string*.

    URI for this merchant's API keys.

``meta``
    *object*.

    A single-level dictionary of string-type key/value pairs.

``street_address``
    *string*.


``city``
    *string*.


``postal_code``
    *string*.


``country_code``
    *string*.




Update
======

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>
:methods: ``PUT``



Index
=====

:uri: /v1/`merchants <./merchants.rst>`_
:methods: ``HEAD``, ``GET``



Show
====

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>
:methods: ``HEAD``, ``GET``

Click `here <./merchants.rst#merchant-view>`_
for the ``merchant`` schema.



