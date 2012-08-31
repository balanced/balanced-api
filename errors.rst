======
Errors
======

    ``status_code``
        *string*. HTTP response code of the exception.

    ``status``
        *string*.
    ``additional``
        *string*. Any additional information that may describe how to resolve the issue.

    ``category_type``
        *string*. The type of the exception -- one of:
          - request
          - banking
          - logical

    ``category_code``
        *string*. The code of the exception.

    ``extras``
        *object*. Any extra information associated with this exception.

    ``description``
        *string*. Description of the exception

    ``request_id``
        *string*. An ID that can be used to identify and debug the exception.

.. _address-verification-failed:

address-verification-failed
    :category code: address-verification-failed
    :status code: 409
    :category type: logical

    TODO

.. _bank-account-not-valid:

bank-account-not-valid
    :category code: bank-account-not-valid
    :status code: 409
    :category type: logical

    TODO

.. _bank-account-already-valid:

bank-account-already-valid
    :category code: bank-account-already-valid
    :status code: 409
    :category type: logical

    TODO

.. _bank-account-already-associated:

bank-account-already-associated
    :category code: bank-account-already-associated
    :status code: 409
    :category type: logical

    TODO

.. _cannot-associate-bank-account:

cannot-associate-bank-account
    :category code: cannot-associate-bank-account
    :status code: 409
    :category type: logical

    TODO

.. _invalid-routing-number:

invalid-routing-number
    :category code: invalid-routing-number
    :status code: 400
    :category type: request

    TODO

.. _bank-account-not-associated:

bank-account-not-associated
    :category code: bank-account-not-associated
    :status code: 409
    :category type: logical

    TODO

.. _bank-account-already-invalidated:

bank-account-already-invalidated
    :category code: bank-account-already-invalidated
    :status code: 409
    :category type: logical

    TODO

.. _multiple-debits:

multiple-debits
    :category code: multiple-debits
    :status code: 409
    :category type: logical

    TODO

.. _debit-not-found:

debit-not-found
    :category code: debit-not-found
    :status code: 409
    :category type: logical

    TODO

.. _unexpected-payload:

unexpected-payload
    :category code: unexpected-payload
    :status code: 409
    :category type: logical

    TODO

.. _card-not-valid:

card-not-valid
    :category code: card-not-valid
    :status code: 409
    :category type: logical

    This card has already been marked as invalid/deactivated. It cannot be used
    again.

.. _card-not-validated:

card-not-validated
    :category code: card-not-validated
    :status code: 409
    :category type: logical

    The card could not be validated -- either the card number or security code
    may be wrong.

.. _card-not-associated:

card-not-associated
    :category code: card-not-associated
    :status code: 409
    :category type: logical

    The card is not associated with the given account.

.. _card-already-funding-src:

card-already-funding-src
    :category code: card-already-funding-src
    :status code: 409
    :category type: logical

    The card is already associated with an account -- it cannot be associated
    again.

.. _cannot-associate-card:

cannot-associate-card
    :category code: cannot-associate-card
    :status code: 409
    :category type: logical

    The card was tokenized on a different marketplace than the one used for
    this request.

.. _card-declined:

card-declined
    :category code: card-declined
    :status code: 402
    :category type: banking

    This card was declined by the processor.

.. _funding-source-not-hold:

funding-source-not-hold
    :category code: funding-source-not-hold
    :status code: 409
    :category type: logical

    TODO

.. _funding-source-not-debitable:

funding-source-not-debitable
    :category code: funding-source-not-debitable
    :status code: 409
    :category type: logical

    TODO

.. _funding-source-not-refundable:

funding-source-not-refundable
    :category code: funding-source-not-refundable
    :status code: 409
    :category type: logical

    TODO

.. _funding-source-not-authorizable:

funding-source-not-authorizable
    :category code: funding-source-not-authorizable
    :status code: 409
    :category type: logical

    TODO

.. _funding-source-not-associated:

funding-source-not-associated
    :category code: funding-source-not-associated
    :status code: 409
    :category type: logical

    TODO

.. _funding-source-already-associated:

funding-source-already-associated
    :category code: funding-source-already-associated
    :status code: 409
    :category type: logical

    TODO

.. _funding-destination-not-creditable:

funding-destination-not-creditable
    :category code: funding-destination-not-creditable
    :status code: 409
    :category type: logical

    TODO

.. _funding-destination-not-associated:

funding-destination-not-associated
    :category code: funding-destination-not-associated
    :status code: 409
    :category type: logical

    TODO

.. _funding-destination-already-associated:

funding-destination-already-associated
    :category code: funding-destination-already-associated
    :status code: 409
    :category type: logical

    TODO

.. _funding-destination-declined:

funding-destination-declined
    :category code: funding-destination-declined
    :status code: 402
    :category type: banking

    TODO

.. _incomplete-account-info:

incomplete-account-info
    :category code: incomplete-account-info
    :status code: 400
    :category type: request

    TODO

.. _cannot-associate-merchant-with-account:

cannot-associate-merchant-with-account
    :category code: cannot-associate-merchant-with-account
    :status code: 409
    :category type: logical

    TODO

.. _account-already-merchant:

account-already-merchant
    :category code: account-already-merchant
    :status code: 409
    :category type: logical

    TODO

.. _illegal-credit:

illegal-credit
    :category code: illegal-credit
    :status code: 409
    :category type: logical

    TODO

.. _duplicate-email-address:

duplicate-email-address
    :category code: duplicate-email-address
    :status code: 409
    :category type: logical

    TODO

.. _invalid-account-info:

invalid-account-info
    :category code: invalid-account-info
    :status code: 400
    :category type: request

    TODO

.. _invalid-account-info:

invalid-account-info
    :category code: invalid-account-info
    :status code: 409
    :category type: logical

    TODO

.. _no-funding-destination:

no-funding-destination
    :category code: no-funding-destination
    :status code: 409
    :category type: logical

    TODO

.. _marketplace-already-created:

marketplace-already-created
    :category code: marketplace-already-created
    :status code: 409
    :category type: logical

    TODO

.. _authorization-failed:

authorization-failed
    :category code: authorization-failed
    :status code: 402
    :category type: banking

    TODO

.. _reverse-void-attempt:

reverse-void-attempt
    :category code: reverse-void-attempt
    :status code: 409
    :category type: logical

    TODO

.. _capture-void-attempt:

capture-void-attempt
    :category code: capture-void-attempt
    :status code: 409
    :category type: logical

    TODO

.. _authorization-expired:

authorization-expired
    :category code: authorization-expired
    :status code: 409
    :category type: logical

    TODO

.. _cannot-capture-authorization:

cannot-capture-authorization
    :category code: cannot-capture-authorization
    :status code: 409
    :category type: logical

    TODO

.. _cannot-void-authorization:

cannot-void-authorization
    :category code: cannot-void-authorization
    :status code: 409
    :category type: logical

    TODO

.. _hold-not-associated:

hold-not-associated
    :category code: hold-not-associated
    :status code: 409
    :category type: logical

    TODO

.. _hold-not-associated:

hold-not-associated
    :category code: hold-not-associated
    :status code: 409
    :category type: logical

    TODO

.. _insufficient-funds:

insufficient-funds
    :category code: insufficient-funds
    :status code: 409
    :category type: logical

    TODO

.. _insufficient-funds:

insufficient-funds
    :category code: insufficient-funds
    :status code: 409
    :category type: logical

    TODO

.. _invalid-amount:

invalid-amount
    :category code: invalid-amount
    :status code: 400
    :category type: request

    TODO
