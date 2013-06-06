Refunds
=======

- `Refund an Account`_
- `Retrieve a Refund`_
- `List All Refunds`_
- `Update a Refund`_

Fields
------

.. dcode:: view refund
   :exclude: invoice_uri fee
   
Deprecated
~~~~~~~~~~

.. dcode:: view refund
   :include: fee

Refund an Account
-----------------

.. dcode:: endpoint refunds.create
   :exclude-method: HEAD

Request
~~~~~~~

.. dcode:: form refunds.create
   :exclude: account_uri

.. dcode:: scenario refunds.create
   :section-include: request

Response
~~~~~~~~

.. dcode:: scenario refunds.create
   :section-include: response

Retrieve a Refund
-----------------

.. dcode:: endpoint refunds.show
   :exclude-method: HEAD

Response
~~~~~~~~

.. dcode:: scenario refunds.show
   :section-include: response


List All Refunds
----------------

.. dcode:: endpoint refunds.index
   :exclude-method: HEAD

.. dcode:: scenario refunds.index

Update a Refund
---------------

.. dcode:: endpoint refunds.update
   :exclude-method: HEAD


Request
~~~~~~~

.. dcode:: form refunds.update

.. dcode:: scenario refunds.update
   :section-include: request


Response
~~~~~~~~

.. dcode:: scenario refunds.update
   :section-include: response
