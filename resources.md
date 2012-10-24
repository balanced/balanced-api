# Resources

All URIs should be prefixed with `https://x.balancedpayments.com`.

## Bank Account

    /a1/bank_accounts

### Example

```javascript
{
    "id": "BANm9b8BcoOjcF5i1p4eV9I",
    "uri": "/a1/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
    "created_at": "2012-09-13T21:25:24Z",
    "credits_uri": "/a1/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
    "name": "Gottfried Leibniz",
    "account_number": "xxxxxx2930",
    "routing_number": "121042882",
    "fingerprint": "xyz",
    "type": "checking"
}
```

### Fields

`id`
: **string**

`uri`
: **string**

`created_at`
: **string**
: [iso8601](http://en.wikipedia.org/wiki/Iso8601)

`credits_uri`
: **string**

`name`
: **string**
: Name of account holder

`account_number`
: **string**

`routing_number`
: **string**
: 9 digits
: Meets [MICR routing number format](http://en.wikipedia.org/wiki/Routing_transit_number#MICR_Routing_number_format)
: Specified in FedACH database defined by the
[US Federal Reserve](http://www.fedwiredirectory.frb.org/)

`fingerprint`
: **string**
: Uniquely identifies a bank account (account number and routing number)

`type`
: **string**
: `checking` or `savings`


## Credit

    /a1/credits

### Example

```javascript
{
    "id": "BCtjdsSJg0fFN26PACLLVHz",
    "uri": "/a1/credits/CRtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "status": "paid",
    "trace_number": "111036188001706",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/a1/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "credits_uri": "/a1/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "fingerprint": "xyz",
        "type": "checking"
    }
}
```

### Fields

`id`
: **string**

`uri`
: **string**

`created_at`
: **string**
: [iso8601](http://en.wikipedia.org/wiki/Iso8601)

`amount`
: **integer**
: `>= 0`
: USD cents

`status`
: **string**
: `pending`, `paid` or `failed`

`trace_number`
: **string** or `null`
: Used by the ACH network to track transactions

`bank_account`
: **object**
: [Bank Account](./resources/bank_accounts.rst)