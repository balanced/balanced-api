Credits
=======

- `Credit a New Bank Account`_
- `Credit an Existing Bank Account`_
- `Credit a Merchant`_
- `Retrieve a Credit`_
- `List All Credits`_
- `List All Credits for a Bank Account`_
- `List All Credits for a Merchant`_

Fields
------

.. pez:: balanced_service.views:Credit
   :excludes: transaction_number available_at fee destination state
   
   - account
     `Accounts <./accounts.rst>`_. Present if the credit went to a merchant instead of directly to a bank account. 
   - bank_account
     `Bank Account <./bank_accounts.rst>`_.
    
Deprecated
~~~~~~~~~~

.. pez:: balanced_service.views:Credit
   :includes: transaction_number available_at fee destination state


Credit a New Bank Account
-------------------------

.. wag-route:: balanced_service.application:Application() credits.create

Request
~~~~~~~

.. pilo:: balanced_service.forms:CreditCreateForm

   - bank_account
     `BankAccount <./bank_accounts.rst>`_.

.. dcode:: credits.create
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: credits.create
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:


Credit an Existing Bank Account
-------------------------------

.. wag-route:: balanced_service.application:Application() bank_account_credits.create

Request
~~~~~~~

.. pilo:: balanced_service.forms:BankAccountCreditCreateForm

.. dcode:: bank_account_credits.create
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:

Response
~~~~~~~~

.. dcode:: bank_account_credits.create
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:


Credit a Merchant
-----------------

.. wag-route:: balanced_service.application:Application() account_credits.create


Request
~~~~~~~

.. pilo:: balanced_service.forms:AccountCreditCreateForm
   :excludes: account_uri bank_account_uri

.. dcode:: account_credits.create
   :section-chars: ^
   :section-depth: 2
   :includes: request.* 
   :cache:


Response
~~~~~~~~

.. dcode:: account_credits.create
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:


Retrieve a Credit
-----------------

.. wag-route:: balanced_service.application:Application() credits.show
   :exclude-methods: HEAD

.. dcode:: credits.show
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*


List All Credits
----------------

.. wag-route:: balanced_service.application:Application() credits.index
   :exclude-methods: HEAD
   
Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.

.. dcode:: credits.index
   :section-chars: ~^
   :section-depth: 1


List All Credits for a Bank Account
-----------------------------------

.. wag-route:: balanced_service.application:Application() bank_account_credits.index
   :exclude-methods: HEAD

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.
   
.. dcode:: bank_account_credits.index
   :section-chars: ~^
   :section-depth: 1


List All Credits for a Merchant
-------------------------------

.. wag-route:: balanced_service.application:Application() account_credits.index
   :exclude-methods: HEAD
   
Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.

.. dcode:: account_credits.index
   :section-chars: ~^
   :section-depth: 1
