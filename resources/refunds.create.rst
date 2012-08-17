==============
refunds.create
==============

:uri: /v1/marketplaces/(marketplace:marketplace)/refunds
:methods: POST


A refund represents a reversal of funds associated with a debit. A
debit can have many refunds associated with it up to the total amount
of the original debit. Funds are returned to your Marketplace's
escrow account.

Any fees associated with the original debit are refunded proportionally
to the amount refunded.

.. autocodecollection:: refunds-create
                        _code/api/refunds/create-request.*



.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``debit_uri``
     - The debit being refunded. May be omitted when POSTing to the
       ``refunds_uri`` associated with a debit.
   * - ``amount``
     - The amount to refund represented in cents, the currency is USD. If
       omitted, the total amount of the original debit that has not been
       refunded will be used.
   * - ``description``
     - Optional, free text, used for display purposes.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

