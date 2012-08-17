================================
marketplace_bank_accounts.update
================================

:uri: /v1/marketplaces/(marketplace:marketplace)/bank_accounts/(bank_account:bank_account)
:methods: PUT


You may invalidate a bank account by passing ``is_valid`` with a False
value. Once a bank account has been invalidated it cannot be
re-activated, you must create a new bank account.
`
Fields
******                        


.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``is_valid``
     - False to invalidate this bank account.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

