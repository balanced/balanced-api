=====
CARDS
=====

A card represents a source of funds, such as a debit or credit card. It must be
associated with an account via a PUT on the account before transactions can be
made with it.

Operate on a card using the following endpoints:

   - `Create a card <./cards.rst#card-create>`_
   - `Index Cards <./cards.rst#card-index>`_
   - `Update a Card <./cards.rst#card-update>`_
   - `Show a Card <./cards.rst#card-show>`_

Operate on a card in an account context using the following endpoints:

   - `Create and Associate a Card <./cards.rst#account-card-create>`_
   - `Show an Account Card <./cards.rst#account-card-show>`_
   - `Update an Account Card <./cards.rst#account-update-card>`_

The card resource is composed of the following fields:

.. _card-view:

``id``
    *string*. The resource identifier.

``uri``
    *string*. The URI of the card

``account``
    *object*. The account this card is associated with.
    See `account view <./accounts.rst#account-view>`_.

``created_at``
    *string*. When this card was tokenized.

``street_address``
    *string*. Street address.

``postal_code``
    *string*. Postal code (zip code in the USA).

``country_code``
    *string*. `ISO-3166-3`_ three character country code.

``name``
    *string*. The name on the card.

``expiration_month``
    *string*. Card's expiration month.

``expiration_year``
    *string*. Card's expiration year.

``card_type``
    *string*. **Deprecated**
    The type of the card. This field has been deprecated in favor of
    ``brand``.

``meta``
    *object*. A single-level dictionary of string-type key/value pairs.

``last_four``
    *string*. Last four digits of the card.

``brand``
    *string*. The brand of the card. One of: ``Visa``, ``MasterCard``,
    ``American Express``, or ``Discover``.

``is_valid``
    *boolean*. A boolean value indicating whether or not the card is valid. Once
    invalidated, ``is_valid`` can not be set to ``true`` again.



Show an account's card
======================

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_/<*card*>
:methods: ``HEAD``, ``GET``

.. _account-card-show:

Click `here <./cards.rst#card-view>`_ for the ``card`` schema.


Get a card
==========

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_/<*card*>
:methods: ``HEAD``, ``GET``

.. _card-show:

Click `here <./cards.rst#card-view>`_ for the ``card`` schema.


Create and associate a card to an account
=========================================

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_
:methods: ``POST``

.. _account-card-card:

.. _account-card-create-form:

Exactly one of

    ``uri``
        *string*. Tokenized card URI.


    ``card_uri``
        *string*. Tokenized card URI.


    ``*object*``
        See `card create form <./cards.rst#a>`_.


Response
--------

`card-not-validated <../errors.rst#card-not-validated>`_
    :status code: 409
    :category type: logical

`card-declined <../errors.rst#card-declined>`_
    :status code: 402
    :category type: banking



Update an account's card
========================

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>/`cards <./cards.rst>`_/<*card*>
:methods: ``PUT``

.. _account-card-update:

.. _account-card-update-form:

``is_valid``
    *boolean*. Indicates whether the card is active (``true``) or has been deactivated
    (``false``). Setting this to ``false`` will deactivate the card.


Exactly one of

    ``account_uri``
        *string*. URI. Defaults to ``null``.


    ``account``
        *object*. ``uri``
            *string*. URI. Defaults to ``null``.



``meta``
    *object*. Single level mapping from string keys to string values. Defaults to {}


Response
--------


Invalidate a card
=================

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_/<*card*>
:methods: ``PUT``

.. _card-update:

.. _card-update-form:

``is_valid``
    *boolean*. Indicates whether the card is active (``true``) or has been deactivated
    (``false``). Setting this to ``false`` will deactivate the card.


Exactly one of

    ``account_uri``
        *string*. URI. Defaults to ``null``.


    ``account``
        *object*. ``uri``
            *string*. URI. Defaults to ``null``.



``meta``
    *object*. Single level mapping from string keys to string values. Defaults to {}


Response
--------

`card-already-funding-src <../errors.rst#card-already-funding-src>`_
    :status code: 409
    :category type: logical

`cannot-associate-card <../errors.rst#cannot-associate-card>`_
    :status code: 409
    :category type: logical



List all card tokens
====================

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_
:methods: ``HEAD``, ``GET``

.. _card-index:




Create a card
=============

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`cards <./cards.rst>`_
:methods: ``POST``

.. _card-create:

Creates a card. The resulting card should then be associated with an
account. This process of creating and then associating a card is
called *tokenization*.

Request
-------

.. _card-create-form-required:

Required fields:

``card_number``
    *string*. The digits of the credit card number.


``expiration_year``
    *integer*. Expiration year.


``expiration_month``
    *integer*. Expiration month (e.g. 1 for January).


.. _card-create-form-optional:

Optional fields:

``security_code``
    *string*. The 3-4 digit security code for the card. Defaults to ``null``.


``name``
    *string*. Sequence of characters. Length must be **<=** ``128``. Defaults to ``null``.


``phone_number``
    *string*. E.164 formatted phone number. Length must be **<=** ``15``. Defaults to ``null``.


``city``
    *string*. City. Defaults to ``null``.


Exactly one of

    ``region``
        *string*. Region (e.g. state, province, etc). This field has been
        **deprecated**. Defaults to ``null``.


    ``state``
        *string*. US state. This field has been **deprecated**. Defaults to ``null``.


``postal_code``
    *string*. Postal code. This is known as a zip code in the USA.
    *requires* country_code


``street_address``
    *string*. Street address.
    *requires* postal_code


``country_code``
    *string*. `ISO-3166-3
    <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_
    three character country code. Defaults to USA


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to {}


``is_valid``
    *boolean*. Indicates whether the card is active (``true``) or has been deactivated
    (``false``). Defaults to true


A card create request must provide all the required fields alongside
any desired optional ones.

Response
--------

`card-not-validated <../errors.rst#card-not-validated>`_
    :status code: 409
    :category type: logical




