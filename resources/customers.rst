Customers
=========

- `Create a Customer`_
- `Retrieve a Customer`_
- `List all Customers`_
- `Update a Customer`_

Fields
------

``bank_accounts_uri``
    **string**. URI for all bank accounts associated with the customer.

``business_name``
    **string**. Full business name if the customer is a business. If there is a
    business name and EIN present, the customer will be treated as a
    business instead of a person.

``cards_uri``
    **string**. URI for all cards associated with the customer.

``city``
    **string**. City of the person or business.

``created_at``
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
    customer was created.

``credits_uri``
    **string**. URI for all credits associated with the customer.

``debits_uri``
    **string**. URI for all debits associated with the customer.

``destination_uri``
    **string**. The default bank account that will be credited.

``dob``
    **string**. Date of birth of the customer or representative of the business.

``ein``
    **string**. Employee Identification Number of the business if the customer is a
    business. If there is a business name and EIN present, the customer
    will be treated as a business instead of a person.

``email_address``
    **string**. Email address of the person or business.

``first_name``
    **string**. First name of the customer or representative of the business.

``holds_uri``
    **string**. URI for all holds associated with the customer.

``id``
    **string**.

``is_identity_verified``
    **boolean**. Indicates if Balanced was able to match the identify information
    provided for the customer.

``last_name``
    **string**. Last name of the customer or representative of the business.

``meta``
    **key-value**. A single-level dictionary of string-type key/value pairs.

``phone_number``
    **string**. Phone number of the person or business.

``postal_code``
    **string**. Postal code/zip code of the person or business.

``refunds_uri``
    **string**. URI for all refunds associated with the customer.

``source_uri``
    **string**. The default credit card that will be debited.

``ssn_last_4``
    **string**. Last four digits of the Social Security Number of the customer or
    representative of the business.

``state``
    **string**. State of the person or business.

``street_address``
    **string**. Street address of the person or business.

``transactions_uri``
    **string**. URI for all transactions associated with the customer.

``uri``
    **string**. The URI of this customer.

Create a Customer
-----------------

.. code::
    POST /v1/customers

Request
~~~~~~~

``first_name``
    *optional* **string**. First name of the customer or representative of the business. Defaults to ``null``.

``last_name``
    *optional* **string**. Last name of the customer or representative of the business. Defaults to ``null``.

``email_address``
    *optional* **string** or **null**. Email address of the customer. It must be **unique** among all customers
    on your marketplace. Defaults to ``null``.

``meta``
    *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``ssn_last_4``
    *optional* **string**. Last four digits of the Social Security Number of the customer or
    representative of the business. Defaults to ``null``.

``business_name``
    *optional* **string**. Full business name if the customer is a business. If there is a business
    name and EIN present, the customer will be treated as a business instead
    of a person. Defaults to ``null``.

``street_address``
    *optional* **string**. Street address of the person or business. Defaults to ``null``.

``city``
    *optional* **string**. City of the person or business. Defaults to ``null``.

``state``
    *optional* **string**.

``postal_code``
    *optional* **string**. Postal code/zip code of the person or business. Defaults to ``null``.

``country_code``
    *optional* **string**. Country of the person or business. Defaults to ``USA``.

``phone_number``
    *optional* **string**. Phone number of the person or business. Defaults to ``null``.

``dob``
    *optional* **string**. Date of birth of the customer or representative of the business. Defaults to ``null``.

``ein``
    *optional* **string**. Employee Identification Number of the business if the customer is a
    business. If there is a business name and EIN present, the customer will
    be treated as a business instead of a person. Defaults to ``null``.


Body
^^^^

.. code:: javascript

    {
        "id": null
    }

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
      "phone_number": null, 
      "_type": "customer", 
      "last_name": null, 
      "source_uri": null, 
      "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC28tw6T0rE7bJlxly6B8SFH/bank_accounts", 
      "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC28tw6T0rE7bJlxly6B8SFH/holds", 
      "meta": {}, 
      "postal_code": null, 
      "destination_uri": null, 
      "business_name": null, 
      "email_address": null, 
      "id": "AC28tw6T0rE7bJlxly6B8SFH", 
      "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC28tw6T0rE7bJlxly6B8SFH/credits", 
      "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC28tw6T0rE7bJlxly6B8SFH/cards", 
      "city": null, 
      "first_name": null, 
      "ssn_last_4": null, 
      "dob": null, 
      "created_at": "2013-05-01T17:26:35.782037Z", 
      "is_identity_verified": false, 
      "uri": "/v1/customers/AC28tw6T0rE7bJlxly6B8SFH", 
      "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC28tw6T0rE7bJlxly6B8SFH/refunds", 
      "state": null, 
      "_uris": {
        "holds_uri": {
          "_type": "page", 
          "key": "holds"
        }, 
        "bank_accounts_uri": {
          "_type": "page", 
          "key": "bank_accounts"
        }, 
        "refunds_uri": {
          "_type": "page", 
          "key": "refunds"
        }, 
        "debits_uri": {
          "_type": "page", 
          "key": "debits"
        }, 
        "transactions_uri": {
          "_type": "page", 
          "key": "transactions"
        }, 
        "credits_uri": {
          "_type": "page", 
          "key": "credits"
        }, 
        "cards_uri": {
          "_type": "page", 
          "key": "cards"
        }
      }, 
      "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC28tw6T0rE7bJlxly6B8SFH/debits", 
      "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC28tw6T0rE7bJlxly6B8SFH/transactions", 
      "street_address": null, 
      "ein": null
    }

Retrieve a Customer
-------------------

.. code::
    HEAD /v1/customers/:customer_id
    GET /v1/customers/:customer_id

Response
~~~~~~~~


Headers
^^^^^^^

.. code::

    Status: 200 OK


Body
^^^^

.. code:: javascript

    {
      "phone_number": null, 
      "_type": "customer", 
      "last_name": null, 
      "source_uri": null, 
      "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2cfUU6bADHJZLCOBoj3cvT/bank_accounts", 
      "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2cfUU6bADHJZLCOBoj3cvT/holds", 
      "meta": {}, 
      "postal_code": null, 
      "destination_uri": null, 
      "business_name": null, 
      "email_address": null, 
      "id": "AC2cfUU6bADHJZLCOBoj3cvT", 
      "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2cfUU6bADHJZLCOBoj3cvT/credits", 
      "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2cfUU6bADHJZLCOBoj3cvT/cards", 
      "city": null, 
      "first_name": null, 
      "ssn_last_4": null, 
      "dob": null, 
      "created_at": "2013-05-01T17:26:39.143564Z", 
      "is_identity_verified": false, 
      "uri": "/v1/customers/AC2cfUU6bADHJZLCOBoj3cvT", 
      "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2cfUU6bADHJZLCOBoj3cvT/refunds", 
      "state": null, 
      "_uris": {
   