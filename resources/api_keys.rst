========
Api_keys
========

API keys identify users of the API. A valid API key must be passed with most
requests in order to authenticate the request.

.. _api-key-view:

``id``
    *string*.

    The resource identifier.

``uri``
    *string*.

    A URI for a Balanced entity

``created_at``
    *string*.

    Time of creation.

``merchant``
    *object*.

    The merchant owning this API key.
    See `merchant view
    <./merchants.rst#merchant-view>`_.

``secret``
    *string*.

    The secret associated with this API key. Will only be shown if passed
    in the original request.

``meta``
    *object*.

    A single-level dictionary of string-type key/value pairs.



Delete
======

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``DELETE``
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``DELETE``

Deactivates an API key. Once deactivated this key cannot be used again.


Show
====

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``HEAD``, ``GET``
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``HEAD``, ``GET``

Click `here <./api_keys.rst#api-key-view>`_ for the ``api_key`` schema.


Create
======

:uri: /v1/`api_keys <./api_keys.rst>`_
:methods: ``POST``
:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_
:methods: ``POST``

Creates a new API key. If created with an authenticated request, the
API key will be associated with, and will be able to access the same
marketplace associated with, the original API key.

.. _api-key-create-form:

``meta``
    *object*. Single level mapping from string keys to string values.
    Defaults to ``{   }``.

``secret``
    *string*. Sequence of characters.
    Defaults to ``null``.

`identity-verification-error <../errors.rst#identity-verification-error>`_
    :status code: 409
    :category type: logical

`Business principal failed KYC <../errors.rst#Business principal failed KYC>`_
    :status code: 409
    :category type: logical

`Business KYC failed <../errors.rst#Business KYC failed>`_
    :status code: 409
    :category type: logical

`Person KYC failed <../errors.rst#Person KYC failed>`_
    :status code: 409
    :category type: logical

`invalid-routing-number <../errors.rst#invalid-routing-number>`_
    :status code: 400
    :category type: request



Update
======

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``PUT``
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``PUT``

.. _api-key-update-form:

``meta``
    *object*. Single level mapping from string keys to string values.
    Defaults to ``null``.




