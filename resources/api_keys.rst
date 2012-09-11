========
API KEYS
========

API keys identify users of the API. A valid API key must be passed with most
requests in order to authenticate the request.

api-keys-view
-------------

.. _api-key-view:

``id``
    *string*. The resource identifier.

``uri``
    *string*. A URI for a Balanced entity

``created_at``
    *string*. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
    api key was created.

``merchant``
    *object*. The merchant owning this API key.
    See `merchant view
    <./merchants.rst#merchant-view>`_.

``secret``
    *string*. The secret associated with this API key. Will only be shown if passed
    in the original request. 

``meta``
    *object*. A single-level dictionary of string-type key/value pairs.



Update
======

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``PUT``
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``PUT``

.. _api-key-update-form:

``meta``
    *object*. Single level mapping from string keys to string values. Ignored if not updated.




Show
====

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``HEAD``, ``GET``
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``HEAD``, ``GET``

Refer to the `api_key schema <./api_keys.rst#api-key-view>`_.


Create
======

:uri: /v1/`api_keys <./api_keys.rst>`_
:methods: ``POST``
:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_
:methods: ``POST``

Creates a new API key. If created with an authenticated request, the
API key will be associated with, and will be able to access the same
marketplace associated with, the original API key.

api-key-create-form
-------------------

.. _api-key-create-form:

``meta``
    *object*. Single level mapping from string keys to string values. Defaults to ``{}``


``secret``
    *string*. Sequence of characters. Ignored if not updated.


`invalid-routing-number <../errors.rst#invalid-routing-number>`_
    :status code: 400
    :category type: request



Delete
======

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``DELETE``
:uri: /v1/`api_keys <./api_keys.rst>`_/<*api_key*>
:methods: ``DELETE``

Deactivates an API key. Once deactivated this key cannot be used again.



