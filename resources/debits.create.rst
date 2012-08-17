=============
debits.create
=============

:uri: /v1/marketplaces/(marketplace:marketplace)/debits
:methods: POST


A debit represents a transfer of funds from a buyer's account to your
marketplace.

A debit may have a hold associated with it if it was created using a
authorizable funding source such as a credit card. Once a debit is
created, you may refund the debit or any fractional amount up to the
entire amount of the original debit. Fees associated with the debit are
refunded proportionally to the amount refunded.

.. autocodecollection:: debits-create
                        _code/api/debits/create-request.*


.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``hold_uri``
     - The uri of the hold to be captured. If not provided a hold is created
       implicitly using the default funding source associated with the account.
   * - ``account_uri``
     - Account being debited. Only required if ``hold_uri`` is not specified.
       Can be implicitly provided by using the debit endpoint that exists under
       an account.
   * - ``amount``
     - Required if ``hold_uri`` is not provided. Must be a positive integer
       greater than 50, values are assumed to be provided as cents, the
       currency is USD. e.g. 100 = $1.00. When the ``hold_uri`` is specified
       the amount may be any fraction of the amount of the hold up to the full
       amount. Once the hold has been captured you cannot capture any remaining
       funds represented by the hold.
   * - ``description``
     - Optional, free text, used for display purposes.
   * - ``appears_on_statement_as``
     - 22 character string shown on the buyer's credit card statement. If not
       provided, the domain name for the marketplace will be shown.
   * - ``source_uri``
     - A ``card_uri`` associated with the account where funds for this debit
       will be drawn from. Not valid if ``hold_uri`` is already provided, if
       otherwise not present the default funding source will be used.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

