==============
accounts.index
==============

:uri: /v1/marketplaces/(marketplace:marketplace)/accounts
:methods: HEAD,GET


Returns a paginated representation of account resources.

The query string parameters filter and sort on a particular ``field`` of
the account resource and control pagination. For details on filtering,
sorting and pagination see :ref:`api_filtering`. For a list of the account
``fields`` you can use when sorting and filtering see
:ref:`account_attributes`.

Request:

.. autocodecollection:: accounts-index
                        _code/api/accounts/index/1-request.*

Response:

.. autocodecollection:: accounts-index-response
                        _code/api/accounts/index/1-response.json
        

