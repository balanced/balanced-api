========================
marketplace_cards.update
========================

:uri: /v1/marketplaces/(marketplace:marketplace)/cards/(card:card)
:methods: PUT


You may invalidate a card by passing ``is_valid`` with a False
value. Once a card has been invalidated it cannot be re-activated, you
must create a new card.

Fields
******


.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``is_valid``
     - False to invalidate this card.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

