# Resources

All URIs should be prefixed with `https://api.balancedpayments.com`.

## Bank Account

    `/a0/bank_accounts`

### Example

```javascript
{
    "id": "BANm9b8BcoOjcF5i1p4eV9I",
    "uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
    "created_at": "2012-09-13T21:25:24Z",
    "debits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
    "credits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
    "name": "Gottfried Leibniz",
    "account_number": "xxxxxx2930",
    "routing_number": "121042882",
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

`debits_uri`
: **string**

`credits_uri`
: **string**

`name`
: **string**

`account_number`
: **string**

`routing_number`
: **string**

`type`
: **string**
: `checking` or `savings`


## Debit

    `/a0/debits`

### Example

```javascript
{
    "id": "BDtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/debits/WDtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "cleared",
    "fee": 100,
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "debits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
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
: `> 0`

`state`
: **string**
: `pending`, `cleared` or `rejected`

`fee`
: **integer**
: amount charged by Balanced

`bank_account`
: **object**
: [Bank Account](./resources/bank_accounts.md)


## Credit

    `/a0/credits`

### Example

```javascript
{
    "id": "BCtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/credits/CRtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "cleared",
    "fee": 25,
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "debits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
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

`state`
: **string**
: `pending`, `cleared` or `rejected`

`fee`
: **integer**
: amount charged by Balanced

`bank_account`
: **object**
: [Bank Account](./resources/bank_accounts.md)