Accounts
========

- `Create a Buyer`_
- `Create a Person Merchant`_
- `Create a Business Merchant`_
- `Retrieve an Account`_
- `List all Accounts`_
- `Update an Account`_
- `Promote a Buyer Account to a Merchant`_

Fields
------

.. pez:: balanced_service.views:Account


Create a Buyer
--------------

.. wag-route:: balanced_service.application:Application() accounts.create
   :exclude-methods: HEAD

Request
~~~~~~~

.. pilo:: balanced_service.forms:AccountCreateForm
   :includes: email_address name card_uri card type

   - card
     See `Create a Card <./cards.rst#create-a-card>`_.

.. dcode:: accounts.create-buyer
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:

Response
~~~~~~~~

.. dcode:: accounts.create-buyer
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:

Create a Business Merchant
--------------------------

.. wag-route:: balanced_service.application:Application() accounts.create
   :exclude-methods: HEAD

Request
~~~~~~~

.. pilo:: balanced_service.forms:AccountCreateForm
   :includes: name email_address bank_account_uri bank_account merchant_uri merchant
   :excludes: merchant.region merchant.state  merchant.person.region merchant.person.state merchant.dob merchant.ssn_last_4 merchant.person.ssn_last_4

   - bank_account
     See `BankAccount <./bank_accounts.rst>`_.

.. dcode:: accounts.create-business-merchant
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:

Response
~~~~~~~~

.. dcode:: accounts.create-business-merchant
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:


Create a Person Merchant
------------------------

.. wag-route:: balanced_service.application:Application() accounts.create
   :exclude-methods: HEAD

Request
~~~~~~~

.. pilo:: balanced_service.forms:AccountCreateForm
   :includes: name email_address bank_account_uri bank_account merchant_uri merchant
   :excludes: merchant.person merchant.region merchant.state merchant.ssn_last_4

   - bank_account
     See `BankAccount <./bank_accounts.rst>`_.

.. dcode:: accounts.create-person-merchant
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:

Response
~~~~~~~~

.. dcode:: accounts.create-person-merchant
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:


Retrieve an Account
-------------------

.. wag-route:: balanced_service.application:Application() accounts.show
   :exclude-methods: HEAD

.. dcode:: accounts.show
   :section-chars: ~^
   :section-depth: 2


List all Accounts
-----------------

.. wag-route:: balanced_service.application:Application() accounts.index
   :exclude-methods: HEAD

.. dcode:: accounts.index
   :section-chars: ~^
   :section-depth: 1
   :includes: response.*


Update an Account
-----------------

.. wag-route:: balanced_service.application:Application() accounts.update
   :exclude-methods: HEAD

Request
~~~~~~~

.. pilo:: balanced_service.forms:AccountUpdateForm
   :excludes: 0.merchant 0.merchant_uri 1.merchant 1.merchant_uri

   - bank_account
     See `BankAccount <./bank_accounts.rst>`_.

   - card
     See `Card <./cards.rst>`_.

.. dcode:: accounts.update
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:

Response
~~~~~~~~

.. dcode:: accounts.update
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:

Promote a Buyer Account to a Merchant
-------------------------------------

.. wag-route:: balanced_service.application:Application() accounts.update
   :exclude-methods: HEAD

Request
~~~~~~~

.. pilo:: balanced_service.forms:AccountUpdateForm
   :includes: 1.*

   - 1.merchant_uri
     See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_.

   - 1.merchant
     See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_.

.. dcode:: accounts.promote-buyer
   :section-chars: ^
   :section-depth: 2
   :includes: request.*
   :cache:

Response
~~~~~~~~

.. dcode:: accounts.promote-buyer
   :section-chars: ^
   :section-depth: 2
   :includes: response.*
   :cache:
