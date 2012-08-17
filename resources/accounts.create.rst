===============
accounts.create
===============

:uri: /v1/marketplaces/(marketplace:marketplace)/accounts
:methods: POST


Accounts have roles, the ``buyer`` role is assigned to an account that may have
debits created against it, the ``merchant`` role is assigned to accounts that
may have credits created against it. For an account to have the ``merchant``
role assigned you must pass identifying information, to create a ``buyer`` role
you simply provide a funding source that may be debited.

**Creating a buyer**

To become a buyer, you must pass a tokenized card via the ``card_uri`` param or
the full credit card via the ``card`` param.

.. autocodecollection:: accounts-create
                        _code/api/accounts/create/buyer-request.*


Fields
******


.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``email_address``
     - The email address of the account, unique constraint.
   * - ``name``
     - The display name of the account `optional`.
   * - ``card_uri``
     - The URI of the tokenized credit card. **or**
   * - ``card``

     - If you are not tokenizing the card you may pass the data straight
       through.

       .. list-table::
          :widths: 20 80
          :header-rows: 1

          * - Name
            - Description
          * - ``expiration_month``
            - The expiration month as an integer (e.g. 1 for January).
          * - ``expiration_year``
            - The expiration year as an integer (e.g. 2010).
          * - ``card_number``
            - The digits of the credit card number as a string.
          * - ``security_code``
            - The 3-4 digit security code for the card as a string. `optional`
          * - ``name``
            - The name on the card. `optional`


**Creating a merchant**

To create a merchant, you must pass a tokenized merchant identity via the
``merchant_uri`` param or full merchant information via the ``merchant`` param.
A merchant can be represented as a business or a person depending on the entity
being represented by the account.

*Note* If Balanced cannot identify the merchant being created the API will
respond with a **300** status code. A 300 represents multiple choices, you may
re-submit the original request along with more identifying information (e.g.
``tax_id``) **or** you may redirect the user to the location specified in the
redirect where Balanced will identify the user. See
`requests for more information`__

__ #requests-for-more-information

Payload to create a person


.. autocodecollection:: accounts-create
                        _code/api/accounts/create/merchant-person-request.*



.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``email_address``
     - The email address of the account, unique constraint.
   * - ``name``
     - The display name of the account `optional`.
   * - ``bank_account_uri``
     - The URI of the bank account created via balanced.js **or**
   * - ``bank_account``
     - A dictionary of bank account with the following fields:

       .. list-table::
          :widths: 20 80
          :header-rows: 1

          * - Name
            - Description
          * - ``name``
            - Name on the bank account
          * - ``account_number``
            - Bank account number
          * - ``bank_code``
            - Routing number in USA

   * - ``merchant_uri``
     - The URI of the merchant account created during a request for more
       information **or**
   * - ``merchant``
     - A dictionary of merchant information with the following fields:

       .. list-table::
          :widths: 20 80
          :header-rows: 1

          * - Name
            - Description
          * - ``type``
            - ``person``
          * - ``name``
            - The legal name of the merchant.
          * - ``street_address``
            - Address of merchant.
          * - ``postal_code``
            - Postal code of merchant (Zip code in USA).
          * - ``country_code``
            - Country of merchant, ISO 3166-1 alpha-3
          * - ``dob``
            - Legal date of birth of merchant. YYYY-MM-DD
          * - ``phone_number``
            - Contact phone number of merchant.
          * - ``tax_id``
            - Tax ID of merchant (SSN in USA) `optional`

**Business**

When creating a business merchant, you must also specify the principal
representing the business, this payload is the same as for creating a person
based merchant but also includes the registered business information.

.. autocodecollection:: accounts-create
                        _code/api/accounts/create/merchant-business-request.*



.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Name
     - Description
   * - ``email_address``
     - The email address of the account, unique constraint.
   * - ``name``
     - The display name of the account `optional`.
   * - ``bank_account_uri``
     - The URI of the bank account created via balanced.js **or**
   * - ``bank_account``
     - A dictionary of bank account with the following fields:

       .. list-table::
          :widths: 20 80
          :header-rows: 1

          * - Name
            - Description
          * - ``name``
            - Name on the bank account
          * - ``account_number``
            - Bank account number
          * - ``bank_code``
            - Routing number in USA

   * - ``merchant_uri``
     - The URI of the merchant account created during a request for more
       information **or**
   * - ``merchant``
     - A dictionary of merchant information with the following fields:

       .. list-table::
          :widths: 20 80
          :header-rows: 1

          * - Name
            - Description
          * - ``type``
            - ``business``
          * - ``name``
            - The registered business name of the merchant
          * - ``street_address``
            - Address of merchant
          * - ``postal_code``
            - Postal code of merchant (Zip code in USA)
          * - ``country_code``
            - Country of merchant, ISO 3166-1 alpha-3
          * - ``phone_number``
            - Contact phone number of merchant
          * - ``tax_id``
            - Tax ID of merchant (EIN in USA)
          * - ``person``
            - Legal data for the principal of the merchant

              .. list-table::
                  :widths: 20 80
                  :header-rows: 1

                  * - Name
                    - Description
                  * - ``name``
                    - The legal name of principal.
                  * - ``street_address``
                    - Address of principal.
                  * - ``postal_code``
                    - Postal code of principal (Zip code in USA).
                  * - ``country_code``
                    - Country of principal, ISO 3166-1 alpha-3.
                  * - ``dob``
                    - Legal date of birth of principal YYYY-MM-DD.
                  * - ``phone_number``
                    - Contact phone number of principal
                  * - ``tax_id``
                    - Tax ID of principal (SSN in USA) `optional`

