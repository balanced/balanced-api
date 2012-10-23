========
ACCOUNTS
========

Accounts have roles, the ``buyer`` role is assigned to an account that may have
debits created against it, the ``merchant`` role is assigned to accounts that
may have credits created against it. For an account to have the ``merchant``
role assigned you must pass identifying information, to create a ``buyer`` role
you simply provide a funding source that may be debited.

account-view
------------

.. _account-view:

``id``
    *string*. The resource identifier.

``uri``
    *string*. The URI of the account.

``created_at``
    *string*. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
    account was created.

``name``
    *string*. The name of the account.

``email_address``
    *string*. The email address of the account.

``roles``
    *list*. A list of roles the account has. Can be zero, one, or both of
    ``buyer``, ``merchant``

``debits_uri``
    *string*. URI for all debits associated with the account.

``credits_uri``
    *string*. URI for all credits associated with the account.

``refunds_uri``
    *string*. URI for all refunds associated with the account.

``holds_uri``
    *string*. URI for all holds associated with the account.

``meta``
    *object*. A single-level dictionary of string-type key/value pairs.

``transactions_uri``
    *string*. URI for all transactions associated with the account.

``bank_accounts_uri``
    *string*. URI for all bank accounts associated with the account.

``cards_uri``
    *string*. URI for all cards associated with the account.



Show
====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>
:methods: ``HEAD``, ``GET``

Refer to the `account schema <./accounts.rst#account-view>`_.


Index
=====

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_
:methods: ``HEAD``, ``GET``

Returns a paginated representation of account resources.

.. _accounts-index-query:


.. _accounts-index-view:


Create
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_
:methods: ``POST``

Creating a buyer
----------------

To become a buyer, you must pass a tokenized card via the
``card_uri`` param or the full credit card via the ``card``
param.

buyer-account-create-form
-------------------------

.. _buyer-account-create-form:

``email_address``
    *string*. Email address of the account. It must be **unique** among all accounts
    on your marketplace. Defaults to ``null``.


``name``
    *string*. The display ``name`` of the account. Length must be **<=** ``128``. If a ``card`` is provided with a ``name`` then that is used as the
    default. Otherwise no default is provided and this field is
    **required**.


Exactly one of

    ``card_uri``
        *string*. The URI of the tokenized card. Ignored if not updated.


    ``card``
        *object*. 

        If you are not tokenizing the card you may pass the data straight
        through as a map.

        See `card create form <./cards.rst#card-create-form>`_.


        Ignored if not updated.


Creating a merchant
-------------------

To create a merchant, you must pass a tokenized merchant
identity via the ``merchant_uri`` param or full merchant
information via the ``merchant`` param. A merchant can be
represented as a business or a person depending on the entity
being represented by the account.

*Note* If Balanced cannot identify the merchant being created
the API will respond with a **300** status code. A 300
represents multiple choices, you may re-submit the original
request along with more identifying information (e.g.
``tax_id``) **or** you may redirect the user to the location
specified in the redirect where Balanced will identify the
user.

``email_address``
    *string*. Email address of the account. It must be **unique** among all accounts
    on your marketplace. Defaults to ``null``.


``name``
    *string*. The display ``name`` of the account. Length must be **<=** ``128``. If a ``card`` is provided with a ``name`` then that is used as the
    default. Otherwise no default is provided and this field is
    **required**.


Exactly one of

    ``bank_account_uri``
        *string*. The URI of the bank account created via *balanced.js*. Ignored if not updated.


    ``bank_account``
        *object*. 

        Bank account information:

        See `bank account create form
        <./bank_accounts.rst#bank-account-create-form>`_.

        Ignored if not updated.


Exactly one of

    ``merchant_uri``
        *string*. The URI of the merchant account created during a request for more
        information. Ignored if not updated.


    ``merchant``
        *object*. 

        Merchant account information.

        See `merchant create form
        <./accounts.rst#merchant-account-create-form>`_.

        Ignored if not updated.


Creating a business
-------------------

When creating a business merchant, you must also specify the
principal representing the business, this payload is the same
as for creating a person based merchant but also includes the
registered business information.

.. _business-merchant-account-create-form:

``email_address``
    *string*. Email address of the account. It must be **unique** among all accounts
    on your marketplace. Defaults to ``null``.


``name``
    *string*. The display ``name`` of the account. Length must be **<=** ``128``. If a ``card`` is provided with a ``name`` then that is used as the
    default. Otherwise no default is provided and this field is
    **required**.


Exactly one of

    ``bank_account_uri``
        *string*. The URI of the bank account created via *balanced.js*. Ignored if not updated.


    ``bank_account``
        *object*. 

        Bank account information:

        See `bank account create form
        <./bank_accounts.rst#bank-account-create-form>`_.

        Ignored if not updated.


Exactly one of

    ``merchant_uri``
        *string*. The URI of the merchant account created during a request for more
        information. Ignored if not updated.


    ``merchant``
        *object*. 

        Merchant account information.

        See `merchant create form
        <./accounts.rst#merchant-account-create-form>`_.

        Ignored if not updated.


merchant-account-create-form
----------------------------

.. _merchant-account-create-form:

``type``
    *string*. Merchant type. It should be one of: ``person`` or ``business``.


``phone_number``
    *string*. E.164 formatted phone number. Length must be **<=** ``15``.


``meta``
    *object*. Single level mapping from string keys to string values. Defaults to ``{}``


``tax_id``
    *string*. Length must be **=** ``9``. For *person* merchants `tax_id` is optional, defaulting to ``null``.
    For *business* merchants `tax_id` is required.


``dob``
    *string*. Date-of-birth formatted as YYYY-MM-DD. For *person* merchants `dob` is required. For *business* merchants
    `dob` is optional, defaulting to ``null``.


``person``
    *object*. 

    See `person create form <./accounts.rst#person-create-form>`_.



``name``
    *string*. Sequence of characters. Length must be **<=** ``128``. If an account is referenced in the resolving URI then the default is
    null. If this is nested in an account creation then the account
    ``name`` is used. Otherwise no default is provided and this field is
    required.


``email_address``
    *string*. RFC-2822 formatted email address. Ignored if not updated.


``city``
    *string*. City. Defaults to ``null``.


Exactly one of

    ``region``
        *string*. Region (e.g. state, province, etc). This field has been
        **deprecated**. Ignored if not updated.


    ``state``
        *string*. US state. This field has been **deprecated**. Ignored if not updated.


``postal_code``
    *string*. Postal code. This is known as a zip code in the USA.
    *requires* country_code


``street_address``
    *string*. Street address.
    *requires* postal_code


``country_code``
    *string*. `ISO-3166-3
    <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_
    three character country code. Defaults to ``USA``


person-create-form
------------------

.. _person-create-form:

``name``
    *string*. Sequence of characters.


``dob``
    *string*. Date-of-birth formatted as YYYY-MM-DD.


``city``
    *string*. City. Defaults to ``null``.


Exactly one of

    ``region``
        *string*. Region (e.g. state, province, etc). This field has been
        **deprecated**. Ignored if not updated.


    ``state``
        *string*. US state. This field has been **deprecated**. Ignored if not updated.


``postal_code``
    *string*. Postal code. This is known as a zip code in the USA.
    *requires* country_code


``street_address``
    *string*. Street address.
    *requires* postal_code


``country_code``
    *string*. `ISO-3166-3
    <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_
    three character country code. Defaults to ``USA``


``tax_id``
    *string*. Length must be **=** ``9``. Ignored if not updated.


Response
--------

.. _account-create-errors:

`incomplete-account-info <../errors.rst#incomplete-account-info>`_
    :status code: 400
    :category type: request

`cannot-associate-merchant-with-account <../errors.rst#cannot-associate-merchant-with-account>`_
    :status code: 409
    :category type: logical

`duplicate-email-address <../errors.rst#duplicate-email-address>`_
    :status code: 409
    :category type: logical



Update
======

:uri: /v1/`marketplaces <./marketplaces.rst>`_/<*marketplace*>/`accounts <./accounts.rst>`_/<*account*>
:methods: ``PUT``

Allows partial updates to accounts within your marketplace.

account-update-form
-------------------

.. _account-update-form:

#. If `account` is a merchant then:

   Exactly one of

       ``merchant_uri``
           *string*. URI. Ignored if not updated.


       ``merchant``
           *object*. 

           See `merchant create form
           <./accounts.rst#merchant-account-create-form>`_.

           Ignored if not updated.


#. If `account` is not a merchant then:

   Exactly one of

       ``merchant_uri``
           *string*. URI. Ignored if not updated.


       ``merchant``
           *object*. 

           See `merchant update form
           <./accounts.rst#merchant-update-form>`_.


           Ignored if not updated.



``name``
    *string*. The display ``name`` of the account. Length must be **<=** ``128``. Ignored if not updated.


``email_address``
    *string*. RFC-2822 formatted email address. Ignored if not updated.


``meta``
    *object*. Single level mapping from string keys to string values. Ignored if not updated.


Exactly one of

    ``card_uri``
        *string*. Tokenized card URI. Ignored if not updated.


    ``card``
        *object*. 

        Card information mapping:

        See `card create form
        <./cards.rst#card-create-form>`_.

        Ignored if not updated.


Exactly one of

    ``bank_account_uri``
        *string*. Tokenized bank account URI. Ignored if not updated.


    ``bank_account``
        *object*. 

        Bank account information:

        See `bank account create form
        <./bank_accounts.rst#bank-account-create-form>`_.

        Ignored if not updated.


merchant-update-form
--------------------

.. _merchant-update-form:

Merchant Update Form
--------------------

``name``
    *string*. Sequence of characters. Length must be **<=** ``128``. Ignored if not updated.


``email_address``
    *string*. RFC-2822 formatted email address. Ignored if not updated.


``phone_number``
    *string*. E.164 formatted phone number. Length must be **<=** ``15``. Ignored if not updated.


``meta``
    *object*. Single level mapping from string keys to string values. Ignored if not updated.


``bank_account``
    *object*. 

    See `bank account create form
    <./bank_accounts.rst#bank-account-create-form>`_.

    Ignored if not updated.


Response
--------

.. _account-update-errors:

`cannot-associate-merchant-with-account <../errors.rst#cannot-associate-merchant-with-account>`_
    :status code: 409
    :category type: logical

`account-already-merchant <../errors.rst#account-already-merchant>`_
    :status code: 409
    :category type: logical

`bank-account-already-associated <../errors.rst#bank-account-already-associated>`_
    :status code: 409
    :category type: logical

`cannot-associate-bank-account <../errors.rst#cannot-associate-bank-account>`_
    :status code: 409
    :category type: logical

`invalid-routing-number <../errors.rst#invalid-routing-number>`_
    :status code: 400
    :category type: request

`card-not-validated <../errors.rst#card-not-validated>`_
    :status code: 409
    :category type: logical

`card-not-associated <../errors.rst#card-not-associated>`_
    :status code: 409
    :category type: logical

`card-already-funding-src <../errors.rst#card-already-funding-src>`_
    :status code: 409
    :category type: logical

`cannot-associate-card <../errors.rst#cannot-associate-card>`_
    :status code: 409
    :category type: logical




