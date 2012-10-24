# Errors


## HTTP Status Codes

**200** OK - Item or collection retrieved successfully.

**201** Created - Item created.

**204** No Content - Item deleted.

**400** Bad Request - Request does not meet the
[API specifications](./resources.md).

**404** Not Found - Requested URI doesn't exist.

**405** Method Not Allowed - The HTTP method used is not allowed for the requested URI.

**500, 502, 503, 504** Internal Server Error - Something went wrong on Balanced's side.


## Error Response

All errors return a JSON response with the following format:

`type`
: **string**
: `invalid-request-error`, `api-error`, or `bank-account-error`

`code`
: **string** or `null`

`request_id`
: **string**
: Unique to the request

`message`
: **string**
: Explanation of the error


### Invalid Request Errors

**type:** `invalid-request-error`
: Used as a general error when no other error type applies

### API Errors

**type:** `api-error`

### Bank Account Errors

**type:** `bank-account-error`

**code:** `invalid-routing-number`
: The routing number is not valid according to the
[US Federal Reserve](http://www.fedwiredirectory.frb.org/)

**code:** `invalid-account-number`
: The account number is known to be invalid based on the bank

**code:** `invalid-type`
: The bank account type is not valid.
