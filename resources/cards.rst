=====
Cards
=====

A card represents a source of funds, such as a debit or credit card. It must be
associated with an account via a PUT on the account before transactions can be
made with it. Card's are composed of the following fields:

.. _card-view:

    ``id``
        *String*. The card identifier.

    ``uri``
        *Object*. URI useed to resolve to the card.

    ``account``
        *Object*. The account this card is associated with. See `account view <./accounts.rst#account-view>`_.

    ``created_at``
        *Timestamp*. When this card was created.

    ``street_address``
        *String*. Street address.

    ``postal_code``
        *String*. Postal code (zip code in the USA).

    ``country_code``
        *String*. `ISO-3166-3 <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ three-character country code.

    ``name``
        *String*. The name on the card.

    ``expiration_month``
        *String*. Card's expiration month.

    ``expiration_year``
        *String*. Card's expiration year.

    ``card_type``
        *String*. The type of the card. This field has been deprecated in favor of ``brand``.

    ``meta``
        *Object*. A single-level dictionary of string-type key/value pairs.

    ``last_four``
        *String*. Last four digits of the card.

    ``brand``
        *Object*. The brand of the card. One of:

            - Visa
            - MasterCard
            - American Express
            - Discover

    ``is_valid``
        *Boolean*. A boolean value indicating whether or not the card is valid.

A card in a response will have all of these fields. For example:

    .. code:: json

        {
            "card_type": "amex", 
            "account": null, 
            "name": null, 
            "expiration_year": 2015, 
            "created_at": "2012-08-24T01:35:03.068130Z", 
            "brand": "American Express", 
            "uri": "/v1/marketplaces/TEST-MP4FhjzABEH4sSj74WllZG9B/cards/CC4Fs2DoDjEOfgYNgxoDBlPd", 
            "expiration_month": 7, 
            "is_valid": true, 
            "meta": {}, 
            "last_four": "1111", 
            "id": "CC4Fs2DoDjEOfgYNgxoDBlPd"
        }


Operate on card's using the following endpoints:

    - `Create a Card <./cards.rst#create-a-card>`_
    - `Index Cards <./cards.rst#index-cards>`_
    - `Update a Card <./cards.rst#update-a-card>`_
    - `Show a Card <./cards.rst#show-a-card>`_
    - `Create and Associate a Card <./cards.rst#create-and-associate-a-card>`_
    - `Show an Account Card <./cards.rst#show-an-account-card>`_
    - `Update an Account Card <./cards.rst#update-an-account-card>`_


Create a Card
=============

uri: /v1/`marketplaces <./marketplaces.rst>`_/:*marketplace*/`cards <./cards.rst>`_
method: ``POST``

Creates a card. The resulting card should then be associated with an account.
This process of creating and then associated a card is commonly called
*tokenization*.


Request
-------

.. _card-create-form-required:

Required fields:

    ``card_number``
        *String*. The digits of the credit card number.

    ``expiration_year``
        *Integer*. Expiration year. The current year or later. Value must be **<=** ``9999``.

    ``expiration_month``
        *Integer*. Expiration month (e.g. 1 for January). If ``expiration_year`` is the current year then current month or later,
        otherwise 1. Value must be **<=** ``12``.

.. _card-create-form-optional:

Optional fields:
    
    ``security_code``
        *String*. The 3-4 digit security code for the card.

    ``name``
        *String*. Sequence of characters. Length must be **<=** ``128``.

    ``phone_number``
        *String*. E.164 formatted phone number. Length must be **<=** ``15``.

    ``street_address``
        *string*. Street address.

    ``city``
        *String*. City.

    Exactly one of
        ``region``
            *String*. Region (e.g. state, province, etc). This field has been
            **deprecated**.            

        ``state``
            *String*. US state. This field has been **deprecated**.

    ``postal_code``
        *String*. Postal code. This is known as a zip code in the USA.
    
    ``country_code``
        *String*. `ISO-3166-3 <http://www.iso.org/iso/home/standards/country_codes.htm#2012_iso3166-3>`_ three character country code. Defaults to ``USA``.
    
    ``meta``
        *Object*. Single level mapping from string keys to string values. Defaults to ``{   }``. 

    ``is_valid``
        *Boolean*. Indicates whether the card is active (``true``) or has been deactivated
        (``false``). Defaults to ``true``.


A card create request will have all required fields and whichever optional ones
desired. For example:

    .. code:: json

        {
            "expiration_month": "07", 
            "card_number": "4111111111111111", 
            "expiration_year": "2015"
        }


Response
--------

The status code of the response indicates success (**201**) or failure
(**4xx**).


On success the body includes the card fields described `previously <card-view>`_:

    .. code:: json

        {
            "card_type": "amex", 
            "account": null, 
            "name": null, 
            "expiration_year": 2015, 
            "created_at": "2012-08-24T01:35:03.068130Z", 
            "brand": "American Express", 
            "uri": "/v1/marketplaces/TEST-MP4FhjzABEH4sSj74WllZG9B/cards/CC4Fs2DoDjEOfgYNgxoDBlPd", 
            "expiration_month": 7, 
            "is_valid": true, 
            "meta": {}, 
            "last_four": "1111", 
            "id": "CC4Fs2DoDjEOfgYNgxoDBlPd"
        }



On failure the body includes the standard error fields. Card creation can fail
with one of the following errors:

    ``card-not-validated``
        The card could not be validated -- either the card number or security
        code may be wrong.

        .. code:: json

            {
                "status": "Conflict", 
                "category_code": "card-not-validated", 
                "additional": null, 
                "status_code": 409, 
                "category_type": "logical", 
                "extras": {}, 
                "request_id": "OHMe4f2423aedc611e19a4080ee7316ae43", 
                "description": "Card cannot be validated. Your request id is OHMe4f2423aedc611e19a4080ee7316ae43."
            }

