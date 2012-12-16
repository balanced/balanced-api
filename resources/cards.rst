Cards
=====

- `Tokenize a Card`_
- `Retrieve a Card`_
- `Update a Card`_
- `Associate a Card with an Account`_

Fields
------

.. pez:: balanced_service.views:Card

   - account
     See `Accounts <./accounts.rst>`_.

     
Tokenize a Card
---------------

.. wag-route:: balanced_service.application:Application() marketplace_cards.create
   :exclude-methods: HEAD
   
Request
~~~~~~~

.. pilo:: balanced_service.forms:CardCreateForm
   :excludes: region state
   
.. dcode:: cards.tokenize
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: cards.tokenize
   :section-chars: ^
   :section-depth: 2
   :includes: response.* 
   :cache:

Retrieve a Card
---------------

.. wag-route:: balanced_service.application:Application() marketplace_cards.show
   :exclude-methods: HEAD

Response
~~~~~~~~

.. dcode:: cards.show
   :section-chars: ^
   :section-depth: 2
   :includes: response.*

Update a Card
-------------

.. wag-route:: balanced_service.application:Application() marketplace_cards.update

Request
~~~~~~~

.. pilo:: balanced_service.forms:CardUpdateForm
   :excludes: account_uri account
   
.. dcode:: cards.update
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: cards.update
   :section-chars: ^
   :section-depth: 2
   :includes: response.* 
   :cache:

Associate a Card with an Account
--------------------------------

.. wag-route:: balanced_service.application:Application() marketplace_cards.update

Request
~~~~~~~

.. pilo:: balanced_service.forms:CardUpdateForm
   :includes: account_uri
   
.. dcode:: cards.associate
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: cards.associate
   :section-chars: ^
   :section-depth: 2
   :includes: response.* 
   :cache:
