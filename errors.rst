======
Errors
======

``status_code``
    *string*.

    HTTP response code of the exception.

``status``
    *string*.


``additional``
    *string*.

    Any additional information that may describe how to resolve the issue.

``category_type``
    *string*.

    The type of the exception. Values: ``request``,
    ``banking``, or ``logical``

``category_code``
    *string*.

    The code of the exception.

``extras``
    *object*.

    Any extra information associated with this exception.

``description``
    *string*.

    Description of the exception

``request_id``
    *string*.

    An ID that can be used to identify and debug the exception.

.. _address-verification-failed:

address-verification-failed
---------------------------

address-verification-failed
    :category code: address-verification-failed
    :status code: 409
    :category type: logical

    This address could not be verified.

.. _bank-account-not-valid:

bank-account-not-valid
----------------------

bank-account-not-valid
    :category code: bank-account-not-valid
    :status code: 409
    :category type: logical

    This bank account has already been marked as invalid/deactivated. It cannot
    be used again.

.. _bank-account-already-associated:

bank-account-already-associated
-------------------------------

bank-account-already-associated
    :category code: bank-account-already-associated
    :status code: 409
    :category type: logical

    The bank account is already associated with an account -- it cannot be
    associated again.

.. _cannot-associate-bank-account:

cannot-associate-bank-account
-----------------------------

cannot-associate-bank-account
    :category code: cannot-associate-bank-account
    :status code: 409
    :category type: logical

    The bank account was tokenized on a different marketplace than the one used
    for this request.

.. _invalid-routing-number:

invalid-routing-number
----------------------

invalid-routing-number
    :category code: invalid-routing-number
    :status code: 400
    :category type: request

    The routing number provided for the bank account was invalid.

.. _bank-account-not-associated:

bank-account-not-associated
---------------------------

bank-account-not-associated
    :category code: bank-account-not-associated
    :status code: 409
    :category type: logical

    The bank account is not associated with the given account.

.. _card-not-valid:

card-not-valid
--------------

card-not-valid
    :category code: card-not-valid
    :status code: 409
    :category type: logical

    This card has already been marked as invalid/deactivated. It cannot be used
    again.

.. _card-not-validated:

card-not-validated
------------------

card-not-validated
    :category code: card-not-validated
    :status code: 409
    :category type: logical

    The card could not be validated -- either the card number or security code
    may be wrong.

.. _card-not-associated:

card-not-associated
-------------------

card-not-associated
    :category code: card-not-associated
    :status code: 409
    :category type: logical

    The card is not associated with the given account.

.. _card-already-funding-src:

card-already-funding-src
------------------------

card-already-funding-src
    :category code: card-already-funding-src
    :status code: 409
    :category type: logical

    The card is already associated with an account -- it cannot be associated
    again.

.. _cannot-associate-card:

cannot-associate-card
---------------------

cannot-associate-card
    :category code: cannot-associate-card
    :status code: 409
    :category type: logical

    The card was tokenized on a different marketplace than the one used for
    this request.

.. _card-declined:

card-declined
-------------

card-declined
    :category code: card-declined
    :status code: 402
    :category type: banking

    This card was declined by the processor.

.. _funding-source-not-hold:

funding-source-not-hold
-----------------------

funding-source-not-hold
    :category code: funding-source-not-hold
    :status code: 409
    :category type: logical

    The given funding source cannot have a hold created against it.

.. _funding-source-not-debitable:

funding-source-not-debitable
----------------------------

funding-source-not-debitable
    :category code: funding-source-not-debitable
    :status code: 409
    :category type: logical

    The given funding source cannot have a debit created against it.

.. _funding-source-not-refundable:

funding-source-not-refundable
-----------------------------

funding-source-not-refundable
    :category code: funding-source-not-refundable
    :status code: 409
    :category type: logical

    The given funding source cannot be refunded.

.. _funding-source-not-authorizable:

funding-source-not-authorizable
-------------------------------

funding-source-not-authorizable
    :category code: funding-source-not-authorizable
    :status code: 409
    :category type: logical

    The given funding source cannot have an authorization created against
    it. Authorizations are only valid for card-type funding sources.

.. _funding-source-not-associated:

funding-source-not-associated
-----------------------------

funding-source-not-associated
    :category code: funding-source-not-associated
    :status code: 409
    :category type: logical

    The given funding source is not associated with an account.

.. _funding-source-already-associated:

funding-source-already-associated
---------------------------------

funding-source-already-associated
    :category code: funding-source-already-associated
    :status code: 409
    :category type: logical

    The given funding source is already associated with an account.

.. _funding-destination-not-creditable:

funding-destination-not-creditable
----------------------------------

funding-destination-not-creditable
    :category code: funding-destination-not-creditable
    :status code: 409
    :category type: logical

    The given funding destination cannot have a credit created against it.

.. _funding-destination-not-associated:

funding-destination-not-associated
----------------------------------

funding-destination-not-associated
    :category code: funding-destination-not-associated
    :status code: 409
    :category type: logical

    The given funding destination is not associated with the account.

.. _funding-destination-already-associated:

funding-destination-already-associated
--------------------------------------

funding-destination-already-associated
    :category code: funding-destination-already-associated
    :status code: 409
    :category type: logical

    The given funding destination is already associated with an account.

.. _funding-destination-declined:

funding-destination-declined
----------------------------

funding-destination-declined
    :category code: funding-destination-declined
    :status code: 402
    :category type: banking

    The processor did not accept the transaction.

.. _incomplete-account-info:

incomplete-account-info
-----------------------

incomplete-account-info
    :category code: incomplete-account-info
    :status code: 400
    :category type: request

    No buyer or merchant info was provided. Either "merchant/merchant_uri" or
    "card/card_uri" fields must be present.

.. _cannot-associate-merchant-with-account:

cannot-associate-merchant-with-account
--------------------------------------

cannot-associate-merchant-with-account
    :category code: cannot-associate-merchant-with-account
    :status code: 409
    :category type: logical

    The merchant information was created on a different marketplace than the
    one used for this request.

.. _account-already-merchant:

account-already-merchant
------------------------

account-already-merchant
    :category code: account-already-merchant
    :status code: 409
    :category type: logical

    The account is already a merchant.

.. _duplicate-email-address:

duplicate-email-address
-----------------------

duplicate-email-address
    :category code: duplicate-email-address
    :status code: 409
    :category type: logical

    An account with the given email address already exists.

.. _no-funding-source:

no-funding-source
-----------------

no-funding-source
    :category code: no-funding-source
    :status code: 409
    :category type: logical

    The account has no valid funding sources.

.. _no-funding-destination:

no-funding-destination
----------------------

no-funding-destination
    :category code: no-funding-destination
    :status code: 409
    :category type: logical

    The account has no valid funding destinations.

.. _marketplace-already-created:

marketplace-already-created
---------------------------

marketplace-already-created
    :category code: marketplace-already-created
    :status code: 409
    :category type: logical

    Marketplace has already been created.

.. _authorization-failed:

authorization-failed
--------------------

authorization-failed
    :category code: authorization-failed
    :status code: 402
    :category type: banking

    The processor did not accept this hold.

.. _reverse-void-attempt:

reverse-void-attempt
--------------------

reverse-void-attempt
    :category code: reverse-void-attempt
    :status code: 409
    :category type: logical

    This hold has already been voided, which cannot be reversed.

.. _capture-void-attempt:

capture-void-attempt
--------------------

capture-void-attempt
    :category code: capture-void-attempt
    :status code: 409
    :category type: logical

    This hold has already been captured, which cannot be reversed.

.. _authorization-expired:

authorization-expired
---------------------

authorization-expired
    :category code: authorization-expired
    :status code: 409
    :category type: logical

    This hold has already expired.

.. _cannot-capture-authorization:

cannot-capture-authorization
----------------------------

cannot-capture-authorization
    :category code: cannot-capture-authorization
    :status code: 409
    :category type: logical

    This hold has already been captured or voided, and cannot be captured.

.. _cannot-void-authorization:

cannot-void-authorization
-------------------------

cannot-void-authorization
    :category code: cannot-void-authorization
    :status code: 409
    :category type: logical

    This hold has already been captured or voided, and cannot be voided.

.. _hold-not-associated-marketplace:

hold-not-associated-marketplace
-------------------------------

hold-not-associated-marketplace
    :category code: hold-not-associated-marketplace
    :status code: 409
    :category type: logical

    This hold is not associated with this marketplace.

.. _hold-not-associated-account:

hold-not-associated-account
---------------------------

hold-not-associated-account
    :category code: hold-not-associated-account
    :status code: 409
    :category type: logical

    This hold is not associated with this account.

.. _insufficient-funds:

insufficient-funds
------------------

insufficient-funds
    :category code: insufficient-funds
    :status code: 409
    :category type: logical

    Marketplace escrow balance is insufficient to issue this credit.

.. _refund-insufficient-funds:

refund-insufficient-funds
-------------------------

refund-insufficient-funds
    :category code: refund-insufficient-funds
    :status code: 409
    :category type: logical

    Marketplace escrow balance is insufficient to issue this refund.

.. _invalid-amount:

invalid-amount
--------------

invalid-amount
    :category code: invalid-amount
    :status code: 400
    :category type: request

    Refund amount cannot be greater than the amount of the original debit.

