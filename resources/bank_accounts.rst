Bank Accounts
=============

- `Create a Bank Account`_
- `Retrieve a Bank Account`_
- `List All Bank Accounts`_
- `List All Bank Accounts for an Account`_
- `Associate a Bank Account with an Account`_
- `Delete a Bank Account`_

Fields
------

.. pez:: balanced_service.views:BankAccount
   :excludes: bank_code is_valid last_four account

Deprecated
~~~~~~~~~~

.. pez:: balanced_service.views:BankAccount
   :includes: bank_code is_valid last_four
   
   - is_valid
     Use `Delete a Bank Account`_ instead.

Create a Bank Account
---------------------

.. wag-route:: balanced_service.application:Application() bank_accounts.create

Request
~~~~~~~

.. pilo:: balanced_service.forms:RootBankAccountCreateForm
   :excludes: 0.bank_code 1

.. dcode:: bank_accounts.create
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:

Response
~~~~~~~~

.. dcode:: bank_accounts.create
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:

Retrieve a Bank Account
-----------------------

.. wag-route:: balanced_service.application:Application() bank_accounts.show
   :exclude-methods: HEAD

.. dcode:: bank_accounts.show
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*

List All Bank Accounts
----------------------

.. wag-route:: balanced_service.application:Application() bank_accounts.index
   :exclude-methods: HEAD
   
Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.

.. dcode:: bank_accounts.index
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*

List All Bank Accounts for an Account
-------------------------------------

.. wag-route:: balanced_service.application:Application() account_bank_accounts.index
   :exclude-methods: HEAD
   
Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``. 
 
``offset``
    *optional* integer. Defaults to ``0``.
   
.. dcode:: account_bank_accounts.index
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*

Associate a Bank Account with an Account
----------------------------------------

.. wag-route:: balanced_service.application:Application() marketplace_bank_accounts.update

Request
~~~~~~~

.. pilo:: balanced_service.forms:BankAccountUpdateForm
   :includes: account_uri

.. dcode:: bank_accounts.associate
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:

Response
~~~~~~~~

.. dcode:: bank_accounts.associate
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:

Delete a Bank Account
---------------------

.. wag-route:: balanced_service.application:Application() bank_accounts.delete

.. dcode:: bank_accounts.delete
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*
