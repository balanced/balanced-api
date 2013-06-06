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

.. dcode:: view hold
   :exclude: invoice_uri fee
   
   - account
     See `Account <./accounts.rst>`_.

   - source
     See `Card <./cards.rst>`_.

   - debit
     See `Debit <./debits.rst>`_.
     
Deprecated
~~~~~~~~~~

.. dcode:: view hold
   :include: fee

Create a Hold
-------------

.. dcode:: endpoint holds.create

Request
~~~~~~~

.. dcode:: form holds.create
   :exclude: card_uri account_uri

.. dcode:: scenario holds.create
   :section-include: request

Response
~~~~~~~~

.. dcode:: scenario holds.create
   :section-include: response

Retrieve a Hold
---------------

.. dcode:: endpoint holds.show
   :exclude-method: HEAD
   
Response
~~~~~~~~
   
.. dcode:: scenario holds.show
   :section-include: response

List all Holds
--------------

.. dcode:: endpoint holds.index
   :exclude-method: HEAD

Response
~~~~~~~~
   
.. dcode:: scenario holds.index
   :section-include: response

Update a Hold
-------------

.. dcode:: endpoint holds.update

Request
~~~~~~~

.. dcode:: form holds.update
   :exclude: is_void appears_on_statement_as

.. dcode:: scenario holds.update
   :section-include: request

Response
~~~~~~~~

.. dcode:: scenario holds.update
   :section-include: response

Capture a Hold
--------------

Use ``hold_uri`` when `creating a debit <./debits.rst#create-a-debit>`_.

.. dcode:: scenario holds.capture


Void a Hold
------------

.. dcode:: endpoint holds.update

Request
~~~~~~~

.. dcode:: form holds.update
   :include: is_void appears_on_statement_as

.. dcode:: scenario holds.void
   :section-include: request

Response
~~~~~~~~

.. dcode:: scenario holds.void
   :section-include: response 
