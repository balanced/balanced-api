===============
accounts.update
===============

:uri: /v1/marketplaces/(marketplace:marketplace)/accounts/(account:account)
:methods: PUT


Allows partial updates to accounts within your marketplace, all
parameters are optional.


.. list-table::
    :widths: 20 80
    :header-rows: 1

    * - Name
      - Description
    * - ``email_address``
      - The email address of the account, unique constraint.
    * - ``name``
      - The display name of the account `optional`.
    * - ``merchant_uri``
      - The URI of a merchant account created during a request
        for more information
    * - ``card_uri``
      - The URI of a credit card tokenized via balanced.js. Setting
        this will associate the card with this account as well as
        setting it as the default funding source for this account.
    * - ``bank_account_uri``
      - The URI of a bank account tokenized via balanced.js. Setting
        this will associate the bank account with this account as well
        as setting it as the default funding destination **and**
        funding source.

        

