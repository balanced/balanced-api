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

.. _card-already-funding-src:

card-already-funding-src
    :category code: card-already-funding-src
    :status code: 409
    :category type: logical

    The card is already associated with an account -- it cannot be associated again.

.. _cannot-associate-card:

cannot-associate-card
    :category code: cannot-associate-card
    :status code: 409
    :category type: logical

    The card was tokenized on a different marketplace than the one used for this request.

.. _card-not-validated:

card-not-validated
    :category code: card-not-validated
    :status code: 409
    :category type: logical

    The card could not be validated -- either the card number or security code may be wrong.

.. _card-declined:

card-declined
    :category code: card-declined
    :status code: 402
    :category type: banking

    This card was declined by the processor.

.. _card-not-valid:

card-not-valid
    :category code: card-not-valid
    :status code: 409
    :category type: logical

    This card has already been marked as invalid/deactivated. It cannot be used again.

