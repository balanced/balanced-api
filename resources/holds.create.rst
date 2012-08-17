============
holds.create
============

:uri: /v1/marketplaces/(marketplace:marketplace)/holds
:methods: POST


A hold represents a reservation of money from a buyer's account to your
marketplace.

A hold is guaranteed valid for seven days from the date of creation as
represented by the ``expires_at`` field. To capture the funds and
transfer them to your marketplace you must create a debit from the
hold.

When you capture a hold, you may capture any fraction of the original
amount up to the full amount. Once a hold has been captured it is
marked as expired and you cannot capture any remaining value.

.. autocodecollection:: holds-create
                        _code/api/holds/create-request.*



.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``account_uri``
     - Account being debited. Can be implicitly provided by using the hold
       endpoint that exists under an account.
   * - ``amount``
     - Must be a positive integer greater than 50, values are assumed to be
       provided as cents, the currency is USD. e.g. 100 = $1.00.
   * - ``description``
     - Optional, free text, used for display purposes.
   * - ``appears_on_statement_as``
     - 22 character string shown on the buyer's credit card statement. If not
       provided, the domain name for the marketplace will be shown.
   * - ``source_uri``
     - A ``card_uri`` associated with the account where funds for this debit
       will be drawn from. If not present the default funding source will be
       used.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

