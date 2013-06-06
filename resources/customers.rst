Customers
=========

- `Create a Customer`_
- `Retrieve a Customer`_
- `List all Customers`_
- `Update a Customer`_
- `Delete a Customer`_

Fields
------

.. dcode:: view customer
    :exclude: _type _uris region


Create a Customer
-----------------

.. dcode:: endpoint customers.create


Request
~~~~~~~

.. dcode:: form customers.create
    :exclude: region

.. dcode:: scenario customers.create
   :section-include: request

Response
~~~~~~~~

.. dcode:: scenario customers.create
   :section-include: response


Retrieve a Customer
-------------------

.. dcode:: endpoint customers.show

Response
~~~~~~~~

.. dcode:: scenario customers.show
   :section-include: response


List all Customers
------------------

.. dcode:: endpoint customers.index

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.

.. dcode:: scenario customers.index
   :section-include: response


Update a Customer
-----------------

.. dcode:: endpoint customers.update

Request
~~~~~~~

.. dcode:: form customers.create
    :exclude: region

.. dcode:: scenario customers.update
   :section-include: response


Delete a Customer
-----------------

You can delete a customer so long as there has been no activity associated with it such as creating a hold, credit, or debit. 

.. dcode:: endpoint customers.delete

Request
~~~~~~~

.. dcode:: scenario customers.delete
   :section-include: response
