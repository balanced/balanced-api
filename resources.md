# Resources

## Marketplace

### Example

```javascript
{
    "id": "MP3fcTyo4hrVp44bCjRmxtpQ",
    "status": "live",
    "reserve": 1716,
    "balance": -100,
    "api_key": "0f8df97cf21c11e1887e026ba7e239a9",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "name": "Rent my bike",
        "account_number": "xxxxxx1129",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```

### Fields

`id`
: **string**

`status`
: **string**
: `live` or `test`

`reserve`
: **integer**
: `>= 0`

`balance`
: **ineger**

`api_key`
: **string**
: keep this secret!!!

`bank_account`
: **object**
: [Bank Account](./resources.md#bank-account)


## Bank Account

### Example

```javascript
{
    "id": "BANm9b8BcoOjcF5i1p4eV9I",
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
: **string** or _null_

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
: [Bank Account](./resources.md#bank-account)


## Bank Account Credit

### Example

```javascript
{
    "id": "BCtjdsSJg0fFN26PACLLVHz",
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
: [Bank Account](./resources.md#bank-account)