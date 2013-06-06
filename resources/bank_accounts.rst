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

.. dcode:: view bank_account
   :exclude: bank_code is_valid last_four account _type _uri

Deprecated
~~~~~~~~~~

.. dcode:: view bank_account
   :include: bank_code is_valid last_four 

   - is_valid
     Use `Delete a Bank Account`_ instead.

Create a Bank Account
---------------------

.. dcode:: endpoint bank_accounts.create

Request
~~~~~~~

.. dcode:: form root_bank_account.create
   :exclude: bank_code

.. dcode:: scenario bank_accounts.create
   :section-include: request

Response
~~~~~~~~

.. dcode:: scenario bank_accounts.create
   :section-include: response

Retrieve a Bank Account
-----------------------

Request
~~~~~~~

.. dcode:: endpoint bank_accounts.show

.. dcode:: scenario bank_accounts.show
   :section-include: response

List All Bank Accounts
----------------------

.. dcode:: endpoint bank_accounts.index

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.

.. dcode:: scenario bank_accounts.index
   :section-include: response

List All Bank Accounts for an Account
-------------------------------------

.. dcode:: endpoint account_bank_accounts.index

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.

.. dcode:: scenario account_bank_accounts.index
   :section-include: response

Associate a Bank Account with an Account
----------------------------------------

.. dcode:: endpoint marketplace_bank_accounts.update

Request
~~~~~~~

.. dcode:: form bank_account.update
    :include: account_uri

.. dcode:: scenario bank_accounts.associate
   :section-include: request

Response
~~~~~~~~

.. dcode:: scenario bank_accounts.associate
   :section-include: response

Delete a Bank Account
---------------------

Request
~~~~~~~

.. dcode:: endpoint bank_accounts.delete

.. dcode:: scenario bank_accounts.delete
   :section-include: response
