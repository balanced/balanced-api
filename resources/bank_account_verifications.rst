Bank Account Verifications
==========================

- `Create a Bank Account Verification`_
- `Retrieve a Bank Account Verification for a Bank Account`_
- `List All Bank Account Verifications for a Bank Account`_
- `Confirm a Bank Account Verification`_

Fields
------

``attempts``
   **integer**.

``id``
   **string**.

``remaining_attempts``
   **integer**.

``state``
   **string**. One of ``pending``, ``verified``, ``failed``.

``uri``
   **string**.

Create a Bank Account Verification
----------------------------------

Verifying a bank account will result in *two* micro deposits being sent to bank
account being verified. The amounts of these two deposits must be sent back as
the `amount_1` and `amount_2` parameters when subsequently updating this
verification. These deposits will appear on the bank accounts statement as
`Balanced verification`.

.. code::


   POST /v1/bank_accounts/:bank_account_id/verifications

Response
~~~~~~~~


Headers
^^^^^^^

.. code::

   Status: 201 CREATED


Body
^^^^

.. code:: javascript

   {
     "_type": "bank_account_authentication", 
     "_uris": {}, 
     "state": "pending", 
     "id": "BZ6Y4OEfc18M1GWUj8hC430K", 
     "attempts": 0, 
     "remaining_attempts": 3, 
     "uri": "/v1/bank_accounts/BA6XqzI1Lr6ut0KwVQshePbi/verifications/BZ6Y4OEfc18M1GWUj8hC430K"
   }

Retrieve a Bank Account Verification for a Bank Account
-------------------------------------------------------

Request
~~~~~~~

.. code::


   HEAD /v1/bank_accounts/:bank_account_id/verifications/:verification_id
   GET /v1/bank_accounts/:bank_account_id/verifications/:verification_id


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "_type": "bank_account_authentication", 
     "_uris": {}, 
     "state": "pending", 
     "id": "BZ6ZwuztRVmnLhMUvAEWxrqa", 
     "attempts": 0, 
     "remaining_attempts": 3, 
     "uri": "/v1/bank_accounts/BA6YOiksYHMikBnjNX69f1fN/verifications/BZ6ZwuztRVmnLhMUvAEWxrqa"
   }

List All Bank Account Verifications for a Bank Account
------------------------------------------------------

.. code::


   HEAD /v1/bank_accounts/:bank_account_id/verifications
   GET /v1/bank_accounts/:bank_account_id/verifications

Request
~~~~~~~

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "first_uri": "/v1/bank_accounts/BA70x0zvREKMTn9iQe9PeNDp/verifications?limit=10&offset=0", 
     "_type": "page", 
     "items": [
       {
         "_type": "bank_account_authentication", 
         "attempts": 0, 
         "uri": "/v1/bank_accounts/BA70x0zvREKMTn9iQe9PeNDp/verifications/BZ71gxQuhzxp1jglOPl7qTY4", 
         "state": "pending", 
         "_uris": {}, 
         "id": "BZ71gxQuhzxp1jglOPl7qTY4", 
         "remaining_attempts": 3
       }
     ], 
     "previous_uri": null, 
     "uri": "/v1/bank_accounts/BA70x0zvREKMTn9iQe9PeNDp/verifications?limit=10&offset=0", 
     "_uris": {
       "first_uri": {
         "_type": "page", 
         "key": "first"
       }, 
       "next_uri": {
         "_type": "page", 
         "key": "next"
       }, 
       "previous_uri": {
         "_type": "page", 
         "key": "previous"
       }, 
       "last_uri": {
         "_type": "page", 
         "key": "last"
       }
     }, 
     "limit": 10, 
     "offset": 0, 
     "total": 1, 
     "next_uri": null, 
     "last_uri": "/v1/bank_accounts/BA70x0zvREKMTn9iQe9PeNDp/verifications?limit=10&offset=0"
   }

Confirm a Bank Account Verification
-----------------------------------

When operating on a test bank account, the correct verification amounts are
always 1 and 1.

.. code::


   PUT /v1/bank_accounts/:bank_account_id/verifications/:verification_id

Request
~~~~~~~

``amount_1``
   *required* **integer**.

``amount_2``
   *required* **integer**.


Headers
^^^^^^^

.. code::

   Status: 200 OK


Body
^^^^

.. code:: javascript

   {
     "_type": "bank_account_authentication", 
     "_uris": {}, 
     "state": "verified", 
     "id": "BZ72YLcyWbUTTy2GwigoUYsM", 
     "attempts": 1, 
     "remaining_attempts": 2, 
     "uri": "/v1/bank_accounts/BA72cPO5x2E3Plgaxt0K56eQ/verifications/BZ72YLcyWbUTTy2GwigoUYsM"
   }

