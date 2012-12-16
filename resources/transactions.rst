Transactions
============

Unified view of `Holds <./holds.rst>`_, `Debits <./debits.rst>`_, `Refunds <./refunds.rst>`_ and `Credits <./credits.rst>`_.

- `List Transactions`_

Fields
------

- `Holds <./holds.rst>`_
- `Debits <./debits.rst>`_
- `Refunds <./refunds.rst>`_
- `Credits <./credits.rst>`_

List Transactions
-----------------

.. wag-route:: balanced_service.application:Application() transactions.index
   :exclude-methods: HEAD
   
.. dcode:: transactions.index
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*
