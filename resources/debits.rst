Debits
=======

- `Debit an Account`_
- `Retrieve a Debit`_
- `List All Debits`_
- `Update a Debit`_
- `Refund a Debit`_

Fields
------

.. dcode:: view debit
   :exclude: invoice_uri fee

Deprecated
~~~~~~~~~~

.. dcode:: view debit
   :include: fee

Debit an Account
----------------

.. dcode:: endpoint debits.create
   :exclude-method: HEAD


Request
~~~~~~~

.. dcode:: form debit.create
   :exclude: account_uri card_uri merchant_uri

.. dcode:: scenario debits.create
   :section-include: request


Response
~~~~~~~~

.. dcode:: scenario debits.create
   :section-include: response


Retrieve a Debit
----------------

.. dcode:: endpoint debits.show
   :exclude-method: HEAD

Request
~~~~~~~

.. dcode:: scenario debits.show
   :section-include: response


List All Debits
---------------

.. dcode:: endpoint debits.index
   :exclude-method: HEAD

.. dcode:: scenario debits.index


Update a Debit
--------------

.. dcode:: endpoint debits.update


Request
~~~~~~~

.. dcode:: form debits.update


.. dcode:: scenario debits.update
   :section-include: request


Response
~~~~~~~~

.. dcode:: scenario debits.update
   :section-include: response


Refund a Debit
--------------

.. dcode:: endpoint debit_refunds.create


Request
~~~~~~~

.. dcode:: form refunds.create
   :exclude: debit_uri


.. dcode:: scenario debit_refunds.create
   :section-include: request


Response
~~~~~~~~

.. dcode:: scenario debit_refunds.create
   :section-include: response
