Bank Account Verifications
==========================

- `Create a Bank Account Verification`_
- `Retrieve a Bank Account Verification for a Bank Account`_
- `List All Bank Account Verifications for a Bank Account`_
- `Confirm a Bank Account Verification`_

Fields
------

.. dcode:: view bank_account_authentication
    :exclude: _type _uris


Create a Bank Account Verification
----------------------------------

Verifying a bank account will result in *two* micro deposits being sent to bank
account being verified. The amounts of these two deposits must be sent back as
the `amount_1` and `amount_2` parameters when subsequently updating this
verification. These deposits will appear on the bank accounts statement as
`Balanced verification`.

.. dcode:: endpoint bank_account_authentications.create

Response
~~~~~~~~

.. dcode:: scenario bank_account_authentications.create
   :section-include: response


Retrieve a Bank Account Verification for a Bank Account
-------------------------------------------------------

Request
~~~~~~~

.. dcode:: endpoint bank_account_authentications.show

.. dcode:: scenario bank_account_authentications.show
   :section-include: response


List All Bank Account Verifications for a Bank Account
------------------------------------------------------

.. dcode:: endpoint bank_account_authentications.index

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.

.. dcode:: scenario bank_account_authentications.index
   :section-include: response


Confirm a Bank Account Verification
-----------------------------------

When operating on a test bank account, the correct verification amounts are
always 1 and 1.

.. dcode:: endpoint bank_account_authentications.update

Request
~~~~~~~

.. dcode:: form bank_account_authentications.update

.. dcode:: scenario bank_account_authentications.update
   :section-include: response
