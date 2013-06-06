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

.. dcode:: view account


Create a Buyer
--------------

.. dcode:: endpoint accounts.create

Request
~~~~~~~

.. dcode:: form accounts.create 
    :include: email_address name card_uri card type

    - card
      See `Create a Card <./cards.rst#create-a-card>`_.

.. dcode:: scenario accounts.create-buyer
    :section-include: request

Response
~~~~~~~~

.. dcode:: scenario accounts.create-buyer
   :section-include: response

Create a Business Merchant
--------------------------

.. dcode:: endpoint accounts.create

Request
~~~~~~~

.. dcode:: form accounts.create
    :include: name email_address bank_account_uri bank_account merchant_uri merchant
    :exclude: merchant.region merchant.state merchant.person.region merchant.person.state merchant.dob merchant.ssn_last_4 merchant.person.ssn_last_4
    :required: merchant.person

    - bank_account
      See `BankAccount <./bank_accounts.rst>`_.

.. dcode:: scenario accounts.create-business-merchant
    :section-include: request

Response
~~~~~~~~

.. dcode:: scenario accounts.create-business-merchant
   :section-include: response


Create a Person Merchant
------------------------

.. dcode:: endpoint accounts.create

Request
~~~~~~~

.. dcode:: form accounts.create
    :include: name email_address bank_account_uri bank_account merchant_uri merchant
    :exclude: merchant.person merchant.region merchant.state merchant.ssn_last_4

    - bank_account
      See `BankAccount <./bank_accounts.rst>`_.

.. dcode:: scenario accounts.create-person-merchant
    :section-include: request

Response
~~~~~~~~

.. dcode:: scenario accounts.create-person-merchant
   :section-include: response


Retrieve an Account
-------------------

.. dcode:: scenario accounts.show

.. dcode:: endpoint accounts.show

.. dcode:: scenario accounts.show


List all Accounts
-----------------

Request
~~~~~~~

.. dcode:: endpoint accounts.index

.. dcode:: scenario accounts.index
    :section-include: response


Update an Account
-----------------

.. dcode:: endpoint accounts.update

Request
~~~~~~~

.. dcode:: form accounts.update
    :exclude: 0.merchant 0.merchant_uri 1.merchant 1.merchant_uri

    - bank_account
      See `BankAccount <./bank_accounts.rst>`_.

    - card
      See `Card <./cards.rst>`_.

.. dcode:: scenario accounts.update
    :section-include: request

Response
~~~~~~~~

.. dcode:: scenario accounts.update
    :section-include: response

Promote a Buyer Account to a Merchant
-------------------------------------

.. dcode:: endpoint accounts.update

Request
~~~~~~~

.. dcode:: form accounts.update
   :include: 1.*

   - 1.merchant_uri
     See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_.

   - 1.merchant
     See `Business Merchant <./accounts.rst#create-a-business-merchant>`_ or `Person Merchant <./accounts.rst#create-a-person-merchant>`_.

.. dcode:: scenario accounts.promote-buyer
   :section-include: request

Response
~~~~~~~~

.. dcode:: scenario accounts.promote-buyer
   :section-include: includes response
