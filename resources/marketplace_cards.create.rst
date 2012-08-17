========================
marketplace_cards.create
========================

:uri: /v1/marketplaces/(marketplace:marketplace)/cards
:methods: POST


A card represents a source of funds. It must be associated with an
account via a PUT on the account before you can begin transferring
with it.

.. autocodecollection:: cards-create
                        _code/api/cards/create-request.*
                                                


.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``name``
     - Name associated with this card.
   * - ``card_number``
     - The card number.
   * - ``expiration_month``
     - 2 character string representing the month this card will expire. e.g.
       "01"
   * - ``expiration_year``
     - 4 character string representing the year this card will expire.
       e.g. "2012".
   * - ``security_code``
     - Optional, 3-4 digit security code. Sometimes called a CVV2.
   * - ``meta``
     - A single level dictionary of key/value pairs, both keys and values must
       be strings.
        

