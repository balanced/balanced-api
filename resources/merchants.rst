=========
MERCHANTS
=========

In order to create a seller (a provider of goods or services in a
marketplace), you must pass identifying information when creating an account.
Upon verification, the seller account will acquire the ``merchant`` role, and
will be able to have credits created against it.

merchant-view
-------------

.. _merchant-view:

``id``
    *string*. The resource identifier. 

``uri``
    *string*. The URI of this merchant. 

``created_at``
    *string*. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
    merchant was underwritten.

``type``
    *string*. Merchant type. It will be one of: ``person`` or ``business``

``name``
    *string*. The name of the business, for a business-type merchant.
    The name of the person, for a person-type merchant.

``email_address``
    *string*. Email address of the business, for a business-type merchant.
    Email address of the person, for a person-type merchant.

``phone_number``
    *string*. The merchant's phone number.

``balance``
    *integer*. Merchant's account balance.

``marketplace``
    *object*. See `marketplace view
    <./marketplaces.rst#marketplace-view>`_.

``accounts_uri``
    *string*. Accounts belonging to this merchant.

``api_keys_uri``
    *string*. URI for this merchant's API keys.

``meta``
    *object*. A single-level dictionary of string-type key/value pairs.

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

Refer to the `merchant schema <./merchants.rst#merchant-view>`_.



