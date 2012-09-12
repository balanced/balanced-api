# Resources

## Bank Account

### Example

```javascript
{
    "id": "BANm9b8BcoOjcF5i1p4eV9I",
    "uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
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
    "amount": 1716,
    "status": "pending",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
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

`amount`
: **integer**
: `> 0`

`status`
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
    "amount": 1716,
    "status": "pending",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
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

`amount`
: **integer**
: `>= 0`

`status`
: **string**
: `pending`, `cleared` or `rejected`

`bank_account`
: **object**
: [Bank Account](./resources/bank_accounts.md)