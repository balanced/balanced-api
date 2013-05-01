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

``facebook_id``
    **string**. Facebook ID or username of the customer or representative of the
    business.

``holds_uri``
    **string**. URI for all holds associated with the customer.

``id``
    **string**.

``is_identity_verified``
    **boolean**. Indicates if Balanced was able to match the identify information
    provided for the customer.

``meta``
    **key-value**. A single-level dictionary of string-type key/value pairs.

``name``
    **string**. Name of the customer or representative of the business.

``phone_number``
    **string**. Phone number of the person or business.

``postal_code``
    **string**. Postal code/zip code of the person or business.

``refunds_uri``
    **string**. URI for all refunds associated with the customer.

``source_uri``
    **string**. The default credit card that will be debited.

``ssn_last4``
    **string**. Last four digits of the Social Security Number of the customer or
    representative of the business.

``state``
    **string**. State of the person or business.

``street_address``
    **string**. Street address of the person or business.

``transactions_uri``
    **string**. URI for all transactions associated with the customer.

``twitter_id``
    **string**. Twitter ID or username of the customer or representative of the
    business.

``uri``
    **string**. The URI of this customer.

Create a Customer
-----------------

.. code::
    POST /v1/customers

Request
~~~~~~~

``name``
    *optional* **string**. Name of the customer or representative of the business. Defaults to ``null``.

``email_address``
    *optional* **string** or **null**. Email address of the customer. It must be **unique** among all customers
    on your marketplace. Defaults to ``null``.

``meta``
    *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``ssn_last4``
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

``facebook_id``
    *optional* **string**. Facebook ID or username of the customer or representative of the
    business Defaults to ``null``.

``twitter_id``
    *optional* **string**. Twitter ID or username of the customer or representative of the business Defaults to ``null``.


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
      "source_uri": null, 
      "bank_accounts_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC16tkLtAOyD3btDLMGrG9Db/bank_accounts", 
      "meta": {}, 
      "postal_code": null, 
      "destination_uri": null, 
      "business_name": null, 
      "email_address": null, 
      "id": "AC16tkLtAOyD3btDLMGrG9Db", 
      "credits_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC16tkLtAOyD3btDLMGrG9Db/credits", 
      "cards_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC16tkLtAOyD3btDLMGrG9Db/cards", 
      "city": null, 
      "holds_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC16tkLtAOyD3btDLMGrG9Db/holds", 
      "name": null, 
      "twitter_id": null, 
      "dob": null, 
      "created_at": "2013-05-01T17:54:16.863490Z", 
      "is_identity_verified": false, 
      "uri": "/v1/customers/AC16tkLtAOyD3btDLMGrG9Db", 
      "refunds_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC16tkLtAOyD3btDLMGrG9Db/refunds", 
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
      "debits_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC16tkLtAOyD3btDLMGrG9Db/debits", 
      "facebook_id": null, 
      "transactions_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC16tkLtAOyD3btDLMGrG9Db/transactions", 
      "ssn_last4": null, 
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
      "source_uri": null, 
      "bank_accounts_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC195sfSCBRERGMxgoSrDaKZ/bank_accounts", 
      "meta": {}, 
      "postal_code": null, 
      "destination_uri": null, 
      "business_name": null, 
      "email_address": null, 
      "id": "AC195sfSCBRERGMxgoSrDaKZ", 
      "credits_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC195sfSCBRERGMxgoSrDaKZ/credits", 
      "cards_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC195sfSCBRERGMxgoSrDaKZ/cards", 
      "city": null, 
      "holds_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC195sfSCBRERGMxgoSrDaKZ/holds", 
      "name": null, 
      "twitter_id": null, 
      "dob": null, 
      "created_at": "2013-05-01T17:54:19.188378Z", 
      "is_identity_verified": false, 
      "uri": "/v1/customers/AC195sfSCBRERGMxgoSrDaKZ", 
      "refunds_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC195sfSCBRERGMxgoSrDaKZ/refunds", 
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
      "debits_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC195sfSCBRERGMxgoSrDaKZ/debits", 
      "facebook_id": null, 
      "transactions_uri": "/v1/marketplaces/TEST-MPWa8G06qSnuh2eK7xsI3lv/accounts/AC195sfSCBRERGMxgoSrDaKZ/transactions", 
      "ssn_last4": null, 
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
          "twitter_id": null, 
          "meta": {}, 
          "postal_code": "10023", 
          "email_address": null, 
          "id": "AC1atwjRwWLTRNwnJxdGGuqd", 
          "city": "Balo Alto", 
          "state": "CA", 
          "facebook_id": null, 
          "phone_number": "+16505551234", 
          "_type": "customer", 
          "source_uri": null, 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC1atwjRwWLTRNwnJxdGGuqd/bank_accounts", 
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
          "business_name": "Levain Bakery", 
          "credits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC1atwjRwWLTRNwnJxdGGuqd/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC1atwjRwWLTRNwnJxdGGuqd/cards", 
          "holds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC1atwjRwWLTRNwnJxdGGuqd/holds", 
          "name": "William James", 
          "dob": "1842-01", 
          "created_at": "2013-05-01T17:54:20.422708Z", 
          "is_identity_verified": true, 
          "uri": "/v1/customers/AC1atwjRwWLTRNwnJxdGGuqd", 
          "refunds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC1atwjRwWLTRNwnJxdGGuqd/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC1atwjRwWLTRNwnJxdGGuqd/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC1atwjRwWLTRNwnJxdGGuqd/transactions", 
          "ssn_last4": "3992", 
          "street_address": "167 West 74th Street", 
          "ein": "253912384"
        }, 
        {
          "twitter_id": null, 
          "meta": {}, 
          "postal_code": null, 
          "email_address": null, 
          "id": "AC17VjwRufpMqv8d4gZnO4Vz", 
          "city": null, 
          "state": null, 
          "facebook_id": null, 
          "phone_number": null, 
          "_type": "customer", 
          "source_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC17VjwRufpMqv8d4gZnO4Vz/cards/CC16qF9qWCK4PafzsWaDH97j", 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC17VjwRufpMqv8d4gZnO4Vz/bank_accounts", 
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
          "business_name": null, 
          "credits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC17VjwRufpMqv8d4gZnO4Vz/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC17VjwRufpMqv8d4gZnO4Vz/cards", 
          "holds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC17VjwRufpMqv8d4gZnO4Vz/holds", 
          "name": "Benny Riemann", 
          "dob": null, 
          "created_at": "2013-05-01T17:54:18.153883Z", 
          "is_identity_verified": false, 
          "uri": "/v1/customers/AC17VjwRufpMqv8d4gZnO4Vz", 
          "refunds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC17VjwRufpMqv8d4gZnO4Vz/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC17VjwRufpMqv8d4gZnO4Vz/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/AC17VjwRufpMqv8d4gZnO4Vz/transactions", 
          "ssn_last4": null, 
          "street_address": null, 
          "ein": null
        }, 
        {
          "twitter_id": null, 
          "meta": {}, 
          "postal_code": null, 
          "email_address": null, 
          "id": "ACZCNMgn60S5v4fz3MSwMwx", 
          "city": null, 
          "state": null, 
          "facebook_id": null, 
          "phone_number": null, 
          "_type": "customer", 
          "source_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACZCNMgn60S5v4fz3MSwMwx/cards/CCYoDHQoHJSWrqNprXEKrst", 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACZCNMgn60S5v4fz3MSwMwx/bank_accounts", 
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
          "business_name": null, 
          "credits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACZCNMgn60S5v4fz3MSwMwx/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACZCNMgn60S5v4fz3MSwMwx/cards", 
          "holds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACZCNMgn60S5v4fz3MSwMwx/holds", 
          "name": "Benny Riemann", 
          "dob": null, 
          "created_at": "2013-05-01T17:54:10.775543Z", 
          "is_identity_verified": false, 
          "uri": "/v1/customers/ACZCNMgn60S5v4fz3MSwMwx", 
          "refunds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACZCNMgn60S5v4fz3MSwMwx/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACZCNMgn60S5v4fz3MSwMwx/debits", 
          "transactions_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACZCNMgn60S5v4fz3MSwMwx/transactions", 
          "ssn_last4": null, 
          "street_address": null, 
          "ein": null
        }, 
        {
          "twitter_id": null, 
          "meta": {}, 
          "postal_code": "90210", 
          "email_address": "fee@poundpay.com", 
          "id": "ACW59qHifkLWUaatbGADFiV", 
          "city": "Nowhere", 
          "state": "CA", 
          "facebook_id": null, 
          "phone_number": "+16505551212", 
          "_type": "customer", 
          "source_uri": null, 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW59qHifkLWUaatbGADFiV/bank_accounts", 
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
          "holds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW59qHifkLWUaatbGADFiV/holds", 
          "credits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW59qHifkLWUaatbGADFiV/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW59qHifkLWUaatbGADFiV/cards", 
          "transactions_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW59qHifkLWUaatbGADFiV/transactions", 
          "name": null, 
          "dob": null, 
          "created_at": "2013-05-01T17:54:07.625585Z", 
          "is_identity_verified": true, 
          "uri": "/v1/customers/ACW59qHifkLWUaatbGADFiV", 
          "refunds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW59qHifkLWUaatbGADFiV/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW59qHifkLWUaatbGADFiV/debits", 
          "ssn_last4": null, 
          "street_address": "123 Fake St"
        }, 
        {
          "_type": "customer", 
          "holds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW56JFOnUojqZzNn82acx3/holds", 
          "name": null, 
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
          "uri": "/v1/customers/ACW56JFOnUojqZzNn82acx3", 
          "id": "ACW56JFOnUojqZzNn82acx3", 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW56JFOnUojqZzNn82acx3/bank_accounts", 
          "refunds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW56JFOnUojqZzNn82acx3/refunds", 
          "meta": {}, 
          "debits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW56JFOnUojqZzNn82acx3/debits", 
          "destination_uri": null, 
          "transactions_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW56JFOnUojqZzNn82acx3/transactions", 
          "email_address": "escrow@poundpay.com", 
          "created_at": "2013-05-01T17:54:07.625088Z", 
          "credits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW56JFOnUojqZzNn82acx3/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACW56JFOnUojqZzNn82acx3/cards"
        }, 
        {
          "twitter_id": null, 
          "meta": {}, 
          "postal_code": "90210", 
          "email_address": "whc@example.org", 
          "id": "ACVXWDOUhPxx5AB6i3ESkFj", 
          "city": "Nowhere", 
          "state": "CA", 
          "facebook_id": null, 
          "phone_number": "+16505551212", 
          "_type": "customer", 
          "source_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/bank_accounts/BAW5cImDgzoNJ8QMgjxQLeh", 
          "bank_accounts_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/bank_accounts", 
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
          "destination_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/bank_accounts/BAW5cImDgzoNJ8QMgjxQLeh", 
          "holds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/holds", 
          "credits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/credits", 
          "cards_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/cards", 
          "transactions_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/transactions", 
          "name": "William Henry Cavendish III", 
          "dob": null, 
          "created_at": "2013-05-01T17:54:07.522221Z", 
          "is_identity_verified": true, 
          "uri": "/v1/customers/ACVXWDOUhPxx5AB6i3ESkFj", 
          "refunds_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/refunds", 
          "debits_uri": "/v1/marketplaces/TEST-MPVXKEdkeDdQVePUkH8dEkh/accounts/ACVXWDOUhPxx5AB6i3ESkFj/debits", 
          "ssn_last4": null, 
          "street_address": "123 Fake St"
        }
      ], 
      "previous_uri": null, 
      "uri": "/v1/customers?limit=10&offset=0", 
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
      "total": 6, 
      "next_uri": null, 
      "last_uri": "/v1/customers?limit=10&offset=0"
    }

Update a Customer
-----------------

.. code::
    PUT /v1/customers/:customer_id

Request
~~~~~~~

``name``
    *optional* **string**. Name of the customer or representative of the business. Defaults to ``null``.

``email_address``
    *optional* **string** or **null**. Email address of the customer. It must be **unique** among all customers
    on your marketplace. Defaults to ``null``.

``meta``
    *optional* **key-value**. Single level mapping from string keys to string values. Defaults to ``{}``.

``ssn_last4``
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

``facebook_id``
    *optional* **string**. Facebook ID or username of the customer or representative of the
    business Defaults to ``null``.

``twitter_id``
    *optional* **string**. Twitter ID or username of the customer or representative of the business Defaults to ``null``.


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
      "source_uri": null, 
      "bank_accounts_uri": "/v1/marketplaces/TEST-MPX9ZWauVN4Zo1PyHObnwSR/accounts/AC1eAEq1vxvWXQME7vdnjTRn/bank_accounts", 
      "meta": {}, 
      "postal_code": null, 
      "destination_uri": null, 
      "business_name": null, 
      "email_address": null, 
      "id": "AC1eAEq1vxvWXQME7vdnjTRn", 
      "credits_uri": "/v1/marketplaces/TEST-MPX9ZWauVN4Zo1PyHObnwSR/accounts/AC1eAEq1vxvWXQME7vdnjTRn/credits", 
      "cards_uri": "/v1/marketplaces/TEST-MPX9ZWauVN4Zo1PyHObnwSR/accounts/AC1eAEq1vxvWXQME7vdnjTRn/cards", 
      "city": null, 
      "holds_uri": "/v1/marketplaces/TEST-MPX9ZWauVN4Zo1PyHObnwSR/accounts/AC1eAEq1vxvWXQME7vdnjTRn/holds", 
      "name": null, 
      "twitter_id": null, 
      "dob": null, 
      "created_at": "2013-05-01T17:54:24.081318Z", 
      "is_identity_verified": false, 
      "uri": "/v1/customers/AC1eAEq1vxvWXQME7vdnjTRn", 
      "refunds_uri": "/v1/marketplaces/TEST-MPX9ZWauVN4Zo1PyHObnwSR/accounts/AC1eAEq1vxvWXQME7vdnjTRn/refunds", 
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
      "debits_uri": "/v1/marketplaces/TEST-MPX9ZWauVN4Zo1PyHObnwSR/accounts/AC1eAEq1vxvWXQME7vdnjTRn/debits", 
      "facebook_id": null, 
      "transactions_uri": "/v1/marketplaces/TEST-MPX9ZWauVN4Zo1PyHObnwSR/accounts/AC1eAEq1vxvWXQME7vdnjTRn/transactions", 
      "ssn_last4": null, 
      "street_address": null, 
      "ein": null
    }

