Errors
======

Fields
------

``status_code`` 
    **string**. HTTP response code of the exception. 
 
``status`` 
    **string**.  
 
``additional`` 
    **string**. Any additional information that may describe how to resolve the issue. 
 
``category_type`` 
    **string**. The type of the exception. Values: ``request``, 
    ``banking``, or ``logical`` 
 
``category_code`` 
    **string**. The code of the exception. 
 
``extras`` 
    **object**. Any extra information associated with this exception. 
 
``description`` 
    **string**. Description of the exception 
 
``request_id`` 
    **string**. An ID that can be used to identify and debug the exception. 
 

Status Codes
------------

**200** OK - Resource(s) retrieved successfully.

**201** Created - Resource created.

**204** No Content - Resource deleted.

**400** Bad Request - Request is improper.

**401** Unauthorized - HTTP Authentication must be used to access the requested URI.

**404** Not Found - Requested URI doesn't exist.

**405** Method Not Allowed - HTTP method used is not allowed for the requested URI.

**500, 502, 503, 504** Internal Server Error - Something went wrong on Balanced's side.

Category Types
--------------

**request** - Malformed requests.

**banking** - Errors related to banking/payment processing.

**logical** - Errors related to requests that are well-formed, but logically inconsistent.

Category Codes
--------------

authorization-failed 
~~~~~~~~~~~~~~~~~~~~ 
 
The processor did not accept this hold. 
 
:status_code: 402 
:category_type: banking 
:category_code: authorization-failed 
 
card-declined 
~~~~~~~~~~~~~ 
 
This card was declined by the processor. 
 
:status_code: 402 
:category_type: banking 
:category_code: card-declined 
 
funding-destination-declined 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The processor did not accept the transaction. 
 
:status_code: 402 
:category_type: banking 
:category_code: funding-destination-declined 
 
account-already-merchant 
~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The account is already a merchant. 
 
:status_code: 409 
:category_type: logical 
:category_code: account-already-merchant 
 
address-verification-failed 
~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
This address could not be verified. 
 
:status_code: 409 
:category_type: logical 
:category_code: address-verification-failed 
 
authorization-expired 
~~~~~~~~~~~~~~~~~~~~~ 
 
This hold has already expired. 
 
:status_code: 409 
:category_type: logical 
:category_code: authorization-expired 
 
bank-account-already-associated 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The bank account is already associated with an account -- it cannot be 
associated. 
 
:status_code: 409 
:category_type: logical 
:category_code: bank-account-already-associated 
 
bank-account-not-associated 
~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The bank account is not associated with the given account. 
 
:status_code: 409 
:category_type: logical 
:category_code: bank-account-not-associated 
 
bank-account-not-valid 
~~~~~~~~~~~~~~~~~~~~~~ 
 
This bank account has already been marked as invalid/deactivated. It cannot 
be used again. 
 
:status_code: 409 
:category_type: logical 
:category_code: bank-account-not-valid 
 
business-kyc 
~~~~~~~~~~~~ 
 
:status_code: 409 
:category_type: logical 
:category_code: business-kyc 
 
business-principal-kyc 
~~~~~~~~~~~~~~~~~~~~~~ 
 
:status_code: 409 
:category_type: logical 
:category_code: business-principal-kyc 
 
cannot-associate-bank-account 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The bank account was tokenized on a different marketplace than the one 
used for this request. 
 
:status_code: 409 
:category_type: logical 
:category_code: cannot-associate-bank-account 
 
cannot-associate-card 
~~~~~~~~~~~~~~~~~~~~~ 
 
The card was tokenized on a different marketplace than the one used for 
this request. 
 
:status_code: 409 
:category_type: logical 
:category_code: cannot-associate-card 
 
cannot-associate-merchant-with-account 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The merchant information was created on a different marketplace than the 
one used for this request. 
 
:status_code: 409 
:category_type: logical 
:category_code: cannot-associate-merchant-with-account 
 
cannot-capture-authorization 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
This hold has already been captured or voided, and cannot be captured. 
 
:status_code: 409 
:category_type: logical 
:category_code: cannot-capture-authorization 
 
cannot-void-authorization 
~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
This hold has already been captured or voided, and cannot be voided. 
 
:status_code: 409 
:category_type: logical 
:category_code: cannot-void-authorization 
 
capture-void-attempt 
~~~~~~~~~~~~~~~~~~~~ 
 
This hold has already been captured, which cannot be reversed. 
 
:status_code: 409 
:category_type: logical 
:category_code: capture-void-attempt 
 
card-already-funding-src 
~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The card is already associated with an account -- it cannot be associated 
again. 
 
:status_code: 409 
:category_type: logical 
:category_code: card-already-funding-src 
 
card-not-associated 
~~~~~~~~~~~~~~~~~~~ 
 
The card is not associated with the given account. 
 
:status_code: 409 
:category_type: logical 
:category_code: card-not-associated 
 
card-not-valid 
~~~~~~~~~~~~~~ 
 
This card has already been marked as invalid/deactivated. It cannot be used 
again. 
 
:status_code: 409 
:category_type: logical 
:category_code: card-not-valid 
 
card-not-validated 
~~~~~~~~~~~~~~~~~~ 
 
The card could not be validated -- either the card number or security code 
may be wrong. 
 
:status_code: 409 
:category_type: logical 
:category_code: card-not-validated 
 
debit-not-found 
~~~~~~~~~~~~~~~ 
 
:status_code: 409 
:category_type: logical 
:category_code: debit-not-found 
 
duplicate-email-address 
~~~~~~~~~~~~~~~~~~~~~~~ 
 
An account with the given email address already exists. 
 
:status_code: 409 
:category_type: logical 
:category_code: duplicate-email-address 
 
funding-destination-already-associated 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding destination is already associated with an account. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-destination-already-associated 
 
funding-destination-not-associated 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding destination is not associated with the account. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-destination-not-associated 
 
funding-destination-not-creditable 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding destination cannot have a credit created against it. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-destination-not-creditable 
 
funding-source-already-associated 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding source is already associated with an account. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-source-already-associated 
 
funding-source-not-associated 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding source is not associated with an account. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-source-not-associated 
 
funding-source-not-authorizable 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding source cannot have an authorization created against 
it. Authorizations are only valid for card-type funding sources. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-source-not-authorizable 
 
funding-source-not-debitable 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding source cannot have a debit created against it. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-source-not-debitable 
 
funding-source-not-hold 
~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding source cannot have a hold created against it. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-source-not-hold 
 
funding-source-not-refundable 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
The given funding source cannot be refunded. 
 
:status_code: 409 
:category_type: logical 
:category_code: funding-source-not-refundable 
 
hold-not-associated-account 
~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
This hold is not associated with this account. 
 
:status_code: 409 
:category_type: logical 
:category_code: hold-not-associated-account 
 
hold-not-associated-marketplace 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
This hold is not associated with this marketplace. 
 
:status_code: 409 
:category_type: logical 
:category_code: hold-not-associated-marketplace 
 
identity-verification-error 
~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
:status_code: 409 
:category_type: logical 
:category_code: identity-verification-error 
 
insufficient-funds 
~~~~~~~~~~~~~~~~~~ 
 
Marketplace escrow balance is insufficient to issue this credit. 
 
:status_code: 409 
:category_type: logical 
:category_code: insufficient-funds 
 
marketplace-already-created 
~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
Marketplace has already been created. 
 
:status_code: 409 
:category_type: logical 
:category_code: marketplace-already-created 
 
multiple-debits 
~~~~~~~~~~~~~~~ 
 
:status_code: 409 
:category_type: logical 
:category_code: multiple-debits 
 
no-funding-destination 
~~~~~~~~~~~~~~~~~~~~~~ 
 
The account has no valid funding destinations. 
 
:status_code: 409 
:category_type: logical 
:category_code: no-funding-destination 
 
no-funding-source 
~~~~~~~~~~~~~~~~~ 
 
The account has no valid funding sources. 
 
:status_code: 409 
:category_type: logical 
:category_code: no-funding-source 
 
person-kyc 
~~~~~~~~~~ 
 
:status_code: 409 
:category_type: logical 
:category_code: person-kyc 
 
refund-insufficient-funds 
~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
Marketplace escrow balance is insufficient to issue this refund. 
 
:status_code: 409 
:category_type: logical 
:category_code: refund-insufficient-funds 
 
reverse-void-attempt 
~~~~~~~~~~~~~~~~~~~~ 
 
This hold has already been voided, which cannot be reversed. 
 
:status_code: 409 
:category_type: logical 
:category_code: reverse-void-attempt 
 
unexpected-payload 
~~~~~~~~~~~~~~~~~~ 
 
:status_code: 409 
:category_type: logical 
:category_code: unexpected-payload 
 
incomplete-account-info 
~~~~~~~~~~~~~~~~~~~~~~~ 
 
No buyer or merchant info was provided. Either "merchant/merchant_uri" or 
"card/card_uri" fields must be present. 
 
:status_code: 400 
:category_type: request 
:category_code: incomplete-account-info 
 
invalid-amount 
~~~~~~~~~~~~~~ 
 
Refund amount cannot be greater than the amount of the original debit. 
 
:status_code: 400 
:category_type: request 
:category_code: invalid-amount 
 
invalid-routing-number 
~~~~~~~~~~~~~~~~~~~~~~ 
 
The routing number provided for the bank account was invalid. 
 
:status_code: 400 
:category_type: request 
:category_code: invalid-routing-number 
 
precog-bad-request 
~~~~~~~~~~~~~~~~~~ 
 
:status_code: 400 
:category_type: request 
:category_code: precog-bad-request 
 
refund-invalid-debit-state 
~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 
State of debit to refund must be ``succeeded``. 
 
:status_code: 400 
:category_type: request 
:category_code: refund-invalid-debit-state 
 

