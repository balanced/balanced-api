Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_

Fields
------

.. pez:: balanced_service.views:Debit


Debit an Account
----------------

.. wag-route:: balanced_service.application:Application() debits.create
   :exclude-methods: HEAD


Request
~~~~~~~

.. pilo:: balanced_service.forms:DebitCreateForm
   :excludes: account_uri card_uri

.. dcode:: debits.create
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:


Response
~~~~~~~~

.. dcode:: debits.create
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:   


Retrieve a Debit
----------------

.. wag-route:: balanced_service.application:Application() debits.show
   :exclude-methods: HEAD

.. dcode:: debits.show
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*


List All Debits
---------------

.. wag-route:: balanced_service.application:Application() debits.index
   :exclude-methods: HEAD

.. dcode:: debits.index
   :section-chars: ~^
   :section-depth: 1


Update a Debit
--------------

.. wag-route:: balanced_service.application:Application() debits.update


Request
~~~~~~~

.. pilo:: balanced_service.forms:DebitUpdateForm


.. dcode:: debits.update
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:


Response
~~~~~~~~

.. dcode:: debits.update
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:
