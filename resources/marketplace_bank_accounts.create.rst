================================
marketplace_bank_accounts.create
================================

:uri: /v1/marketplaces/(marketplace:marketplace)/bank_accounts
:methods: POST


A bank account represents both a source, and a destination of funds. It
must be associated with an account via a PUT on the account before you
can begin transferring with it.

.. autocodecollection:: bank_accounts-create
                        _code/api/bank_accounts/create-request.*



.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``name``
     - Display name for this account.
   * - ``account_number``
     - The bank account number.
   * - ``bank_code``
     - Routing number in USA.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

