=========
Merchants
=========

In order to create a merchant (a provider of goods or services in a
marketplace), you must pass identitfying information when creating an
account. Upon verification, the account will acquire the ``merchant`` role, and
will be able to have credits created against it.

.. _merchant-view:

.. list-table::
   :widths: 20 20 80 
   :header-rows: 1

   * - Name
     - Type
     - Description
   * - ``phone_number``
     - string
     - The merchant's phone number

   * - ``city``
     - string
     - 
   * - ``marketplace``
     - ``marketplace``
     - See `marketplace view
       <./marketplaces.rst#marketplace-view>`_.


   * - ``name``
     - string
     - The name of the business, for a business-type merchant.
       The name of the person, for a person-type merchant.

   * - ``email_address``
     - string
     - Email address of the business, for a business-type merchant.
       Email address of the person, for a person-type merchant.

   * - ``created_at``
     - datetime
     - When this merchant was created

   * - ``uri``
     - string
     - The URI of this merchant


   * - ``accounts_uri``
     - string
     - Accounts belonging to this merchant

   * - ``meta``
     - map
     - A single-level dictionary of string-type key/value pairs

   * - ``postal_code``
     - string
     - 
   * - ``country_code``
     - string
     - 
   * - ``type``
     - string
     - Merchant type. It will be one of:

           - ``person``
           - ``business``

   * - ``balance``
     - integer
     - Merchant's account balance

   * - ``api_keys_uri``
     - string
     - URI for this merchant's API keys

   * - ``id``
     - string
     - The id of this merchant


   * - ``street_address``
     - string
     - 

.. list-table::
   :widths: 20 20 80
   :header-rows: 1

   * - URI
     - Methods
     - Description
   * - /v1/`merchants <./merchants.rst>`_/<*merchant*>
     - HEAD,GET
     - `Show <./merchants.rst#show>`_
   * - /v1/`merchants <./merchants.rst>`_
     - HEAD,GET
     - `Index <./merchants.rst#index>`_
   * - /v1/`merchants <./merchants.rst>`_/<*merchant*>
     - PUT
     - `Update <./merchants.rst#update>`_

====
Show
====

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>
:methods: HEAD,GET

Click `here <./merchants.rst#merchant-view>`_
for the ``merchant`` schema.


=====
Index
=====

:uri: /v1/`merchants <./merchants.rst>`_
:methods: HEAD,GET



======
Update
======

:uri: /v1/`merchants <./merchants.rst>`_/<*merchant*>
:methods: PUT




