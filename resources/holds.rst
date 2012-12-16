Holds
=====

- `Create a Hold`_
- `Retrieve a Hold`_
- `List all Holds`_
- `Update a Hold`_
- `Capture a Hold`_
- `Void a Hold`_

Fields
------

.. pez:: balanced_service.views:Hold

   - account
     See `Account <./accounts.rst>`_.

   - source
     See `Card <./cards.rst>`_.

   - debit
     See `Debit <./debits.rst>`_.

     
Create a Hold
-------------

.. wag-route:: balanced_service.application:Application() holds.create

Request
~~~~~~~

.. pilo:: balanced_service.forms:HoldCreateForm
   :excludes: card_uri account_uri

.. dcode:: holds.create
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: holds.create
   :section-chars: ^
   :section-depth: 2
   :includes: response.* 
   :cache:

Retrieve a Hold
---------------

.. wag-route:: balanced_service.application:Application() holds.show
   :exclude-methods: HEAD
   
.. dcode:: holds.show
   :section-chars: ~^
   :section-depth: 1
   :includes: response.* 
   :cache:

List all Holds
--------------

.. wag-route:: balanced_service.application:Application() holds.index
   :exclude-methods: HEAD
   
.. dcode:: holds.index
   :section-chars: ~^
   :section-depth: 1
   :includes: response.* 
   :cache:

Update a Hold
-------------

.. wag-route:: balanced_service.application:Application() holds.update

Request
~~~~~~~

.. pilo:: balanced_service.forms:HoldUpdateForm
   :excludes: is_void appears_on_statement_as

.. dcode:: holds.update
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: holds.update
   :section-chars: ^
   :section-depth: 2
   :includes: response.* 
   :cache:

Capture a Hold
--------------

Use ``hold_uri`` when `creating a debit <./debits.rst#create-a-debit>`_.

.. dcode:: holds.capture
   :section-chars: ~^
   :section-depth: 1

Void a Hold
-----------

.. wag-route:: balanced_service.application:Application() holds.update

Request
~~~~~~~

.. pilo:: balanced_service.forms:HoldUpdateForm
   :includes: is_void appears_on_statement_as

.. dcode:: holds.void
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: holds.void
   :section-chars: ^
   :section-depth: 2
   :includes: response.* 
   :cache:
