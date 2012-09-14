# Resources

## Bank Account

### Example

```javascript
{
    "id": "BANm9b8BcoOjcF5i1p4eV9I",
    "uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
    "created_at": "2012-09-13T21:25:24Z",
    "debits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
    "credits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
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


## Bank Account Debit

### Example

```javascript
{
    "id": "BDtjdsSJg0fFN26PACLLVHz",
    "uri": "/:version/bank_account_debits/ADtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "pending",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "debits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
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

`bank_account`
: **object**
: [Bank Account](./resources/bank_accounts.md)


## Bank Account Credit

### Example

```javascript
{
    "id": "BCtjdsSJg0fFN26PACLLVHz",
    "uri": "/:version/bank_account_credits/ACtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "pending",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "debits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
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

`bank_account`
: **object**
: [Bank Account](./resources/bank_accounts.md)