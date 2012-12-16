Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

.. pez:: balanced_service.views:Refund

Refund an Account
----------------

.. wag-route:: balanced_service.application:Application() refunds.create
   :exclude-methods: HEAD

Request
~~~~~~~

.. pilo:: balanced_service.forms:RefundCreateForm
   :excludes: account_uri

.. dcode:: refunds.create
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: refunds.create
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:   

Retrieve a Refund
----------------

.. wag-route:: balanced_service.application:Application() refunds.show
   :exclude-methods: HEAD

.. dcode:: refunds.show
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*


List All refunds
---------------

.. wag-route:: balanced_service.application:Application() refunds.index
   :exclude-methods: HEAD

.. dcode:: refunds.index
   :section-chars: ~^
   :section-depth: 1

Update a Refund
--------------

.. wag-route:: balanced_service.application:Application() refunds.index
   :exclude-methods: HEAD


Request
~~~~~~~

.. pilo:: balanced_service.forms:RefundUpdateForm


.. dcode:: refunds.update
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:


Response
~~~~~~~~

.. dcode:: refunds.update
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:
