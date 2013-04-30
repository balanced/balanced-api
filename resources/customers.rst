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
    **object**.

``cards_uri``
    **string**. URI for all cards associated with the customer.

``city``
    **object**.

``created_at``
    **string**. `ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this
    customer was created.

``credits_uri``
    **string**. URI for all credits associated with the customer.

``debits_uri``
    **string**. URI for all debits associated with the customer.

``destination_uri``
    **object**.

``dob``
    **object**.

``ein``
    **object**.

``email_address``
    **string**. Email address of the person or business.

``first_name``
    **object**.

``holds_uri``
    **string**. URI for all holds associated with the customer.

``id``
    **string**.

``is_identity_verified``
    **object**.

``last_name``
    **object**.

``merchant_uri``
    **object**.

``meta``
    **key-value**. A single-level dictionary of string-type key/value pairs.

``phone_number``
    **object**.

``postal_code``
    **object**.

``refunds_uri``
    **string**. URI for all refunds associated with the customer.

``source_uri``
    **object**.

``ssn_last_4``
    **object**.

``state``
    **object**.

``street_address``
    **object**.

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
      "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5PVpbYfqJIj9WdIvQDR7Wh/bank_accounts", 
      "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5PVpbYfqJIj9WdIvQDR7Wh/holds", 
      "meta": {}, 
      "postal_code": null, 
      "destination_uri": null, 
      "business_name": null, 
      "email_address": null, 
      "id": "AC5PVpbYfqJIj9WdIvQDR7Wh", 
      "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5PVpbYfqJIj9WdIvQDR7Wh/credits", 
      "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5PVpbYfqJIj9WdIvQDR7Wh/cards", 
      "city": null, 
      "first_name": null, 
      "ssn_last_4": null, 
      "dob": null, 
      "created_at": "2013-04-30T00:20:23.415914Z", 
      "is_identity_verified": false, 
      "uri": "/v1/customers/AC5PVpbYfqJIj9WdIvQDR7Wh", 
      "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5PVpbYfqJIj9WdIvQDR7Wh/refunds", 
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
      "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5PVpbYfqJIj9WdIvQDR7Wh/debits", 
      "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5PVpbYfqJIj9WdIvQDR7Wh/transactions", 
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
      "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5SLAAFOvYOnVoIw7dNdlpn/bank_accounts", 
      "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5SLAAFOvYOnVoIw7dNdlpn/holds", 
      "meta": {}, 
      "postal_code": null, 
      "destination_uri": null, 
      "business_name": null, 
      "email_address": null, 
      "id": "AC5SLAAFOvYOnVoIw7dNdlpn", 
      "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5SLAAFOvYOnVoIw7dNdlpn/credits", 
      "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5SLAAFOvYOnVoIw7dNdlpn/cards", 
      "city": null, 
      "first_name": null, 
      "ssn_last_4": null, 
      "dob": null, 
      "created_at": "2013-04-30T00:20:25.942603Z", 
      "is_identity_verified": false, 
      "uri": "/v1/customers/AC5SLAAFOvYOnVoIw7dNdlpn", 
      "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5SLAAFOvYOnVoIw7dNdlpn/refunds", 
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
      "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5SLAAFOvYOnVoIw7dNdlpn/debits", 
      "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC5SLAAFOvYOnVoIw7dNdlpn/transactions", 
      "street_address": null, 
      "ein": null
    }

List all Customers
------------------

.. code::
    HEAD /v1/customers
    GET /v1/customers

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
      "first_uri": "/v1/customers?limit=10&offset=0", 
      "_type": "page", 
      "items": [
        {
          "last_name": null, 
          "meta": {}, 
          "postal_code": null, 
          "business_name": null, 
          "email_address": null, 
          "id": "ACQc1YTgeCLX2nPG3oK6Q01", 
          "city": null, 
          "first_name": null, 
          "state": null, 
          "phone_number": null, 
          "_type": "customer", 
          "source_uri": null, 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/ACQc1YTgeCLX2nPG3oK6Q01/bank_accounts", 
          "_uris": {
            "transactions_uri": {
              "_type": "page", 
              "key": "transactions"
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
            "holds_uri": {
              "_type": "page", 
              "key": "holds"
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
          "destination_uri": null, 
          "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/ACQc1YTgeCLX2nPG3oK6Q01/holds", 
          "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/ACQc1YTgeCLX2nPG3oK6Q01/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/ACQc1YTgeCLX2nPG3oK6Q01/cards", 
          "ssn_last_4": null, 
          "dob": null, 
          "created_at": "2013-04-29T22:06:57.090072Z", 
          "is_identity_verified": false, 
          "uri": "/v1/customers/ACQc1YTgeCLX2nPG3oK6Q01", 
          "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/ACQc1YTgeCLX2nPG3oK6Q01/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/ACQc1YTgeCLX2nPG3oK6Q01/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/ACQc1YTgeCLX2nPG3oK6Q01/transactions", 
          "street_address": null, 
          "ein": null
        }, 
        {
          "last_name": null, 
          "meta": {}, 
          "postal_code": null, 
          "business_name": null, 
          "email_address": null, 
          "id": "AC3CPbFFGjziqwyOhzKRXOx", 
          "city": null, 
          "first_name": null, 
          "state": null, 
          "phone_number": null, 
          "_type": "customer", 
          "source_uri": null, 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3CPbFFGjziqwyOhzKRXOx/bank_accounts", 
          "_uris": {
            "transactions_uri": {
              "_type": "page", 
              "key": "transactions"
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
            "holds_uri": {
              "_type": "page", 
              "key": "holds"
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
          "destination_uri": null, 
          "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3CPbFFGjziqwyOhzKRXOx/holds", 
          "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3CPbFFGjziqwyOhzKRXOx/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3CPbFFGjziqwyOhzKRXOx/cards", 
          "ssn_last_4": null, 
          "dob": null, 
          "created_at": "2013-04-29T22:06:13.907869Z", 
          "is_identity_verified": false, 
          "uri": "/v1/customers/AC3CPbFFGjziqwyOhzKRXOx", 
          "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3CPbFFGjziqwyOhzKRXOx/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3CPbFFGjziqwyOhzKRXOx/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3CPbFFGjziqwyOhzKRXOx/transactions", 
          "street_address": null, 
          "ein": null
        }, 
        {
          "last_name": null, 
          "meta": {}, 
          "postal_code": null, 
          "business_name": null, 
          "email_address": null, 
          "id": "AC3ihypDQHSIwsHYofsA45X", 
          "city": null, 
          "first_name": null, 
          "state": null, 
          "phone_number": null, 
          "_type": "customer", 
          "source_uri": null, 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3ihypDQHSIwsHYofsA45X/bank_accounts", 
          "_uris": {
            "transactions_uri": {
              "_type": "page", 
              "key": "transactions"
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
            "holds_uri": {
              "_type": "page", 
              "key": "holds"
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
          "destination_uri": null, 
          "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3ihypDQHSIwsHYofsA45X/holds", 
          "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3ihypDQHSIwsHYofsA45X/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3ihypDQHSIwsHYofsA45X/cards", 
          "ssn_last_4": null, 
          "dob": null, 
          "created_at": "2013-04-29T22:06:13.613286Z", 
          "is_identity_verified": false, 
          "uri": "/v1/customers/AC3ihypDQHSIwsHYofsA45X", 
          "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3ihypDQHSIwsHYofsA45X/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3ihypDQHSIwsHYofsA45X/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC3ihypDQHSIwsHYofsA45X/transactions", 
          "street_address": null, 
          "ein": null
        }, 
        {
          "last_name": null, 
          "meta": {}, 
          "postal_code": null, 
          "business_name": null, 
          "email_address": null, 
          "id": "AC2CSNCslIEOdV6ldiIUHFD", 
          "city": null, 
          "first_name": "Benny", 
          "state": null, 
          "phone_number": null, 
          "_type": "customer", 
          "source_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2CSNCslIEOdV6ldiIUHFD/cards/CC4apLxsdhfQB6cktwjTCpPz", 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2CSNCslIEOdV6ldiIUHFD/bank_accounts", 
          "_uris": {
            "transactions_uri": {
              "_type": "page", 
              "key": "transactions"
            }, 
            "source_uri": {
              "_type": "card", 
              "key": "source"
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
            "holds_uri": {
              "_type": "page", 
              "key": "holds"
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
          "destination_uri": null, 
          "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2CSNCslIEOdV6ldiIUHFD/holds", 
          "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2CSNCslIEOdV6ldiIUHFD/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2CSNCslIEOdV6ldiIUHFD/cards", 
          "ssn_last_4": null, 
          "dob": null, 
          "created_at": "2013-04-29T22:06:13.019595Z", 
          "is_identity_verified": false, 
          "uri": "/v1/customers/AC2CSNCslIEOdV6ldiIUHFD", 
          "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2CSNCslIEOdV6ldiIUHFD/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2CSNCslIEOdV6ldiIUHFD/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2CSNCslIEOdV6ldiIUHFD/transactions", 
          "street_address": null, 
          "ein": null
        }, 
        {
          "last_name": null, 
          "meta": {}, 
          "postal_code": "90210", 
          "email_address": "fee@poundpay.com", 
          "id": "AC2lWjCY4zROvEiBwbarkgF", 
          "city": "Nowhere", 
          "first_name": null, 
          "state": "CA", 
          "phone_number": "+16505551212", 
          "_type": "customer", 
          "source_uri": null, 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lWjCY4zROvEiBwbarkgF/bank_accounts", 
          "_uris": {
            "transactions_uri": {
              "_type": "page", 
              "key": "transactions"
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
            "holds_uri": {
              "_type": "page", 
              "key": "holds"
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
          "destination_uri": null, 
          "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lWjCY4zROvEiBwbarkgF/holds", 
          "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lWjCY4zROvEiBwbarkgF/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lWjCY4zROvEiBwbarkgF/cards", 
          "ssn_last_4": null, 
          "dob": null, 
          "created_at": "2013-04-29T22:06:12.776575Z", 
          "is_identity_verified": true, 
          "uri": "/v1/customers/AC2lWjCY4zROvEiBwbarkgF", 
          "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lWjCY4zROvEiBwbarkgF/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lWjCY4zROvEiBwbarkgF/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lWjCY4zROvEiBwbarkgF/transactions", 
          "street_address": "123 Fake St"
        }, 
        {
          "_type": "customer", 
          "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lR7IRirJS04W8JOrwcut/holds", 
          "_uris": {
            "transactions_uri": {
              "_type": "page", 
              "key": "transactions"
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
            "holds_uri": {
              "_type": "page", 
              "key": "holds"
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
          "source_uri": null, 
          "is_identity_verified": false, 
          "uri": "/v1/customers/AC2lR7IRirJS04W8JOrwcut", 
          "id": "AC2lR7IRirJS04W8JOrwcut", 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lR7IRirJS04W8JOrwcut/bank_accounts", 
          "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lR7IRirJS04W8JOrwcut/refunds", 
          "meta": {}, 
          "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lR7IRirJS04W8JOrwcut/debits", 
          "first_name": null, 
          "destination_uri": null, 
          "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lR7IRirJS04W8JOrwcut/transactions", 
          "email_address": "escrow@poundpay.com", 
          "created_at": "2013-04-29T22:06:12.775468Z", 
          "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lR7IRirJS04W8JOrwcut/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2lR7IRirJS04W8JOrwcut/cards"
        }, 
        {
          "last_name": null, 
          "meta": {}, 
          "postal_code": "90210", 
          "email_address": "whc@example.org", 
          "id": "AC2eoSlcFiSNmnOs8xMORgZ", 
          "city": "Nowhere", 
          "first_name": "William", 
          "state": "CA", 
          "phone_number": "+16505551212", 
          "_type": "customer", 
          "source_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/bank_accounts/BA2m2P7ZrNfDaEtrPVU0xcR", 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/bank_accounts", 
          "_uris": {
            "holds_uri": {
              "_type": "page", 
              "key": "holds"
            }, 
            "source_uri": {
              "_type": "bank_account", 
              "key": "source"
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
            "destination_uri": {
              "_type": "bank_account", 
              "key": "destination"
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
          "destination_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/bank_accounts/BA2m2P7ZrNfDaEtrPVU0xcR", 
          "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/holds", 
          "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/cards", 
          "ssn_last_4": null, 
          "dob": null, 
          "created_at": "2013-04-29T22:06:12.668516Z", 
          "is_identity_verified": true, 
          "uri": "/v1/customers/AC2eoSlcFiSNmnOs8xMORgZ", 
          "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC2eoSlcFiSNmnOs8xMORgZ/transactions", 
          "street_address": "123 Fake St"
        }
      ], 
      "previous_uri": "/v1/customers?limit=10&offset=70", 
      "uri": "/v1/customers?limit=10&offset=80", 
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
      "offset": 80, 
      "total": 87, 
      "next_uri": null, 
      "last_uri": "/v1/customers?limit=10&offset=80"
    }

Update a Customer
-----------------

.. code::
    PUT /v1/customers/:customer_id

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
      "bank_accounts_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC657FefOc2zTfPDpZiv6oUh/bank_accounts", 
      "holds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC657FefOc2zTfPDpZiv6oUh/holds", 
      "meta": {}, 
      "postal_code": null, 
      "destination_uri": null, 
      "business_name": null, 
      "email_address": null, 
      "id": "AC657FefOc2zTfPDpZiv6oUh", 
      "credits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC657FefOc2zTfPDpZiv6oUh/credits", 
      "cards_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC657FefOc2zTfPDpZiv6oUh/cards", 
      "city": null, 
      "first_name": null, 
      "ssn_last_4": null, 
      "dob": null, 
      "created_at": "2013-04-30T00:20:36.928337Z", 
      "is_identity_verified": false, 
      "uri": "/v1/customers/AC657FefOc2zTfPDpZiv6oUh", 
      "refunds_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC657FefOc2zTfPDpZiv6oUh/refunds", 
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
      "debits_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC657FefOc2zTfPDpZiv6oUh/debits", 
      "transactions_uri": "/v1/marketplaces/TEST-MP2e8BX5gqnjEVPgguWuE2R/accounts/AC657FefOc2zTfPDpZiv6oUh/transactions", 
      "street_address": null, 
      "ein": null
    }

