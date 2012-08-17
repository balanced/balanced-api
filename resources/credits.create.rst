==============
credits.create
==============

:uri: /v1/marketplaces/(marketplace:marketplace)/credits
:methods: POST


A credit represents a transfer of money from your marketplace to a
merchant's account.

By default a credit will be sent to the most recently added funding
destination associated with an account but you may specify a specific
funding destination when creating a credit.

A credit is not refundable, to transfer money back to your marketplace
you must create a debit.

.. autocodecollection:: credits-create
                        _code/api/credits/create-request.*



.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``account_uri``
     - Account being credited. Can be implicitly provided by using the
       ``credit_uri`` endpoint that exists under an account.
   * - ``amount``
     - Must be a positive integer greater than 50, values are assumed to be
       provided as cents, the currency is USD. e.g. 100 = $1.00.
   * - ``description``
     - Optional, free text, used for display purposes.
   * - ``appears_on_statement_as``
     - 22 character string shown on the merchant's bank statement. If not
       provided, the domain name for the marketplace will be shown.
   * - ``destination_uri``
     - A ``bank_account_uri`` associated with the account where funds for
       this credit will be sent to. If not present the default funding
       destination will be used.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

